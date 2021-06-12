<%-- 
    Document   : register-sendotp
    Created on : Jan 11, 2021, 11:11:14 PM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Home | Register</title>
        <link rel="stylesheet" href="<c:url value="/Dn-Dky-QMk/style-login.css"></c:url>"> 
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/cart.js" type="text/javascript"></script>    
    </head>
    <div class="box">
	
		<div class="inner-box">
		
		<form action="register?action=send-otp" method="POST">
		
		<h3>Hãy nhập Email của bạn.</h3>
		<input type="email" name="email" placeholder="Please Enter" required="">
                <small>${emailError}</small>
		
		<input type="submit" value="Submit">
		
		</form>
		
		</div>
	
	</div>
</html>
