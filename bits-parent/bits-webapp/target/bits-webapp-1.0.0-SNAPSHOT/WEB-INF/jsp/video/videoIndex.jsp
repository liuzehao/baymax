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

    <title>视频主页</title>

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

    <script>

        function toGetVideoSingle(){
            location.href = basePath + "video/getVideoSingle";
        }
    </script>

</head>

<body>
<header>
    <!--Top-->
    <jsp:include page="../includes/header.jsp"/>


    <div class="header-slide">
        <div id="owl-demo" class="owl-carousel">
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/2.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/3.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/4.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/5.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/6.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/7.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/8.jpg" />
                </div>
            </div>
            <div class="item">
                <div class="zoom-container">
                    <div class="zoom-caption">
                        <span>Video's Tag</span>
                        <a href="#" onclick="toGetVideoSingle()">
                            <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                        </a>
                        <p>Video's Name</p>
                    </div>
                    <img src="../videocss/images/9.jpg" />
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Header -->


<div class="col-md-8 col-sm-8 col-md-offset-3">

    <form class="form" method="get" action="search">
        <div class="col-md-12">
            <div class="col-md-9" style="padding-left: 0px;padding-right: 0px;">
                <input type="text" class="form-control" name="key" placeholder="标题、概要内容">
                <input type="hidden" value="video" name="direction">
            </div>
            <div class="col-md-3" style="padding-left: 0px; padding-top: 9.8px;">
                <button class="btn1 green" type="submit">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>
            </div>
        </div>
    </form>
