<%-- 
    Document   : aboutus.jsp
    Created on : Dec 27, 2020, 4:55:00 PM
    Author     : KHOAPHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/styleAbout.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/384d09a31e.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="gogo">
                    <img src="images/logo-default.jpg" width="125px" alt=""/>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="products.jsp">Sản phẩm</a></li>
                        <li><a href="">Liên hệ</a></li>
                        <li><a href="myblog.jsp">Blog</a></li>
                        <li><a href="account-info.jsp">Tài khoản</a></li>
                        <c:choose>
                                    <c:when test="${sessionScope.account==null}" >
                                    <li><a href="login" class="btn-login">Đăng nhập</a></li>
                                    <li><a href="register" class="btn-register">Đăng ký</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${sessionScope.account.type=='customer'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                            </c:when>
                                            <c:when test="${sessionScope.account.type=='employee'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                            </c:when>  
                                            <c:otherwise>
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                            <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                    </ul>
                </nav>
                <a href="cart.jsp" class="cart-day-ne">
                    <img src="images/cart.png" width="30px" height="30px" class="imgcard">
                    <c:choose>
                        <c:when test="${sessionScope.cart==null}" >
                                <span class="cart-item" id="cart-item">0</span>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${sessionScope.cart!=null}">
                                    <span class="cart-item" id="cart-item"><c:out value="${sessionScope.cart.items.size()}" ></c:out></span>
                                </c:when>
                                
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </a><!-- comment -->
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>
            <div class="row">
               <div class="col-2">
                    <h1>Chào mừng đến với TEAM16</h1>
                    <p>Hãy đăng kí ngay hôm nay<br>Để nhận được những ưu đãi siêu khủng từ chúng tôi......</p>
                    <button value="Explore Now" class="btn " onclick="location.href='register'">Khám phá ngay &#10132;</button>
                </div>
                <div class="col-2">
                    <img src="images/prd8.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Featured categories-->
    <div class="about">
        <section>
            <div class="container">
                <h1 class="heading">Liên hệ chi tiết</h1>
                <div class="card-wrapper">
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/cat.jpg" alt="profile image" class="profile-img">
                        <h1>Khoa Phan</h1>
                        <p class="job-title">Web Designer</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư     Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Liên hệ</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/dongthan.jpg" alt="profile image" class="profile-img">
                        <h1>Đông Thân</h1>
                        <p class="job-title">Web Develop</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư   Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Liên hệ</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/cat3.jpg" alt="profile image" class="profile-img">
                        <h1>Quốc Minh</h1>
                        <p class="job-title">Lead Designer</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư    Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Liên hệ</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                    <div class="card">
                        <img src="images/tea1.jpg" alt="card background" class="card-img">
                        <img src="images/cat1.jpg" alt="profile image" class="profile-img">
                        <h1>Vinh Kiều</h1>
                        <p class="job-title">Business Analyst</p>
                        <p class="infor">
                            Sinh viên năm 3 trường ĐH Sư   Phạm Kỹ Thuật Thành Phố HCM
                        </p>
                        <a href="#" class="btn">Liên hệ</a>
                        <ul class="social-media">
                            <li><a href="#"><i class="fab fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fab fa-google-plus-square"></i></a></li>
                        </ul>
                    </div>
    
                </div>
            </div>
        </section>
    </div>
    
    
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Liên hệ</h3>
                    <ul>
                        <li><i class="fas fa-map-marker-alt" style="padding-right: 8.5px"></i> Địa chỉ: 1 Võ Văn Ngân, Linh Chiểu, Thủ Đức</li>
                        <li><i class="fas fa-mobile-alt" style="padding-right: 9px"></i> Tel: 0909999999</li>
                        <li><i class="fas fa-phone-alt" style="padding-right: 5px"></i> Phone: 082.686868</li>
                        <li><i class="fas fa-fax" style="padding-right: 5px"></i> Fax: 024.3294.7979</li>
                    </ul>
                    </br>
                    <h3>Ứng dụng trên điện thoại</h3>
                    <div class="app-logo">
                        <img src="images/playstore.png" alt="">
                        <img src="images/appstore.png" alt="">           
                    </div>
                </div>
                <div class="footer-col-2">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4972148751713!2d106.77022543613889!3d10.849736223750991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175270ad28d48ab%3A0xa6c02de0a7c40d6c!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrAgUGjhuqFtIEvhu7kgVGh14bqtdCBUcC5IQ00!5e0!3m2!1svi!2s!4v1610775978281!5m2!1svi!2s" width="250" height="200" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></li>

                </div>
                <div class="footer-col-3">
                    <img src="images/logo-default-2.jpg" alt="" style="width: 180px"/>
                    <p>Sức khỏe hôm nay - Hạnh phúc ngày mai  </p>
                </div>
                <div class="footer-col-3">
                    <h3 style="padding-bottom: 8px">Theo dõi</h3>
                    <ul>
                        <li>
                            
                            <i class="fab fa-facebook-square fa-4x" style="padding: 10px"></i>
                            <i class="fas fa-blog fa-4x" style="padding: 10px"></i>

                        </li>
         
                        <li>
                          
                            <i class="fab fa-instagram-square fa-4x" style="padding: 10px"></i>
                            <i class="fab fa-youtube fa-4x" style="padding: 10px"></i>
 
                        </li>
                    </ul>
                    
                </div>
            </div>
            <hr>
            <p class="copyright">Copyright 2020 - Team16</p>
        </div>
    </div>
</body>
</html>

<script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight="0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight=="0px")
            {
                MenuItems.style.maxHeight="250px"
            }
            else
            {
                MenuItems.style.maxHeight="0px"
            }
        }
    </script>