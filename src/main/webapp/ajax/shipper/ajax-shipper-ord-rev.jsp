<%-- 
    Document   : ajax-shipper-ord-rev
    Created on : Jan 18, 2021, 5:13:35 PM
    Author     : ASUS
--%>

<%@page import="Dao.OrderDAO"%>
<%@page import="Model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String errorsql = "";
            String id=request.getParameter("id").trim();
            String note = request.getParameter("note").trim();
            if(errorsql=="")
            {
                try{
                    Order o = OrderDAO.getOrder(Integer.parseInt(id));
                    o.setStatus(6);
                    o.setNote(note);
                    OrderDAO.updateEmp(o);
                    errorsql="Thành công";
                }
                catch(Exception e)
                {
                    errorsql="Lỗi DAO";
                }

            }
        %>
        <p id="sqlmsg"> <%=errorsql%></p>
        <div id="debug">
            <p><%=errorsql%></p>
            <p><%=id%></p>
        </div>
    </body>
</html>
