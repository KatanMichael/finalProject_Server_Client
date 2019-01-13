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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String path = request.getPathInfo();


        if(path.equals("/personalStats"))
        {

        }

        if(path.equals("/signUp"))
        {
            User user = new User();
            user.setHeight(1.0f);
            user.setWeight(1.0f);


            String userName = request.getParameter("registerUserName");
            String userPassword = request.getParameter("registerPassword");
            if(userName != null)
            {
                user.setUserName(userName);
            }

            if(userPassword != null)
            {
                user.setPassword(userPassword);
            }

            gymDAO.getUsersByName(userName, new RequestListener() {
                @Override
                public void onComplete(Object o)
                {
                    List<User> userList = (List) o;
                    if(userList.size() > 0)
                    {
                        out.println("Username already taken");
                    }
                }

                @Override
                public void onError(String errorMsg)
                {
                    User tempUser = new User(userPassword,userName,1.1f,1.1f);

                    try {
                        getServletContext().getRequestDispatcher("/indexLogged.jsp")
                                .forward(request,response);
                    } catch (ServletException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            });

        }

        if(path.equals("/login"))
        {
            String userName = request.getParameter("loginUserName");
            String userPassword = request.getParameter("loginPassword");

            gymDAO.getUsersByName(userName, new RequestListener() {
                @Override
                public void onComplete(Object o)
                {
                    List<User> users = (List) o;
                    if(users != null)
                    {
                        if (users.size() > 0)
                        {
                            User tempUser = users.get(0);
                            out.println(tempUser);

                            if(tempUser.getPassword().equals(userPassword))
                            {
                                try {
                                    getServletContext().getRequestDispatcher("personalProfile.jsp")
                                            .forward(request,response);
                                } catch (ServletException e) {
                                    e.printStackTrace();
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            }else
                            {
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

            if(path.equals("/personalUpdate"))
            {


            }


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {


    }

}
