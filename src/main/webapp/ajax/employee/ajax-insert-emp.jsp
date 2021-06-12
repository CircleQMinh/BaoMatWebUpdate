<%-- 
    Document   : ajax-insert-emp
    Created on : Dec 7, 2020, 1:23:31 PM
    Author     : ASUS
--%>

<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="mycssadminpage.css" type="text/css">
        <script src="testjavascript.js" type="text/javascript"></script>
        <style>
            .tabledis{
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
            margin-left: 1%;
            margin-bottom: 1%;
            font-size: 14px;
        }
        .tabledis td,th{
            border: 1px solid #ddd;
            padding: 8px;
        }
        .tabledis tr:nth-child(even){background-color: #f2f2f2;}
        .tabledis tr:hover{background-color: #ddd;}
        .tabledis th{
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            background-color: DodgerBlue;
            border: none; 
            color: white; 
            padding: 12px 16px;
            font-size: 12px; 
            cursor: pointer;
            margin-left: 1%;
            margin-bottom: 1%;
          }
        </style>
        <script>
            
            
        </script>
        <title>Testing</title>
    </head>
    <body>      
        <%
            String errorsql="";
            String salary = request.getParameter("salary").trim();
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
            Calendar c = Calendar.getInstance();
            c.setTime(new Date()); // Now use today date.
            c.add(Calendar.DATE, 30); // Adding 30 days
            Date payday=c.getTime();
            c.setTime(new Date());
            c.add(Calendar.DATE, -1);
            Date lastd=c.getTime();

            if(errorsql=="")
            { 
                int intsal=Integer.valueOf(salary);
                try {
              
                        Employee emp=new Employee(mail,phone,add,name,sex,intsal,payday,0,lastd);
                        EmployeeDao.saveEmp(emp);
                        errorsql="Thêm nhân viên thành công";
                    }        
                catch (Exception e) 
                    {
                        e.printStackTrace();
                        errorsql=String.valueOf(e);
                    }
            }
            
        %>
        <p id="msg">
        <%=name%><br>   
        <%=mail%><br>  
        <%=phone%><br>  
        <%=add%><br>  
        <%=sex%><br>  
        <%=salary%><br> 
        <%=payday%><br> 
        <%=errorsql%><br>        
        </p>
        <div id="errormsg">
            <%=errorsql%>
        </div>
        <p id="sqlmsg"> <%=errorsql%></p>
    </body>
</html>