<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-5
  Time: 上午10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<html>
<head>
    <title>图片浏览</title>
    <meta charset="utf-8">
    <title>Men category | Metronic Shop UI</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.ico">

    <!-- Fonts START -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="../assets3_0/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- <link href="../assets3_0/global/plugins/bootstrap/css/bootstrap-rtl.css" rel="stylesheet">-->
    <!-- Global styles END -->
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/frontend/layout/css/style.css" rel="stylesheet">
    <!-- Page level plugin styles START -->
    <link href="../assets3_0/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="../assets3_0/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel-rtl.css" rel="stylesheet">
    <link href="../assets3_0/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
    <link href="../assets3_0/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <!-- Theme styles START -->
    <link href="../assets/global/css/components.css" rel="stylesheet">
    <!--<link href="../assets3_0/frontend/layout/css/style-rtl.css" rel="stylesheet">-->
    <link href="../assets3_0/frontend/pages/css/style-shop-rtl.css" rel="stylesheet" type="text/css">
    <link href="../assets3_0/frontend/layout/css/style-responsive-rtl.css" rel="stylesheet">
    <link href="../assets3_0/frontend/layout/css/themes/red-rtl.css" rel="stylesheet" id="style-color">
    <link href="../assets/frontend/layout/css/custom.css" rel="stylesheet">

    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
</head>
<jsp:include page="../includes/header.jsp"/>
<body class="ecommerce">
<!-- BEGIN STYLE CUSTOMIZER -->


<div class="main" style="margin-top: 50px;">
    <div class="container">

        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->

            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-10">
                <div class="row list-view-sorting clearfix">
                    <div class="col-md-2 col-sm-2 list-view">
                        <a href="#"><i class="fa fa-th-large"></i></a>
                        <a href="#"><i class="fa fa-th-list"></i></a>
                    </div>
                    <div class="col-md-10 col-sm-10">

                        <form class="form" method="get" action="search">
                            <div class="col-md-12">
                                <div class="col-md-9" style="padding-left: 0px;padding-right: 0px;">
                                    <input type="text" class="form-control" name="key" placeholder="标题、概要内容">
                                    <input type="hidden" value="picture" name="direction">
                                </div>
                                <div class="col-md-3" style="padding-left: 0px;">
                                    <button class="btn green" type="submit">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <!-- BEGIN PRODUCT LIST -->
                <div class="row product-list">
                    <!-- PRODUCT ITEM START -->

                    <c:forEach items="${result}" var="picture" varStatus="cursor">
                        <div class="col-md-3 col-sm-4 col-xs-12 ">
                            <div class="product-item">
                                <div class="pi-img-wrapper">
                                    <img style="width: 240px; height: 190px;" src="/bits/FileDown?filename=${picture.fileName}" alt="该图片没有缩略图" class="img-responsive">
                                    <div>
                                        <a href="/bits/FileDown?filename=${picture.fileName}" class="btn btn-default fancybox-button">预览</a>
                                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">详情</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--弹出界面-->
                        <div id="product-pop-up" style="display: none; width: 700px;">
                            <div class="product-page product-pop-up">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-3">
                                        <div class="product-main-image" >
                                            <img  src="/bits/FileDown?filename=${picture.fileName}" alt="该图片没有缩略图" class="img-responsive">
                                        </div>

                                        <div class="product-other-images">
                                            <a>相关文件:</a>
                                            <c:forEach items="${picture.relations}" var="relation" varStatus="cursor">
                                            <a href="/bits/literature/getLiteratureDetail?id=${rerlation.fileId}" class="active"><img alt="无缩略图" src="/bits/findLittleImg?filename=${relations.fileImgUrl}"></a>
                                            </c:forEach>
                                        </div>

                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-9">
                                        <h2>${picture.fileName}</h2>
                                        <div class="price-availability-block clearfix">
                                            <ul class="blog-info">
                                                <li>
                                                    <i>评分:</i><div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                                                </li><br><br>
                                                <li><i>关键字:</i>&nbsp;${picture.fileKeywords}</li><br><br>
                                                <li><i>日期:&nbsp;</i>${picture.fileTime}</li><br><br>
                                                <li><i>领域:&nbsp;</i> 计算机</li><br><br>
                                                <li><i>类型:</i>&nbsp;${picture.fileType}</li><br><br>
                                                <li><i>大小:</i>&nbsp;${picture.fileSize}M</li><br><br>
                                               <li> <i>摘要:</i><p>&nbsp;${picture.fileAbstract}</p></li>

                                            </ul>
                                        </div>
                                        <div class="product-page-cart">
                                            <button class="btn btn-primary" type="submit">收藏</button>
                                            <a href="/bits/FileDown?filename=${picture.fileName}" class="btn btn-default">下载</a>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <ul class="pagination">
                        <c:forEach items="${Pagination}" var="item">
                            ${item}
                        </c:forEach>
                    </ul>


                </div>

            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>





<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10">
                2014 © Metronic Shop UI. ALL Rights Reserved.
            </div>
            <!-- END COPYRIGHT -->
            <!-- BEGIN PAYMENTS -->

            <!-- END PAYMENTS -->
        </div>
    </div>
</div>

<script src="../assets3_0/plugins/respond.min.js"></script>
<![endif]-->
<script src="../assets3_0/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="../assets3_0/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="../assets3_0/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets3_0/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="../assets3_0/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="../assets3_0/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
<script src="../assets3_0/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel-rtl.js" type="text/javascript"></script><!-- slider for products -->
<script src='../assets3_0/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="../assets3_0/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="../assets3_0/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="../assets3_0/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<!--<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>--><!-- for slider-range -->

<script src="../assets3_0/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
        Layout.initSliderRange();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>