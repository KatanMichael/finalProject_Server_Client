package com.hit.java.controller;

import com.hit.java.models.HibernateGymDAO;
import com.hit.java.models.RequestListener;
import com.hit.java.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static java.lang.System.out;


@WebServlet(name = "MainServletController", urlPatterns = {"/controller/*"})
public class MainServletController extends HttpServlet
{
    HibernateGymDAO gymDAO = HibernateGymDAO.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        if (path.equals("/signUp"))
        {
            User user = new User();
            user.setHeight(1.0f);
            user.setWeight(1.0f);


            String userName = request.getParameter("loginUserName");
            String userPassword = request.getParameter("loginPassword");
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
                public void onError(String errorMsg) {
                    User tempUser = new User(userPassword, userName, 1.1f, 1.1f);

                    gymDAO.addNewUser(tempUser);

                    try {
                        getServletContext().getRequestDispatcher("/personalProfile.jsp")
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


            gymDAO.getUsersByName(userName, new RequestListener() {
                @Override
                public void onComplete(Object o) {
                    List<User> users = (List) o;
                    if (users != null) {
                        if (users.size() > 0) {
                            User tempUser = users.get(0);
                            out.println(tempUser);

                            if (tempUser.getPassword().equals(userPassword)) {
                                try {
                                    request.setAttribute("userName", userName);
                                    getServletContext().getRequestDispatcher("/indexLogged.jsp")
                                            .forward(request, response);
                                } catch (ServletException e) {
                                    e.printStackTrace();
                                } catch (IOException e) {
                                    e.printStackTrace();
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
            String userPassword = request.getParameter("loginPassword");
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
                            tempUser.setHeight(Double.parseDouble(weight));
                            tempUser.setPassword(userPassword);
                            gymDAO.updateUser(tempUser);
                            out.println(tempUser);

                            try {
                                getServletContext().getRequestDispatcher("/Home.jsp")
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
        getServletContext().getRequestDispatcher("/Home.jsp")
                .forward(request,response);


    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);

    }



}
