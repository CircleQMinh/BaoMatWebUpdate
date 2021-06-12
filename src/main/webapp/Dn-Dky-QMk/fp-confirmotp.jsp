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
		
		<form action="check-otp" method="POST">
		
		<h3>Hãy nhập mã OTP của bạn.</h3>
		<input type="text" name="otp" placeholder="Please Enter" required="">
                <small>${otpError}</small>
		<input type="submit" value="Submit">
		
		</form>
		
		</div>
	
	</div>
	

<!--</body>
    <body style=" background: linear-gradient(to right,#ffad063b,#ff105fb0);font-family: 'Poppins', sans-serif;">
        <center>
            <h1 style="margin-top: 200px;">Vui lòng nhập Code</h1>       
            <form method="POST" action="check-otp">
                OTP Code : <input name="otp" placeholder="" ><br> ${otpError} <br>           
                <button type="submit" style="width: 100px;background-color: whitesmoke  ;border-radius: 3px;font-family:'Poppins' " >Xác nhận</button>
            </form>
        </center>
    </body>-->
</html>