<%-- 
    Document   : order
    Created on : Dec 9, 2020, 2:37:45 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Dao.*"%>
<%@page import="Model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <script src="javascript/jquery.tableManager.js" type="text/javascript"></script>
        <title>Order Page</title>
    </head>
    <body>
        <div class="divchua" id="order">
            <div class="dashbo" id="d1">
                <p>Đơn hàng</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl" id='employeetag' >
                <p >Đơn hàng chưa duyệt <button class="minibtn" id="btnUnck" onclick="miniTable('ordertable','btnUnck')">-</button></p>                    
            </div>
            <div class="searhbar" id="searchbar-turn">
                <button class="btn" id="orderrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            List<Order> listOfOrders = OrderDAO.getAllOrdersChuaDuyet();
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
                        <th>DS sản phẩm</th>
                        <th colspan="2">Option</th>
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
                                <td><button class="btn" id="ord_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="ord_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
                
                
<!----------------------------------------------------------------------------------------------------------------->
            <div class="dashbosl" id='employeetag' >
                <p >Đơn hàng đã duyệt<button class="minibtn" id="btnCk" onclick="miniTable('ordertableCk','btnCk')">-</button></p>                    
            </div>
            <div class="searhbar" id="searchbar-turn">
                <button class="btn" id="orderrefreshCk" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            listOfOrders = OrderDAO.getAllOrdersDaDuyet();
            %>
            <div id="ordertableCk" class="divtable">                    
                <table id="tableorderCk" class="tabledis">
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
                        <th>DS sản phẩm</th>
                        <th colspan="2">Option</th>
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
                                    <button class="btn" id="ord_info_Ck"><i class="fas fa-gifts"></i></button>
                                </td>
                                <td><button class="btn" id="ord_edit_Ck"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="ord_del_Ck" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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




<!----------------------------------------------------------------------------------------------------------------->
            <div class="dashbosl" id='employeetag' >
                <p >Đơn hàng đang giao<button class="minibtn" id="btnDv" onclick="miniTable('ordertableDv','btnDv')">-</button></p>                    
            </div>
            <div class="searhbar" id="searchbar-turn">
                <button class="btn" id="orderrefreshDv" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            List <Object [] > danggiao = OrderDAO.getOrderDangGiao();
            %>
            <div id="ordertableDv" class="divtable">                    
                <table id="tableorderDv" class="tabledis">
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
                        <th>Tên Shipper</th>
                        <th>DS sản phẩm</th>
                        <th>Option</th>
                    </tr>
                    <%               
                    try {          
                            for (Object[] result : danggiao) {
                            Employee emp = (Employee) result[1];
                            Order ord = (Order) result[0];
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
                                <td><%= emp.getEmployeeName() %></td>
                                <td>
                                    <button class="btn" id="ord_info_Dv"><i class="fas fa-gifts"></i></button>
                                </td>
                                <td><button id ="ord_del_Dv" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
            <div class="dashbosl" id='employeetag' >
                <p >Lịch sử giao hàng<button class="minibtn" id="btnHis" onclick="miniTable('ordertableHis','btnHis')">-</button></p>                    
            </div>
            <div class="searhbar" id="searchbar-turn">
                <button class="btn" id="orderrefreshHis" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
            List <Object [] > dagiao = OrderDAO.getOrderDaGiao();
            %>
            <div id="ordertableHis" class="divtable">                    
                <table id="tableorderHis" class="tabledis">
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
                        <th>Tên Shipper</th>
                        <th>DS sản phẩm</th>
                        <th>Option</th>
                    </tr>
                    <%               
                    try {          
                            for (Object[] result : dagiao) {
                            Employee emp = (Employee) result[1];
                            Order ord = (Order) result[0];
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
                                <td><%= emp.getEmployeeName() %></td>
                                <td>
                                    <button class="btn" id="ord_info_His"><i class="fas fa-gifts"></i></button>
                                </td>
                                <td><button id ="ord_del_His" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
<!--------------------------------------------------------------------------------------------------->
            <div class="dashbosl" id='employeetag' >
                <p >Thông tin shipper <button class="minibtn" id="btnShip" onclick="miniTable('ordertableShip','btnShip')">-</button></p>                    
            </div>
            <div class="searhbar" id="searchbar-turn">
                <button class="btn" id="orderrefreshShip" value="Refresh"><i class="fas fa-sync" ></i></button> 
            </div>
            <%
                List<Employee> shippers = EmployeeDao.getAllShipper();
            %>
            <div id="ordertableShip" class="divtable">                    
                <table id="tableorderShip" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th>E-mail</th>
                        <th>Điện thoại</th>
                        <th>Xem lịch sử</th>
                    </tr>
                    <%               
                    try {          
                            int i=0;
                            while (i<shippers.size()) {
                            Employee emp_temp=shippers.get(i);
                            %>
                            <tr>
                                <td><%=emp_temp.getEmployeeId()%></td>
                                <td><%=emp_temp.getEmployeeName()%></td>
                                <td><%=emp_temp.getSex()%></td>
                                <td><%=emp_temp.getEmail()%></td>
                                <td><%=emp_temp.getPhone()%></td>  
                                <td><button class="btn" id="shipper_his"><i class="fas fa-edit"></i></button></td>                     
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
            <div class="dashbosl"  >
                 <p >Lịch sử giao hàng của shipper<button class="minibtn" >-</button></p>                    
            </div>      
            <div id="shipper_history" class="divtable">                    
                <table id="tablehistory" class="tabledis">
                    
                </table>
            </div>
        </div>
        <script>  
            startTime();       
        </script>
    </body>
</html>