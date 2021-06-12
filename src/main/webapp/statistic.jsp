<%-- 
    Document   : statistic
    Created on : Dec 7, 2020, 10:55:43 AM
    Author     : ASUS
--%>

<%@page import="Model.Revenue"%>
<%@page import="java.util.List"%>
<%@page import="Dao.StatisticDao"%>
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
        <%  
            String fd = request.getParameter("FD");
            String td = request.getParameter("TD");
            List < ? > listOfRev = null;
            if( fd==null || td==null )
            {
               fd="2020-12-01";
               td="2020-12-31";
            }
            listOfRev = StatisticDao.getRevenue(fd, td);
            int i=0;
        
        %>
       
        
    </head>
    <body>
        <div class="divchua" id="statistic">
            <div class="dashbo" id="d1">
                <p>Statistic</p>
            </div>
            <div class="dashbosr" >
                <p id="time">???</p>
            </div>
            <div class="dashbosl"  >
                <p >Statistic<button class="minibtn" id="btnacc" onclick="miniTable('statable','btnacc')">-</button></p>                    
            </div>
            <div class="divtable" style="margin-bottom:  2%;margin-left: 2%;">  
                <label ><strong>From</strong></label>
                <input type="date" id="from-date" value="2020-01-01">
                <label ><strong>To</strong></label>
                <input type="date" id="to-date">
                <button class="btn" id="reload-sta">Reload</button>
                <button class="btn" id="reload-sta" onclick="openForm('revueform')">Add Revenue</button>
            </div>
            <div class="divtable" id="sta-gra" style="background-color: #4CAF50;border: 2px #000 solid;margin-left: 2%">
                
            </div>
            <div id="statable" class="divtable" style="display: none;">  
                <table id="tablesta" class="tabledis">
                    <tr>
                        <th>Date</th>
                        <th>Revenue</th>

                    </tr>
                    <%               
                    try {          
                            i=0;
                            while (i<listOfRev.size()) {
                            Object[] row = (Object[]) listOfRev.get(i);
                            %>
                            <tr>
                                <td><%=row[0]%></td>
                                <td><%=row[1]%></td>
                                <%i++;%>
                            </tr>                   
                            <%}
                        }        
                        catch (Exception e)
                        {
                            e.printStackTrace();
                        }
                    %>
                </table>
            </div>
            <br>
            
        </div>
        <script>  
            startTime(); 
        </script>
    </body>
</html>
