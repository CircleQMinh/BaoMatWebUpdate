<%-- 
    Document   : shipper
    Created on : Dec 24, 2020, 7:05:42 PM
    Author     : ASUS
--%>

<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery-shipper-page.js" type="text/javascript"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <link href='https://fonts.googleapis.com/css?family=Fredoka One' rel='stylesheet'>
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!------------------------------------------>
        <title>Shipper</title>
        
    </head>
    <body>
        <c:if test="${(sessionScope.account==null) || (sessionScope.account.type=='customer')}">
            <c:redirect url="login-employee"></c:redirect>
        </c:if>
         <c:if test="${(sessionScope.account==null) || (sessionScope.account.type=='admin')}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <%
                Employee emp = (Employee)request.getSession().getAttribute("userInfo");
                int shipperID=emp.getEmployeeId();  
        
        %>
        
        
        
        <input type="hidden" id="shipperid" value="<%=emp.getEmployeeId()      %>">
        <div class="navibar" >  
            <a> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Trang Shipper</a>
        </div>
<!--        <nav>
            <button title="Visit Dashboard" id="dashboard"><i class="fas fa-home"></i></button>
            <button title="View Account"  id = 'acc-setting'><i class="fas fa-key"></i></button>
            <button title="View Order" id = 'order-view'><i class="fas fa-tasks"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>-->
        <div id="viewport">
            <div id="sidebar">
                <header>
                    <a href="#" onclick="MenuOPCS()"><i class="fas fa-angle-double-left" id="icon-nav"></i></a>
                </header>
                <ul class="nav" id="navlist" >
                    <li>
                        <a href="account-info.jsp" id="my-acc">
                            <i class="fas fa-home"></i> My info
                        </a>
                    </li>
                    <li>
                        <a href="logout">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="divcontent" id="home" > 
            <div class="divchua" id="employee">
                <div class="dashbo" id="d1">
                    <p>Shipping</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
                <div class="dashbosr" >
                    <p style="font-family: sans-serif"> Nhân viên đang đăng nhập : <%=emp.getEmployeeName()     %></p>
                </div>
                <div class="dashbosl" id='employeetag' >
                    <p >Đơn hàng đang giao<button class="minibtn" id="btnAdd" onclick="miniTable('myordertable','btnAdd')">-</button></p>                    
                </div>
                <div class="searhbar">
                    <button class="btn" id="myorder-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                </div>
                <%
                     List<Order> myOrder = OrderDAO.getAllMyOrders(shipperID);
                
                %>
                <div id="myordertable" class="divtable">                    
                    <table id="tablemyorder" class="tabledis">
                        <tr>
                            <th>OrderID</th>
                            <th>Trạng thái</th>
                            <th>Tên khách</th>
                            <th>Ngày đặt</th>
                            <th>Ngày yêu cầu</th>
                            <th>Địa chỉ</th>
                            <th>Điện thoại</th>
                            <th>Thanh toán</th>
                            <th>Ghi chú</th>
                            <th >DS sản phẩm</th>
                            <th colspan="2">Option</th>
                        </tr>
                        <%               
                        try {          
                                int i=0;
                                while (i< myOrder.size()) {
                                Order ord= myOrder.get(i);
                                %>
                                <tr>
                                    <td><%= ord.getOrderId() %></td>
                                    <td><%= OrderDAO.returnStatus(ord.getStatus()) %></td>
                                    <td><%= ord.getCustomer().getCustomerName()  %></td>
                                    <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                    <td><%= ord.getOrderAdress() %></td>
                                    <td><%= ord.getOrderPhone() %></td>
                                    <td><%= ord.getPaymentType()            %></td>
                                <td><%=OrderDAO.returnNote(ord.getNote())            %></td>
                                    <td>
                                    <button class="btn" id="ord_info"><i class="fas fa-gifts"></i></button>
                                </td>
                                    <td><button class="btn" id="order-complete" style=" background-color: green;"><i class="fas fa-check"></i></button></td>
                                    <td><button class="btn" id="ord-remove" style=" background-color: red;"><i class="fas fa-times"></i></button></td>
                                    <%i++;%>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
                    <!------------------------------------------------------------------------------------------>
                
                <div class="dashbosl" id='employeetag' >
                    <p >Đơn hàng có thể nhận<button class="minibtn" id="btnAd" onclick="miniTable('ordertable','btnAd')">-</button></p>                    
                </div>
                <div class="searhbar">
                    <button class="btn" id="new-order-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                </div>
                <%
//                OrderDAO.deleteAllShippedOrder();
                List<Order> listOfOrders = OrderDAO.getAllOrdersDaDuyet();
                %>
                <div id="ordertable" class="divtable">                    
                    <table id="tableorder" class="tabledis">
                        <tr>
                            <th>OrderID</th>
                            <th>Trạng thái</th>
                            <th>Tên khách</th>
                            <th>Ngày đặt</th>
                            <th>Ngày yêu cầu</th>
                            <th>Địa chỉ</th>
                            <th>Điện thoại</th>
                            <th>Thanh toán</th>
                            <th>Ghi chú</th>
                            <th colspan="1">DS sản phẩm</th>
                            <th>Option</th>
                        </tr>
                        <%               
                        try {          
                                int i=0;
                                while (i<listOfOrders.size()) {
                                Order ord=listOfOrders.get(i);
                                %>
                                <tr>
                                    <td><%= ord.getOrderId() %></td>
                                    <td><%= OrderDAO.returnStatus(ord.getStatus()) %></td>
                                    <td><%= ord.getCustomer().getCustomerName()  %></td>
                                    <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                    <td><%= ord.getOrderAdress() %></td>
                                    <td><%= ord.getOrderPhone() %></td>   
                                    <td><%= ord.getPaymentType()            %></td>
                                <td><%=OrderDAO.returnNote(ord.getNote())            %></td>
                                    <td>
                                    <button class="btn" id="ord_info"><i class="fas fa-gifts"></i></button>
                                </td>
                                    
                                    <td><button class="btn" id="order-acc" style=" background-color: red;"><i class="fas fa-check"></i></button></td>                         
                                    <%i++;%>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div> 
                    <!----------------------------------------------------------------------------------->
                <div class="dashbosl" id='employeetag' >
                    <p >Lịch sử giao hàng<button class="minibtn" id="btnAddd" onclick="miniTable('orderhistable','btnAddd')">-</button></p>                    
                </div>
                <div class="searhbar">
                    <button class="btn" id="old-order-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                </div>
                <%
//                OrderDAO.deleteAllShippedOrder();
                List<Order> History = OrderDAO.getAllMyOrdersHistory(shipperID);
                %>
                <div id="orderhistable" class="divtable">                    
                    <table id="tablehisorder" class="tabledis">
                        <tr>
                            <th>OrderID</th>
                            <th>Trạng thái</th>
                            <th>Tên khách</th>
                            <th>Ngày đặt</th>
                            <th>Ngày yêu cầu</th>
                            <th>Ngày giao</th>
                            <th>Địa chỉ</th>
                            <th>Điện thoại</th>
                            <th>Thanh toán</th>
                            <th>Ghi chú</th>
                            <th colspan="1">DS sản phẩm</th>
                        </tr>
                        <%               
                        try {          
                                int i=0;
                                while (i<History.size()) {
                                Order ord=History.get(i);
                                %>
                                <tr>
                                    <td><%= ord.getOrderId() %></td>
                                    <td><%= OrderDAO.returnStatus(ord.getStatus()) %></td>
                                    <td><%= ord.getCustomer().getCustomerName()  %></td>
                                    <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                                    <td><%= OrderDAO.returnDate(ord.getShippedDate()) %></td>
                                    <td><%= ord.getOrderAdress() %></td>
                                    <td><%= ord.getOrderPhone() %></td>
                                    <td><%= ord.getPaymentType()            %></td>
                                <td><%=OrderDAO.returnNote(ord.getNote())            %></td>
                                    <td>
                                    <button class="btn" id="ord_info"><i class="fas fa-gifts"></i></button>
                                </td>              
                                    <%i++;%>
                                </tr>                   
                                <%}
                            }        
                            catch (Exception e)
                            {
                                e.printStackTrace();
                            }
                        %>
                    </table>
                </div>
            </div>  
        </div>
        <div class="divwait" id="formwait" >

        </div>
        <div class="divorderinfo" id="order-info-form" >

        </div>
        <div class="divform" id="deleteOrder" >
            <form >
                <h1>Hủy đơn hàng này</h1>
                <br>
                <label ><strong>Order ID</strong></label>
                <input type="number" id="orderid-edit" name="wd"><br>
                <label ><strong>Ghi chú</strong></label>
                <input type="text" id="ordernote-edit" name="wd"><br>
                <button type="button" id="editorder_status"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('deleteOrder')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <script>
            startTime();
        </script>
    </body>
</html>
