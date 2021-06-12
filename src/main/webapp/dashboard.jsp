<%-- 
    Document   : dashboard
    Created on : Dec 7, 2020, 8:17:55 AM
    Author     : ASUS
--%>



<%@page import="Dao.DashboardDao"%>
<%@page import="Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="Model.Employee"%>
<%@page import="Dao.EmployeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int sonv = DashboardDao.SoNhanVien();
    int sosp = DashboardDao.SoSanPham();
    int sokh = DashboardDao.SoKhachHang();
    int sotk = DashboardDao.SoTaiKhoan();
    int soord = DashboardDao.SoOrder();
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
        <link rel="stylesheet" href="css/mycssadminpage.css" type="text/css">
        <script src="https://kit.fontawesome.com/e74f1447db.js" crossorigin="anonymous"></script>
        <script src="javascript/adminpage.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="javascript/jquery.tablePagination.js" type="text/javascript"></script>
        <script src="javascript/jquery-adminpage.js" type="text/javascript"></script>
        <script src="javascript/tableManager.js" type="text/javascript"></script>
        <link href='https://fonts.googleapis.com/css?family=Fredoka One' rel='stylesheet'>
        <!------------------------------------------------------->
<!--        <link rel="stylesheet" href="css/jquery.simple-bar-graph.css" type="text/css">-->
        <link rel="stylesheet" href="css/jquery.simple-bar-graph.min.css" type="text/css">
        <script src="javascript/jquery.simple-bar-graph.js" type="text/javascript"></script>
        <!--<script src="javascript/jquery.simple-bar-graph.min.js" type="text/javascript"></script>-->
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script>
            console.log(<%=sonv%>);
            console.log(<%=sosp%>);
            console.log(<%=sokh%>);
            console.log(<%=sotk%>);
            console.log(<%=soord%>);
            var myStaData = [
                { key: 'jQuery', value: 100 },
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
    <c:if test="${(sessionScope.account==null) || !(sessionScope.account.type=='admin')}">
        <c:redirect url="login-admin"></c:redirect>
    </c:if>
        <div class="navibar" style="z-index: 0;">
            
            <a href="logout"> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Administrator </a>
        </div>
<!--        <nav>
            <button title="Visit Dashboard" id="dashboard"><i class="fas fa-home"></i></button>
            <button title="View Employee" id="emppage"><i class="fas fa-id-card"></i></button>
            <button title="View Product"  id = 'propage'><i class="fas fa-shopping-bag"></i></button>
            <button title="View Customer"  id = 'cuspage'><i class="fas fa-users"></i></button>
            <button title="View Account"  id = 'accpage'><i class="fas fa-key"></i></button>
            <button title="View Order" id = 'orderpage'><i class="fas fa-tasks"></i></button>
            <button title="View Blog" id = 'blogpage'><i class="fab fa-blogger"></i></button>
            <button title="Nạp tài khoản" id = 'bankpage'><i class="far fa-money-bill-alt"></i></button>
            <button title="View Statistic" id="stapage"><i class="fas fa-chart-line"></i></button>
            <button title="Logout" ><i class="fas fa-sign-out-alt"></i></button>
        </nav>-->

        <div id="viewport">
            <div id="sidebar">
                <header>
                    <a href="#" onclick="MenuOPCS()" id="menu-nav"><i class="fas fa-angle-double-left" id="icon-nav"></i></a>
                </header>
                <ul class="nav" id="navlist" >
                    <li>
                        <a href="#" id="dashboard">
                            <i class="fas fa-home"></i> Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#" id="emppage">
                            <i class="fas fa-id-card"></i> Nhân viên
                        </a>
                    </li>
                    <li>
                        <a href="#" id="propage">
                            <i class="fas fa-shopping-bag"></i> Sản phẩm
                        </a>
                    </li>
                    <li>
                        <a href="#" id="cuspage">
                            <i class="fas fa-users"></i> Khách hàng
                        </a>
                    </li>
                    <li>
                        <a href="#" id="accpage">
                            <i class="fas fa-key"></i> Tài khoản
                        </a>
                    </li>
                    <li>
                        <a href="#" id="orderpage">
                            <i class="fas fa-tasks"></i> Đơn hàng
                        </a>
                    </li>
                    <li>
                        <a href="#" id="bankpage">
                            <i class="far fa-money-bill-alt"></i> Nạp tiền
                        </a>
                    </li>
                    <li>
                        <a href="#" id="stapage">
                            <i class="fas fa-chart-line"></i> Thống kê
                        </a>
                    </li>
                    <li>
                        <a href="account-info.jsp">
                            <i class="fas fa-info"></i> My Info
                        </a>
                    </li>
                    <li>
                        <a href="logout">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--        Dashboard code ở đây-->
        <div class="divcontent" id="home">            
            <div class="divchua" id="ds">
                <div class="dashbo" id="d1">
                    <p>Dashboard</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
                <div class="card">
                    <p><i class="fas fa-id-card"></i></p>
                    <h3><%=sonv%></h3>
                    <p>Nhân viên</p>
                    <a onclick="clickme('emppage')">View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-shopping-bag"></i></p>
                    <h3><%=sosp%></h3>
                    <p>Sản phẩm</p>   
                    <a onclick="clickme('propage')">View</a>
                </div>
                <div class="card">
                    <p><i class="fa fa-user"></i></p>
                    <h3><%=sokh%></h3>
                    <p>Khách hàng</p>
                    <a onclick="clickme('cuspage')">View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-key"></i></p>
                    <h3><%=sotk%></h3>
                    <p>Tài khoản</p>
                    <a onclick="clickme('accpage')">View</a>
                </div>
                <div class="card">
                    <p><i class="fa fa-check"></i></p>
                    <h3><%=soord%></h3>
                    <p >Đơn hàng</p>
                    <a onclick="clickme('orderpage')">View</a>
                </div>
                <div class="card">
                    <p><i class="far fa-money-bill-alt"></i></p>
                    <h3>New !!!</h3>
                    <p>Nạp tiền</p>   
                    <a onclick="clickme('bankpage')">View</a>
                </div>
                <div class="card">
                    <p><i class="fas fa-comment-dollar"></i></p>
                    <h3>New !!!</h3>
                    <p>Thống kê</p>
                    <a onclick="clickme('stapage')">View</a>
                </div>

            </div>
        </div>
        <!--Hidden form ở đây-->
        <div class="divform" id="form1" >
            <form >
                <h1>Thêm nhân viên</h1>
                <label ><strong>Tên</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-emp">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-emp">
                <label ><strong>Điện thoại</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-emp">
                <label ><strong>Địa chỉ</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-emp">
                <label ><strong>Lương</strong></label>
                <input type="text" placeholder="Enter Salary" name="salary" id="salary-emp">
                <label ><strong>Giới tính</strong></label>
                <select name="sex" id="sex-emp">
                    <option selected>Nam</option>
                    <option>Nữ</option>
                </select><br>
                <button type="button" id="save_emp"><strong>Thêm</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form1')" ><strong>Close</strong></button>        
            </form>  
        </div> 
        <div class="divform" id="form2" >
            <form >
                <h1>Chỉnh sửa nhân viên</h1>
                <label ><strong>Tên</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-emp-edit">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-emp-edit">
                <label ><strong>Điện thoại</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-emp-edit">
                <label ><strong>Địa chỉ</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-emp-edit">
                <label ><strong>Lương</strong></label>
                <input type="text" placeholder="Enter Salary" name="salary" id="salary-emp-edit">
                <label ><strong>Giới tính</strong></label>
                <select name="sex" id="sex-emp-edit">
                    <option selected>Nam</option>
                    <option>Nữ</option>
                </select><br>
                <label ><strong>Ngày lãnh lương</strong></label>
                <input type="date" id="paycheck-emp-edit" name="paycheck"><br>
                <input type="hidden" id="eid-emp-edit">
                <button type="button" id="edit-emp"><strong>Chỉnh sửa</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form2')" ><strong>Close</strong></button>        
            </form>             
        </div>
        <div class="divform" id="form3" >
            <form >
                <h1>Chỉnh sửa ngày công</h1>
                <br>
                <label ><strong>Ngày công</strong></label>
                <input type="number" id="workdayempatt-edit" name="wd"><br>
                
                <label ><strong>Ngày lãnh lương</strong></label>
                <input type="date" id="paycheckempatt-edit" name="pay"><br>
                <label ><strong>Lần cuối đi làm</strong></label>
                <input type="date" id="lastempatt-edit" name="ld"><br>
                <input type="hidden" id="eidempatt-edit">
                <button type="button" id="editattemp"><strong>Chỉnh sửa</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form3')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divform" id="form7open" style="max-width: 80%">
            <div class="divformupanh" id="form7" style="display: block">
                <form >
                    <h1>Thêm sản phẩm</h1>
                    <br>
                    <label ><strong>Tên</strong></label>
                    <input type="text" placeholder="Enter Name" name="name" id="name-pro-add">
                    <label ><strong>Mô tả sản phẩm</strong></label><br>
                    <textarea name="mota" cols="50" rows="3" id="mota-pro-add" ></textarea><br>
                    <label ><strong>Giá</strong></label>
                    <input type="text" placeholder="Enter Price" name="phone" id="price-pro-add">
                    <label ><strong>Số lượng</strong></label>
                    <input type="text" placeholder="Enter Quantity" name="address" id="qua-pro-add">
                    <label ><strong>Loại</strong></label><br>
                    <input type="text" list="category-pro" id="category-pro-add" />
                    <datalist id="category-pro">
                        <option selected>Dược liệu</option>
                        <option>Thực phẩm chức năng</option>
                        <option >Cao dược liệu</option>
                        <option>Trà cốm thuốc</option>
                    </datalist>
                    <input type="hidden" id="url-pro-add" readonly>
                          
                </form>  
            </div>
            <div class="divupanhupanh" id="form7upanh" style="display: block">
                <form action="" method="post" enctype="multipart/form-data" onsubmit="" id="uploaded-pro-form">
                <fieldset>
                        <input type="hidden" name="upload_preset" readonly value="v0q5hczm" max="10">
                     <p>
                    <label >Select your photo:
                        <input type="file" name="file" accept="image/*" onchange="AJAXSubmit('uploaded-pro-form'); return false;"></label>
                      </p>
                      <img id="uploaded-pro" class="productimgupload" src="https://res.cloudinary.com/dkmk9tdwx/image/upload/v1607672014/1_kkeis8.png">
                </fieldset>
                <button type="button" id="save_pro"><strong>Thêm</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form7open')" ><strong>Close</strong></button> 
                </form>
            </div>
        </div>
        <div class="divform" id="form7edit" style="max-width: 80%">
            <div class="divformupanh" id="form7" style="display: block">
                <form >
                    <h1>Chỉnh sửa sản phẩm</h1>
                    <br>
                    <label ><strong>Tên sản phẩm</strong></label>
                    <input type="text" placeholder="Enter Name" name="name" id="name-pro-edit">
                    <label ><strong>Mô tả sản phẩm</strong></label><br>
                    <textarea name="mota" cols="50" rows="3" id="mota-pro-edit" ></textarea><br>
                    <label ><strong>Giá</strong></label>
                    <input type="text" placeholder="Enter Price" name="phone" id="price-pro-edit">
                    <label ><strong>Số lượng</strong></label>
                    <input type="text" placeholder="Enter Quantity" name="address" id="qua-pro-edit">
                    <label ><strong>Loại</strong></label><br>
                    <input type="text" list="category-pro" id="category-pro-edit" />
                    <datalist id="category-pro">
                        <option selected>Dược liệu</option>
                        <option>Thực phẩm chức năng</option>
                        <option >Cao dược liệu</option>
                        <option>Trà cốm thuốc</option>
                    </datalist>
                    <input type="text" id="url-pro-edit" readonly>
                    <input type="hidden" id="id-pro-edit" readonly>      
                </form>  
            </div>
            <div class="divupanhupanh" id="form7upanh" style="display: block">
                <form action="" method="post" enctype="multipart/form-data" onsubmit="" id="uploaded-pro-form-edit">
                <fieldset>
                        <input type="hidden" name="upload_preset" readonly value="v0q5hczm" max="10">
                     <p>
                    <label >Chọn ảnh :
                        <input type="file" name="file" accept="image/*" onchange="AJAXSubmit_edit_product('uploaded-pro-form-edit'); return false;"></label>
                      </p>
                      <img id="uploaded-pro-edit" class="productimgupload" >
                </fieldset>
                <button type="button" id="edit_pro"><strong>Chỉnh sửa</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form7edit')" ><strong>Close</strong></button> 
                </form>
            </div>
        </div>
        <div class="divform" id="formeditaccemp" >
            <form >
                <h1>Chỉnh sửa tài khoản nhân viên</h1>
                <br>
                <label ><strong>Username</strong></label>
                <input type="text" id="name-acc-emp-edit" name="wd" readonly><br>
                
                <label ><strong>Nhập Password</strong></label>
                <input type="password" id="pass-acc-emp-edit" name="pay"><br>
                <label ><strong>Nhập lại Password </strong></label>
                <input type="password" id="passagain-acc-emp-edit" name="pay"><br>
                <span id='message-edit-emp-acc'></span><br>
                <input type="hidden" id="id-acc-emp-edit">
                <input type="hidden" id="uid-acc-emp-edit">
                <button type="button" id="edit-acc-emp"><strong>Chỉnh sửa</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('formeditaccemp')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divform" id="formempnoacc" >
            <form >
                <h1>Tạo tài khoản nhân viên</h1>
                <br>
                <label ><strong>Username</strong></label>
                <input type="text" id="name-acc-empnoacc" name="wd"><br>
                
                <label ><strong>Nhập Password</strong></label>
                <input type="password" id="pass-acc-empnoacc" name="pay"><br>
                <label ><strong>Nhập lại Password </strong></label>
                <input type="password" id="passagain-acc-empnoacc" name="pay"><br>
                <span id='message-create-emp-acc'></span><br>
                <input type="hidden" id="id-acc-empnoacc">
                <button type="button" id="acc-empnoacc"><strong>Tạo</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('formempnoacc')" ><strong>Close</strong></button>        
            </form>  
        </div>
        
         <div class="divform" id="form10">
            <form >
                <h1>Thêm Khách</h1>
                <label ><strong>Tên</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-cus">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-cus">
                <label ><strong>Điện thoại</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-cus">
                <label ><strong>Địa chỉ</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-cus">               
                <label ><strong>Giới tính</strong></label>
                <select name="sex" id="sex-cus">
                    <option selected>Nam</option>
                    <option>Nữ</option>
                </select><br>
                <button type="button" id="save_cus"><strong>Thêm</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form10')" ><strong>Close</strong></button>        
            </form>  
        </div> 
        
        <div class="divform" id="form11" >
            <form >
                <h1>Chỉnh sửa Khách</h1>
                <label ><strong>Tên</strong></label>
                <input type="text" placeholder="Enter Name" name="name" id="name-cus-edit">
                <label ><strong>E-mail</strong></label>
                <input type="text" placeholder="Enter E-mail" name="mail" id="mail-cus-edit">
                <label ><strong>Điện thoại</strong></label>
                <input type="text" placeholder="Enter Phone" name="phone" id="phone-cus-edit">
                <label ><strong>Địa chỉ</strong></label>
                <input type="text" placeholder="Enter Address" name="address" id="add-cus-edit">               
                <label ><strong>Giới tính</strong></label>
                <select name="sex" id="sex-cus-edit">
                    <option selected>Nam</option>
                    <option>Nữ</option>
                </select><br>
                
                <input type="hidden" id="cid-cus-edit">
                <button type="button" id="edit-cus"><strong>Chỉnh sửa</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form11')" ><strong>Close</strong></button>        
            </form>             
        </div>
        <div class="divform" id="updateOrder" >
            <form >
                <h1>Cập nhập trạng thái đơn hàng</h1>
                <br>
                <label ><strong>Order ID</strong></label>
                <input type="number" id="orderid-edit" name="wd"><br>
                <label ><strong>Ghi chú</strong></label>
                <input type="text" id="ordernote-edit" name="wd"><br>
                <label ><strong>Trạng thái</strong></label>
                <select name="orderStatus" id="order-status">
                    <option selected value="1">Chưa duyệt</option>
                    <option value="2">Đã duyệt</option>
                    <option value="6">Hủy</option>
                </select><br>
                <button type="button" id="editorder_status"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('updateOrder')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divform" id="bankform" >
            <form >
                <h1>Nạp tiền</h1>
                <br>
                <label ><strong>ID </strong></label>
                <input type="number" id="bank-id" name="wd" readonly><br>
                
                <label ><strong>Số tiền</strong></label>
                <input type="number" id="bank-money" name="wd"><br>
                
                <br>
                <button type="button" id="bank_add_money"><strong>Add</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('bankform')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divform" id="revueform" >
            <form >
                <h1>Lưu doanh thu</h1>
                <br>
                <label ><strong>ID </strong></label>
                <input type="date" id="add-rev-date" name="wd" ><br>
                
                <label ><strong>Số tiền</strong></label>
                <input type="number" id="rev-money" name="wd"><br>
                
                <br>
                <button type="button" id="rev_add_money"><strong>Add</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('revueform')" ><strong>Close</strong></button>        
            </form>  
        </div>
        <div class="divorderinfo" id="order-info-form" >

        </div>
<!--        // thông báo tải trang -->
        <div class="divwait" id="formwait" >

        </div>
    </body>
</html>
