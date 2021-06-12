<%-- 
    Document   : ajax-chamcong-emp
    Created on : Dec 7, 2020, 3:45:02 PM
    Author     : ASUS
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
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
            String EID = request.getParameter("EID");
            String ld=request.getParameter("LD");
            Date last=Date.valueOf(ld);
            Date today=Date.valueOf(LocalDate.now());
            if(last.equals(today))
            {
                errorsql="Đã chấm công nhân viên này rồi !";
            }
            if(errorsql=="")
            {
                try {
                    int id=Integer.valueOf(EID);
                    EmployeeDao.chamcongEmp(id);
                    errorsql="Chấm công thành công";
                }
                catch(Exception e){
                    errorsql="Không thành công";
                }
            }
            
        %>
        <p id="sqlmsg"> <%=errorsql%></p>
        
        
    </body>
</html>