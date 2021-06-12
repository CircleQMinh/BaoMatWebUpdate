<%-- 
    Document   : products
    Created on : Nov 20, 2020, 8:58:16 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*" %>
<%@page import="Model.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All products - TEAM16 Store</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/styles/metro/notify-metro.css" />
        <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                var pageSize = 12;// 12 product in page
                showPage = function (page) {
                    $(".col-4.contentProduct").hide();
                    $(".col-4.contentProduct").each(function (n) {
                        if (n >= pageSize * (page - 1) && n < pageSize * page)
                            $(this).show();
                    });
                }
                showPage(1);
                var totalRows = $('#total_prd').val();//total product
                var btnPage = 5;// Số nút bấm
                var iTotalPages = Math.ceil(totalRows / pageSize);

                var obj = $('#pagination').twbsPagination({
                    totalPages: iTotalPages,
                    visiblePages: btnPage,
                    onPageClick: function (event, page) {
                        /* console.info(page); */
                        showPage(page);
                    }
                });
            });
        </script>
        <style>
            #pagination {
                display: flex;
                display: -webkit-flex; /* Safari 8 */
                flex-wrap: wrap;
                -webkit-flex-wrap: wrap; /* Safari 8 */
                justify-content: center;
                -webkit-justify-content: center;
            }
            #pagination a{
                position: relative;
                float: left;
                padding: .5rem .75rem;
                margin-left: -1px;
                color: #0275d8;
                text-decoration: none;
                background-color: #fff;
                border: 1px solid #ddd;
            }
        </style>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="gogo">
                    <img src="images/logo-default.jpg" width="125px" alt=""/>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="products.jsp">Sản phẩm</a></li>
                        <li><a href="aboutus.jsp">Liên hệ</a></li>
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
        </div>

        <div class="small-container">
            <div class="row row-2">
                <h2>Tất cả sản phẩm</h2>
                <form action="SearchProduct" method="get">
                    <input type="text" name="search-product" placeholder="Tìm kiếm" class="txtSearch">
                    <input type="submit" class="btn" value="Tìm">
                </form>
            </div>
            <%
                List<Product> prd = null;
                prd = (ArrayList<Product>)request.getAttribute("prd");
                if(prd==null){
                prd = ProductDao.getAllPro();
                }
            %>
            <input type="hidden" id="total_prd" value="<%= prd.size()%>">
            <%
                int total = prd.size();
                int first = 0, last = 0, pages = 1;
                if (request.getParameter("pages") != null) {
                    pages = (int) Integer.parseInt(request.getParameter("pages"));
                }

                if (total <= 12) {
                    first = 0;
                    last = total;
                } else {
                    first = (pages - 1) * 12;
                    last = 12;
            }
            try {

                for (int i = 0; i < prd.size(); i++) {%>
            <div class="row">
                <% if (i < prd.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId()%>');">
                        <img src="<%= prd.get(i).getPicture()%>" alt="">
                        <h4><%= prd.get(i).getProductName()%></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice()%></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng"  class="btn">
                    </div>
                </form><% }
                    i++;%>
                <% if (i < prd.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId()%>');">
                        <img src="<%= prd.get(i).getPicture()%>" alt="">
                        <h4><%= prd.get(i).getProductName()%></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice()%></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng"  class="btn">
                    </div>
                </form><% }
                    i++;%>
                <% if (i < prd.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId()%>');">
                        <img src="<%= prd.get(i).getPicture()%>" alt="">
                        <h4><%= prd.get(i).getProductName()%></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice()%></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng"  class="btn">
                    </div>
                </form><% }
                    i++;%>
               <% if (i < prd.size()) {%>
                <form class="col-4 contentProduct" name="product">
                    <div class="" onclick="location.assign('product-details.jsp?prdID_item=<%= prd.get(i).getProductId()%>');">
                        <img src="<%= prd.get(i).getPicture()%>" alt="">
                        <h4><%= prd.get(i).getProductName()%></h4>
                        <div class="rating">
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star" ></i>
                            <i class="fa fa-star-o" ></i>
                        </div>
                        <p><%= prd.get(i).getPrice()%></p>
                        <input type="hidden" name="prdID_item" value="<%= prd.get(i).getProductId()%>"><!-- comment -->
                        <input type="hidden" name="prdName_item" value="<%= prd.get(i).getProductName()%>"><!-- comment -->
                        <input type="hidden" name="prdPrice_item" value="<%= prd.get(i).getPrice()%>"><!-- comment -->
                        <input type="hidden" name="action" value="add">
                    </div> 
                    <div class="overlay">
                        <input type="button" id="add_item" value="Thêm vào giỏ hàng"  class="btn">
                    </div>
                </form><% } %>
            </div>
            <% }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <div class="page-btn">
                <ul id="pagination"></ul> <!-- Hiển thị nút chuyển trang -->
            </div>
        </div>
        <!--------- footer  --------->
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
        <!---- Toggle Menu ------>
        <script>
            var MenuItems = document.getElementById("MenuItems");
            MenuItems.style.maxHeight = "0px";
            function menutoggle() {
                if (MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "250px"
                } else
                {
                    MenuItems.style.maxHeight = "0px"
                }
            }
        </script>
    </body>
</html>
<script>
    function notify() {
	$.notify("Thêm thành công", "success");
    }
    $(function(){
            $("input[id|='add_item']").click( function(){
                var numItem = $('#cart-item').html();
                console.log(numItem);
                var postData = $(this).closest('div').closest('form').serialize();
                 $.ajax({
                    type: "POST",
                    url: "ajax/customerpage/ajax_add_item.jsp",
                    data: postData,
                    success: function ( response ) {
                        notify();
                        $('#cart-item').html(Number(numItem) + 1);
                    }  
                });
            });
    });
</script>