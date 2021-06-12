<%-- 
    Document   : nhanvien
    Created on : Dec 24, 2020, 7:05:14 PM
    Author     : ASUS
--%>

<%@page import="Model.Account"%>
<%@page import="Dao.EmployeeDao"%>
<%@page import="Model.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script src="javascript/jquery-nvpage.js" type="text/javascript"></script>
        <link href='https://fonts.googleapis.com/css?family=Fredoka One' rel='stylesheet'>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!------------------------------------------>
        <title>Nhân viên</title>
    </head>
    <body>
        <c:if test="${(sessionScope.account==null) || (sessionScope.account.type=='customer')}">
            <c:redirect url="login-employee"></c:redirect>
        </c:if>
         <c:if test="${(sessionScope.account==null) || (sessionScope.account.type=='admin')}">
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>
        <%
                Employee emp = (Employee)request.getSession().getAttribute("userInfo");
                
        %>
        
        <div class="navibar" >
            
            <a href="logout"> <i class="fas fa-sign-out-alt"></i></a>
            <a style="margin-right: 23.5%;font-family: Showcard Gothic,serif;width: 30%">Trang Nhân Viên</a>
            
        </div>
        
<!--        <nav>
            <button title="View Product"  id = 'propage'><i class="fas fa-shopping-bag"></i></button>
            <button title="View Order" id = 'orderpage'><i class="fas fa-tasks"></i></button>
            <button title="Nạp tài khoản" id = 'bankpage'><i class="far fa-money-bill-alt"></i></button>
            <button title="Logout" id="logoutbut"><i class="fas fa-sign-out-alt"></i></button>
        </nav>-->
        <div id="viewport">
            <div id="sidebar">
                <header>
                    <a href="#" onclick="MenuOPCS()"><i class="fas fa-angle-double-left" id="icon-nav"></i></a>
                </header>
                <ul class="nav" id="navlist" >
                    <li>
                        <a href="account-info.jsp" id="my-acc">
                            <i class="fas fa-home"></i> My info
                        </a>
                    </li>
                    <li>
                        <a href="#" id="propage">
                            <i class="fas fa-shopping-bag"></i> Sản phẩm
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
                        <a href="logout">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="divcontent" id="home">       
            
            <div class="divchua" id="ds">
                <div class="dashbo" id="d1">
                    <p>Dashboard</p>
                </div>
                <div class="dashbosr" >
                    <p id="time">???</p>
                </div>
                
            </div>
        </div>
        <div class="dashbosr" >
             <p style="font-family: sans-serif"> Nhân viên đang đăng nhập : <%=emp.getEmployeeName()    %></p>
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
                <button type="button" id="save_pro"><strong>Add</strong></button>   
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
                <button type="button" id="edit_pro"><strong>Edit</strong></button>   
                <button type="button" style="background-color: red;" onclick="closeForm('form7edit')" ><strong>Close</strong></button> 
                </form>
            </div>
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
        <div class="divorderinfo" id="order-info-form" >

        </div>
        <div class="divwait" id="formwait" >

        </div>
    </body>
</html>
