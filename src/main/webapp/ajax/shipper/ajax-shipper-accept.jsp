<%-- 
    Document   : ajax-shipper-accept
    Created on : Dec 28, 2020, 10:28:45 AM
    Author     : ASUS
--%>

<%@page import="Model.Order"%>
<%@page import="Dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String errorsql="";
        int OID = Integer.valueOf(request.getParameter("OID"));
        int SID = Integer.valueOf(request.getParameter("SID"));
        Order ord = OrderDAO.getOrder(OID);
        if(ord.getShipperId()!=null)
        {
            errorsql="Đơn hàng này đã có người giao";
        }
        if(errorsql=="")
        {
            try{
                OrderDAO.editOrdShipper(OID, SID);                
                errorsql="Thành công";
            }
            catch(Exception e)
            {
                errorsql="Không thành công";
            }            
        }
        
    %>
    <body>
        <h1>Hello World!</h1>
        <p id="sqlmsg"> <%=errorsql%> </p>
        
    </body>
</html>
