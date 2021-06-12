<%-- 
    Document   : cart
    Created on : Nov 20, 2020, 8:55:12 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.*" %>
<%@page import="Model.*" %>
<%@page import="Service.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.security.Provider" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart - TEAM16 Store</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>

      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/styles/metro/notify-metro.css" />

</head>
<body>
    <c:if test="${(sessionScope.account==null) || (sessionScope.account.type=='admin') ||(sessionScope.account.type=='employee') }">
        <c:redirect url="login"></c:redirect>
    </c:if>
    <div id="page">
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
        <!------- cart item ------>
        <div class="small-container cart-page">
            <div class="row">
                    <button type="button" onclick="location.assign('account-info.jsp?action=historyOrder');" class="btn btn-info">Lịch sử mua hàng</button>
                    <%
                        if(session.getAttribute("cart")==null) {
                    %>
                        <h4>Không có sản phẩm nào trong giỏ hàng!!!</h4>
                    <% } %>
                    <%
                    if (session.getAttribute("cart")!=null){
                        Cart cart=(Cart)session.getAttribute("cart");
                    %>
                    <table class='tbl-cart-item'>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                        <% 
                            List<CartItem> listItems = cart.getItems();     
                            for (int i=0;i<listItems.size();i++)
                                { 
                                System.out.println(listItems.get(i).toString());%>
                                <tr>
                                    <td>
                                        <div class="cart-info">
                                            <img src="<%= listItems.get(i).getPictureString()%>" alt="">
                                            <div>
                                                <p><%= listItems.get(i).getProductName()%></p>
                                                <small>Giá: <%= listItems.get(i).getPrice()%></small>
                                                <a href="RemoveCartItem?prd_id=<%= listItems.get(i).getProductID() %>">Xóa</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td><input class="cart-quantity" type="number" value="<%= listItems.get(i).getQuantity() %>"></td>
                                    <td><%= CartService.getCost(listItems.get(i))  %></td>
                                </tr>
                        <%} %>

                    </table>
            </div>
                <div class="total-price">
                    <table>
                        <tr>
                            <td>Thành tiền</td>
                            <td><%= CartService.getTotalCost(listItems)%></td>
                        </tr>
                        <tr>
                            <td>Thuế</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>Tổng tiền</td>
                            <td><%= CartService.getTotalCost(listItems)%></td>
                        </tr>
                    </table>
                
            </div>
            <div class="row">
                <button id="btn-tt" class="btn btn-tt" data-toggle="modal" data-target="#myModal">Thanh toán</button>
            </div>
            <%  }%>
        </div>
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
        <!--------- footer  --------->

        <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Chọn phương thức thanh toán</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input type="radio" class="form-control" name="payment-method" value="cash">
                            </div>
                            <label>Tiền mặt (Thanh toán khi nhận hàng)</label>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input type="radio" class="form-control" name="payment-method"  value="team16-acc">
                            </div>
                            <label>Tài khoản team 16</label>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input type="radio" class="form-control" name="payment-method" value="vnpay">
                            </div>
                            <label>Thanh toán qua VNPay</label>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <input type="radio" class="form-control" name="payment-method"  value="paypal">
                            </div>
                            <label>Thanh toán qua Paypal</label>
                        </div>
                        <div class="form-group">        
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="btn-pay" class="btn btn-default">Submit</button>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>

</html>
<!---- Toggle Menu ------>
    <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight="0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight=="0px")
            {
                MenuItems.style.maxHeight="250px";
                MenuItems.style.zIndex = "800"
                
            }
            else
            {
                MenuItems.style.maxHeight="0px"
            }
        }
        $(function(){
           $('#btn-pay').click(function(){
               var list = document.getElementsByName("payment-method");
                for(i=0;i<list.length;i++){
                var a = list[i];
                if(a.checked === true){
                    if(a.value == 'cash'){
                        location.assign('checkout.jsp');
                    }
                    if(a.value == 'vnpay'){
                        location.assign('checkout-vnpay.jsp');
                    }
                    if(a.value == 'paypal'){
                        location.assign('checkout-paypal.jsp');
                    }
                    if(a.value == 'team16-acc'){
                        location.assign('checkout-app.jsp');
                    }
                }
                
            }
           });
           
        });
    </script>