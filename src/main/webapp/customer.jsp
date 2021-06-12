<%-- 
    Document   : customer
    Created on : Dec 7, 2020, 10:48:51 AM
    Author     : ASUS
--%>

<%@page import="Dao.CustomerDAO"%>
<%@page import="Model.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
    List < Customer > listOfCus=CustomerDAO.getAllCus();
    int i=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <title>Customer Page</title>
    </head>
    <body>
        <div class="divchua" id="customer">
            <div class="dashbo" id="d1">
                <p>Khách hàng</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl"  >
                 <p >Khách hàng<button class="minibtn" id="btncus" onclick="miniTable('customertable','btnCus')">-</button></p>                    
            </div>
            <div class="searhbar">
            <button class="btn" onclick="openForm('form10');"><i class="fas fa-user-plus"></i></button>
            <button class="btn" id="customerrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
            <input id="cussearchbar" type="text" class="myInput" onkeyup="FilterTable('tablecus','cussearchbar','customerrefresh','cusselect')" placeholder="Search for names.." title="Type in a name">
            <select class="myselect" id="cusselect">
                <option value="0" >ID</option>
                <option value="1" selected>Tên</option>
                <option value="3" >Email</option>
                <option value="4" >Điện thoại</option>
                <option value="5" >Address</option>
            </select>
            </div>
            
            
            <div id="customertable" class="divtable">                    
                <table id="tablecus" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Địa chỉ</th>
                        <th>Điện thoại</th>
                        <th>Email</th> 
                        <th>Giới tính</th> 
                        <th colspan="3">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i< listOfCus.size()) {
                            Customer cus = listOfCus.get(i);
                            %>
                            <tr>                           
                                <td><%=cus.getCustomerId()%></td>
                                <td><%=cus.getCustomerName()%></td>
                                <td><%=cus.getAddress()%></td>
                                <td><%=cus.getPhone()%></td>
                                <td><%=cus.getEmail()%></td>
                                <td><%=cus.getSex()%></td>
                                <td><button class="btn" id="cus_history" style=" background-color: yellow;"><i class="fas fa-shopping-cart"></i></button></td>
                                <td><button class="btn" id="cus_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="cus_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
                 <p >Lịch sử đơn hàng<button class="minibtn" >-</button></p>                    
            </div>      
            <div id="customerhistory" class="divtable">                    
                <table id="tablehistory" class="tabledis">
                    
                </table>
            </div>
        </div>
        <script>  
            startTime();       
        </script>
    </body>
</html>