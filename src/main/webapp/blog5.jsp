<%-- 
    Document   : blog5
    Created on : Dec 30, 2020, 8:23:11 PM
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
								<img src="images/mother.jpg" class="img-fluid" alt="">
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
                                    <a href="single.jsp" style="color: #7F95D1; font-size: 25px;">Chế độ ăn uống sau sinh: 12 thực phẩm cho bà mẹ mới</a>
                                </h5>
                                <p class="mytext">Trong thời kỳ mang thai, nhu cầu dinh dưỡng của bà bầu vô cùng quan trọng bởi nó cung cấp chất dinh dưỡng cho cả mẹ và bé. Tuy nhiên, chế độ ăn sau sinh cho sản phụ cũng quan trọng không kém. Nó giúp cho cơ thể người mẹ nhanh chóng được phục hồi sau quá trình vượt cạn, đồng thời cung cấp năng lượng và chất dinh dưỡng cần thiết để chăm sóc, nuôi dưỡng trẻ.</p>
                                <br>
                                <img src="images/me.jpg" class="img-fluid" alt="">
                                <p class="mytext1" style="color: #7F95D1; font-size: 25px;">1. Chế độ ăn sau sinh có ảnh hưởng lớn đến nguồn sữa mẹ</p>
                                <br>
                                <p class="mytext">Phần lớn trẻ sau khi sinh được nuôi dưỡng bằng sữa mẹ. Chính vì vậy, nhu cầu dinh dưỡng của bà mẹ thời kỳ này được xây dựng dựa vào số lượng sữa cho con bú và quá trình phát triển của bé.</p>
                                <br>
                                <p class="mytext">Một số nghiên cứu cho rằng tình trạng dinh dưỡng của mẹ sau khi sinh có ảnh hưởng tới số lượng và thành phần của sữa mẹ. Khi người mẹ ăn khẩu phần ít hơn so với nhu cầu thì một số chất dinh dưỡng của sữa mẹ sẽ thay đổi chẳng hạn như tỷ lệ acid béo hoặc một số vi chất dinh dưỡng. Để đảm bảo khẩu phần ăn của mẹ trong giai đoạn này cần cung cấp đủ và cân đối các thành phần dinh dưỡng. Ngoài ra, nên kết hợp đa dạng các loại thực phẩm để nâng cao chất lượng khẩu phần ăn. Bên cạnh đó, những thực phẩm sử dụng trong khẩu phần nên lựa chọn thực phẩm theo mùa.</p>
                                <br>
                                <p class="mytext1" style="color: #7F95D1; font-size: 25px;">2. Nhu cầu dinh dưỡng của bà mẹ sau sinh</p>
                                <br>
                                <p class="mytext2" >* Năng lượng: Năng lượng của bà mẹ trong thời kỳ này là cần thiết và nên bổ sung tương đương với năng lượng để mẹ bài tiết sữa. Nhu cầu năng lượng cần bổ sung thêm 550 - 625 kcal/ngày so với nhu cầu của người trưởng thành.</p>
                                <br>
                                <p class="mytext2">* Protein: Nhu cầu protein được tăng thêm so với người trưởng thành là 20 -25 gam/ ngày.</p>
                                <br>
                                <p class="mytext2">* Lipid: Đối với phụ nữ nói chung và bà mẹ sau sinh nói riêng, nhu cầu lipid/ năng lượng tổng số (%) là 20 - 25%, và tối đa là 30%</p>
                                <br>
                                <p class="mytext2">* Vitamin: Vitamin B2 (tăng thêm 0.5mg/ngày), vitamin C (95mg/ngày), folate (tăng thêm 100 mcg/ngày), vitamin A (850mg/ngày)</p>
                                <br>
        
                                <p class="mytext1" style="color: #7F95D1; font-size: 25px;">3. Những thực phẩm nên chọn cho bà mẹ sau sinh</p>
                                <br>
                                <p class="mytext">Thường xuyên ăn thực phẩm lành mạnh sẽ giúp tối đa hóa năng lượng cho bà mẹ sau sinh. Lựa chọn thực phẩm cho bà mẹ sau sinh đóng vai trò quan trọng đến chất lượng sữa. Một số thực phẩm lành mạnh nên có trong khẩu phần của bà mẹ sau sinh bao gồm:</p>
                                <br>
                                <p class="mytext1">3.1. Cá hồi</p>
                                <br>
                                <p class="mytext">Đây là loại thực phẩm có lợi cho những bà mẹ sau sinh. Cá hồi giống như các loại cá béo khác có chứa hàm lượng rất phong phú và quan trọng cho sự phát triển hệ thần kinh của bé. Hàm lượng DHA trong sữa mẹ không cao, nhưng nếu mẹ tiêu thụ nhiều cá hồi thì hàm lượng này sẽ tăng lên.</p>
                                <br>
                                <img src="images/cahoi.jpg" class="img-fluid" alt="">
                                <p class="mytext">DHA trong cá hồi cũng có thể giúp cải thiện tâm trạng. Các nghiên cứu cho rằng DHA đóng vai trò quan trọng trong việc ngăn ngừa trầm cảm sau sinh. Tuy nhiên, cơ quan quản lý Thực phẩm và Dược phẩm (FDA) khuyến cáo, phụ nữ cho con bú nên giới hạn tiêu thụ số lượng cá hồi. Số lượng cá hồi tiêu thụ trung bình trong một tuần được khuyến nghị khoảng 360 gam. Lý do hạn chế tiêu thụ cá hồi để tránh tiếp xúc nhiều với thủy ngân. Mức thủy ngân trong cá hồi là thấp. Nên ăn cá theo khuyến nghị sẽ không gây hại cho cả mẹ và bé.</p>
                                <br>
                                <p class="mytext1">3.2. Sản phẩm sữa ít béo</p>
                                <br>
                                <img src="images/thitbo.jpg" class="img-fluid" alt="">
                                <p class="mytext">Sữa là một phần quan trọng đối với mẹ sau sinh cũng như mẹ đang nuôi con bú. Sữa cung cấp một lượng vitamin D tăng cường sức mạnh của xương. Ngoài ra, nó còn cung cấp protein và vitamin B, cùng với nguồn canxi phong phú. Bà mẹ cho con bú tiêu thụ sữa sẽ được cung cấp thêm canxi giúp cho xương của bé phát triển. Vì vậy, mẹ phải cung cấp đủ canxi để đáp ứng cả nhu cầu của mẹ và bé.</p>
                                <br>
                                <p class="mytext1">3.3. Cây họ đậu</p>
                                <br>
                                <p class="mytext">Đậu là loại thực phẩm giàu sắt, đặc biệt là những loại có màu sẫm như đậu đen và đậu bầu dục. Đây là loại thực phẩm tuyệt vời cho khẩu phần của bà mẹ cho con bú. Nó có nguồn protein thực vật khá tốt cho bà mẹ đang cho con bú và cả những người ăn chay.</p>
                                <br>
                                <img src="images/quadau.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">3.4. Quả việt quất</p>
                                <br>
                                <img src="images/vietquat.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Quả việt quất là loại quả mọng chứa nhiều vitamin và chất khoáng lành mạnh cho bà mẹ sau sinh. Ngoài ra, nó còn cung cấp cho một lượng carbohydrate để giúp bà mẹ giữ mức năng lượng cao.</p>
                                <br>
                                <p class="mytext1">3.5. Gạo lứt</p>
                                <br>
                                <img src="images/gaolut.jpg" class="img-fluid" alt="">
                                <p class="mytext">Với những bà mẹ sau sinh, vấn đề cân nặng luôn được quan tâm. Hầu hết các bà mẹ đều muốn giảm cân nặng bằng cách cắt giảm lượng carbs trong khẩu phần. Tuy nhiên, giảm cân quá nhanh sẽ khiến quá trình tiết sữa bị giảm. Trong giai đoạn này, mẹ có thể sử dụng carbs nguyên hạt như gạo nâu đưa vào khẩu phần để đảm bảo mức năng lượng cần thiết theo khuyến nghị. Thêm vào đó, các loại thực phẩm như gạo lứt có thể cung cấp cho mẹ lượng calo cần thiết để tạo ra sữa chất lượng tốt nhất cho bé.</p>
                                <br>
                                
                                <p class="mytext1">3.6. Trái cam</p>
                                <br>
                                <img src="images/quacam.jpg" class="img-fluid" alt="">
                                <p class="mytext">Đây là loại thực phẩm tiện lợi và bổ dưỡng. Cam không những giúp mẹ sau sinh tăng cường năng lượng mà nó còn cung cấp lượng vitamin C phong phú đáp ứng nhu cầu của cả mẹ và bé.</p>
                                <br>
                                <p class="mytext1">3.7. Trứng</p>
                                <br>
                                <img src="images/trung.jpg" class="img-fluid" alt="">
                                <p class="mytext">Trứng là loại thực phẩm linh hoạt đáp ứng nhu cầu protein hàng ngày. Ngoài ra, nó còn được coi là có hàm lượng protein hoàn hảo với hầu hết các acid amin mà cơ thể không tự tổng hợp được. Trứng không những chứa một lượng vitamin và khoáng chất mà còn có hàm lượng choline khá dồi dào. Vì thế, trứng là thực phẩm không thể thiếu trong khẩu phần ăn của bà mẹ sau sinh bởi nó đáp ứng đủ những chất cần thiết theo nhu cầu khuyến nghị.</p>
                                <br>
            
                                <p class="mytext1">3.8. Bánh mì nguyên chất</p>
                                <br>
                                <img src="images/banhmi.jpg" class="img-fluid" alt="">
                                <p class="mytext">Acid folic rất quan trọng trong sự phát triển của bé trong giai đoạn đầu của thai kỳ. Nhưng tầm quan trọng của nó không kết thúc ở đó. Acid folic còn là một chất dinh dưỡng quan trọng trong sữa mẹ mà bé cần để có sức khỏe tốt. Bánh mì nguyên chất không chỉ tăng cường acid folic trong khẩu phần ăn mà nó còn cung cấp một lượng chất xơ và sắt lành mạnh.</p>
                                <br>
                                <p class="mytext1">3.9. Rau lá xanh</p>
                                <br>
                                <p class="mytext">Các loại rau lá xanh như rau bina, củ cải Thụy sĩ, bông cải xanh có chứa hàm lượng vitamin A cao - là vitamin rất tốt cho cả mẹ và bé. Những lợi ích của chúng không dừng ở đó. Chúng còn là thực phẩm có hàm lượng canxi, vitamin C và sắt tốt cho cơ thể. Bên cạnh đó, chúng chứa cả chất chống oxy hóa tốt cho tim và ít calo.</p>
                                <br>
                                <img src="images/bina.jpg" class="img-fluid" alt="">
                                <p class="mytext6">Rau bina rất tốt cho mẹ sau sinh</p>
                                <br>
                                <br>
                                <p class="mytext1">3.10. Ngũ cốc nguyên hạt</p>
                                <br>
                                <img src="images/ngucoc.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Ngũ cốc nguyên hạt giúp bổ sung các vitamin và chất dinh dưỡng thiết yếu đáp ứng nhu cầu hàng ngày.</p>
                                <br>
                                <p class="mytext1">3.11. Nước</p>
                                <br>
                                <img src="images/uongnc.jpg" class="img-fluid" alt="">
                                <p class="mytext">Nước giúp cho quá trình duy trì năng lượng cũng như khả năng sản xuất sữa của mẹ. Bởi vì các bà mẹ cho con bú đặc biệt có nguy cơ mất nước năng lượng. Do đó, các bà mẹ cần lưu ý bổ sung để đáp ứng nhu cầu về chất lỏng bằng cách uống nước trái cây, sữa....</p>
                                <br>
                                <p class="mytext1">3.12. Thịt bò nạc</p>
                                <br>
                                <p class="mytext">Thịt bò nạc không những tăng cường năng lượng cho mẹ mà còn là thực phẩm cung cấp sắt đáp ứng nhu cầu khuyến nghị. Thiếu sắt có thể làm cạn kiệt năng lượng và cũng như không đáp ứng được nhu cầu sắt khuyến nghị cho bé.</p>
                                <br>
                                <img src="images/thitbo.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Ngoài ra, thịt bò nạc còn là nguồn protein và vitamin B12 rất cần cho bà mẹ cho con bú.</p>
                                <br>

                            
                                <p class="mytext"></p>
                                <br>
                                <p class="mytext1"> ** Mọi đóng góp và thắc mắc về bài viết xin gửi về <a style ="color: brown" href="https://docs.google.com/forms/d/e/1FAIpQLScRf96rQB0h3aTyu30ilCpzniMEo_dNCoV3oaPdWuUChFvaGw/viewform">link này </a>chúng tôi sẵn sàng lắng nghe tất cả ý kiến của các bạn để hoàn thiện 1 cách tốt hơn **</p>
                                <br>
                            </div>
                        </div>
                        
                        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="ru01vTkG"></script>
<div class="fb-comments" data-href="http://127.0.0.1:5500/blog5.jsp" data-numposts="5" data-width=""></div>

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
