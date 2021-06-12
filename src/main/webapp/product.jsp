<%-- 
    Document   : product
    Created on : Dec 7, 2020, 10:47:18 AM
    Author     : ASUS
--%>


<%@page import="Model.Unapprovedproduct"%>
<%@page import="Dao.CategoryDao"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List < Product > listpro=ProductDao.getAllPro();
    List < Unapprovedproduct > listunpro=ProductDao.getAllUnPro();
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
        <title>Sản phẩm Page</title>
    </head>
    <body>
        <div class="divchua" id="product">
            <div class="dashbo" id="d1">
                <p>Sản phẩm</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl"  >
                 <p >Sản phẩm<button class="minibtn" id="btnpro" onclick="miniTable('producttable','btnpro')">-</button></p>                    
            </div>   
            <div class="searhbar">
                <button class="btn" onclick="openForm('form7open');FillForm7();"><i class="fas fa-plus"></i></button>
                <button class="btn" id="productrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="prosearchbar" type="text" class="myInput" onkeyup="FilterTable('tablepro','prosearchbar','productrefresh','proselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="proselect">
                    <option value="0" >ID</option>
                    <option value="1" selected>Tên</option>
                </select>
            </div>
            <div id="producttable" class="divtable">                    
                <table id="tablepro" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th>Số lượng</th> 
                        <th>Loại</th> 
                        <th>Hình ảnh</th>
                        <th>Ngày thêm</th>
                        <th colspan="2">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listpro.size()) {
                            Product pro=listpro.get(i);
                            %>
                            <tr>
                                <td><%=pro.getProductId()%></td>
                                <td><%=pro.getProductName()%></td>
                                <td><%=pro.getProductDescription()%></td>
                                <td><%=pro.getPrice()%></td>
                                <td><%=pro.getQuantity()%></td>
                                <td><%=pro.getCategory()%></td>
                                <td><img src="<%=pro.getPicture()%>" class="productimg"></td>
                                <td><%=pro.getDateAdded()  %></td>
                                <td><button class="btn" id="pro_edit"><i class="fas fa-edit"></i></button></td>
                                <td><button id ="pro_del" class="btn" style=" background-color: red;"><i class="fa fa-trash"></i></button></td>
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
                 <p > Sản phẩm chưa duyệt <button class="minibtn" id="btnunpro" onclick="miniTable('unproducttable','btnunpro')">-</button></p>                    
            </div>   
            <div class="searhbar">
                <button class="btn" id="unproductrefresh" value="Refresh"><i class="fas fa-sync" ></i></button> 
                <input id="unprosearchbar" type="text" class="myInput" onkeyup="FilterTable('tableunpro','unprosearchbar','unproductrefresh','unproselect')" placeholder="Search for names.." title="Type in a name">
                <select class="myselect" id="unproselect">
                    <option value="0" >ID</option>
                    <option value="1" selected>Tên</option>
                </select>
            </div>
            <div id="unproducttable" class="divtable">                    
                <table id="tableunpro" class="tabledis">
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th>Số lượng</th> 
                        <th>Loại</th> 
                        <th>Hình ảnh</th>
                        <th>Ngày thêm</th>
                        <th colspan="1">Option</th>
                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listunpro.size()) {
                            Unapprovedproduct pro=listunpro.get(i);
                            %>
                            <tr>
                                <td><%=pro.getProductId()%></td>
                                <td><%=pro.getProductName()%></td>
                                <td><%=pro.getProductDescription()%></td>
                                <td><%=pro.getPrice()%></td>
                                <td><%=pro.getQuantity()%></td>
                                <td><%=pro.getCategory()%></td>
                                <td><img src="<%=pro.getPicture()%>" class="productimg"></td>
                                <td><%=pro.getDateAdded()  %></td>
                                <td><button class="btn" id="pro_OK"><i class="fas fa-edit"></i></button></td>
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