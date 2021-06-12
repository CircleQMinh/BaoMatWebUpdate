<%-- 
    Document   : changepassword
    Created on : Dec 26, 2020, 1:00:12 PM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Find Password</title>
        <link rel="stylesheet" href="<c:url value="/Dn-Dky-QMk/style-login.css"></c:url>"> 
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="box">
	
		<div class="inner-box">
		
		<form action="change-password" method="POST">
		
		<h3>Hãy nhập mật khẩu mới.</h3>
		<input type="text" name="newPassword" placeholder="Please Enter" required="">
                <small>${passwordError}</small>
		<input type="submit" value="Thay đổi">
		
		</form>
		
		</div>
	
	</div>
    </body>
</html>
