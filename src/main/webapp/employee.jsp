<%-- 
    Document   : employee
    Created on : Dec 7, 2020, 10:25:44 AM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

        List < Employee > listOfEmp = EmployeeDao.getAllEmp();
        int i=0;
%>
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
        <title>Nhân viên Page</title>
    </head>
    <body>
        <div class="divchua" id="employee">
            <div class="dashbo" id="d1">
                <p>Nhân viên</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl" id='employeetag' >
                <p >Nhân viên<button class="minibtn" id="btnAd" onclick="miniTable('employeetable','btnAd')">-</button></p>                    
            </div>   

            <div class="searhbar">
                <!--quan trọng-->
            <button class="btn" onclick="openForm('form1');FillForm1();"><i class="fas fa-user-plus"></i></button>
            <!--quan trọng-->
            <button class="btn" id="employeerefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
            <input id="empsearchbar" type="text" class="myInput" onkeyup="FilterTable('tableemp','empsearchbar','employeerefresh','empselect')" placeholder="Search for names.." title="Type in a name">
            <select class="myselect" id="empselect">
                <option value="0" >EID</option>
                <option value="1" selected>Tên</option>
                <option value="3" >Email</option>
                <option value="4" >Phone</option>
                <option value="5" >Add</option>
            </select>
            </div>

            <div id="employeetable" class="divtable">                    
                <table id="tableemp" class="tabledis">
                    <tr>
                        <th>EID</th>
                        <th>Tên</th>
                        <th>Giới tính</th>
                        <th>E-mail</th>
                        <th>Điện thoại</th>
                        <th>Địa chỉ</th> 
                        <th>Lương</th>
                        <th>Ngày lãnh lương</th>
                        <th colspan="2">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listOfEmp.size()) {
                            Employee emp_temp=listOfEmp.get(i);
                            %>
                            <tr>
                                <td><%=emp_temp.getEmployeeId()%></td>
                                <td><%=emp_temp.getEmployeeName()%></td>
                                <td><%=emp_temp.getSex()%></td>
                                <td><%=emp_temp.getEmail()%></td>
                                <td><%=emp_temp.getPhone()%></td>
                                <td><%=emp_temp.getAddress()%></td>   
                                <td><%=emp_temp.getSalary()%></td> 
                                <td><%=emp_temp.getPaycheck()%></td>
                                <td><button class="btn" id="emp_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="emp_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
             <div class="dashbosl" >
                <p id='paychecktag'>Điểm danh - Chấm công - Tính lương<button class="minibtn" id="btnpay" onclick="miniTable('att-table','btnpay')">-</button></p>
            </div>
            <div class="searhbar">
                <button class="btn" id="att-refresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="empattsearchbar" type="text" class="myInput" onkeyup="FilterTable('empatt1','empattsearchbar','att-refresh','empselect2')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="empselect2">
                    <option value="0" >ID</option>
                    <option value="1" selected>Tên</option>
                </select>
            </div>    
            <div id="att-table" class="divtable">
                <table id="empatt1" class="tabledis">
                    <tr>
                        <th >ID</th>
                        <th >Tên</th>
                        <th>Lương</th>
                        <th>Ngày lãnh lương</th>
                        <th>Ngày công</th>
                        <th>Ngày cuối đi làm</th>
                        <th colspan="3">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listOfEmp.size()) {
                            Employee emp_temp=listOfEmp.get(i);
                            %>
                            <tr>
                                <td><%=emp_temp.getEmployeeId()%></td>
                                <td><%=emp_temp.getEmployeeName()%></td>
                                <td><%=emp_temp.getSalary()%></td> 
                                <td><%=emp_temp.getPaycheck()%></td>
                                <td><%=emp_temp.getWorkdate()%></td>
                                <td><%=emp_temp.getLastAtt()%></td>
                                <td><button id="editemp-att" class="btn"><i class="fas fa-edit"></i></button></td>
                                <td><button id="check-att" class="btn" style=" background-color: yellowgreen;"><i class="fas fa-check"></i></button></td>
                                <td><button id ="payluong-att" class="btn" style=" background-color: lightskyblue;"><i class="fas fa-hand-holding-usd"></i></button></td>
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
