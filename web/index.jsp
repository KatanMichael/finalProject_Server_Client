<%--
  Created by IntelliJ IDEA.
  User: micha
  Date: 1/8/2019
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <%
    getServletConfig().getServletContext()
            .getRequestDispatcher("/login.jsp").forward(request,response);
  %>

  </body>
</html>
