<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.spring.orm.model.dmvp_Employees_ORM_" %>
<%@ page import="com.spring.orm.model.dmvp_Department_ORM_" %>
<%@ page import="com.spring.orm.model.dmvp_Address_ORM_" %>
<%@ page import="com.spring.orm.model.dmvp_Projects_ORM_" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employees and Departments</title>
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
                <th>Address ID</th>
                <th>Project ID</th>
            </tr>
        </thead>
        <tbody>
             <% 
         List<dmvp_Employees_ORM_> p=(List<dmvp_Employees_ORM_>)request.getAttribute("employees");
         for(dmvp_Employees_ORM_ prod:p){
      %>
                 <tr>
         <td><%= prod.getEmpID() %></td>
         <td><%= prod.getEmpName() %></td>
         <td><%= prod.getEmpDesgn() %></td>
         <td><%= prod.getDepartment().getDeptID()%></td>
         <td><%= prod.getAddress().getId()%></td>
        <%--<td>
                        <% 
                        Set<dmvp_Projects_ORM_> projects = prod.getProjects();
                        for (dmvp_Projects_ORM_ project : projects) {
                            out.print(project.getId() + " ");
                        }
                        %>
                    </td> --%>
      </tr>
      <% } %>
        </tbody>
    </table>

    <h2>Departments</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
             <% 
         List<dmvp_Department_ORM_> p1=(List<dmvp_Department_ORM_>)request.getAttribute("departments");
         for(dmvp_Department_ORM_ prod:p1){
      %>
                 <tr>
         <td><%= prod.getDeptID() %></td>
         <td><%= prod.getDeptName() %></td>
      </tr>
      <% } %>
        </tbody>
    </table>
    
    <h2>Address</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Place</th>
            </tr>
        </thead>
        <tbody>
             <% 
         List<dmvp_Address_ORM_> p2=(List<dmvp_Address_ORM_>)request.getAttribute("address");
         for(dmvp_Address_ORM_ prod:p2){
      %>
                 <tr>
         <td><%= prod.getId() %></td>
         <td><%= prod.getPlace() %></td>
      </tr>
      <% } %>
        </tbody>
    </table>
    
     <h2>Projects</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
             <% 
         List<dmvp_Projects_ORM_> p3=(List<dmvp_Projects_ORM_>)request.getAttribute("projects");
         for(dmvp_Projects_ORM_ prod:p3){
      %>
                 <tr>
         <td><%= prod.getId() %></td>
         <td><%= prod.getName() %></td>
      </tr>
      <% } %>
        </tbody>
    </table>
    
    <a href="${pageContext.request.contextPath}/Choose">More Options</a>
</body>
</html>
