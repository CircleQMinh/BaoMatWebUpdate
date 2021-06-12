<%-- 
    Document   : ajax-approve-product
    Created on : Dec 29, 2020, 2:14:31 PM
    Author     : ASUS
--%>

<%@page import="Model.Product"%>
<%@page import="Dao.ProductDao"%>
<%@page import="Model.Unapprovedproduct"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
            String errorsql="";
            try{
                int ID = Integer.valueOf(request.getParameter("ID"));
                Unapprovedproduct unpro = ProductDao.getUnPro(ID);
                Product pro = new Product();
                pro.setCategory(unpro.getCategory());
                pro.setDateAdded(unpro.getDateAdded());
                pro.setPicture(unpro.getPicture());
                pro.setPrice(unpro.getPrice());
                pro.setProductDescription(unpro.getProductDescription());
                pro.setProductName(unpro.getProductName());
                pro.setQuantity(unpro.getQuantity());
                ProductDao.savePro(pro);
                ProductDao.deleteUnPro(ID);
                errorsql="Thành công";
            }
            catch(Exception e){
                errorsql="Không thành công";
            }
    %>
    <body>
        <h1>Hello World!</h1><p id="sqlmsg"> <%=errorsql%></p>
    </body>
</html>
