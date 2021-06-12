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
<body>    
    <div class="box">
	
		<div class="inner-box">
		
			<form action="login-employee" method="POST" id="login">
			
			<h2>Đăng nhập</h2>
			
                        <input type="text" name="username" placeholder="Tài khoản" value="${username}"required><br>
                        ${usernameError}                      
			<input type="password" name="password" placeholder="Mật khẩu" required>
			${passwordError}
			<p>
			
			<!--<input type="checkbox"><span> Keep me Signed In</span>-->
			
			<span class="forgot"><a href="forget-password">Forgot Password?</a></span>
			
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
