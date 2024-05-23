<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="LoginSuccess" method="post">
		<input type="text" name="userName"><br> 
		<input type="password" name="passWord"><br>
		<input type="submit" value="Login">
</form>	
</body>
</html>

<!-- method="post" modelAttribute="loginModel" -->