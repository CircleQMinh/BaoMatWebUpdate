<%-- 
    Document   : login
    Created on : Nov 20, 2020, 8:57:46 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Home | Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="Dn-Dky-QMk/style-login.css">
        <%-- <link rel="stylesheet" href="<c:url value="/Dn-Dky-QMk/style-login.css"></c:url>"> --%> 
      <!--   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"> -->
    </head>
    <body>
       <div class="box">
	
		<div class="inner-box">
		
			<form action="login" method="POST" id="login">
			
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
