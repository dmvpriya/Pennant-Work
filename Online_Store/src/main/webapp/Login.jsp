<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="LoginCss.css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
<script>
    $(document).ready(function(){
        $('#loginform').submit(function(event){
            event.preventDefault();

            var formdata = $(this).serialize();

            $ajax.({
                url:"LoginServlet",
                type:"GET",
                data:formdata,
                success:function(response){
                    window.location.href = "Home.jsp";
                },
                error:function(xhr, status, error){
                    console.error(xhr.responseTex);
                }

            })
        })
    }
</script>  
</html>