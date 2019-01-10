<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">

    <title>视频搜索</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../videocss/css/bootstrap.min.css"  type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../videocss/css/style.css">

    <!-- Owl Carousel Assets -->
    <link href="../videocss/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="../videocss/owl-carousel/owl.theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="../videocss/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">

    <!-- jQuery -->
    <script src="../videocss/js/jquery-2.1.1.js"></script>

    <!-- Core JavaScript Files -->
    <script src="../videocss/js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="../videocss/js/html5shiv.js"></script>
    <script src="../videocss/js/respond.min.js"></script>
    <![endif]-->

    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
</head>

<body>
<header>
    <!--Top-->
    <jsp:include page="../includes/header.jsp"/>

</header>
<!-- Header -->




<div id="page-content" class="archive-page" style="margin-top: 50px;">
    <div class="container">
        <div class="row">
            <div id="main-content" class="col-md-8">
              <c:forEach items="${result}" var="video" varStatus="cursor">
                <article>
                    <a href="getVideoSingle?id=${video.fileId}"><h2 class="vid-name">${video.fileName}</h2></a>
                    <div class="info">

                        <span><i class="fa fa-calendar"></i> ${video.fileTime}</span>

                    </div>
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <a href="getVideoSingle?id=${video.fileId}">
                                    <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                </a>
                                <p>${video.fileName}</p>
                            </div>
                            <img class="img-responsive" alt="" src="/bits/findLittleImg?filename=${video.fileImgUrl} " />
                        </div>
                        <p>${video.fileAbstract} <a href="#">MORE...</a></p>
                    </div>
                </article>
                <div class="line"></div>
              </c:forEach>
                <ul class="pagination">
                    <c:forEach items="${Pagination}" var="item">
                        ${item}
                    </c:forEach>
                </ul>
            </div>
            <div id="sidebar" class="col-md-4">
                <!---- Start Widget ---->

                <!---- Start Widget ---->

                <!---- Start Widget ---->
                <div class="widget wid-news">
                    <div class="heading"><h4><i class="fa fa-clock-o"></i> 视频推荐</h4></div>
                    <div class="content">
                     <c:forEach  begin="4" end="9"  items="${result}" var="video" varStatus="cursor">
                        <div class="wrap-vid"><!--这里输出4~9号视频将就下-->
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <a href="getVideoSingle?id=${video.fileId}"><h2 class="vid-name">${video.fileName}</h2>
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>${video.fileName}</p>
                                </div>
                                <img class="img-responsive" alt="" src="/bits/findLittleImg?filename=${video.fileImgUrl} " />
                            </div>
                            <h3 class="vid-name"><a  href="getVideoSingle?id=${video.fileId}">${video.fileName}</a></h3>
                            <div>
                                <span><i class="fa fa-calendar"></i> ${video.fileTime}</span>
                            </div>
                        </div>
                     </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<footer>

    <div class="bottom-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 copyright">
                    <span>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></span>
                </div>
                <div class="col-md-6 col-sm-6 link">
                    <div class="menu-footer-menu-container">
                        <ul id="menu-footer-menu" class="menu list-inline">
                            <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li><a href="#"><i class="fa fa-comments"></i> Contact</a></li>
                            <li><a href="#"><i class="fa fa-question-circle"></i> FAQ</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer -->

<!-- JS -->
<script src="../videocss/owl-carousel/owl.carousel.js"></script>
<script>
    $(document).ready(function() {
        $("#owl-demo").owlCarousel({
            autoPlay: 3000,
            items : 5,
            itemsDesktop : [1199,4],
            itemsDesktopSmall : [979,4]
        });

    });
</script>

</body>
</html>
