<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h2>Add Employee</h2>
    <form action="EmpFormOutput" method="post">
        <label for="empName">Employee Name:</label>
        <input type="text" id="empName" name="empName"><br><br>
        
        <label for="empDesgn">Employee Designation:</label>
        <input type="text" id="empDesgn" name="empDesgn"><br><br>
        
        <label for="empDeptID">Department ID:</label>
        <input type="text" id="empDeptID" name="empDeptID"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
