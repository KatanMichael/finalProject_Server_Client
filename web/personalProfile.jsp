<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 13/01/2019
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <h4><label for='form-switch'><span>Update your bio stats: </span></label></h4>
    <form id='login-form' action="${pageContext.request.contextPath}/controller//personalProfile" method='post'>
        <input type="text" name="loginUserName" placeholder="Username" required>
        <input type="text" name="height" placeholder="height" required>
        <input type="text" name="weight" placeholder="weight" required>
        <button type='submit'>Update</button>

    </form>
</head>
<body>

</body>
</html>