</div>
<!-- /////////////////////////////////////////Content -->
<br>
<br>
<br>
<div id="page-content" class="index-page">



    <div class="container">
        <div class="row">

            <div class="featured">

                <h4>&nbsp; 本周最热</h4>
                <br>
                <div class="main-vid">
                    <div class="col-md-6">
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span>Video's Tag</span>
                                <a href="single.html">
                                    <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                </a>
                                <p>Video's Name</p>
                            </div>
                            <img src="../videocss/images/1.jpg" />
                        </div>
                    </div>
                </div>
                <div class="sub-vid">
                    <div class="col-md-3">
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span>Video's Tag</span>
                                <a href="single.html">
                                    <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                </a>
                                <p>Video's Name</p>
                            </div>
                            <img src="../videocss/images/2.jpg" />
                        </div>
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span>Video's Tag</span>
                                <a href="single.html">
                                    <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                </a>
                                <p>Video's Name</p>
                            </div>
                            <img src="../videocss/images/3.jpg" />
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span>Video's Tag</span>
                                <a href="single.html">
                                    <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                </a>
                                <p>Video's Name</p>
                            </div>
                            <img src="../videocss/images/4.jpg" />
                        </div>
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <span>Video's Tag</span>
                                <a href="single.html">
                                    <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                </a>
                                <p>Video's Name</p>
                            </div>
                            <img src="../videocss/images/6.jpg" />
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="row">
            <div id="main-content" class="col-md-8">
                <div class="box">

                    <h4> 精选视频</h4>

                    <div class="box-content">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/7.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <p class="more">Aenean feugiat in ante et blandit. Vestibulum posuere molestie risus, ac interdum magna porta non. Pellentesque rutrum fringilla elementum. Curabitur tincidunt porta lorem vitae accumsan.</p>
                                <br>
                                <div class="line"></div>
                                <div class="post wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/8.jpg" />
                                    </div>
                                    <div class="wrapper">
                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                        <div class="info">
                                            <h6>By <a href="#">Kelvin</a></h6>
                                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                            <span><i class="fa fa-heart"></i>1,200</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="post wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/9.jpg" />
                                    </div>
                                    <div class="wrapper">
                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                        <div class="info">
                                            <h6>By <a href="#">Kelvin</a></h6>
                                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                            <span><i class="fa fa-heart"></i>1,200</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="post wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/6.jpg" />
                                    </div>
                                    <div class="wrapper">
                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                        <div class="info">
                                            <h6>By <a href="#">Kelvin</a></h6>
                                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                            <span><i class="fa fa-heart"></i>1,200</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/9.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <p class="more">Aenean feugiat in ante et blandit. Vestibulum posuere molestie risus, ac interdum magna porta non. Pellentesque rutrum fringilla elementum. Curabitur tincidunt porta lorem vitae accumsan.</p>
                                <br>
                                <div class="line"></div>
                                <div class="post wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/4.jpg" />
                                    </div>
                                    <div class="wrapper">
                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                        <div class="info">
                                            <h6>By <a href="#">Kelvin</a></h6>
                                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                            <span><i class="fa fa-heart"></i>1,200</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="post wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/5.jpg" />
                                    </div>
                                    <div class="wrapper">
                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                        <div class="info">
                                            <h6>By <a href="#">Kelvin</a></h6>
                                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                            <span><i class="fa fa-heart"></i>1,200</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="post wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/2.jpg" />
                                    </div>
                                    <div class="wrapper">
                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                        <div class="info">
                                            <h6>By <a href="#">Kelvin</a></h6>
                                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                            <span><i class="fa fa-heart"></i>1,200</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line"></div>
                </div>
                <div class="box">

                    <h4>其他主题</h4>

                    <div class="box-content">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/3.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/4.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/5.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/6.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/7.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="wrap-vid">
                                    <div class="zoom-container">
                                        <div class="zoom-caption">
                                            <span>Video's Tag</span>
                                            <a href="single.html">
                                                <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                            </a>
                                            <p>Video's Name</p>
                                        </div>
                                        <img src="../videocss/images/8.jpg" />
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a>更多..</a>
                </div>



            </div>
            <div id="sidebar" class="col-md-4">

                <!---- Start Widget ---->
                <div class="widget wid-tags">
                    <div class="heading"><h4><i class="fa fa-tags"></i> 主题</h4></div>
                    <div class="content">
                        <ul class="list-inline">
                            <li><a href="#">animals ,</a></li>
                            <li><a href="#">cooking ,</a></li>
                            <li><a href="#">countries ,</a></li>
                            <li><a href="#">home ,</a></li>
                            <li><a href="#">likes ,</a></li>
                            <li><a href="#">photo ,</a></li>
                            <li><a href="#">travel ,</a></li>
                            <li><a href="#">video</a></li>
                        </ul>
                    </div>
                    <div class="line"></div>
                </div>
                <!---- Start Widget ---->
                <div class="widget wid-post">
                    <div class="heading"><h4><i class="fa fa-globe"></i> 猜你喜欢</h4></div>
                    <div class="content">
                        <div class="post wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <span>Video's Tag</span>
                                    <a href="single.html">
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>Video's Name</p>
                                </div>
                                <img src="../videocss/images/7.jpg" />
                            </div>
                            <div class="wrapper">
                                <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                <div class="info">
                                    <h6>By <a href="#">Kelvin</a></h6>
                                    <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                    <span><i class="fa fa-heart"></i>1,200</span>
                                </div>
                            </div>
                        </div>
                        <div class="post wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <span>Video's Tag</span>
                                    <a href="single.html">
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>Video's Name</p>
                                </div>
                                <img src="../videocss/images/8.jpg" />
                            </div>
                            <div class="wrapper">
                                <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                <div class="info">
                                    <h6>By <a href="#">Kelvin</a></h6>
                                    <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                    <span><i class="fa fa-heart"></i>1,200</span>
                                </div>
                            </div>
                        </div>
                        <div class="post wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <span>Video's Tag</span>
                                    <a href="single.html">
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>Video's Name</p>
                                </div>
                                <img src="../videocss/images/9.jpg" />
                            </div>
                            <div class="wrapper">
                                <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                <div class="info">
                                    <h6>By <a href="#">Kelvin</a></h6>
                                    <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                    <span><i class="fa fa-heart"></i>1,200</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="line"></div>
                </div>
                <!---- Start Widget ---->
                <div class="widget wid-news">
                    <div class="heading"><h4><i class="fa fa-clock-o"></i> 最新上传</h4></div>
                    <div class="content">
                        <div class="wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <span>Video's Tag</span>
                                    <a href="single.html">
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>Video's Name</p>
                                </div>
                                <img src="../videocss/images/3.jpg" />
                            </div>
                            <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                            <div class="info">
                                <h5>By <a href="#">Kelvin</a></h5>
                                <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                <span><i class="fa fa-heart"></i>1,200</span>
                            </div>
                        </div>
                        <div class="wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <span>Video's Tag</span>
                                    <a href="single.html">
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>Video's Name</p>
                                </div>
                                <img src="../videocss/images/4.jpg" />
                            </div>
                            <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                            <div class="info">
                                <h5>By <a href="#">Kelvin</a></h5>
                                <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                <span><i class="fa fa-heart"></i>1,200</span>
                            </div>
                        </div>
                        <div class="wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                    <span>Video's Tag</span>
                                    <a href="single.html">
                                        <i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>
                                    </a>
                                    <p>Video's Name</p>
                                </div>
                                <img src="../videocss/images/5.jpg" />
                            </div>
                            <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                            <div class="info">
                                <h5>By <a href="#">Kelvin</a></h5>
                                <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                <span><i class="fa fa-heart"></i>1,200</span>
                            </div>
                        </div>
                    </div>
                    <a>更多..</a>
                </div>
                <!---- Start Widget ---->


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
