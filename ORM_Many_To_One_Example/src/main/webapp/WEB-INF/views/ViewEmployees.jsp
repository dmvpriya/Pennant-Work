<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employees</title>
</head>
<body>
    <h2>Employees</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Designation</th>
                <th>Department ID</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${employees}" var="employee">
                <tr>
                    <td>${employee.empID}</td>
                    <td>${employee.empName}</td>
                    <td>${employee.empDesgn}</td>
                    <td>${employee.empDeptID}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/Choose">More Options</a>
</body>
</html>
