<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="LoginCss.css"> 
</head>

<body>
    <div class="container">
        <label id="loginPage">Login Form</label>
        <div class="tablecontainer">
        <form id="loginform" action="LoginServlet" method="get">
        <table>            
            <tr>
                <th><label id="username">User Name :</label></th>
                <th><input type="text" name="username"></th>
            </tr>
            <tr>
                <th><label id="password">Password :</label></th>
                <th><input type="password" name="password"></th>
            </tr>
        </table>
        <button id="Submit">Submit</button>
        </form>
        
    </div>
    </div>
    
</body>
</html>