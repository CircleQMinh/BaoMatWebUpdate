<%-- 
    Document   : ajax-edit-product
    Created on : Dec 11, 2020, 4:28:46 PM
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
            String url = request.getParameter("url").trim();
            if(url==""||url==null)
            {
                errorsql="Lỗi : Chưa chọn ảnh";
            }
            String cate = request.getParameter("category");
            if(cate==""||cate==null)
            {
                errorsql="Lỗi : Chưa nhập loại sản phẩm";
            }
            String qua = request.getParameter("qua").trim();
            if(qua==""||qua==null)
            {
                errorsql="Lỗi : Chưa nhập số lượng";
            }
            int intqua=0;
            try{
                intqua=Integer.valueOf(qua);
            }
            catch(Exception e){
                errorsql="Lỗi : Số lượng không hợp lệ";
            }
            String price = request.getParameter("price").trim();
            if(price==""||price==null)
            {
                errorsql="Lỗi : Chưa nhập giá";
            }
            int intprice=0;
             
            try{
                intprice=Integer.valueOf(price);
            }
            catch(Exception e){
                errorsql="Lỗi : Giá không hợp lệ";
            }
            String des = request.getParameter("des").trim();
            if(des==""||des==null)
            {
                errorsql="Lỗi : Chưa nhập mô tả";
            }
            String name = request.getParameter("name").trim();
            if(name==""||name==null)
            {
                errorsql="Lỗi : Chưa nhập tên sản phẩm";
            }
            Calendar c = Calendar.getInstance();
            c.setTime(new Date()); 
            Date today=c.getTime();
            int id = Integer.valueOf(request.getParameter("id").trim());
            
            if(errorsql=="")
            { 

                try {
                        Product  pro = new Product(id,name,des,intprice,intqua,cate,url,today);
                        ProductDao.updatePro(pro);
                        errorsql="Chỉnh sửa sản phẩm thành công";
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
        <%=id%><br> 
        <%=name%><br>   
        <%=des%><br> 
        <%=price%><br> 
        <%=qua%><br> 
        <%=cate%><br> 
        <%=url%><br>  
        <%=errorsql%><br>        
        </p>
        <div id="errormsg">
            <%=errorsql%>
        </div>
        <p id="sqlmsg"> <%=errorsql%></p>
    </body>
</html>