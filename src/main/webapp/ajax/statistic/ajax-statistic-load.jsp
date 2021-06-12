<%-- 
    Document   : ajax-statistic-load
    Created on : Dec 24, 2020, 10:21:38 AM
    Author     : ASUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <!------------------------------------------>
        <link rel="stylesheet" href="css/jquery.simple-bar-graph" type="text/css">
        <link rel="stylesheet" href="css/jquery.simple-bar-graph.min" type="text/css">
        <script src="javascript/jquery.simple-bar-graph" type="text/javascript"></script>
        <script src="jquery.simple-bar-graph.min" type="text/javascript"></script>
        <title>Employee Page</title>
        <script>
            <%
                String fd = request.getParameter("FD");
                String td = request.getParameter("TD");
                
            
            
            %>
            myStaData = [
                    { key: 'jQuery', value: 1000 },
                    { key: 'JavaScript', value: 95 },
                    { key: 'HTML', value: 96 },
                    { key: 'CSS', value: 44 },
                    { key: 'AngularJS', value: 32 },
                    { key: 'ReactJS', value: 130 },
                    { key: 'VueJS', value: 91 }
                ];
            
            
        </script>
        
        
        
    </head>
    <body>
        
        <script>  
            startTime(); 
        </script>
        
        <div id="msg">
            <%=fd%>
            <%=td%>
            
        </div>
    </body>
</html>
