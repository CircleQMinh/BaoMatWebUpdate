<%-- 
    Document   : ajax-shipper-history
    Created on : Jan 20, 2021, 12:55:30 PM
    Author     : ASUS
--%>

<%@page import="Dao.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String id = request.getParameter("ID");
        List<Order> listOfOrders = OrderDAO.getAllOrdersByShipperID(Integer.parseInt(id));
    
    %>
    <body>
        <%
            if(listOfOrders.size()!=0){
            
        %>
        <table id="tablehistory" class="tabledis">
            <tr>
                <th>OrderID</th>
                <th>Tình trạng</th>
                <th>Ngày đặt</th>
                <th>Ngày yêu cầu</th>
                <th>Ngày nhận</th>
                <th>Thanh toán</th>
                <th>DS sản phẩm</th>
            </tr>
            <%               
            try {          
                    int i=0;
                    while (i<listOfOrders.size()) {
                    Order ord=listOfOrders.get(i);
                    %>
                    <tr>
                        <td><%= ord.getOrderId() %></td>
                        <td><%= OrderDAO.returnStatus(ord.getStatus())  %></td>
                        <td><%= OrderDAO.returnDate(ord.getOrderDate()) %></td>
                        <td><%= OrderDAO.returnDate(ord.getRequiredDate()) %></td>
                        <td><%= OrderDAO.returnDate(ord.getShippedDate()) %></td>
                        <td><%= ord.getPaymentType()            %></td>
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
            <%}else{%>
            <div id="tablehistory">
               <div class="dashbo" id="d1">
                    <p>Không có lịch sử được lưu lại</p>
                </div>
            </div>
            <%}%>
        </table>
    </body>
</html>
