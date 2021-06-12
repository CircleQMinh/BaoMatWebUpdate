<%-- 
    Document   : blog1
    Created on : Dec 30, 2020, 8:08:35 PM
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
                            <a href="myblog.jsp">
								<img src="images/tea2.jpg" class="img-fluid" alt="">
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
                                    <a href="myblog.jsp">Trà gừng có tác dụng gì? 8 công dụng tuyệt vời của trà gừng</a>
                                </h5>
                                <p class="mytext">Gừng có vị cay, tính ấm vào 3 kinh vị, phế, tỳ nhưng ít ai biết được những công dụng của gừng cũng như trà của nó. Hôm nay nongsansay.vn sẽ giúp mọi người trả lời câu hỏi trà gừng có tác dụng gì? Và chỉ ra 8 công dụng tuyệt vời từ trà gừng.</p>
                                <br>
                                <img src="images/tea1.jpg" class="img-fluid" alt="">
                                <p class="mytext1">Trà gừng có tác dụng gì?</p>
                                <br>
                                <p class="mytext">Trà gừng vốn được cha ông chúng ta sử dụng từ những thời xa xưa như một liều thuốc tự nhiên để giúp trị các triệu chứng về đường ruột cũng như hệ tiêu hoá. Thế nhưng ít ai biết được rằng trà gừng có những công dụng khác như giảm buồn nôn, chống bệnh truyền nhiệm, chống viêm, tăng cường chức năng não, điều hoà tốt đường huyết và thậm chí là cả giảm cân nữa.</p>
                                <br>
                                <p class="mytext">Lý do mà trà gừng có được nhiều tác dụng tốt đến sức khỏe chính là nhờ vào các thành phần hoá học của nó. Nghiên cứu cho thấy trong nước trà gừng có chứa những thành phần như gingerol, shogaol, zingerone và paradol. Trong số này thì gingerol được xem như là thành phần chính tạo nên các tác dụng tuyệt vời của gừng.</p>
                                <br>
                                <p class="mytext">Một số nghiên cứu cho thấy gingerol được tìm thấy trong gừng có những khả năng giảm viêm hiệu quả. Về cơ bản thì viêm là một hiện tượng mà hệ miễn dịch trong cơ thể phản ứng lại khi có một tác nhân gây hại. Ví dụ: viêm học là do tác nhân gây hại chính là thời tiết lạnh chẳng hạn. Thế nhưng viêm mãn tính là một trong số những nguyên nhân dẫn đến căn bệnh ung thư, bệnh tiểu đường hay những bệnh về đường tim mạch. Nhờ vào những thành phần gingerol mà gừng được xem như chính những loại thực phẩm hiệu quả nhất để chống lại viêm hiệu quả.</p>
                                <br>
                                <img src="images/tea3.jpg" class="img-fluid" alt="">
                                <p class="mytext1">Uống trà gừng thực sự có lợi cho sức khỏe?</p>
                                <br>
                                <p class="mytext">Uống trà gừng còn có những khả năng giúp bạn giảm khả năng bị lây các loại bệnh truyền nhiễm. Lý do chính là gừng có những khả năng chống lại một số loại vi khuẩn, nấm, virus thường thấy ở nhiều loại bệnh truyền nhiễm.
                                    Một số nghiên cứu mới nhất cho thấy gừng còn có các công dụng tuyệt vời khác như làm giảm nhanh chứng buồn nôn, điều hoà đường huyết và giúp hỗ trợ giảm cân. Thế nên uống từ một đến hai tách trà gừng cho mỗi ngày sẽ có những tác động tốt lên sức khoẻ của bạn.
                                    </p>
                                <br>
                                <p class="mytext1">8 tác dụng tuyệt vời của trà gừng</p>
                                <br>
                                <p class="mytext1">1.Trà gừng làm giảm buồn nôn</p>
                                <br>
                                <p class="mytext">Một nghiên cứu ở Thái Lan cho thấy củ gừng có khả năng làm giảm chứng buồn nôn và ói mửa ở phụ nữ đang mang thai. Vì thế trà gừng đã được sử dụng trong rất nhiều các trường hợp buồn nôn do mang thai, uống nhiều bia rượu, hay do say tàu xe. Khi bạn có những cảm giác như buồn nôn thì chỉ cần một tách trà gừng là có thể giảm nhanh cảm giác này.</p>
                                <br>
                                <p class="mytext1">2. Trà gừng giúp tăng cường hệ miễn dịch</p>
                                <br>
                                <p class="mytext">Vào những ngày lạnh thì rất nhiều người có thói quen thích uống trà gừng. Một phần vì tách trà nóng sẽ giúp cơ thể chúng ta cảm thấy ấm hơn. Một phần khác thì trà gừng giúp tăng cường hệ miễn dịch. Qua đó sẽ giúp chúng ta giảm khả năng thắc mắc nhiều loại bệnh tuyền nhiễm.</p>
                                <br>
                                <p class="mytext">Theo các các nghiên cứu gần đây cho thấy trà gừng có khả năng kháng vi khuẩn, kháng nấm, kháng virus rất tốt. Do đó uống trà gừng cũng có thể là một biện pháp giúp phòng chống các bệnh truyền nhiễm. Cũng có thể là một liều thuốc tự nhiên nếu như bạn có lỡ bị nhiễm những triệu chứng không quá nặng.</p>
                                <br>
                                <p class="mytext1">3. Trà gừng giúp tăng cường chức năng não</p>
                                <br>
                                <p class="mytext">Trong một nghiên cứu trong năm 2012 thì gừng giúp giúp cải thiện khả năng tập trung vào một số chức năng ở não của người trung niên sau khoảng 2 tháng liên tục uống chiết xuất gừng. Thế nên uống trà gừng cũng có thể góp một phần vào việc giúp cải thiện những bệnh về não ở người lớn tuổi.</p>
                                <br>
                                <img src="images/tea4.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">4. Trà gừng giúp giảm những chứng đau xương khớp, đau cơ bắp hay đau bụng kinh</p>
                                <br>
                                <p class="mytext">Một nghiên cứu năm 2002 cho thấy gừng có những khả năng giảm đáng kể về chứng đau đầu gối do viêm khớp. Nhiều người trong số bệnh nhân được cho uống chiết xuất từ gừng cảm thấy đầu gối ít bị đau hơn rất nhiều sau 6 tuần.</p>
                                <br>
                                <p class="mytext">Không chỉ giúp giảm nhanh các cơn đau xương khớp. Gừng còn giúp giảm nhanh những chứng đau cơ bắp do hoạt động thể thao. Theo nghiên cứu vào năm 2011 thì việc hấp thụ gừng sẽ giúp những tình nguyện tham gia nghiên cứu giảm đau đáng kể ngay chỉ sau 24 giờ.</p>
                                <br>
                                <p class="mytext">Ngoài ra, theo một nghiên cứu khác của Iran vào năm 2012 cho thấy nếu uống gừng sẽ giúp làm giảm đau bụng kinh cực hiệu quả chỉ sau 5 ngày.</p>
                                <br>
                                <p class="mytext">Thế nên trà gừng cũng có thể được xem như là liều thuốc giảm đau hiệu quả ở nhiều độ tuổi khác nhau cũng như giới tính khác nhau.</p>
                                <br>
                                <p class="mytext1">5. Trà gừng giúp giảm cân và giảm vòng eo</p>
                                <br>
                                <p class="mytext">Một nghiên cứu tổng hợp trong năm 2017 cho thấy gừng cũng có thể giúp chúng ta giảm cân. Lý do sự tăng cường quá trình phân huỷ mỡ, giảm nhanh hấp thụ mỡ và giảm cảm giác thèm ăn.
                                    Uống trà gừng có thể được xem như là một cách hiệu quả để giảm cân. Vì ngoài việc hấp thụ được các thành phần trong gừng thì bạn đồng thời cũng được bổ sung đủ nước. Vì uống nước sẽ giúp cơ thể chúng ta đốt calo nhiều hơn.
                                    </p>
                                <br>
                                <img src="images/tea5.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">6. Trà gừng giúp cải thiện các bệnh đường ruột</p>
                                <br>
                                <p class="mytext">Một nghiên cứu từ phía Đài Loan cho thấy gừng có những khả năng cải thiện hoạt động của dạ dày. Qua đó sẽ cải thiện các chứng khó tiêu cũng như rối loạn tiêu hoá. Chính vì vậy gừng sử dụng để làm nguyên liệu cho nhiều các món ăn. Vì nó không chỉ mang lại mùi thơm và vị cay, mà gừng còn tốt cho hệ tiêu hóa của chúng ta.</p>
                                <br>
                                <p class="mytext1">7. Trà gừng giúp điều hòa đường huyết</p>
                                <br>
                                <p class="mytext">Bệnh tiểu đường dần trở thành căn bệnh đáng lo ngại nhất trong những thập kỷ tới. Theo dự báo thì số lượng những người mắc bệnh tiểu đường ở nước ta sẽ tăng lên khoảng 79% vào năm 2045. Để tránh mắc phải bệnh tiểu đường thì bạn cần có một chế độ ăn uống và lối sống thật lành mạnh.</p>
                                <br>
                                <img src="images/tea6.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext1">8. Trà gừng giúp làm giảm cholesterol xấu</p>
                                <br>
                                <p class="mytext">Tình trạng cholesterol cao có khả năng dẫn đến nhiều loại bệnh về đường tim mạch. Theo nghiên cứu trên động vật cho thấy gừng giúp làm giảm các cholesterol xấu. Và gừng được tin có hiệu quả tương đương với loại thuốc giảm cholesterol.</p>
                                <br>

                                <p class="mytext1">* Cách làm trà gừng mật ong</p>
                                <br>
                                <p class="mytext">Bạn có thể dễ dàng mua trà gừng ở trong bất kỳ siêu thị nào. Thế nhưng việc pha trà từ củ gừng tươi bao giờ cũng tốt hơn nhiều nếu bạn có thời gian. Cách pha trà gừng đơn giản là cho vài lát gừng vào 1 tách nước sôi. Nếu bạn muốn hiệu quả hơn thì trà gừng mật ong chính là thức uống đáng thử. Và sau đây là cách pha trà gừng mật ong đơn giản cực kỳ.</p>
                                <br>
                                <p class="mytext">Nguyên liệu bắt buộc phải có: gừng. Một nhánh gừng chừng 5cm. Sau đó gọt sạch vỏ gừng rồi rửa sạch với nước.</p>
                                <br>
                                <p class="mytext">Dùng dao cắt nhánh gừng thành từng lát nhỏ mỏng nhất có thể.
                                    Cho 1 lít nước vào nồi. Đun sôi rồi cho những lát gừng vừa thái mỏng vào. Đun hỗn hợp nước gừng này trong khoảng 10 đến 20 phút.
                                    </p>
                                <br>
                                <p class="mytext">Bạn có thể dùng khăn hay rây để lọc bã gừng ra nếu muốn. Cho 2-3 muỗng canh mật ong thì bạn có thể thưởng thức món trà gừng mật ong được. Nếu muốn bạn có thể vắt thêm chanh, nhưng cần phải để nước trà nguội hơn.</p>
                                <br>
                                <p class="mytext"></p>
                                <br>
                                <p class="mytext1"> ** Mọi đóng góp và thắc mắc về bài viết xin gửi về <a style ="color: brown" href="https://docs.google.com/forms/d/e/1FAIpQLScRf96rQB0h3aTyu30ilCpzniMEo_dNCoV3oaPdWuUChFvaGw/viewform">link này </a>chúng tôi sẵn sàng lắng nghe tất cả ý kiến của các bạn để hoàn thiện 1 cách tốt hơn **</p>
                                <br>
                            </div>
                        </div>

                        <!--Bình lua-->
                        <div id="fb-root"></div>
                        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="LLwC7U4q"></script>
                        <div class="fb-comments" data-href="http://127.0.0.1:5500/blog1.jsp" data-numposts="5" data-width=""></div>

                        

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
