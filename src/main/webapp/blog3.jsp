<%-- 
    Document   : blog3
    Created on : Dec 30, 2020, 8:12:47 PM
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
								<img src="images/dongy.jpg" class="img-fluid" alt="">
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
                                    <a href="single.jsp">7 Danh y kiệt xuất trong lịch sử y học Việt Nam</a>
                                </h5>
                                <p class="mytext">Trong lịch sử y dược ngàn năm dân tộc Việt Nam đã sinh thành và nuôi dưỡng những vị danh y kiệt xuất, có những đóng góp và cống hiến lớn lao với cộng đồng mà ngành y dược nước nhà sử sách vẫn còn in những dấu son vàng.</p>
                                <br>
                                <img src="images/top7.jpg" class="img-fluid" alt="">
                                <p class="mytext1">7 Danh Y nổi tiếng của Việt Nam là ai?</p>
                                <br>
                                <p class="mytext1">1.Đại y thiền sư Tuệ tĩnh (1330-?):</p>
                                <br>
                                <img src="images/tuetinh.png" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Đại danh y Tuệ Tĩnh chính là hiện thân, là minh chứng cho sự phát triển hưng thịnh của thời đại nhà Trần. Danh Y – thiền sư Tuệ Tĩnh có tên thật là Nguyễn Bá Tĩnh, người làng Nghĩa Phú, huyện Cẩm Giàng (tỉnh Hải Dương) người được coi là vị thánh thuốc nam, là ông tổ của YHCT Việt nam. Trong cuộc đời và sự nghiệp của danh y Tuệ tĩnh đã để lại cho kho tàng y học dân tộc 2 tập sách nổi tiếng “Nam dược thần hiệu” và “Hồng nghĩa giác tư y thư”. Ông cũng là người là người đầu tiên đề cao tư tưởng “Thuốc Nam chữa người Nam việt” Hồng Nghĩa Giác Tư Y Thư là cuốn sách thuốc cổ nhất của ta.</p>
                                <br>
                                <p class="mytext">Mồ côi cha mẹ từ khi 6 tuổi, cậu bé Nguyễn Bá Tĩnh được các nhà sư chùa Hải Triều và chùa Giao Thủy nuôi cho ăn học. Với trí tuệ hơn người cùng với sự chăm chỉ của mình đến năm 22 tuổi ông đậu Thái học sinh dưới triều vua Trần Dụ Tông, nhưng không ra làm quan mà ở lại chùa đi tu lấy pháp hiệu là Tuệ Tĩnh học tập, nghiên cứu nghề làm thuốc, chữa bệnh cứu người tài năng của ông chẳng mấy chốc mà đã nổi danh cả nước. Năm 55 tuổi (1385), Danh Y Tuệ Tĩnh bị đưa đi cống cho triều đình nhà Minh. Sang Trung Quốc ông vẫn tiếp tục sự nghiệp nghiên cứu nghề thuốc và chữa bệnh cứu người. Với tài năng và những đóng góp to lớn của mình Danh y Tuệ tĩnh đã được vua Minh phong là Đại y Thiền sư rồi mất ở đó, không rõ năm nào.</p>
                                <br>
                                <p class="mytext1">2. Danh y Hải Thượng Lãn Ông – Lê Hữu Trác</p>
                                <br>
                                <p class="mytext">Là danh y lỗi lạc nhất trong lịch sử y học dân tộc đồng thời cũng là nhà văn hoá lớn có nhiều đóng góp với nêng văn hoá dân tộc. Hải Thượng Lãn Ông tên thật là Lê Hữu Trác sinh năm (1720 – 1791) tại thôn Văn Xá, làng Liêu Xá, huyện Đường Hào, phủ Thượng Hồng, tỉnh Hải Dương trong một gia đình có truyền thống hiếu học có ông nội và các chú bác đều đỗ Tiến sĩ và làm quan trong triều. Thân sinh của danh y từng đỗ Đệ tam giáp Tiến sĩ, làm Thị lang Bộ Công triều Lê Dụ Tông.</p>
                                <br>
                                <img src="images/haithuonglanong.png" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Bên cạnh những cống hiến to lớn với nền y học nước nhà còn là một nhà văn hoá lớn của nước ta. Hải thượng lãn ông – Lê Hữu Trác còn là tác giả của kho sách trứ danh “Lãn Ông Tâm Lĩnh” hay “Hải Thượng y tông Tâm Lĩnh” gồm 28 tập, 66 quyển bao gồm đủ các mặt về y học: Y đức, Y lý, Y thuật, Dược, Di dưỡng. Toàn bộ sách Hải Thượng để lại mà ngày nay chúng ta được thừa hưởng như một tài sản vô giá của nền y học cổ truyền Việt Nam gọi là “Hải Thượng Y tông tâm lĩnh” gồm 28 tập, 66 quyển, bao gồm lý, pháp, phương, dược và biện chứng luận trị về nội khoa, ngoại khoa, phụ khoa, sản khoa, nhi khoa, đậu sởi, nhãn khoa, thương khoa, cấp cứu và cả đạo đức y học, vệ sinh phòng bệnh… Đặc điểm nổi bật là sách của ông có tiếp thu chọn lọc những y thuật của nước ngoài rồi ứng dụng phù hợp với điều kiện của con người Việt Nam. Sự nghiệp Y học của Hải Thượng Lãn Ông đã góp phần to lớn xây dựng nền Y học dân tộc nước nhà, nên được suy tôn là Đại y tôn Việt Nam.</p>
                                <br>
                                <p class="mytext1">3. Giáo sư Hồ Đắc Di</p>
                                <br>
                                <img src="images/hodacdi.png" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Giáo sư Hồ Đắc Di (1900-1984), sinh ra tại Hà Tĩnh, quê ở làng An Truyền, xã Phú An, huyện Phú Vang, Thừa Thiên – Huế, là một bác sĩ nổi tiếng ở Việt Nam. Năm (1918-1932) ông sang Pháp du học và đỗ bác sĩ nội trú. Trong thời gian này ông có làm phẫu thuật một thời gian ở bệnh viện Tenon, rồi về nước. Trong luận án tốt nghiệp bác sĩ y khoa làm tại Paris, Giáo sư Hồ Đắc Di là người đầu tiên sáng tạo một phương pháp mổ dạ dày (nối thông dạ dày-tá tràng) để điều trị chứng hẹp môn vị do bệnh loét dạ dày- tá tràng gây ra, thay thế cho phương pháp cắt bỏ dạ dày vẫn dùng trước đó.</p>
                                <br>
                                <p class="mytext">Trong suốt cuộc đời và sự nghiệp của mình bác sĩ Hồ Đắc Di đã công bố 37 công trình nghiên cứu trong đó có 21 công trình đã được áp dụng vào thực tế điều trị.</p>
                                <br>
                                <p class="mytext">Cuộc đời và những danh hiệu cao quý: Bác sĩ Hồ Đắc Di là Đại biểu Quốc hội từ khóa 2 đến khóa 5, Ủy viên Ủy ban thường vụ Quốc hội các khóa 2,3,4, Hiệu trưởng Trường đại học Y Hà Nội, Tổng giám đốc Đại học y vụ Việt Nam, Giám đốc Vụ Đại học và Trung học chuyên nghiệp, Ủy viên Ủy ban Khoa học và Kỹ thuật Nhà nước, Chủ tịch Hội Hữu Nghị Việt-Pháp, Ủy viên Ủy ban Trung ương mặt trận Tổ quốc Việt Nam, Chủ tịch Tổng hội Y học Việt Nam, Huân chương Độc lập hạng nhất, Huân chương Kháng chiến hạng nhất và hai hạng ba, Huân chương Lao Động hạng nhất và hạng hai, Huy chương Vì thế hệ trẻ, Chiến sĩ thi đua toàn quốc nǎm 1952 và 1956. Giáo sư Hồ Đắc Di đã được tặng Giải thưởng Hồ Chí Minh. Ông từ trần ngày 25-6-1984.</p>
                                <br>
                                <p class="mytext1">4. Bác sĩ Phạm Ngọc Thạch</p>
                                <br>
                                <p class="mytext">Bác sĩ Phạm Ngọc Thạch (1909- 1968), sinh ra tại Quy Nhơn, tỉnh Bình Định. Năm 1928, ông là sinh viên Trường đại học Y khoa Hà Nội. Năm 1934, tốt nghiệp Bác sĩ y khoa tại Pháp. Sau hai năm, ông trở về Sài Gòn, mở phòng khám và bệnh viện tư chuyên chữa bệnh lao và bệnh phổi.</p>
                                <br>
                                <img src="images/phmngocthach.png" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Bác sĩ Phạm Ngọc Thạch là một trí thức rất có tên tuổi, xuất thân từ một gia đình thượng lưu, trí thức ở Sài Gòn, được người Nhật và người Pháp kính nể nhưng ông lại không đi theo sự nghiệp truyền thống của gia đình mà tham gia cách mạng từ rất sớm. Ông đã đứng ra tổ chức Thanh niên tiền phong, một lực lượng hùng hậu làm nòng cốt cho phong trào quần chúng cướp chính quyền trong Cách mạng Tháng Tám. Ông là Chủ tịch đầu tiên của Hội Liên hiệp Thanh niên Việt Nam.</p>
                                <br>
                                <p class="mytext">Tiến sĩ y khoa Phạm Ngọc Thạch là Bộ trưởng Bộ Y tế đầu tiên của nước Việt Nam độc lập (Chính phủ lâm thời nước Việt Nam Dân chủ Cộng hòa (9/1945 – 1/1946). Từ năm 1954, ông là Thứ trưởng, Bí thư Đảng Đoàn (1954-1958) rồi là Bộ trưởng Bộ Y tế (1958-1968). Ông đã xây dựng một nền y tế nhân dân ở miền Bắc. Ông là người đầu tiên áp dụng khoa học kỹ thuật phương tây vào nền y học Việt Nam.</p>
                                <br>
                                <p class="mytext">Là người sáng lập Viện Chống lao Trung ương, người đặt nền móng cho hình thành chuyên khoa lao và các bệnh phổi ở Việt Nam. Năm (1996) ông được truy tặng giải thưởng Hồ Chí Minh.</p>
                                <br>
                                <p class="mytext">Năm 1958 Bác sĩ Phạm Ngọc Thạch được trao tặng danh hiệu Anh hùng Lao động đầu tiên của ngành Y tế –, tại Đại hội liên hoan Anh hùng Chiến sỹ thi đua toàn quốc lần thứ nhất.</p>
                                <br>
                                <p class="mytext">Năm 1997 ông được nhà nước truy tặng giải thưởng Hồ Chí Minh vì các cống hiến trong lĩnh vực khoa học</p>
                                <br>
                                <p class="mytext">Nhà nước truy tặng Giải thưởng Hồ Chí Minh năm 1997 vì các cống hiến trong lĩnh vực khoa học.</p>
                                <br>
                                <p class="mytext1">5. Giáo sư Đặng Văn Ngữ</p>
                                <br>
                                <p class="mytext">Giáo sư Đặng Văn Ngữ (04/04/1910 -01/04/1967), quê ở làng An Cựu, ngoại thành kinh đô Huế. Ông tốt nghiệp bác sĩ y khoa năm 1937, tại trường Đại học Y khoa Hà Nội. Năm 1942 ông là trưởng Labo Ký sinh trùng và ông đã hoàn thành 19 công trình nghiên cứu khoa học nổi tiếng. Năm 1943 ông đi du học tại Nhật Bản. Năm 1945, ông là hội trưởng hội Việt kiều yêu nước tại Nhật Bản.</p>
                                <br>
                                <img src="images/Giao-su-dang-van-ngu.jpg" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Năm 1949, ông về nước tham gia kháng chiến chống Pháp, trở thành giảng viên Chủ nhiệm Bộ môn Ký sinh trùng trường Đại học Y khoa tại Chiêm Hóa. cũng trong thời gian này giáo sư Đặng Văn Ngữ đã nghiên cứu thành công cách sản xuất ra thuốc nước Penicillin dùng trong chống nhiễm khuẩn cho thương binh và nhân dân trong kháng chiến chống Pháp và chống Mỹ sau này.</p>
                                <br>
                                <p class="mytext">Năm 1955, ông sáng lập ra Viện Sốt rét – Ký sinh trùng và côn trùng Việt Nam (Trung ương) có vai trò rất lớn trong nghiên cứu phòng chống và điều trị căn bệnh sốt rét tại Việt Nam. Ông được truy tặng Giải thưởng Hồ Chí Minh đợt một về lĩnh vực Y học.</p>
                                <br>
                                <p class="mytext1">6. Giáo sư Tôn Thất Tùng</p>
                                <br>
                                <img src="images/GStonthattung.png" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Giáo sư Tôn Thất Tùng (1912 -1982), sinh tại quê hương Thanh Hóa và lớn lên ở Huế. Năm 1932, ông học tại trường Y – Dược. Năm 1935, ông là người duy nhất được nhận vào làm việc tại khoa ngoại của trường Y-Dược, tức là bệnh viện Việt – Đức hiện nay.</p>
                                <br>
                                <p class="mytext">Với một dụng cụ thô sơ, ông đã phẫu tích kỹ lưỡng cơ cấu của lá gan và trên cơ sở đó viết và bảo vệ thành công luận án tốt nghiệp bác sĩ y khoa “Cách phân chia mạch máu của gan”. Bản luận án xuất sắc này đã giúp ông được nhận Huy chương Bạc của Trường Đại học Tổng hợp Paris.</p>
                                <br>
                                <p class="mytext">Vào những năm 1960, ông đã nghiên cứu thành công phương pháp “cắt gan có kế hoạch” đến nay vẫn còn rất nhiều tài liệu lưu giữ.</p>
                                <br>
                                <p class="mytext">Năm 1947, ông được Chính phủ cử giữ chức Thứ trưởng Bộ Y tế. Từ sau ngày hòa bình lập lại, ông được cử làm Giám đốc bệnh viện hữu nghị Việt – Đức, chủ nhiệm bộ môn Ngoại trường Đại học Y khoa Hà Nội.</p>
                                <br>
                                <p class="mytext">Năm 1958, GS tiến hành thành công ca mổ tim đầu tiên ở Việt Nam. Năm 1959, GS phát triển khoa mổ sọ não và khoa ngoại nhi. Năm 1960, GS là người đầu tiên đề xuất và áp dụng có kết quả xuất sắc việc mổ gan bằng phương pháp Việt Nam. Năm 1965, GS triển khai thành công việc mổ tim bằng máy tim phổi nhân tạo ở nước ta.</p>
                                <br>
                                <p class="mytext">Năm 1977, giáo sư được Viện Hàn lâm Phẫu thuật Paris tặng Huy chương phẫu thuật quốc tế mang tên Lannelongue. Đây là phần thưởng cao quý dành cho những nhà phẫu thuật xuất sắc thế giới được trao định kỳ 5 năm một lần. Ông vinh dự và xứng đáng là một trong 12 người trên thế giới và là người duy nhất ở Việt Nam được tặng huy chương ấy…</p>
                                <br>
                                <p class="mytext">Ghi nhận những công lao và cống hiến to lớn với nền y học của đất nước GS. Tôn Thất Tùng đã được đón nhận danh hiệu cao quý Anh hùng Lao động, hai lần Huân chương Lao động hạng Nhất, Huân chương chiến sĩ hạng Nhất, Huân chương kháng chiến hạng Ba và được truy tặng Huân chương Hồ Chí Minh.</p>
                                <br>
                                <p class="mytext1">7. Giáo sư Đặng Văn Chung</p>
                                <br>
                                <p class="mytext">Giáo sư Đặng Văn Chung (1913-1999), sinh tại Sa Đéc, tỉnh Đồng Tháp. Năm 1933 đến năm 1954, GS. Đặng Văn Chung là người đặt nền móng xây dựng các chuyên khoa hệ nội thuộc Bệnh viện Bạch Mai cũng như các bộ môn hệ nội thuộc Trường đại học Y Hà Nội… Những năm 1970, GS. Đặng Văn Chung đã dành nhiều công sức và trí tuệ viết ra 2 cuốn Bệnh học Nội khoa, Điều trị học cũng như hàng loạt tài liệu giảng dạy, công trình nghiên cứu khoa học có giá trị.</p>
                                <br>
                                <img src="images/GSDangVanChung.png" class="img-fluid" alt="">
                                <br>
                                <p class="mytext">Trải qua hơn 60 năm cống hiến với sự nghiệp y học dân tộc  giáo sư Đặng Văn Chung đã từng đảm nhiệm nhiều vị trí quan trọng trong ngành y tế như Trưởng bộ môn Nội, Phó Hiệu trưởng Trường đại học Y Hà Nội và Chủ nhiệm Khoa Nội – Bệnh viện Bạch Mai, Phó Chủ tịch Hội đồng Khoa học kỹ thuật của Bộ Y tế.</p>
                                <br>
                                <p class="mytext">Trải qua hơn 60 năm cống hiến với sự nghiệp y học dân tộc  giáo sư Đặng Văn Chung đã từng đảm nhiệm nhiều vị trí quan trọng trong ngành y tế như Trưởng bộ môn Nội, Phó Hiệu trưởng Trường đại học Y Hà Nội và Chủ nhiệm Khoa Nội – Bệnh viện Bạch Mai, Phó Chủ tịch Hội đồng Khoa học kỹ thuật của Bộ Y tế.</p>
                                <br>
                                <p class="mytext"></p>
                                <br>
                                <p class="mytext1"> ** Mọi đóng góp và thắc mắc về bài viết xin gửi về <a style ="color: brown" href="https://docs.google.com/forms/d/e/1FAIpQLScRf96rQB0h3aTyu30ilCpzniMEo_dNCoV3oaPdWuUChFvaGw/viewform">link này </a>chúng tôi sẵn sàng lắng nghe tất cả ý kiến của các bạn để hoàn thiện 1 cách tốt hơn **</p>
                                <br>
                            </div>
                        </div>
                        <div id="fb-root"></div>
                        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v9.0" nonce="WgDkGJlP"></script>
                        <div class="fb-comments" data-href="http://127.0.0.1:5500/blog3.jsp" data-numposts="5" data-width=""></div>

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
