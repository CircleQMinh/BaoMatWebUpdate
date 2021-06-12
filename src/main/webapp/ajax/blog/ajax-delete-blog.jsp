
<%-- 
    Document   : ajax-delete-blog
    Created on : Dec 28, 2020, 4:07:42 AM
    Author     : KHOAPHAN
--%>
<%@page import="Dao.BlogDao"%>
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
            String BID = request.getParameter("BID");
            
            try {
                int id=Integer.valueOf(BID);
                BlogDao.deleteBlo(id);
                errorsql="Xóa thành công";
            }
            catch(Exception e){
                errorsql="Xóa không thành công";
            }
        %>
        <p id="sqlmsg"> <%=errorsql%></p>
        <div id="errormsg">
            <%=BID%>
        </div>
        
    </body>
</html>
