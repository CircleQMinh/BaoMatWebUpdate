<%-- 
    Document   : blog6
    Created on : Dec 30, 2020, 8:24:14 PM
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
        <script src="js/cart.js" type="text/javascript"></script>
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
								<img src="images/thuocnam.jpg" class="img-fluid" alt="">
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
                                    <a href="single.jsp">Thuốc nam chữa bệnh suy thận đơn giản và hiệu quả</a>
                                </h5>
                                <p class="mytext">Để chữa bệnh suy thận hiệu quả, bạn cần phát hiện bệnh sớm và sử dụng đúng thuốc. Bìa viết hôm nay, Thuốc Nam Đông Thân xin chia sẻ bài thuốc nam chữa suy thận hiệu quả và rất đơn giản. Mời các bạn tìm hiểu bài viết dưới đây để có thể nắm rõ hơn về cách chữa suy thận bằng thuốc nam hiệu quả.</p>
                                <br>
                                <img src="images/thuocnam2.jpg" class="img-fluid" alt="">
                               
                                <p class="mytext1">Thuốc nam chữa bệnh suy thận</p>
                                <br>
                                <p class="mytext">Dưới đây là 2 bài thuốc nam chữa bệnh thận, trong dân gian đã có nhiều người áp dụngvà đã đạt những hiệu quả nhất định. Hãy tìm hiểu và thử áp dụng biết đâu sẽ làcơ hội thoát khỏi căn bệnh này cho bạn.</p>
                                <br>
                                <img src="images/thuocnam3.jpg" class="img-fluid" alt="">
                                <p class="mytext1">1. Bài thuốc chữa bệnh suy thận số 1</p>
                                <br>
                                <p class="mytext">Bài thuốc bao gồm hai cây thảo dược chính là cây nhọ nồi(hay còn gọi là cây cỏ mực) và đỗ đen. Dược tính của hai loại thảo dược này dùng để chữa suy thận rất tốt, tuy nhiên người bệnh cần áp dụng ngay từ giai đoạn đầu, nếu để đến giai đoạn nặng hơn thì chỉ có thể đi lọc máu,chạy thận… chứ không có thuốc gì chữa khỏi.</p>
                                <br>
                                <p class="mytext">Bài thuốc nam chữa suy thận này sẽ giúp loại bỏ các chứng tiểu đêm nhiều lần, ngủhay gặp ác mộng, biểu hiện tóc bạc sớm kèm đau mỏi lưng… Đây là những biểu hiện cơ bản ban đầu của bệnh.</p>
                                <br>
                                <p class="mytext">Bài thuốc từ nhọ nồi và đỗđen rất lành tính, phù hợp với mọi cơ địa, chỉ cần hái cây nhọ nồi về rửa sạch,thái nhỏ, phơi khô sau đó đem sao vàng. Mỗi ngày lấy khoảng 30g cây nhọ nồi đãsao vàng nấu với 40g đỗ đen rang cháy và khoảng 2 lít nước, đun đến khi sôi khoảng15 phút thì có thể chắt lấy nước uống như bình thường. Khi uống hết nước lại đổ thêm nước và đun tiếp thêm vài ba lần rồi thay thuốc.</p>
                                <br>
                                <p class="mytext">Sau khi uống chừng vài thang, người bệnh sẽ thấy các triệu chứng suy thận giảm hẳn, đồng thời sẽ cảm thấy ăn ngon, ngủ tốt hơn. Tuy nhiên, bài thuốc chữa thận này chỉ thích hợp cho những bệnh nhân suy thận giai đoạn đầu, nếu chuyển sang dạng mãn tính thì hầu như rất ít tác dụng. Lúc này,người bệnh có thể nhờ đến sự hỗ trợ của bài thuốc 2.</p>
                                <br>
                                <p class="mytext1">2. Bài thuốc chữa bệnh suy thận số 2</p>
                                <br>
                                <p class="mytext">Theo bác sĩ Nguyễn Thu Hương – phòng chẩn trị YHCT Tâm Minh Đường, người suy thận gần như đã mất đi 2/3 chức năng thận. Người bình thường khi hiến 1 quả thận cũng vẫn hoạt động bình thường, còn người bị suy thận thì không thể được như thế. Chữa bệnh suy thận phải chữa cả “nội thận” và “ngoại thận”, như vậy mới triệt để được vì thận là một cơ quan rất quan trọng với cơ thể.</p>
                                <br>
                                <p class="mytext">Lúc này, thận của người bệnhrất yếu, nếu cố tình dùng thuốc Tân Dược dễ tạo ra gánh nặng cho thận, tốt nhấtlà sử dụng các bài thuốc Đông Y để vừa hỗ trợ phục hồi chức năng của thận vừagiúp người bệnh ổn định sức khỏe.</p>
                                <br>
                                <p class="mytext">Bài thuốc CAO BỔ THẬN TÂM MINH ĐƯỜNG là bài thuốc trị suy thận phục hồi các tế bào thận sắp chết, giải độc và cung cấp chất dinh dưỡng cho cơ thể. Các lương y Phòng chẩn trị YHCT Tâm Minh Đường đã khéo léo áp dụng “lục vị” theo quan niệm âm dương thủy hỏa, sau đó kỳ công nấu thành dạng cao cho người bệnh dễ bảo quản và sử dụng.</p>
                                <br>
                                <p class="mytext2">* Dạng : cao</p>
                                <br>
                                <p class="mytext2">* Trọng lượng : 200g.</p>
                                <br>
                                <p class="mytext2">* Hạn sử dụng : 3năm.</p>
                                <br>
                                <p class="mytext2">* Lục vị : Cẩu Tích,Dây Đau Xương, Tục Đoạn, Tơ Hồng Xanh, Cỏ Xước, Xích Đồng.</p>
                                <br>
                                <p class="mytext2">* Công dụng: phục hồichức năng sức khỏe, bổ thận tráng dương, giảm đau nhức, kém ăn, mất ngủ, tiểu đêm nhiều, xuất tinh sớm, hỗ trợ chức năng sinh lý, suy thận.</p>
                                <br>
                                <p class="mytext2">* Cách dùng : mỗi lầnăn pha 1 thìa cao với 200ml nước ấm. Ngày uống 03 lần, uống trước bữa ăn 15phút</p>
                                <br>
                                <p class="mytext2">* Chống chỉ định: trẻ em dưới 5 tuổi và phụ nữ có thai.</p>
                                <br>
                                <p class="mytext2">* Bảo quản: Nơi khô ráo, thoáng mát, tránh ánh sáng trực tiếp. Tốt nhất là trong ngăn mát tủ lạnh</p>
                                <br>
                                <br>
                                <p class="mytext1"> ** Dưới đây là 2 bài thuốc mà chúng tôi muốn chia sẽ, mong rằng sẽ có ích cho các bạn.Mọi đóng góp và thắc mắc về bài viết xin gửi về <a style ="color: brown" href="https://docs.google.com/forms/d/e/1FAIpQLScRf96rQB0h3aTyu30ilCpzniMEo_dNCoV3oaPdWuUChFvaGw/viewform">link này </a>chúng tôi sẵn sàng lắng nghe tất cả ý kiến của các bạn để hoàn thiện 1 cách tốt hơn **</p>
                                <br>
                            </div>
                        </div>
                        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="6O2rssvR"></script>
<div class="fb-comments" data-href="http://127.0.0.1:5500/blog6.jsp" data-numposts="5" data-width=""></div>
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
