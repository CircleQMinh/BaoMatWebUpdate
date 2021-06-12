<%-- 
    Document   : ajax-edit-ord
    Created on : Dec 9, 2020, 9:39:04 PM
    Author     : ASUS
--%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="Model.*"%>
<%@page import="Dao.*"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
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
            String eid=request.getParameter("eid").trim();
            String status = request.getParameter("status").trim();
            System.out.println("Update");
            if(errorsql=="")
            {
                try{
                    Order o =OrderDAO.getOrder(Integer.parseInt(eid));
                    o.setStatus(Integer.parseInt(status));
                    o.setNote("Khách hủy đơn hàng");
                    OrderDAO.updateEmp(o);
                    System.out.println(o.getPaymentType());
                    String pmt=o.getPaymentType();
                    if(pmt.equals("app account")){
                        List<?> prolist = OrderDAO.getProductListofOrder(o.getOrderId());
                        int i=0;int rev=0;
                        while(i<prolist.size())
                        {
                            Object[] row = (Object[])prolist.get(i);
                            int id = (int)row[0];
                            int qua = (int)row[4];
                            Product pro = ProductDao.getPro(id);
                            rev+=pro.getPrice()*qua;
                            i++;
                        }
                        System.out.println(rev);
                        Customer cus = o.getCustomer();
                        System.out.println(cus.getMoney());
                        System.out.println(cus.getCustomerName());
                        cus.setMoney(cus.getMoney()+rev);
                        CustomerDAO.updateCus(cus);
                        System.out.println(cus.getMoney());
                        System.out.println("UpdateCus");
                    }

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
            <p><%=eid%></p>
            <p><%=status%></p>

        </div>
    </body>
</html>
