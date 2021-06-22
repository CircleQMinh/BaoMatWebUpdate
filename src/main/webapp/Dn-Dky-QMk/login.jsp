<%-- 
    Document   : login
    Created on : Nov 20, 2020, 8:57:46 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Home | Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="Dn-Dky-QMk/style-login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/styles/metro/notify-metro.css" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
        <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>
        <%-- <link rel="stylesheet" href="<c:url value="/Dn-Dky-QMk/style-login.css"></c:url>"> --%> 
      <!--   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"> -->
    </head>
    <body>
       <div class="box">
	
		<div class="inner-box">
		
			<!--<form action="login" method="POST" id="login">-->
                        <form id="login">
			
			<h2>Đăng nhập</h2>
			
                        <!--<input type="text" name="username" id="userName" autocomplete="off" placeholder="Tài khoản" value="${UriUtils.encodeURI(username)}"required><br>-->
                        <input type="text" name="username" id="userName" autocomplete="off" placeholder="Tài khoản" value="${username}"required><br>
                        <span id="usernameError">${usernameError} </span>
                                             
			<input type="password" id="passWord" name="password" autocomplete="off" placeholder="Mật khẩu" required>
			${passwordError}
			<p>
			
			<!--<input type="checkbox"><span> Keep me Signed In</span>-->
			
			<span class="forgot"><a href="forget-password">Quên mật khẩu?</a></span>
			
			</p>
			
			<input type="button" id="loginButton" value="Login">
			
			<p style="text-align:center;">
				<span>Chưa có tài khoản? </span><a class="link" href="register">Đăng ký</a>
			</p>
			
			</form>
		
		</div>
	
	</div>
        <script>
            // private property
            const _keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
//             public method for encoding
            function Base64Encode(input) {
                var output = "";
                var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
                var i = 0;

                input = _utf8_encode(input);

                while (i < input.length) {

                    chr1 = input.charCodeAt(i++);
                    chr2 = input.charCodeAt(i++);
                    chr3 = input.charCodeAt(i++);

                    enc1 = chr1 >> 2;
                    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                    enc4 = chr3 & 63;

                    if (isNaN(chr2)) {
                        enc3 = enc4 = 64;
                    } else if (isNaN(chr3)) {
                        enc4 = 64;
                    }

                    output = output +
                    this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
                    this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

                }

                return output;
            }
            // private method for UTF-8 encoding
            function _utf8_encode (string) {
                string = string.replace(/\r\n/g,"\n");
                var utftext = "";

                for (var n = 0; n < string.length; n++) {

                    var c = string.charCodeAt(n);

                    if (c < 128) {
                        utftext += String.fromCharCode(c);
                    }
                    else if((c > 127) && (c < 2048)) {
                        utftext += String.fromCharCode((c >> 6) | 192);
                        utftext += String.fromCharCode((c & 63) | 128);
                    }
                    else {
                        utftext += String.fromCharCode((c >> 12) | 224);
                        utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                        utftext += String.fromCharCode((c & 63) | 128);
                    }

                }

                return utftext;
            }
            function notify() {
                $.notify("Đăng nhập thành công", "success");
            }
            function error(){
                $.notify("Đăng nhập thất bại", "error");
            }
            $(function(){
                $("input[id|='loginButton']").click( function(){
                    let userName = document.getElementById('userName').value;
                    let passWord = document.getElementById('passWord').value;
                    userName=btoa(userName);
                    passWord=btoa(passWord);
                    var postData = "username=" + userName + "&password=" + passWord;
                    console.log('hello', postData);
                     $.ajax({
                        type: "POST",
                        url: "login",
                        data: postData,
                        success: function ( response ) {
                            console.log('res', response);
//                            notify
//                            const success = $($.parseHTML(response)).get(20).childNodes[1].childNodes[2];
//                            console.log('success', success);
//                            window.location="http://localhost:8080/AdminPage/index.jsp";
                            location.reload();
                        }  
                    });
                });
            });
        </script>
    </body>
</html>
