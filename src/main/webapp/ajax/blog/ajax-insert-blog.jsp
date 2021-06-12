<%-- 
    Document   : ajax-insert-blog
    Created on : Dec 28, 2020, 4:08:04 AM
    Author     : KHOAPHAN
--%>
<%@page import="java.util.Set"%>
<%@page import="Model.Order"%>
<%@page import="Dao.BlogDao"%>
<%@page import="Model.Blog"%>
<%@page import="Dao.CategoryDao"%>
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
            
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên của blog";
            }
            String content = request.getParameter("content").trim();
            if(content==""||content==null)
            {
                errorsql="Lỗi : Chưa nhập nội dung";
            }          
            String synopsis = request.getParameter("synopsis").trim();
            if(synopsis==""||synopsis==null)
            {
                errorsql="Lỗi : Chưa nhập tóm tắt";
            }
            
            //Set<Order> oderes = request.getParameter("oder").trim();
            if(errorsql=="")
            { 
                
                try {
              
                        Blog blo = new Blog(name,content,synopsis);
                        BlogDao.saveBlo(blo);
                        errorsql="Thêm blog mới thành công";
                    }        
                    catch (Exception a) 
                    {
                        a.printStackTrace();
                        errorsql=String.valueOf(a);
                        errorsql="Không thành công";
                    }
            }
            
        %>
        <p id="msg">
        <%=name%><br>   
        <%=content%><br>  
        <%=synopsis%><br>          
        <%=errorsql%><br>        
        </p>
        <div id="errormsg">
            <%=errorsql%>
        </div>
        <p id="sqlmsg"> <%=errorsql%></p>
    </body>
</html>
