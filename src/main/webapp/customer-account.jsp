<%-- 
    Document   : customer-account
    Created on : Dec 23, 2020, 2:21:51 AM
    Author     : Nhat Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Account</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/cart.js" type="text/javascript"></script>
        <style>
            body {
                background: radial-gradient(#fff,#ffd6d6);
            }
            h1 {
                font-weight: 600;
                font-size: 72px;
                color: white;
                text-align: center;
            }
            h4 {
                font-weight: 400;
                font-size: 20px;
                color: #9b9b9b;
                line-height: 1.5;
            }
            /* ///// inputs /////*/
            input:focus ~ label, textarea:focus ~ label, input:valid ~ label, textarea:valid ~ label {
                font-size: 0.75em;
                color: #999;
                top: -5px;
                -webkit-transition: all 0.225s ease;
                transition: all 0.225s ease;
            }
            .styled-input {
                float: left;
                width: 293px;
                margin: 1rem 0;
                position: relative;
                border-radius: 4px;
            }
            @media only screen and (max-width: 768px){
                .styled-input {
                    width:100%;
                }
            }
            .styled-input label {
                color: #999;
                padding: 1.3rem 30px 1rem 30px;
                position: absolute;
                top: 10px;
                left: 0;
                -webkit-transition: all 0.25s ease;
                transition: all 0.25s ease;
                pointer-events: none;
            }
            .styled-input.wide { 
                width: 650px;
                max-width: 100%;
            }
            input,
            textarea {
                padding: 30px;
                border: 0;
                width: 100%;
                font-size: 1rem;
                background-color: #2d2d2d;
                color: white;
                border-radius: 4px;
            }
            input:focus,
            textarea:focus { outline: 0; }
            input:focus ~ span,
            textarea:focus ~ span {
                width: 100%;
                -webkit-transition: all 0.075s ease;
                transition: all 0.075s ease;
            }
            textarea {
                width: 100%;
                min-height: 15em;
            }
            .input-container {
                width: 650px;
                max-width: 100%;
                margin: 20px auto 25px auto;
            }
            .submit-btn {
                float: right;
                padding: 7px 35px;
                border-radius: 60px;
                display: inline-block;
                background-color: #4b8cfb;
                color: white;
                font-size: 18px;
                cursor: pointer;
                box-shadow: 0 2px 5px 0 rgba(0,0,0,0.06),
                    0 2px 10px 0 rgba(0,0,0,0.07);
                -webkit-transition: all 300ms ease;
                transition: all 300ms ease;
            }
            .submit-btn:hover {
                transform: translateY(1px);
                box-shadow: 0 1px 1px 0 rgba(0,0,0,0.10),
                    0 1px 1px 0 rgba(0,0,0,0.09);
            }
            @media (max-width: 768px) {
                .submit-btn {
                    width:100%;
                    float: none;
                    text-align:center;
                }
            }
            input[type=checkbox] + label {
                color: #ccc;
                font-style: italic;
            } 
            input[type=checkbox]:checked + label {
                color: #f00;
                font-style: normal;
            }
            form{ padding: 0px 300px;}
        </style>
    </head>
    <body >
        <c:if test="${(sessionScope.account==null)}">
            <c:redirect url="login"></c:redirect>
        </c:if>
        <div class="header">
            <div class="container">
                <div class="navbar">
                    <div class="gogo">
                        <img src="images/logo-default.jpg" width="125px" alt=""/>
                    </div>
                    <nav>
                        <ul id="MenuItems">
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="products.jsp">Products</a></li>
                            <li><a href="aboutus.jsp">About</a></li>
                            <li><a href="myblog.jsp">Blog</a></li>
                            <li><a href="customer-account.jsp">Account</a></li>
                                <c:choose>
                                    <c:when test="${sessionScope.account==null}" >
                                    <li><a href="login" class="btn-login">Log In</a></li>
                                    <li><a href="register" class="btn-register">Register</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${sessionScope.account.type=='customer'}">
                                            <li><a href="" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                            <li><a href="logout" class="btn-register">Logout</a></li>
                                            </c:when>
                                            <c:when test="${sessionScope.account.type=='employee'}">
                                            <li><a href="" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                            <li><a href="logout" class="btn-register">Logout</a></li>
                                            </c:when>  
                                            <c:otherwise>
                                            <li><a href="" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                            <li><a href="logout" class="btn-register">Logout</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </nav>
                    <a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" class="imgcard"></a>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>

            </div>
        </div>
        <c:if test="${sessionScope.account.type=='customer'}">
            <form style="background: radial-gradient(#fff,#ffd6d6)" action="update-user" method="POST">
                <div class="container">
                    <div class="row">
                        <h1 style="color:black">Contact</h1>
                    </div>
                    <div class="row">
                        <h3 style="text-align:center;color :red" >♥</h3>
                    </div>

                    <div class="row input-container">

                        <div class="col-xs-12">
                            <div class="styled-input wide">
                                <input type="text" name="name" value="${sessionScope.userInfo.customerName}"required/>
                                <label>Name</label> 
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="styled-input wide">
                                <input type="text" name="email" value="${sessionScope.userInfo.email}"required/>
                                <label>Email ${emailError}</label> 
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="styled-input wide">
                                <input type="text" name="phone"value="${sessionScope.userInfo.phone}"required />
                                <label>Phone ${phoneError}</label> 
                            </div>
                        </div>
                        <div style="width:40%; float:left;">
                            <input style="width:50%" type="radio" name="gender" class="gender" value="Nam" checked >Male
                        </div>
                        <div style="width:40%; float:right;">
                            <input style="width:50%"type="radio" name="gender" class="gender"  value="Nữ" 
                                   <c:if test="${sessionScope.userInfo.sex=='Nữ'}">checked</c:if>>Female 
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="styled-input">
                                    <input type="text" disabled=""/>
                                <label>Username: ${sessionScope.account.username}</label> 
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12" style="float: right;margin-left:50px;">
                            <div class="styled-input" style="float:right;">
                                <input type="password" name="password"value="${sessionScope.account.password}" style=""required />
                                <label>Password ${passwordError}</label> 
                            </div>
                        </div>
                        <div>

                        </div>                
                        <div class="col-xs-12">
                            <div class="styled-input wide">
                                <input type="text"required name="address"style="height: 250px;" value="${sessionScope.userInfo.address}">                           
                                </input>
                                <label>Address ${addressError}</label>
                            </div>
                        </div>                
                        <div><button type="submit" style="padding: 5px; width: 100px; background-color: whitesmoke; border-radius:5px;">Update</button></div>
                    </div>
            </form>
        </div>
    </c:if>
    <c:if test="${sessionScope.account.type=='employee'}">
        <form style="background: radial-gradient(#fff,#ffd6d6)" action="update-user" method="POST">
            <div class="container">
                <div class="row">
                    <h1 style="color:black">Contact</h1>
                </div>
                <div class="row">
                    <h3 style="text-align:center;color :red" >♥</h3>
                </div>
                <div class="row input-container">

                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="name" value="${sessionScope.userInfo.employeeName}"required/>
                            <label>Name</label> 
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="email" value="${sessionScope.userInfo.email}" required=""/>
                            <label>Email ${emailError}</label> 
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="phone"value="${sessionScope.userInfo.phone}"required />
                            <label>Phone ${phoneError}</label> 
                        </div>
                    </div>
                    <div style="width:40%; float:left;">
                        <input style="width:50%" type="radio" name="gender" class="gender" value="Nam" checked >Male
                    </div>
                    <div style="width:40%; float:right;">
                        <input style="width:50%"type="radio" name="gender" class="gender"  value="Nữ" 
                               <c:if test="${sessionScope.userInfo.sex=='Nữ'}">checked</c:if>>Female 
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="styled-input">
                                <input type="text" disabled=""/>
                            <label>Username: ${sessionScope.account.username}</label> 
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12" style="float: right;margin-left:50px;">
                        <div class="styled-input" style="float:right;">
                            <input type="password" name="password" value="${sessionScope.account.password}" required />
                            <label>Password ${passwordError}</label>                           
                        </div>
                    </div>
                    <div>

                    </div>                
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text"required name="address"style="height: 250px;" value="${sessionScope.userInfo.address}">                           
                            </input>
                            <label>Address ${addressError}</label>
                        </div>
                    </div>                
                    <div><button type="submit" style="padding: 5px; width: 100px; background-color: whitesmoke; border-radius:5px;">Update</button></div>
                </div>
            </div>
        </form>
    </c:if>
    <c:if test="${sessionScope.account.type=='admin'}">
        <form style="background: radial-gradient(#fff,#ffd6d6)" action="update-user" method="POST">
            <div class="container">
                <div class="row">
                    <h1 style="color:black">Contact</h1>
                </div>
                <div class="row">
                    <h3 style="text-align:center;color :red" >♥</h3>
                </div>
                <div class="row input-container">

                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="name"value="${sessionScope.userInfo.name}"required/>
                            <label>Name</label> 
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="email"value="${sessionScope.userInfo.email}"required/>
                            <label>Email ${emailError}</label> 
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="styled-input wide">
                            <input type="text" name="phone"value="${sessionScope.userInfo.phone}"required />
                            <label>Phone ${phoneError}</label> 
                        </div>
                    </div>
                    <div style="width:40%; float:left;">
                        <input style="width:50%" type="radio" name="gender" class="gender" value="Nam" checked >Male
                    </div>
                    <div style="width:40%; float:right;">
                        <input style="width:50%"type="radio" name="gender" class="gender"  value="Nữ" 
                               <c:if test="${sessionScope.userInfo.sex=='Nữ'}">checked</c:if>>Female 
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="styled-input">
                                <input type="text" disabled=""/>
                            <label>Username: ${sessionScope.account.username}</label> 
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12" style="float: right">
                        <div class="styled-input" style="float:right;margin-left:50px;">
                            <input type="password" name="password"value="${sessionScope.account.password}" required />
                            <label>Password ${passwordError}</label> 
                        </div>
                    </div>    
                    <div><button type="submit" style="padding: 5px; width: 100px; background-color: whitesmoke; border-radius:5px;">Update</button></div>        
                </div>
            </div>
        </form>
    </c:if>
</body>
</html>