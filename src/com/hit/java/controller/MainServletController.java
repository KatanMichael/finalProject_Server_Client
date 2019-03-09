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
import java.util.List;

import static java.lang.System.out;


@WebServlet(name = "MainServletController", urlPatterns = {"/controller/*"})
public class MainServletController extends HttpServlet
{
    HibernateGymDAO gymDAO = HibernateGymDAO.getInstance();
    private User currentUser;
    List<Schedule> allTheSchedule;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

//        gymDAO.getAllSchedule(new RequestListener()
//        {
//            @Override
//            public void onComplete(Object o)
//            {
//                allTheSchedule = (List<Schedule>) o;
//            }
//
//            @Override
//            public void onError(String errorMsg) { }
//        });

        if(path.equals("/logout"))
        {
            HttpSession session = request.getSession(false);
            if(session != null)
                session.invalidate();
            request.getRequestDispatcher("/Home.jsp").forward(request,response);
        }

        if (path.equals("/activityAdd"))
        {
            //int activityID = Integer.parseInt(request.getParameter("activityID"));
            int activityID = 1;

            Activity tempActivity = new Activity(currentUser.getId(),activityID);

            gymDAO.getActivitiesByUserId(currentUser.getId(), new RequestListener()
            {
                @Override
                public void onComplete(Object o)
                {
                    boolean found = false;
                    List<Activity> listOfActivities = (List) o;

                    for(Activity a: listOfActivities)
                    {
                        if(a.getScheduleID() == activityID)
                        {
                            found = true;
                        }
                    }
                    if(!found)
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

        if (path.equals("/signUp"))
        {
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
                    try {
                        getServletContext().getRequestDispatcher("/Home.jsp")
                                .forward(request, response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });

        }

        if (path.equals("/login")) {
            String userName = request.getParameter("loginUserName");
            String userPassword = request.getParameter("loginPassword");

            gymDAO.getUsersByName(userName, new RequestListener()
            {
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
                                    HttpSession session = request.getSession();
                                    session.setAttribute("user", tempUser);

                                    try {
                                        requestDispatcher.forward(request, response);
                                    } catch (ServletException e) {
                                        e.printStackTrace();
                                    } catch (IOException e) {
                                        e.printStackTrace();
                                    }

                                }
                            } else {
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

    public void addNewActivity(Activity activity,HttpServletRequest request, HttpServletResponse response)
    {

        gymDAO.addNewActivity(activity);

        try {
            getServletContext().getRequestDispatcher("/HomeLogged.jsp")
                    .forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void sendAlert(String alert, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html");
        out.println("<script type=\"text/javascript\">");
        out.println("alert('"+alert+"');");
        out.println("</script>");

    }

}
