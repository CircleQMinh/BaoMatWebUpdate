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
                errorsql="L???i : Ch??a nh???p l????ng nh??n vi??n";
            }
            try{
                int salint=Integer.parseInt(salary);  
                if(salint<0)
                {
                    errorsql="L???i : L????ng nh??n vi??n kh??ng h???p l??? (ph???i l???n h??n 0)";
                }
            }
            catch(Exception e)
            {
                errorsql="L???i : L????ng nh??n vi??n kh??ng h???p l??? (nh???p s???)";
            }
            String add = request.getParameter("address").trim();
            if(add==""||add==null)
            {
                errorsql="L???i : Ch??a nh???p ?????a ch??? nh??n vi??n";
            }
            String phone = request.getParameter("phone").trim();
            if(phone==""||phone==null)
            {
                errorsql="L???i : Ch??a nh???p s??? ??i???n tho???i nh??n vi??n";
            }
            if(!(phone.matches("^[0-9]*$") && phone.length() > 8)){
                errorsql="S??? ??i???n tho???i kh??ng h???p l???";
            }
            String mail = request.getParameter("mail").trim();
            if(mail==""||mail==null)
            {
                errorsql="L???i : Ch??a nh???p mail nh??n vi??n";
            }
            Pattern emailpat;
            emailpat = Pattern.compile("\\S+@gmail.com");
            Matcher emailmat=emailpat.matcher(mail);
            if(!emailmat.matches())
            {
               errorsql="L???i : Mail nh??n vi??n kh??ng h???p l??? , nh???p s??? d???ng gmail "; 
            }
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="L???i : Ch??a nh???p t??n nh??n vi??n";
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
                        errorsql="Th??m nh??n vi??n th??nh c??ng";
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