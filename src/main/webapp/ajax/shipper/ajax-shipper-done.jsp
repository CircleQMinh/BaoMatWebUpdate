<%-- 
    Document   : ajax-shipper-done
    Created on : Dec 28, 2020, 12:05:00 PM
    Author     : ASUS
--%>

<%@page import="Dao.RevenueDao"%>
<%@page import="Model.Revenue"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="Model.Product"%>
<%@page import="Dao.ProductDao"%>
<%@page import="java.util.List"%>
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
        List<?> prolist = OrderDAO.getProductListofOrder(OID);
        int i=0;int rev=0;
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        Date today=c.getTime();
        if(errorsql=="")
        {
            
            while(i<prolist.size())
            {
                Object[] row = (Object[])prolist.get(i);
                int id = (int)row[0];
                int qua = (int)row[4];
                Product pro = ProductDao.getPro(id);
                rev+=pro.getPrice()*qua;
                
                Revenue re = new Revenue(rev, today);
                RevenueDao.saveRevenue(re);
                
                ProductDao.editProCount(id, qua);
                
                i++;
            }
            
            OrderDAO.editOrd(OID, 4);
            OrderDAO.editOrdShippedDate(OID, today);
            errorsql="Xác nhận thành công";
        }
        
    %>
    <body>
        <h1>Hello World!</h1>
        <p id="sqlmsg"> <%=errorsql%></p>
        
    </body>
</html>
