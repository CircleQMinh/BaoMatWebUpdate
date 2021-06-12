<%-- 
    Document   : account
    Created on : Dec 7, 2020, 10:49:47 AM
    Author     : ASUS
--%>

<%@page import="Model.Customer"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.EmployeeDao"%>
<%@page import="Dao.AccountDao"%>
<%@page import="java.util.List"%>
<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int i=0;
    List < Employee > listEmpnoacc=EmployeeDao.getAllEmpWithNoAcc();
    List <Object [] > listEmpAcc=AccountDao.getAllEmpAccount();
    List <Object [] > listCusAcc=AccountDao.getAllCusAccount();
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
        <div class="divchua" id="account">
            <div class="dashbo" id="d1">
                <p>Tài khoản</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl"  >
                 <p >Tài khoản nhân viên<button class="minibtn" id="btnacc" onclick="miniTable('acctable','btnacc')">-</button></p>                    
            </div>   
            <div class="searhbar">
                <button class="btn" id="accrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="accsearchbar" type="text" class="myInput" onkeyup="FilterTable('tableacc','accsearchbar','accrefresh','accselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="accselect">
                    <option value="0" >ID</option>
                    <option value="1" selected>UserName</option>
                    <option value="3">UserID</option>
                    <option value="4">Tên</option>
                </select>
            </div>
            <div id="acctable" class="divtable">                    
                <table id="tableacc" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>User-Name</th>
                        <th>Password</th>
                        <th>User-ID</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th colspan="2">Option</th>
                    </tr>
                    <%               
                    try {          
                            for (Object[] result : listEmpAcc) {
                            Employee emp = (Employee) result[0];
                            Account acc = (Account) result[1];
                            %>
                            <tr>
                                <td><%=acc.getAccountId()%></td>
                                <td><%=acc.getUsername()%></td>
                                <td><%=acc.getPassword() %></td>
                                <td><%=acc.getUserId()%></td>
                                <td><%=emp.getEmployeeName()%></td>
                                <td><%=emp.getSex()%></td>
                                <td><button class="btn" id="acc_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="acc_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
                 <p >Tạo tài khoản nhân viên<button class="minibtn" id="btnempnoacc" onclick="miniTable('empnoacctable','btnempnoacc')">-</button></p>                    
            </div>   
            <div class="searhbar">
                <button class="btn" id="empnoaccrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="empnoaccsearchbar" type="text" class="myInput" onkeyup="FilterTable('tableempnoacc','empnoaccsearchbar','empnoaccrefresh','empnoaccselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="empnoaccselect">
                    <option value="0" >ID</option>
                    <option value="1" selected>Tên</option>
                </select>
            </div>
            <div id="empnoacctable" class="divtable">                    
                <table id="tableempnoacc" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th>E-mail</th>
                        <th>Điện thoại</th>
                        <th>Địa chỉ</th>
                        <th colspan="1">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listEmpnoacc.size()) {
                            Employee e = listEmpnoacc.get(i);
                            %>
                            <tr>
                                <td><%=e.getEmployeeId()%></td>
                                <td><%=e.getEmployeeName()%></td>
                                <td><%=e.getSex()%></td>
                                <td><%=e.getEmail()%></td>
                                <td><%=e.getPhone()%></td>
                                <td><%=e.getAddress()%></td> 
                                <td><button class="btn" id="create_emp_acc"><i class="fas fa-edit"></i></button></td>
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
                 <p >Tài khoản khách hàng<button class="minibtn" id="btnacccus" onclick="miniTable('acccustable','btnacccus')">-</button></p>                    
            </div>   
            <div class="searhbar">
                <button class="btn" id="acccusrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="acccussearchbar" type="text" class="myInput" onkeyup="FilterTable('tableacccus','acccussearchbar','acccusrefresh','acccusselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="acccusselect">
                    <option value="0" >ID</option>
                    <option value="1" selected>User-Name</option>
                    <option value="4" selected>Tên</option>
                </select>
            </div>
            <div id="acccustable" class="divtable">                    
                <table id="tableacccus" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>User-Name</th>
                        <th>Password</th>
                        <th>User-ID</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th>Email</th>
                        <th>Điện thoại</th>
                        <th>Địa chỉ</th>
                        <th colspan="1">Option</th>
                    </tr>
                    <%               
                    try {          
                            for (Object[] result : listCusAcc) {
                            Customer cus = (Customer) result[0];
                            Account acc = (Account) result[1];
                            %>
                            <tr>
                                <td><%=acc.getAccountId()%></td>
                                <td><%=acc.getUsername()%></td>
                                <td><%=acc.getPassword() %></td>
                                <td><%=acc.getUserId()%></td>
                                <td><%=cus.getCustomerName()%></td>
                                <td><%=cus.getSex()%></td>
                                <td><%=cus.getEmail()%></td>
                                <td><%=cus.getPhone()%></td>
                                <td><%=cus.getAddress()%></td>
                                <td><button id ="acccus_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
        <script>  
            startTime();       
        </script>
    </body>
</html>