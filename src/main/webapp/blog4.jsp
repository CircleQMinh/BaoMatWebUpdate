<%-- 
    Document   : blog4.jsp
    Created on : Dec 30, 2020, 8:21:41 PM
    Author     : KHOAPHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DONG Store</title>
        <link href="css/style1.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/384d09a31e.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/32884b7746.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="gogo">
                    <img src="images/logo-default.jpg" width="70" height="70
                    " alt=""/>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="products.jsp">Sản phẩm</a></li>
                        <li><a href="aboutus.jsp">Liên hệ</a></li>
                        <li><a href="myblog.jsp">Blog</a></li>
                        <li><a href="account-info.jsp">Tài khoản</a></li>
                        <c:choose>
                            <c:when test="${sessionScope.account==null}" >
                                <li><a href="login" class="btn-login">Đăng nhập</a></li>
                                <li><a href="register" class="btn-register">Đăng ký</a></li>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${sessionScope.account.type=='customer'}">
                                        <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.customerName}"/></a></li>
                                        <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                    </c:when>
                                    <c:when test="${sessionScope.account.type=='employee'}">
                                        <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.employeeName}"/></a></li>                                   
                                        <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                    </c:when>  
                                    <c:otherwise>
                                         <li><a href="account-info.jsp" class="btn-login"><c:out value="${sessionScope.userInfo.name}"/></a></li>
                                          <li><a href="logout" class="btn-register">Đăng xuất</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>

                        
                    </ul>
                </nav>
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
            </div>
            <div class="row">
                <div class="col-2">
                    <h1>Chào mừng đến với TEAM16</h1>
                    <p>Hãy đăng kí ngay hôm nay<br>Để nhận được những ưu đãi siêu khủng từ chúng tôi......</p>
                    <button value="Explore Now" class="btn" onclick="location.href='register'">Khám phá ngay &#10132;</button>
                </div>
                <div class="col-2">
                    <img src="images/prd8.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!--Trang blog-->
    <section class="our_blog py-lg-5 py-md-5 py-3">
        <div class="container">
            <div class="inner-sec py-lg-5  py-3">
                <h3 class="tittle-wthree text-center mb-lg-5 mb-3">Our Blog</h3>
                <div class="row mt-lg-5 mt-md-4 mt-4">
                    <div class="col-lg-8 left-blog-info text-left">
                        <div class="card">
                            <a href="single.jsp">
								<img src="images/traicay.jpg" class="img-fluid" alt="">
							</a>
                            <div class="card-body">
                                <ul class="blog-icons my-4">
                                    <li>
                                        <a href="#">
											<i class="far fa-calendar-alt"></i> Feb 20 .2018</a>
                                    </li>
                                    <li class="mx-2">
                                        <a href="#">
											<i class="far fa-comment"></i> 21</a>
                                    </li>
                                    <li>
                                        <a href="#">
											<i class="fas fa-eye"></i> 2000</a>
                                    </li>

                                </ul>
                                <h5 class="card-title ">
                                    <a href="single.jsp">Mùa hè, ăn trái cây nào tốt nhất?</a>
                                </h5>
                                <p class="mytext">Mùa hè đến, thời tiết nắng nóng làm cơ thể chúng ta mệt mỏi, rã rời, sức đề kháng giảm sút nên rất dễ bị cảm nắng, say nắng nóng… Hơn nữa, do thời tiết oi bức, các dịch bệnh cũng gia tăng, vì vậy, bổ sung vitamin từ các loại rau tươi, quả chín sẽ giúp cơ thể tăng sức đề kháng chống lại bệnh tật... Vậy nên ăn quả gì, uống nước gì tốt trong ngày hè?</p>
                                <br>
                                <p class="mytext">PGS.TS Nguyễn Thị Lâm, Phó Viện trưởng Viện Dinh dưỡng Quốc gia cho hay, trái cây là nguồn cung cấp chất xơ và vitamin dồi dào. Đây cũng là 1 trong 4 nhóm chất cần thiết cho cơ thể mỗi ngày. Vào mùa hè, lượng vitamin trong trái cây càng trở nên cần thiết khi cơ thể dễ bị mất nước do tiết mồ hôi.</p>
                                <br>
                                <p class="mytext">Bà Lâm khuyến cáo mọi người nên ăn ít nhất 400g hoa quả và rau xanh một ngày để giảm nguy cơ mắc các vấn đề sức khỏe nghiêm trọng như bệnh tim, đột quỵ, tiểu đường tuýp 2 và béo phì.</p>
                                <br>
                                <img src="images/he.jpg" class="img-fluid" alt="">
                                <p class="mytext1">Mùa hè nên ăn gì?</p>
                                <br>
                                <p class="mytext1" style="color: dodgerblue; font-size: 20px;">Trái cây nên ăn</p>
                                <br>
                                <p class="mytext1">1. Quả cam:</p>
                                <br>
                                <p class="mytext">Trong tất cả các loại trái cây, cam, quít là có nhiều vitamin C nên những loại quả này rất tốt để tăng cường khả năng miễn dịch của cơ thể. Vì thế, hãy ăn cam mỗi ngày hoặc uống nước cam, chanh, bưởi để tăng khả năng miễn dịch của cơ thể. Nghiên cứu cho thấy mỗi ngày ăn một quả cam còn phòng ngừa bệnh ung thư.</p>
                                <br>
                                <img src="images/quacam.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">2. Quả dứa:</p>
                                <br>
                                <p class="mytext"> Nhiều người thường nghĩ dứa có tính nóng nhưng thực ra dứa có tính thanh nhiệt. Trong dứa có chứa rất nhiều vitamin và khoáng chất, chứa hàm lượng đáng kể canxi, chất xơ, kali và vitamin C. Đặc biệt, dứa lại rất ít chất béo và hàm lượng cholesterol, rất tốt cho sức khoẻ. Hãy ăn dứa mỗi ngày trong mùa hè để bồi bổ cơ thể.</p>
                                <br>
                                <img src="images/quadua.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">3. Quả ổi:</p>
                                <br>
                                <p class="mytext">Ổi giàu vitamin C, một chất chống ôxy hóa cao trước những tổn thương của da từ ánh nắng mặt trời và ô nhiễm. Mỗi ngày uống 1 ly nước ổi hoặc gọt bỏ hạt và cắt ra ăn vừa ngon thơm, giàu dinh dưỡng và chất xơ lại tốt cho người tiểu đường.</p>
                                <br>
                                <img src="images/oi.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">4. Quả xoài: </p>
                                <br>
                                <p class="mytext">Chứa rất nhiều dưỡng chất như: carotene, kali, sắt, vitamin E... Xoài bổ dưỡng cho cơ thể bạn quanh năm nhưng đặc biệt tốt khi ăn xoài mỗi ngày trong mùa hè vì xoài giúp cơ thể chống lại sự mất nước khi bạn đi ngoài nắng về.</p>
                                <br>
                                <img src="images/xoai.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">5. Dưa hấu:</p>
                                <br>
                                <p class="mytext">Không chỉ là loại quả giúp thanh lọc cơ thể tốt nhất mà còn cải thiện làn da của phụ nữ trong mùa hè. Dưa hấu chứa nhiều vitamin, chống mất nước cho cơ thể trong ngày nóng và làm mịn da.</p>
                                <br>
                                <img src="images/duahau.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">6. Chuối chín:</p>
                                <br>
                                <p class="mytext">Là một nguồn cung cấp kali tuyệt vời cho cơ thể, chuối giúp tim khoẻ và giúp cơ thể chống lại sự mệt mỏi trong thời tiết nắng nóng. Mùa hè nếu ăn một quả chuối chín mỗi ngày sẽ thấy cơ thể thật sự khoẻ mạnh. Những khi vận động quá sức hay khi đi nắng lâu, chỉ cần một quả chuối sẽ vực lại sức nhanh hơn bạn tưởng.</p>
                                <br>
                                <img src="images/chuoi.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">7. Quả đu đủ:</p>
                                <br>
                                <p class="mytext">Đu đủ là loại trái cây ngon ngọt, mát, bổ rất thích hợp trong những ngày hè thời tiết nóng nực. Bên cạnh đó, trong đu đủ còn có một lượng lớn axit ascorbic (vitamin C), vitamin A, canxi, sắt, vitamin B, B2 và carotin giúp làn da không bị khô và mất nước trong mùa hè. Hơn nữa, đu đủ nhuận tràng tránh táo bón.</p>
                                <br>
                                <img src="images/dudu.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">8. Nước đậu đen: </p>
                                <br>
                                <p class="mytext">Trong đậu đen có chứa một lượng khoáng chất vi lượng molypden - một thành phần của emzym sunfile oxidate nên có tác dụng rất tốt trong việc giải độc. Sử dụng nước đậu đen dưới dạng ninh nhừ thêm chút đường (nấu chè) ăn cả cái và nước. Hoặc dùng đậu đen sao vàng đun nước uống thay chè hằng ngày giúp bổ thận, thanh nhiệt, giải độc.</p>
                                <br>
                                <img src="images/dauden.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">9. Quả dâu tây: </p>
                                <br>
                                <img src="images/dau.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Chứa hàm lượng lớn vitamin C, kali, natri và sắt giúp cơ thể chống lại sự mệt mỏi, mất nước trong mùa hè. Dâu tây cũng là loại trái cây rất thích hợp cho người ăn kiêng vì nó có chứa rất ít calo. Bạn có thể rửa sạch và ăn dâu tây trực tiếp hoặc có thể cắt nhỏ trộn với sữa chua đều tốt cho cơ thể và làn da.</p>
                                <br>
                                <p class="mytext1">10. Dừa:: </p>
                                <br>
                                <p class="mytext">Dừa tốt cho cả trẻ em và người lớn vào ngày nắng nóng. Dừa nhiều kali, chất điện giải và chất dinh dưỡng, giữ nước cho cơ thể và giảm cân hiệu quả.</p>
                                <br>
                                <img src="images/dua.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">11. Thanh long: </p>
                                <br>
                                <p class="mytext">Thanh long có chứa nhiều chất dinh dưỡng và vi lượng giúp gia tăng sự chuyển hóa các chất trong cơ thể, tăng cường thải độc, cải thiện làn da giúp da mịn màng. Nhờ có chứa nhiều chất xơ và hàm lượng đường thấp, thanh long còn giúp chữa bệnh tiểu đường và béo phì.</p>
                                <br>
                                <img src="images/thanhlong.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">12. Khế: </p>
                                <br>
                                <p class="mytext">Khế chứa ít calo và giàu vitamin C, có nhiều chất chống oxy hóa. Loại trái cây này thường có từ tháng Bảy đến tháng Chín.</p>
                                <br>
                                <img src="images/khe.jpg" class="img-fluid" alt="">
                                <br>

                                <p class="mytext1"> ** Mọi đóng góp và thắc mắc về bài viết xin gửi về <a style ="color: brown" href="https://docs.google.com/forms/d/e/1FAIpQLScRf96rQB0h3aTyu30ilCpzniMEo_dNCoV3oaPdWuUChFvaGw/viewform">link này </a>chúng tôi sẵn sàng lắng nghe tất cả ý kiến của các bạn để hoàn thiện 1 cách tốt hơn **</p>
                                <br>

                                <p class="mytext"></p>
                                <br>
                            </div>
                        </div>
                        <div id="fb-root"></div>
                            <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="dytUuyGt"></script>
                            <div class="fb-comments" data-href="http://127.0.0.1:5500/blog4.jsp" data-numposts="5" data-width=""></div>

                    </div>
                    <!--//left-->

                    
                    <!--Bên phải sẽ chưa thông tin đăng nhập, top các blog,...-->
                    <aside class = "col-lg-4 right-blog-con text-left" >
                        <div class="right-blog-info text-left">

                            <div class="tech-btm"><!--LƯU Ý-->
                                <img src="images/prd5.jpg" class="img-fluid" alt="">
                            </div>

                            <!--Nơi đăng kí email để nhận thông báo về các bài blog mới nhất-->
                            <div class="tech-btm">
                                <h4>Đăng kí để nhận những thông báo mới nhất</h4>
                                <p>Vui lòng điền email của bạn vào đây</p>
                                <form action="#" method="POST">
                                    <input class="form-control" type="email" placeholder="Email" required="">
                                    <input class="form-control" type="submit" value="Subscribe">
                                </form>
                            </div>

                            <!--Phân chia blog theo các thể loại-->
                            <!--<div class="tech-btm">
                                <h4>Các thể loại</h4>
                                <ul class="list-group-single">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Thuốc Nam
                                        <span class="badge badge-primary badge-pill">14 bài</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Chất lượng PV
                                        <span class="badge badge-primary badge-pill">2 bài</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Trải nghiệm người dùng
                                        <span class="badge badge-primary badge-pill">1 bài</span>
                                    </li>
                                </ul>
                            </div>-->

                            <!--Top blog của tuần-->
                            <div class="tech-btm">
                                <h4>Top Blog của tuần</h4>
                                <!--Top 1-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog4.jsp">
                                            <img src="images/traicay.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Mùa hè, ăn trái cây nào tốt nhất?</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!--Top 2-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog2.jsp">
                                            <img src="images/om2.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Mẹo hay chữa cảm lạnh, cảm cúm mùa đông không cần dùng thuốc</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!--Link các mạng xã hội để dễ tiếp cận với người dùng hơn-->
                            <div class="tech-btm widget_social text-left">
                                <h4>Liên hệ với chúng tôi tại</h4>
                                <ul>
                                    <li>
                                        <a class="twitter" href="#">
										<i class="fab fa-twitter"></i>
										<span class="count">317K</span> Twitter Followers</a>
                                    </li>
                                    <li>
                                        <a class="facebook" href="#">
										<i class="fab fa-facebook-f"></i>
										<span class="count">218k</span> Facebook Followers</a>
                                    </li>
                                    <li>
                                        <a class="dribble" href="#">
                                        <i class="fab fa-youtube"></i>

										<span class="count">215k</span> Youtube Subrice </a>
                                    </li>
                                    <li>
                                        <a class="pin" href="#">
                                        <i class="fab fa-amazon"></i>
										<span class="count">190k đơn hàng</span> Amazone</a>
                                    </li>
                                </ul>
                            </div>

                            <!--Bài viết gần đây-->
                            <div class="tech-btm">
                                <h4>Bài viết gần đây</h4>

                                <!--Bài viết 1-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog2.jsp">
                                            <img src="images/om2.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Mẹo hay chữa cảm lạnh, cảm cúm mùa đông không cần dùng thuốc</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!--Bài viết 2-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog5.jsp">
                                            <img src="images/me.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>Chế độ ăn uống sau sinh: 12 thực phẩm cho bà mẹ mới</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!--Bài viết 3-->
                                <div class="blog-grids row mb-3">
                                    <!--thẻ div chứa ảnh minh họa-->
                                    <div class="col-md-5 blog-grids-left">
                                        <a href="blog3.jsp">
                                            <img src="images/thuocnam.jpg" class="img-fluid" alt="">
                                        </a>
                                    </div>
                                    <!--thẻ div chứa thông tin-->
                                    <div class="col-md-7 blog-grids-right">
                                        <h5>
                                            <a>7 Danh y kiệt xuất trong lịch sử y học Việt Nam</a>
                                        </h5>
                                        <div class="sub-meta">
                                            <span>
                                                <i class="fas fa-clock"></i> 20 May, 2020
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </aside>
                    <!--Kết thúc phần bên phải-->

                </div>
            </div>
        </div>
    </section>

    <!--------- footer  --------->
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Liên hệ</h3>
                    <ul>
                        <li><i class="fas fa-map-marker-alt" style="padding-right: 8.5px"></i> Địa chỉ: 1 Võ Văn Ngân, Linh Chiểu, Thủ Đức</li>
                        <li><i class="fas fa-mobile-alt" style="padding-right: 9px"></i> Tel: 0909999999</li>
                        <li><i class="fas fa-phone-alt" style="padding-right: 5px"></i> Phone: 082.686868</li>
                        <li><i class="fas fa-fax" style="padding-right: 5px"></i> Fax: 024.3294.7979</li>
                    </ul>
                    </br>
                    <h3>Ứng dụng trên điện thoại</h3>
                    <div class="app-logo">
                        <img src="images/playstore.png" alt="">
                        <img src="images/appstore.png" alt="">           
                    </div>
                </div>
                <div class="footer-col-2">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4972148751713!2d106.77022543613889!3d10.849736223750991!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175270ad28d48ab%3A0xa6c02de0a7c40d6c!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrAgUGjhuqFtIEvhu7kgVGh14bqtdCBUcC5IQ00!5e0!3m2!1svi!2s!4v1610775978281!5m2!1svi!2s" width="250" height="200" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></li>

                </div>
                <div class="footer-col-3">
                    <img src="images/logo-default-2.jpg" alt="" style="width: 180px"/>
                    <p>Sức khỏe hôm nay - Hạnh phúc ngày mai  </p>
                </div>
                <div class="footer-col-3">
                    <h3 style="padding-bottom: 8px">Theo dõi</h3>
                    <ul>
                        <li>
                            
                            <i class="fab fa-facebook-square fa-4x" style="padding: 10px"></i>
                            <i class="fas fa-blog fa-4x" style="padding: 10px"></i>

                        </li>
         
                        <li>
                          
                            <i class="fab fa-instagram-square fa-4x" style="padding: 10px"></i>
                            <i class="fab fa-youtube fa-4x" style="padding: 10px"></i>
 
                        </li>
                    </ul>
                    
                </div>
            </div>
            <hr>
            <p class="copyright">Copyright 2020 - Team16</p>
        </div>
    </div>

    <!---- Toggle Menu ------>
    <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight="0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight=="0px")
            {
                MenuItems.style.maxHeight="200px"
            }
            else
            {
                MenuItems.style.maxHeight="0px"
            }
        }
    </script>
    </body>
</html>
