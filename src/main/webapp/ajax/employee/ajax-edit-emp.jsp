<%-- 
    Document   : ajax-edit-emp
    Created on : Dec 7, 2020, 1:58:01 PM
    Author     : ASUS
--%>

<%@page import="java.sql.Date"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.EmployeeDao"%>
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
            String errorsql="";
            String eid=request.getParameter("eid").trim();
            String salary = request.getParameter("salary").trim();
            String pay=request.getParameter("paycheck").trim();
            if(salary==""||salary==null)
            {
                errorsql="Lỗi : Chưa nhập lương nhân viên";
            }
            try{
                int salint=Integer.parseInt(salary);  
                if(salint<0)
                {
                    errorsql="Lỗi : Lương nhân viên không hợp lệ (phải lớn hơn 0)";
                }
            }
            catch(Exception e)
            {
                errorsql="Lỗi : Lương nhân viên không hợp lệ (nhập số)";
            }
            String add = request.getParameter("address").trim();
            if(add==""||add==null)
            {
                errorsql="Lỗi : Chưa nhập địa chỉ nhân viên";
            }
            String phone = request.getParameter("phone").trim();
            if(phone==""||phone==null)
            {
                errorsql="Lỗi : Chưa nhập số điện thoại nhân viên";
            }
            if(!(phone.matches("^[0-9]*$") && phone.length() > 8)){
                errorsql="Số điện thoại không hợp lệ";
            }
            String mail = request.getParameter("mail").trim();
            if(mail==""||mail==null)
            {
                errorsql="Lỗi : Chưa nhập mail nhân viên";
            }
            Pattern emailpat;
            emailpat = Pattern.compile("\\S+@gmail.com");
            Matcher emailmat=emailpat.matcher(mail);
            if(!emailmat.matches())
            {
               errorsql="Lỗi : Mail nhân viên không hợp lệ , nhập sử dụng gmail "; 
            }
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên nhân viên";
            }
            String sex = request.getParameter("sex");
            Date payday=Date.valueOf(pay);
            if(errorsql=="")
            {
                try{
                    int inteid=Integer.valueOf(eid);
                    int intsal=Integer.valueOf(salary);
                    EmployeeDao.editEmp(inteid,name,sex,mail,phone,add,intsal,payday);
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
            <p><%=name%></p>
            <p><%=sex%></p>
            <p><%=mail%></p>
            <p><%=phone%></p>
            <p><%=add%></p>
            <p><%=salary%></p>
            <p><%=pay%></p>
        </div>

        
    </body>
</html>