<%-- 
    Document   : bank
    Created on : Jan 4, 2021, 12:29:41 PM
    Author     : ASUS
--%>

<%@page import="Dao.CustomerDAO"%>
<%@page import="Model.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Employee Page</title>
    </head>
    <body>        
        <div class="divchua" id="bank">
            <div class="dashbo" id="d1">
                <p>Nạp tiền</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl" id='employeetag' >
                <p >Nạp tiền<button class="minibtn" id="btnbk" onclick="miniTable('bankdiv','btnbk')">-</button></p>                    
            </div>
            <div class="searhbar">
                <!--quan trọng-->
            <!--quan trọng-->
            <button class="btn" id="bankrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
            <input id="banksearchbar" type="text" class="myInput" onkeyup="FilterTable('banktable','banksearchbar','bankrefresh','bankselect')" placeholder="Search for names.." title="Type in a name">
            <select class="myselect" id="bankselect">
                <option value="0" >ID</option>
                <option value="1" selected>Tên</option>
            </select>
            </div>

            <div id="bankdiv" class="divtable">                    
                <table id="banktable" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th>E-mail</th>
                        <th>Điện thoại</th>
                        <th>Địa chỉ</th> 
                        <th>Số dư tài khoản</th>
                        <th >Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listOfCus.size()) {
                            Customer emp_temp=listOfCus.get(i);
                            %>
                            <tr>
                                <td><%=emp_temp.getCustomerId()         %></td>
                                <td><%=emp_temp.getCustomerName()            %></td>
                                <td><%=emp_temp.getSex()           %></td>
                                <td><%=emp_temp.getEmail()          %></td>
                                <td><%=emp_temp.getPhone()        %></td>
                                <td><%=emp_temp.getAddress()       %></td>   
                                <td><%=emp_temp.getMoney()           %></td> 
                                <td><button class="btn" id="bank_edit"><i class="fas fa-edit"></i></button></td>             
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
    </body>
</html>
