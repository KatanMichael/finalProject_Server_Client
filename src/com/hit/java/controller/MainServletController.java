package com.hit.java.controller;

import com.hit.java.models.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;




@WebServlet(name = "MainServletController", urlPatterns = {"/controller/*"})
public class MainServletController extends HttpServlet
{
    HibernateGymDAO gymDAO = HibernateGymDAO.getInstance();
    private User currentUser;
    private List<Activity> currentUserActivities;
    private ArrayList<Schedule> currentUserSchedules;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        response.setContentType("text/html;charset=UTF-8");

        if(path.equals("/logout"))
        {
            HttpSession session = request.getSession(false);
            if(session != null)
                session.invalidate();
            request.getRequestDispatcher("/Home.jsp").forward(request,response);
            currentUser = null;
            currentUserActivities.clear();
            currentUserSchedules.clear();
        }

        if (path.equals("/activityAdd"))
        {
            int activityId = Integer.parseInt(request.getParameter("activityID"));
            Activity tempActivity = new Activity(currentUser.getId(),activityId);

            gymDAO.getActivitiesByUserId(currentUser.getId(), new RequestListener()
            {
                @Override
                public void onComplete(Object o)
                {
                    boolean found = false;
                    List<Activity> listOfActivities = (List) o;

                    for(Activity a: listOfActivities)
                    {
                        if(a.getScheduleID() == activityId)
                        {
                            found = true;
                            break;
                        }
                    }
                    if(!found)
                    {
                        gymDAO.addNewActivity(tempActivity);
                        currentUserActivities.add(tempActivity);
                    }

                    try {
                        getServletContext().getRequestDispatcher("/HomeLogged.jsp")
                                .forward(request, response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                 }

                @Override
                public void onError(String errorMsg)
                {
                    gymDAO.addNewActivity(tempActivity);

                    try {
                        getServletContext().getRequestDispatcher("/HomeLogged.jsp")
                                .forward(request, response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
        }

        if (path.equals("/activityRemove"))
        {
            int scheuleId = Integer.parseInt(request.getParameter("activityID"));
            Activity tempActivity = null;

            for(Activity a: currentUserActivities)
            {
                if(a.getScheduleID() == scheuleId)
                {
                    tempActivity = a;
                    currentUserActivities.remove(a);
                    break;
                }
            }

            final RequestDispatcher requestDispatcher = getServletConfig()
                    .getServletContext()
                    .getRequestDispatcher("/HomeLogged.jsp");
            requestDispatcher.forward(request,response);

            if(tempActivity != null)
            {
                gymDAO.removeActivityById(tempActivity);

            }else
            {
                //No activity found
            }

        }

        if (path.equals("/signUp"))
        {
            HttpSession session = request.getSession();
            User user = new User();
            user.setHeight(1.0f);
            user.setWeight(1.0f);

            String userName = request.getParameter("registerUserName");
            String userPassword = request.getParameter("registerPassword");
            if (userName != null) {
                user.setUserName(userName);
            }

            if (userPassword != null) {
                user.setPassword(userPassword);
            }

            gymDAO.getUsersByName(userName, new RequestListener()
            {
                @Override
                public void onComplete(Object o) {
                    List<User> userList = (List) o;
                    if (userList.size() > 0) {
                        out.println("Username already taken");
                    }
                }

                @Override
                public void onError(String errorMsg)
                {
                    User tempUser = new User(userPassword, userName, 1.1f, 1.1f);
                    gymDAO.addNewUser(tempUser);

                    request.setAttribute("loginUserName", tempUser.getUserName());
                    request.setAttribute("loginPassword", tempUser.getPassword());

                    session.setAttribute("user", tempUser);
                    session.setAttribute("userSchedules", currentUserSchedules);
                    session.setAttribute("userActivities", currentUserActivities);

                    currentUser = tempUser;

                    final RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/HomeLogged.jsp");

                    try {
                        requestDispatcher.forward(request,response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            });

        }

        /**
         * when a user logged in, all his data cached locally(activities and schedule)
         */
        if (path.equals("/login")) {
            String userName = request.getParameter("loginUserName");
            String userPassword = request.getParameter("loginPassword");

            gymDAO.getUsersByName(userName, new RequestListener()
            {
                HttpSession session = request.getSession();
                @Override
                public void onComplete(Object o) {
                    List<User> users = (List) o;
                    if (users != null) {
                        if (users.size() > 0) {
                            User tempUser = users.get(0);
                            out.println(tempUser);

                            if (tempUser.getPassword().equals(userPassword)) {

                                currentUser = tempUser;
                                final RequestDispatcher requestDispatcher = getServletConfig()
                                        .getServletContext()
                                        .getRequestDispatcher("/HomeLogged.jsp");

                                if (tempUser != null) {
                                    //success!
                                    //save the user data in session scope
                                    session.setAttribute("user", tempUser);

                                    gymDAO.getActivitiesByUserId(tempUser.getId(), new RequestListener() {
                                        @Override
                                        public void onComplete(Object o)
                                        {
                                            currentUserActivities = (List<Activity>) o;
                                            session.setAttribute("userActivities", currentUserActivities);
                                            currentUserSchedules = new ArrayList<>();
                                            for(int i = 0; i < currentUserActivities.size(); i++)
                                            {
                                                gymDAO.getScheduleById(currentUserActivities.get(i).getScheduleID(), new RequestListener()
                                                {
                                                    @Override
                                                    public void onComplete(Object o)
                                                    {
                                                        List<Schedule> tempSchedule = (List<Schedule>) o;
                                                        currentUserSchedules.add(tempSchedule.get(0));
                                                    }

                                                    @Override
                                                    public void onError(String errorMsg)
                                                    { }
                                                });
                                            }
                                            session.setAttribute("userSchedules", currentUserSchedules);
                                            request.setAttribute("userSchedules2",currentUserSchedules);
                                        }

                                        @Override
                                        public void onError(String errorMsg)
                                        {

                                        }
                                    });



                                    try {
                                        requestDispatcher.forward(request, response);
                                    } catch (ServletException e) {
                                        e.printStackTrace();
                                    } catch (IOException e) {
                                        e.printStackTrace();
                                    }

                                } } else {
                                out.println("Wrong Password");
                            }

                        }
                    }

                }

                @Override
                public void onError(String errorMsg) {
                    out.println(errorMsg);
                }
            });
        }

        if (path.equals("/personalProfile")) {

            String userName = request.getParameter("loginUserName");
            String height = request.getParameter("height");
            String weight = request.getParameter("weight");

            gymDAO.getUsersByName(userName, new RequestListener() {
                @Override
                public void onComplete(Object o) {
                    List<User> users = (List) o;
                    if (users != null) {
                        if (users.size() > 0) {
                            User tempUser = users.get(0);
                            tempUser.setHeight(Double.parseDouble(height));
                            tempUser.setWeight(Double.parseDouble(weight));
                            tempUser.setPassword(currentUser.getPassword());
                            gymDAO.updateUser(tempUser);

                            try {
                                getServletContext().getRequestDispatcher("/HomeLogged.jsp")
                                        .forward(request, response);
                            } catch (ServletException e) {
                                e.printStackTrace();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }

                }

                @Override
                public void onError(String errorMsg) {
                    out.println(errorMsg);
                }
            });


        }

        if(path.equals("/Home"))
        {
            getServletContext().getRequestDispatcher("/Home.jsp")
                    .forward(request,response);
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);

    }
}
