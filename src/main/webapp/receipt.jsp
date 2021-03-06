<%@page import="ConfigVNPay.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : vnpay_return
    Created on : Sep 29, 2015, 7:23:56 PM
    Author     : xonv
    Description: Su dung de thong bao ket qua thanh toan toi khach hang. 
                 Khong thuc hien cap nhat vao db tai file nay
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Receipt</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <style>

        </style>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = (String) params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }
            
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
            
        %>
        <!--Begin display -->
        <div class="header">
            <div class="container">
                <div class="navbar">
                    <div class="gogo">
                        <img src="images/logo-default.jpg" width="125px" alt=""/>
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="index.jsp">Trang ch???</a></li>
                            <li><a href="products.jsp">S???n ph???m</a></li>
                            <li><a href="aboutus.jsp">Li??n h???</a></li>
                            <li><a href="myblog.jsp">Blog</a></li>
                            <li><a href="account-info.jsp">T??i kho???n</a></li>
                            <c:choose>
                                <c:when test="${sessionScope.account==null}" >
                                    <li><a href="login" class="btn-login">????ng nh???p</a></li>
                                    <li><a href="register" class="btn-register">????ng k??</a></li>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${sessionScope.account.type=='customer'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                            <li><a href="logout" class="btn-register">????ng xu???t</a></li>
                                        </c:when>
                                        <c:when test="${sessionScope.account.type=='employee'}">
                                            <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                            <li><a href="logout" class="btn-register">????ng xu???t</a></li>
                                        </c:when>  
                                        <c:otherwise>
                                             <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                              <li><a href="logout" class="btn-register">????ng xu???t</a></li>
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
                <h4 class="myarticle-title" >Th??ng tin h??a ????n</h4>
                <article class="myarticle" style="background-color: wheat"> 

                        <label >Ng?????i nh???n:</label>
                        <label><%=request.getParameter("CustomerNameShip")%></label>
                        <br>
                        <label >?????a ch??? nh???n h??ng:</label>
                        <label><%=request.getParameter("AddressShip")%></label>
                        <br>
                        <label >Email: </label>
                        <label><%=request.getParameter("EmailShip")%></label>
                        <br>
                        <%
                            if(request.getParameter("vnp_TxnRef")!=null){%>
                            <label >M?? ????n h??ng:</label>
                            <label><%=request.getParameter("vnp_TxnRef")%></label>
                            <br>   
                            <%}                       
                        %>
                        <label >S??? ti???n:</label>
                        <label><%=request.getParameter("vnp_Amount")%></label>
                        <br>
                        <label >N???i dung thanh to??n:</label>
                        <label><%=request.getParameter("vnp_OrderInfo")%></label>
                        <br>
                        <%
                            if(request.getParameter("vnp_PayDate")!=null){%>
                            <label >Th???i gian thanh to??n:</label>
                            <label><%=request.getParameter("vnp_PayDate")%></label>
                            <br>   
                            <%}                       
                        %>
                        <label >K???t qu???:</label>
                        <label>
                            <%
                                if(request.getAttribute("status_pay")!=null){
                                    if (request.getAttribute("status_pay").equals("success")) {
                                            out.print("Giao d???ch Th??nh c??ng - C???m ??n qu?? kh??ch");
                                        } else {
                                            out.print("Giao d???ch Kh??ng th??nh c??ng");
                                        }
                                }
                                else
                                {
                                    if (signValue.equals(vnp_SecureHash)) {
                                        if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                                            out.print("Giao d???ch Th??nh c??ng - C???m ??n qu?? kh??ch");
                                        } else {
                                             out.print("Giao d???ch Kh??ng th??nh c??ng");
                                        }

                                    } else {
                                        out.print("Ch??? k?? kh??ng h???p l???");
                                    }
                                }
                            %>
                        </label>
                        </article> 
                    </div>
                </div>
            </div>
        </div>
                            <!--------- footer  --------->
        <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Li??n h???</h3>
                    <ul>
                        <li><i class="fas fa-map-marker-alt" style="padding-right: 8.5px"></i> ?????a ch???: 1 V?? V??n Ng??n, Linh Chi???u, Th??? ?????c</li>
                        <li><i class="fas fa-mobile-alt" style="padding-right: 9px"></i> Tel: 0909999999</li>
                        <li><i class="fas fa-phone-alt" style="padding-right: 5px"></i> Phone: 082.686868</li>
                        <li><i class="fas fa-fax" style="padding-right: 5px"></i> Fax: 024.3294.7979</li>
                    </ul>
                    </br>
                    <h3>???ng d???ng tr??n ??i???n tho???i</h3>
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
                    <p>S???c kh???e h??m nay - H???nh ph??c ng??y mai  </p>
                </div>
                <div class="footer-col-3">
                    <h3 style="padding-bottom: 8px">Theo d??i</h3>
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
    $(function(){
       alert('????n h??ng ???? ???????c ghi l???i , c???a h??ng s??? li??n l???c v???i b???n ????? x??c nh???n vi???c ?????t h??ng') 
    });
//    <!---- Toggle Menu ------>
//        var MenuItems = document.getElementById("MenuItems");
//        MenuItems.style.maxHeight="0px";
//        function menutoggle(){
//            if(MenuItems.style.maxHeight=="0px")
//            {
//                MenuItems.style.maxHeight="250px";
//                MenuItems.style.zIndex = "800"
//                
//            }
//            else
//            {
//                MenuItems.style.maxHeight="0px"
//            }
//        }
</script>
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