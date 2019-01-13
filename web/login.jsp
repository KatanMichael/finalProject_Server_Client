<%--
  Created by IntelliJ IDEA.
  User: micha
  Date: 1/11/2019
  Time: 3:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<input type='checkbox' id='form-switch'>--%>
<form id='login-form' action="${pageContext.request.contextPath}/controller/login" method='post'>
    <input type="text" name="loginUserName" placeholder="Username" required>
    <input type="password" name="loginPassword" placeholder="Password" required>
    <button type='submit'>Login</button>
<%--<label for='form-switch'><span>Register</span></label>--%>
<label for='form-switch'>Already Member ? Sign In Now..</label>
</form>
<form id='register-form' action="${pageContext.request.contextPath}/controller/signUp" method='post' >
<input type="text"  name="registerUserName" value="" placeholder="Username" required>
<input type="email" placeholder="Email" required>
<input type="password" name="registerPassword" placeholder="Password" required>
<input type="password" placeholder="Re Password" required>
<button type='submit' value="registerBtn">Register</button>

</form>
</body>
</html>
