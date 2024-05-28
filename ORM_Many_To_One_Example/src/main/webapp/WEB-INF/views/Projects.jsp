<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Add Projects</h2>
    <form action="ProjectsFormOutput" method="post">
        <label for="ProjectName">Place:</label>
        <input type="text" id="ProjectName" name="name"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>