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
			
                        <input type="text" name="username" id="userName" autocomplete="off" placeholder="Tài khoản" value="${username}"required><br>
                        ${usernameError}                      
			<input type="password" id="passWord" name="password" autocomplete="off" placeholder="Mật khẩu" required>
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
        <script>
//            let userName = document.getElementById('userName').value;
//            let passWord = document.getElementById('passWord').value;
//            const Base64 = {
//
//                // private property
//                _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
//
//                // public method for encoding
//                encode : function (input) {
//                    var output = "";
//                    var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
//                    var i = 0;
//
//                    input = Base64._utf8_encode(input);
//
//                    while (i < input.length) {
//
//                        chr1 = input.charCodeAt(i++);
//                        chr2 = input.charCodeAt(i++);
//                        chr3 = input.charCodeAt(i++);
//
//                        enc1 = chr1 >> 2;
//                        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
//                        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
//                        enc4 = chr3 & 63;
//
//                        if (isNaN(chr2)) {
//                            enc3 = enc4 = 64;
//                        } else if (isNaN(chr3)) {
//                            enc4 = 64;
//                        }
//
//                        output = output +
//                        this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
//                        this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
//
//                    }
//
//                    return output;
//                    }
//                };
//                userName=Base64.encode(userName);
//                passWord=Base64.encode(passWord);
        </script>
    </body>
</html>
