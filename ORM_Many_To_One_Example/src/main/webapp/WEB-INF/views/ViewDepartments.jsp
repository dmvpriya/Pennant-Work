<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Departments</title>
</head>
<body>
    <h2>Departments</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${departments}" var="department">
                <tr>
                    <td>${department.deptID}</td>
                    <td>${department.deptName}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/Choose">More Options</a>
</body>
</html>
