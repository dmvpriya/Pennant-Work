<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Details</title>
    <style>
       body {
            background-image: url('fbg.jpg'); /* Replace 'background-image.jpg' with the path to your image */
            background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    margin: 0; /* Reset default body margin */
    padding: 0; /* Reset default body padding */
    height: 100vh; 
        }
    th,td{
    border:2px solid black;
    
    }
    
    </style>
</head>
<body>
<div class="finaldiv"> 
<center>
    <p>Order ID: ${sessionScope.oid != null ? sessionScope.oid : "No Order ID found"}Is Successful!</p>
    </center>
    <% // Get the oid from the session
    int oid = (int) session.getAttribute("oid");
    double t = 0.0; // Initialize t to avoid compilation errors
    ResultSet rs = null; // Initialize rs to avoid compilation errors

    // Use oid in your SQL query
    String sqlQuery = "SELECT * FROM ordered_products2003 WHERE oid = ?";
    String s = "SELECT oname, totalprice FROM orders2003 WHERE oid = ?";
    try {
        Connection conn = DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training",
                "plf_training_admin", "pff123");
        Connection conn2 = DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training",
                "plf_training_admin", "pff123");
        PreparedStatement preparedStatement = conn.prepareStatement(sqlQuery);
        PreparedStatement p = conn.prepareStatement(s);
        preparedStatement.setInt(1, oid);
        p.setInt(1, oid);
        ResultSet r = p.executeQuery();
        rs = preparedStatement.executeQuery();
        
        while (r.next()) {
            System.out.println(r.getString("oname"));
            t = r.getDouble("totalprice");
        }

        // Process the result set as needed
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle any errors
    }
    %>
    <center>
    <table style="border-collapse:collapse;width:50%">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>GST</th>
            </tr>
        </thead>
        <tbody>
            <% while (rs != null && rs.next()) { %>
            <tr>
                <td><%= rs.getString("pname") %></td>
                <td><%= rs.getInt("qty") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getDouble("gst") %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </center>
   <center><h3>Total Price: <%= String.format("%.2f", t) %></h3></center></div>  <!-- Convert double to String and format it -->
</body>
</html>