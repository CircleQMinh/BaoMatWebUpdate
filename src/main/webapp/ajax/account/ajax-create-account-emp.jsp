<%-- 
    Document   : ajax-create-account-emp
    Created on : Dec 12, 2020, 6:10:48 PM
    Author     : ASUS
--%>

<%@page import="Model.Account"%>
<%@page import="Dao.AccountDao"%>
<%@page import="Dao.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="mycssadminpage.css" type="text/css">
        <script src="testjavascript.js" type="text/javascript"></script>
        <script src="jquery.tablePagination.js" type="text/javascript"></script>
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
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");
            int id = Integer.valueOf(request.getParameter("id"));
            String retype = request.getParameter("retype");
            
            String url="https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607530494/account/emp_bz5vtq.jpg";
            if(!retype.equals(pass))
            {
                errorsql = "M???t kh???u nh???p l???i kh??ng ch??nh x??c";
            }
            if(errorsql=="")
            {
                try {
                    Account acc=new Account(name,pass,"employee",id,url);
                    AccountDao.saveAcc(acc);
                    errorsql="T???o th??nh c??ng";
                }
                catch(Exception e){
                    errorsql="T???o kh??ng th??nh c??ng";
                }
            }

        %>
        <p id="sqlmsg"> <%=errorsql%></p>
        <p id="msg">
            <%=name%>
            <%=pass%>
            <%=retype%>
            <%=id%>
        </p>
        
    </body>
</html>