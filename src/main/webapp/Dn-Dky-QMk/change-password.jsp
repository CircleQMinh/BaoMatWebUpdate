<%-- 
    Document   : changepassword
    Created on : Dec 26, 2020, 1:00:12 PM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Find Password</title>
        <link rel="stylesheet" href="css/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body style=" background: linear-gradient(to right,#ffad063b,#ff105fb0);font-family: 'Poppins', sans-serif;">
        <h1 style="margin-top: 200px;">Thay đổi mật khẩu</h1>
        <form method="POST" action="change-password">
            Mật khẩu mới : <input name="newPassword" placeholder="Please Enter" > <br>
            <button type="submit" style="width: 100px;background-color: whitesmoke  ;border-radius: 3px;font-family:'Poppins' " >Thay đổi</button>
        </form
    </body>
</html>