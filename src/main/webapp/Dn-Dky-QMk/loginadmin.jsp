<%-- 
    Document   : adminlogin
    Created on : Dec 19, 2020, 1:35:28 PM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>   
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title> Home | Login </title>  
<link rel="stylesheet" href="<c:url value="/Dn-Dky-QMk/style-login.css"></c:url>"> 
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">  
</head>    
<!--<body>    
    <center> <h1> Admin </h1> </center>   
    <form  id="login" method="POST" action="login-admin">  
        <div class="container">   
            <label>Username : ${usernameError}</label>   
            <input type="text" placeholder="Enter Username" name="username" value="${username}" required>
            <label>Mật khẩu : ${passwordError}</label>   
            <input type="password" placeholder="Enter Password" name="password"  required> 
            <button type="submit" >Đăng nhập</button>   
            <a href="<c:url value="/forget-password"></c:url>" style="color: #333">Forgot your password?</a> 
        </div>   
    </form>     
</body>-->
 <body>
	
	<div class="box">
	
		<div class="inner-box">
		
			<form action="login-admin" method="POST" id="login">
			
			<h2>Đăng nhập</h2>
			
                        <input type="text" name="username" placeholder="Tài khoản" value="${username}"required><br>
                        ${usernameError}                      
			<input type="password" name="password" placeholder="Mật khẩu" required>
			${passwordError}
			<p>
			
			<!--<input type="checkbox"><span> Keep me Signed In</span>-->
			
			<span class="forgot"><a href="forget-password">Quên mật khẩu?</a></span>
			
			</p>
			
			<input type="submit" value="Login">
			
			<p style="text-align:center;">
				<span>Chưa có tài khoản? </span><a class="link" href="register">Đăng ký</a>
			</p>
			
			</form>
		
		</div>
	
	</div>
    </body>
</html>  