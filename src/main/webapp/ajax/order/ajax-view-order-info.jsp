<%-- 
    Document   : ajax-view-order-info
    Created on : Jan 11, 2021, 1:45:23 PM
    Author     : ASUS
--%>

<%@page import="Dao.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int ID = Integer.parseInt(request.getParameter("ID"));
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="info">
            <div class="dashbosr" >
                <p style="font-family: sans-serif;text-align: center;margin-bottom: 0%;"> Danh sách sản phẩm</p>
            </div>
            <div class="divtable" style="width: 100%">   
                <table class="tabledis" style="margin-left: 0%">
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Số lượng</th>
                    </tr>
                    <%
                        try 
                        {
                            int j=0;
                            List<?> prolist = OrderDAO.getProductListofOrder(ID);
                            while(j<prolist.size())
                            {
                                Object[] row = (Object[])prolist.get(j);
                            %>
                            <tr>
                                <td><%=row[1]%></td>
                                <td><img src="<%=row[3]%>" class="productimg"></td>
                                <td><%=row[4]%></td>
                                <%j++;%>
                            </tr>
                            <% }
                        }
                        catch(Exception e)
                        {

                        }
                    %>
                </table>
<!--                <button type="button" onclick="closeForm('order-info-form')" ><strong>OK</strong></button>-->
                <button type="button" style="background-color: red;width: 100%" onclick="closeForm('order-info-form')" ><strong>Close</strong></button>
            </div>
        </div>
    </body>
</html>
