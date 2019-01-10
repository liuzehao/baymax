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

    <title>播放界面</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="../videocss/css/bootstrap.min.css"  type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../videocss/css/style.css">

    <!-- Owl Carousel Assets -->
    <link href="../videocss/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="../videocss/owl-carousel/owl.theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="../videocss/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">

    <!-- jQuery and Modernizr-->
    <script src="../videocss/js/jquery-2.1.1.js"></script>

    <!-- Core JavaScript Files -->
    <script src="../videocss/js/bootstrap.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="../videocss/js/html5shiv.js"></script>
    <script src="../videocss/js/respond.min.js"></script>
    <![endif]-->
    <link href="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.min.css"/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.js"/>"></script>
    <script src="<c:url value="/js/global/toast.js"/>"></script>
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
    <!--Navigation-->
</header>

<!-- /////////////////////////////////////////Content -->
<div id="page-content" class="single-page" style="margin-top: 50px;">
    <div class="container">
        <div class="row">
            <div id="main-content" class="col-md-8">
                <div class="wrap-vid">
                    <video width="100%" height="400" src="<c:url value="/FileDown?filename=${video.fileName}"/>" frameborder="0" controls allowfullscreen></video>
                </div>
                <div class="share">
                    <ul class="list-inline center">
                        <li><a  id="setGeneralFile" class="btn btn-facebook"><i class="fa  fa-star-o"></i> 收藏</a></li>
                        <li><a href="/bits/FileDown?filename=${video.fileName}" class="btn btn-google"><i class="fa fa-toggle-down"></i> 下载</a></li>
                        <li><a  onclick="javascript:document.getElementById('discuss').scrollIntoView()" class="btn btn-mail scroll"><i class="fa fa-envelope-o"></i> 评论</a></li>
                    </ul>
                </div>
                <script>
                    $("#setGeneralFile").click(function(){
                        $.ajax({
                            url: basePath + "literature/setGeneralFile",
                            data: {
                                fileId:${video.fileId}
                            },
                            dataType: "json",
                            type: "POST",
                            success: function () {
                             toast.success();
                            },
                            error: function(){
                                alert("出错了");
                            }
                        })
                    })
                </script>
                <div class="line"></div>
                <h1 class="vid-name"><a href="#">${video.fileName}</a></h1>
                <div class="info">
                    <span><i class="fa fa-calendar"></i>${video.fileTime}</span>
                    <span><i class="fa fa-barcode"></i>${video.fileId}</span>
                </div>
                <p style="margin-top: 20px"></p>
                <h4>简介</h4>
                <p style="margin-top: 20px">${video.fileAbstract}</p>
                <br>
                <div class="line"></div>
                <br>
                <div class="comment">
                    <h3 id="discuss">发表评论:</h3>
                    <form name="form1" method="post" action="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control input-lg" name="name" id="name" placeholder="Enter name" required="required" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="email" class="form-control input-lg" name="email" id="email" placeholder="Enter email" required="required" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
										<textarea name="message" id="message" class="form-control" rows="4" cols="25" required="required"
                                                  placeholder="Message"></textarea>
                                </div>
                                <button type="submit" class="btn1 green  btn-block" name="btnSend" id="btnSend">
                                    发表</button>
                            </div>
                        </div>
                    </form>
                </div>
                <br>
                <br>
            </div>

        </div>
    </div>
</div>

<footer>

    <div class="bottom-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6 copyright">
                    <span>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></span>
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
