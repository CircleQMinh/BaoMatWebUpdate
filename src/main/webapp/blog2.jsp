<%-- 
    Document   : blog2
    Created on : Dec 30, 2020, 8:11:06 PM
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
								<img src="images/om2.jpg" class="img-fluid" alt="">
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
                                    <a href="single.jsp">Mẹo hay chữa cảm lạnh, cảm cúm mùa đông không cần dùng thuốc</a>
                                </h5>
                                <p class="mytext">Mùa đông là thời điểm mọi người rất dễ bị cảm lạnh, cảm cúm, nhất là đối với trẻ nhỏ. Bài viết sau đây sẽ giúp bạn có cách chữa cảm lạnh, cảm cúm không cần dùng thuốc.</p>
                                <br>
                                <img src="images/cam.jpg" class="img-fluid" alt="">
                                <p class="mytext1">Ốm vào mùa đông đem lại cảm giác rất khó chịu</p>
                                <br>
                                <p class="mytext1">1. Dùng cây tía tô</p>
                                <br>
                                <p class="mytext">Cây tía tô không chỉ chữa cảm lạnh hiệu quả mà còn rất an toàn cho sức khỏe, hạn chế được việc dùng thuốc. Bạn chỉ cần lấy 20g lá cây tía tô tươi, chế thêm nước sôi, khuấy đều gạn lấy nước nóng; hoặc dùng 10 lá cắt nhỏ trộn với cháo nóng, ăn rồi nằm nghỉ cho ra mồ hôi. Ngoài ra, có thể thêm hành sống giã nhỏ 5g, gừng tươi giã nhỏ ba lát, muối vừa đủ để nấu cháo giải cảm.</p>
                                <br>
                                <img src="images/tiato.jpg" class="img-fluid" alt="">
                                <p class="mytext1">Tía tô có tác dụng giải cảm rất tốt</p>
                                <br>
                                <p class="mytext1">2. Dùng vỏ và lá bưởi</p>
                                <br>
                                <p class="mytext">Trong vỏ bưởi có chứa tinh dầu vị cay, ngọt, đắng giúp trị ho và giải cảm rất tốt. Bạn chỉ cần dùng lá bưởi tươi, kết hợp thêm lá chanh, lá sả, hương nhu đun sôi rồi xông sẽ giải cảm được. Nếu bị cảm cúm dẫn tới ho có đờm, hãy lấy vỏ bưởi gọt bỏ lớp ngoài, cắt thành từng khúc rồi đun sôi, sau đó vắt nước, rồi ngâm trong đường 1 tuần. Sau đó, lấy nước bưởi ngâm nuốt từ từ, sau vài ngày sẽ thuyên giảm hẳn.</p>
                                <br>
                                <img src="images/buoi.jpg" class="img-fluid" alt="">
                                <br>
                                <br>
                                <p class="mytext1">3. Súc miệng nước muối</p>
                                <br>
                                <p class="mytext">Đây là một trong những cách chữa cảm lạnh, cảm cúm rất đơn giản mà lại hiệu quả. Muối giúp phòng tránh các bệnh liên quan đến đường hô hấp, nhờ khả năng sát khuẩn vùng miệng, họng nên sẽ giảm bớt cơn ho cho bạn. Bạn có thể làm nước muối theo tỷ lệ 9gr muối với 1 lít nước rồi đun sôi, để nguội. Nếu muốn nhanh chóng và tiện lợi hơn, bạn có thể mua nước muối sinh lý tại các hiệu thuốc và súc miệng.</p>
                                <br>
                                <img src="images/nuocmuoi.jpg" class="img-fluid" alt="">
                                <br>
                                <br>
                                <p class="mytext1">4. Dùng tỏi tía</p>
                                <br>
                                <p class="mytext">Tỏi không chỉ là một loại gia vị mà còn là phương thuốc trị cảm lạnh và cảm cúm vô cùng hiệu quả. Theo Đông y, tỏi có vị cay, tính ôn, nằm trong hai kinh can và vị. Tác dụng thanh nhiệt, giải độc, sát trùng, chữa bệnh lỵ ra máu, tiêu nhọt, hạch ở phổi, tiêu đàm, trừ ho.</p>
                                <br>
                                <p class="mytext">Còn theo y học hiện đại, trong tỏi có chứa chất oxy hóa mạnh, có thể tiêu diệt vi rút, kháng khuẩn nên chữa cảm lạnh, cảm cúm rất tốt. Bạn có thể dùng cách trị cảm lạnh này ngay khi có những dấu hiệu đầu tiên của bệnh.</p>
                                <br>
                                <p class="mytext">Để chữa cảm lạnh, bạn dùng tỏi tươi bóc vỏ, giã nát rồi ngửi nhiều lần, sau đó pha phần tỏi giã nát với nước và uống. Ngoài ra, bạn có thể thái lát tỏi, ngâm trong giấm khoảng 30 ngày, rồi ngậm lát tỏi trong miệng từ 10 đến 15 phút mỗi ngày.</p>
                                <br>
                                <img src="images/toi.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">Tỏi tía là 1 cách giải cảm hiệu quả không phải ai cũng biết</p>
                                <br>
                                <p class="mytext1"> ** Mọi đóng góp và thắc mắc về bài viết xin gửi về <a style ="color: brown" href="https://docs.google.com/forms/d/e/1FAIpQLScRf96rQB0h3aTyu30ilCpzniMEo_dNCoV3oaPdWuUChFvaGw/viewform">link này </a>chúng tôi sẵn sàng lắng nghe tất cả ý kiến của các bạn để hoàn thiện 1 cách tốt hơn **</p>
                                <br>
                            </div>
                        </div>
                        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="Rs94AAVF"></script>
<div class="fb-comments" data-href="http://127.0.0.1:5500/blog2.jsp" data-numposts="5" data-width=""></div>
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
