<%-- 
    Document   : ajax-delete-product
    Created on : Dec 11, 2020, 6:09:21 PM
    Author     : ASUS
--%>
<%@page import="Dao.ProductDao"%>
<%@page import="Model.Product"%>
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
            int Id=0;
            
            try{
                Id=Integer.parseInt(request.getParameter("ID"));
            }
            catch(Exception e)
            {
                errorsql="wtf";
            }
            if(ProductDao.CheckProInUse(Id))
            {
                errorsql="Lỗi : Sản phẩm đang sử dụng trong giao dịch";
            }
            if(errorsql=="")
            { 
                try {
                        ProductDao.deletePro(Id);   
                        errorsql="Xóa sản phẩm thành công";
                    }        
                catch (Exception e) 
                {
                    e.printStackTrace();
                    errorsql=String.valueOf(e);
                    errorsql="Không thành công";
                }
            }
            
        %>
        <p id="sqlsmsg">        
        </p>
        <div id="errormsg">
            <%=errorsql%>
        </div>
        <p id="sqlmsg"> <%=errorsql%> </p>
    </body>
</html>