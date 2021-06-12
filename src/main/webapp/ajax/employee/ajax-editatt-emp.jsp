<%-- 
    Document   : ajax-editatt-emp
    Created on : Dec 7, 2020, 4:18:52 PM
    Author     : ASUS
--%>

<%@page import="Dao.EmployeeDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            String errorsql="";
            String eid = request.getParameter("eid");
            String pay = request.getParameter("paycheck");
            String wd = request.getParameter("wd");
            String last = request.getParameter("last");
            Date payday=Date.valueOf(pay);
            Date lastd=Date.valueOf(last);
            int inteid=Integer.valueOf(eid);
            int intday=Integer.valueOf(wd);
            if(intday<0)
            {
                errorsql="Số ngày công không hợp lệ";
            }
            if(errorsql=="")
            {
                try{
                    
                    EmployeeDao.editattEmp(inteid, payday, intday, lastd);
                    errorsql="Chỉnh sửa thành công";
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
            <p><%=wd%></p>
            <p><%=last%></p>
            <p><%=pay%></p>

        </div>

    </body>
</html>