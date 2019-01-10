<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<html>
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>文档详情</title>

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
    <link href="../assetsallP/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assetsallP/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="../assetsallP/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="../assetsallP/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="../assetsallP/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
    <link href="../assetsallP/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin styles END -->

    <!--   Theme styles START <link href="../assetsallP/global/css/components.css" rel="stylesheet">-->

     <link href="../assetsallP/frontend/layout/css/style.css" rel="stylesheet">
     <link href="../assetsallP/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
     <link href="../assetsallP/frontend/layout/css/style-responsive.css" rel="stylesheet">
     <link href="../assetsallP/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
     <link href="../assetsallP/frontend/layout/css/custom.css" rel="stylesheet">
     <!-- Theme styles END -->
    <link href="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.min.css"/>" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.js"/>"></script>
    <script src="<c:url value="/js/global/toast.js"/>"></script>
    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
    <script>
        function details(){

            $("#abstract").hide();
            $("#details").show();

        }
        function abstract(){

            $("#abstract").show();
            $("#details").hide();

        }
    </script>


</head>
<!-- Head END -->
<jsp:include page="../includes/header.jsp"/>
<!-- Body BEGIN -->
<body class="ecommerce">

<div class="main" style="margin-top: 20px;">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li><a href="">文件</a></li>
            <li class="active">文件详情</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN SIDEBAR -->

            <!-- END SIDEBAR -->

            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <div class="product-page">
                    <div class="row">
                        <div class="col-md-12 col-sm-12" style="text-align: center">
                            <h2><a href="getLiteratureDetail?id=${Literature.fileId}" style="color: #616264">${Literature.fileName}</a></h2>
                            <br>
                            <div style="height: 1px;background-color: #D3D3D3" ></div>
                            <br><br><br>
                        </div>

                        <div class="row">
                            <div class="col-md-1 col-sm-1"></div>
                            <div class="col-md-5 col-sm-5 "  id="abstract" >
                                <ul  class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#" onclick="abstract()"  >文档摘要</a>
                                    </li>
                                    <li>
                                        <a href="#" onclick="details()"  >详细信息 </a>
                                    </li>
                                </ul>
                                <br>
                                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Literature.fileAbstract}</p>
                                <div style="display:none;">
                                    <c:choose>
                                        <c:when test="${Literature.fileType == 'jpg'||Literature.fileType=='png'||Literature.fileType=='gif'}">
                                            <a href="/bits/FileDown?filename=${Literature.fileName}" class=" fancybox-button"><i class="fa  fa-camera-retro"></i> 预览</a>
                                        </c:when>
                                        <c:when test="${Literature.fileType == 'mp3'||Literature.fileType=='wav'}">
                                            <a data-toggle="modal" href="#form" onclick="upload()"><i class="fa  fa-camera-retro"></i> 预览</a>
                                        </c:when>
                                        <c:when test="${Literature.fileType == 'mp4'||Literature.fileType=='avi'||Literature.fileType=='swf'}">
                                            <a href="/bits/video/getVideoSingle?id=${Literature.fileId}" class=" fancybox-button"><i class="fa  fa-camera-retro"></i> 预览</a>
                                        </c:when>
                                        <c:when test="${Literature.fileType == 'html'}">
                                            <a href="/bits/upload/documents/${Literature.fileName}"  target="_blank" class=" fancybox-button"><i class="fa  fa-camera-retro"></i> 预览</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="http://officeweb365.com/o/?i=9734&furl=http://111.116.20.180:20482/bits/FileDown?filename=${Literature.fileName}" class="more"><i class="fa  fa-camera-retro"></i> 预览</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="/bits/FileDown?filename=${Literature.fileName}" class="more"><i class="fa fa-toggle-down"></i>下载</a>
                                    <a href="#" id="setGeneralFile" onclick="general()"><i  class="fa  fa-star-o"></i> 收藏</a>
                                </div>
                            </div>
                            <!-- Carousel nav -->
                            <div class="col-md-5 col-sm-5 "id="details" style="display: none " >

                                <ul id="myTab" class="nav nav-tabs">
                                    <li >
                                        <a href="#" onclick="abstract()" >文档摘要</a>
                                    </li>
                                    <li class="active">
                                        <a href="#" onclick="details()" >详细信息 </a>
                                    </li>
                                </ul>
                                <br>
                                <input value="${Literature.fileId}"  id="fileId" name="fileId" style="display: none" >
                                <h2 style="display: none"><a href="getLiteratureDetail?id=${Literature.fileId}">${Literature.fileName}</a></h2>
                                <ul class="blog-info">
                                    <li>
                                        <i>评分:</i>&nbsp;<div id="score" onclick="scoreto()" class="rateit" data-rateit-ispreset="true" data-rateit-value="${Literature.totleScore}"data-rateit-resetable="false" ></div>
                                    </li><br><br>
                                    <li><i>文件编号:&nbsp;</i>${Literature.fileId}</li><br><br>
                                    <li><i>关键字:</i>&nbsp;${Literature.fileKeywords}</li><br><br>
                                    <li><i>上传时间:&nbsp;</i>${Literature.fileTime}</li><br><br>
                                    <li><i>上传人:&nbsp;</i>${uploadUser.username}</li><br><br>
                                    <li><i>主题:&nbsp;</i> <c:forEach items="${Themes}" var="theme">
                                        ${theme.themeName} </c:forEach>
                                    </li><br><br>
                                    <li><i>类型:</i>&nbsp;${Literature.fileType}</li><br><br>
                                    <li><i>大小:</i>&nbsp;${Literature.fileSize}k</li><br><br>
                                </ul>
                            </div>
                            <div class="col-md-1 col-sm-1"></div>
                            <div class="col-md-4 col-sm-4">
                                <br>
                                <br>
                                <c:choose>
                                    <c:when test="${empty Literature.fileImgUrl}">
                                        <img class="img-responsive" alt="" src="<c:url value="/assets/frontend/pages/img/works/img2.jpg"/>"/>
                                    </c:when>
                                    <c:when test="${not empty Literature.fileImgUrl}" >
                                        <img class="img-responsive" style="height: 300px; "alt="" src="<c:url value="/findLittleImg?filename=${Literature.fileImgUrl}"/>"/>
                                    </c:when>
                                </c:choose>
                                <br>
                                <br>
                                <c:choose>
                                    <c:when test="${Literature.fileType == 'jpg'||Literature.fileType=='png'||Literature.fileType=='gif'}">

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/bits/FileDown?filename=${Literature.fileName}" class=" fancybox-button"><i class="fa  fa-camera-retro" style="display: none"></i> <img src="../images/yl.png"></a>&nbsp;&nbsp;&nbsp;

                                    </c:when>
                                    <c:when test="${Literature.fileType == 'mp3'||Literature.fileType=='wav'}">

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" href="#form" onclick="upload()"><i class="fa  fa-camera-retro" style="display: none"></i> <img src="../images/yl.png"></a>&nbsp;&nbsp;&nbsp;
                                    </c:when>
                                    <c:when test="${Literature.fileType == 'mp4'||Literature.fileType=='avi'||Literature.fileType=='swf'}">

                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<a href="/bits/video/getVideoSingle?id=${Literature.fileId}" class=" fancybox-button"><i class="fa  fa-camera-retro" style="display: none"></i> <img src="../images/yl.png"></a>&nbsp;&nbsp;&nbsp;
                                    </c:when>
                                    <c:when test="${Literature.fileType == 'html'}">

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/bits/upload/documents/${Literature.fileName}"  target="_blank" class=" fancybox-button"><i style="display: none" class="fa  fa-camera-retro"></i> <img src="../images/yl.png"></a>&nbsp;&nbsp;&nbsp;
                                    </c:when>

                                    <c:otherwise>

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://officeweb365.com/o/?i=10099&furl=http://zhishiku.win:20482/bits/FileDown?filename=${Literature.fileName}" target="_blank" class="more"><i style="display: none" class="fa  fa-camera-retro"></i> <img src="../images/yl.png"></a>&nbsp;&nbsp;&nbsp;
                                    </c:otherwise>
                                </c:choose>

                                <a href="/bits/FileDown?filename=${Literature.fileName}" class="more"><i class="fa fa-toggle-down" style="display: none;"></i><img src="../images/xz.png"></a>&nbsp;&nbsp;&nbsp;

                                <a href="#" id="setGeneralFile" onclick="general()"> <img src="../images/sc.png"></a><a id="general"></a>
                            </div>
                            <div class="col-md-1 col-sm-1"></div>
                        </div>

                        <!--mp3弹窗-->
                        <div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false"
                             data-backdrop="static">
                            <div class="modal-dialog" style="width: 400px;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" ></button>
                                        <h4 class="modal-title" id="dialogTitle"></h4>
                                    </div>
                                    <div class="modal-body" style="padding-top: 0px; height: 80px;">
                                        <div class="portlet-body">
                                            <audio controls="controls">
                                                <source src="/bits/FileDown?filename=${Literature.fileName}" />
                                            </audio>
                                            <button type="button" class="btn default" onclick="quit()"style="margin-left: 310px;">关闭</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                   </div>
                        <div class="product-page-content">
                            <ul class="nav nav-tabs">

                                <li class="active"><a href="#Reviews" data-toggle="tab">用户评论 </a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content">

                                <div class="tab-pane fade in active" id="Reviews">
                                    <!--<p>There are no reviews for this product.</p>-->
                                    <c:forEach items="${CommentList}" var="CommentList" varStatus="cursor">
                                        <div class="review-item clearfix">
                                            <div class="review-item-submitted">
                                                <strong>${CommentList.userName}</strong>
                                                <em>${CommentList.commentTime}</em>
                                                <div style="display:none;" class="rateit" data-rateit-value="${CommentList.fileValue}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                                            </div>
                                            <div class="review-item-content">
                                                <p>${CommentList.commentContent}</p>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <!-- BEGIN FORM-->
                                    <form  class="reviews-form" role="form" >

                                        <div class="form-group">
                                            <label for="userName">姓名<span class="require">*</span>：</label>
                                            <input type="text" class="form-control" id="userName" name="userName">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">邮箱：</label>
                                            <input type="text" class="form-control" id="email" >
                                        </div>
                                        <div class="form-group">
                                            <label for="commentContext">评论 <span class="require">*</span>：</label>
                                            <textarea class="form-control" rows="8" id="commentContext" name="commentContext" vlaue="aaa" ></textarea>
                                        </div>
                                        <div class="form-group" style="display: none">
                                            <label for="email">打星：</label>
                                            <input type="range" value="0" step="0.25"  id="backing5" name="fileValue">
                                            <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                                            </div>
                                        </div>
                                        <div class="padding-top-20">
                                            <a  onclick="comment1()"><img src="../images/fa.png" /></a>
                                        </div>
                                    </form>
                                    <script>
                                    var comment1 = function() {
                                    var now = new Date();

                                    var now1 = now.toLocaleString();

                                    $.ajax({
                                    url: basePath + "comment/addComment",
                                    data: {
                                    fileId:${Literature.fileId},
                                    userName: $("#userName").val(),
                                    commentContent: $("#commentContext").val(),
                                    fileValue:$("#backing5").val(),
                                    commentTime:now1
                                    },
                                    dataType: "json",
                                    type: "POST",
                                    success: function () {
                                    //$("#general").attr("class","fa  fa-star");
                                    window.location.href = basePath + "literature/getLiteratureDetail?id=" + ${Literature.fileId};

                                    toast.success();
                                    },
                                    error: function(){
                                    alert("出错了");
                                    }
                                    })
                                    }
                                    </script>
                                    <!-- END FORM-->
                                </div>
                            </div>
                        </div>
                        <!-- BEGIN LEFT SIDEBAR -->
                        <!--<div class="row">
                            <div class="col-md-1 col-sm-1"></div>
                            <div class="col-md-5 col-sm-5">
                                <c:choose>
                                    <c:when test="${empty Literature.fileImgUrl}">
                                        <img class="img-responsive" alt="" src="<c:url value="/assets/frontend/pages/img/works/img2.jpg"/>"/>
                                    </c:when>
                                    <c:when test="${not empty Literature.fileImgUrl}" >
                                        <img class="img-responsive" alt="" style="width: 353px; height: 350px;" src="<c:url value="/findLittleImg?filename=${Literature.fileImgUrl}"/>"/>
                                    </c:when>
                                </c:choose>


                            </div>
                            <!-- Carousel nav -->
                            <!--<div class="col-md-4 col-sm-4">
                                <h2><a href="getLiteratureDetail?id=${Literature.fileId}">${Literature.fileName}</a></h2>
                                <ul class="blog-info">
                                    <li>
                                        <i>评分:</i>&nbsp;<div id="score" onclick="scoreto()" class="rateit" data-rateit-ispreset="true" data-rateit-value="${Literature.totleScore}"data-rateit-resetable="false" ></div>
                                    </li><br><br>
                                    <li><i>文件编号:&nbsp;</i>${Literature.fileId}</li><br><br>
                                    <li><i>关键字:</i>&nbsp;计算机;软件</li><br><br>
                                    <li><i>上传时间:&nbsp;</i>${Literature.fileTime}</li><br><br>
                                    <li><i>上传人:&nbsp;</i>${User.username}</li><br><br>
                                    <li><i>主题:&nbsp;</i> <c:forEach items="${Themes}" var="theme">
                                        ${theme.themeName} </c:forEach>
                                    </li><br><br>

                                    <li><i>类型:</i>&nbsp;${Literature.fileType}</li><br><br>
                                    <li><i>大小:</i>&nbsp;${Literature.fileSize}k</li><br><br>
                                </ul>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <p>[摘要]&nbsp;${Literature.fileAbstract}</p>


                                <c:choose>
                                    <c:when test="${Literature.fileType == 'jpg'||Literature.fileType=='png'||Literature.fileType=='gif'}">
                                        <a href="/bits/FileDown?filename=${Literature.fileName}"   class=" fancybox-button" ><i class="fa  fa-camera-retro"></i> 预览</a>
                                    </c:when>
                                    <c:when test="${Literature.fileType == 'mp3'||Literature.fileType=='wav'}">
                                        <a data-toggle="modal" href="#form" onclick="upload()"><i class="fa  fa-camera-retro"></i> 预览</a>
                                    </c:when>
                                    <c:when test="${Literature.fileType == 'mp4'||Literature.fileType=='avi'||Literature.fileType=='swf'}">
                                        <a href="/bits/video/getVideoSingle?id=${Literature.fileId}" target="_blank"  class=" fancybox-button"  ><i class="fa  fa-camera-retro"></i> 预览</a>
                                    </c:when>
                                    <c:when test="${Literature.fileType == 'html'}">
                                        <a href="/bits/upload/documents/${Literature.fileName}"  target="_blank" class=" fancybox-button"><i class="fa  fa-camera-retro"></i> 预览</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="http://officeweb365.com/o/?i=9734&furl=http://l1y5061839.iask.in:20482/bits/FileShow?filename=${Literature.fileName}" target="_blank" class="more"><i class="fa  fa-camera-retro"></i> 预览</a>
                                    </c:otherwise>
                                </c:choose>
                                <a href="/bits/FileDown?filename=${Literature.fileName}" class="more"><i class="fa fa-toggle-down"></i>下载</a>
                                <a href="#" id="setGeneralFile" onclick="general()"><i id="general" class="fa  fa-star-o"></i> 收藏</a>
                            </div>
                        </div>-->

                        <script src="../assets3_0/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
                        <script>
                            var quit=function(){

                                parent.parent.$("#modalDialog").modal("hide");
                            }
                            var scoreto=function(){
                                $.ajax({
                                    url: basePath + "literature/setScore",
                                    data: {
                                        score:$("#score").rateit('value'),
                                        fileId:${Literature.fileId}
                                    },
                                    dataType: "json",
                                    type: "POST",
                                    success: function () {
                                        $("#score").append("<text id='message'style='color:red;'>感谢您的评分!推荐将更加准确</text>");
                                        $('#message').delay(3000).hide(0);
                                        toast.success();
                                    },
                                    error: function(){
                                       alert("出错");
                                    }
                                })
                            }

                            var upload=function (){
                                $("#dialogTitle").text("音频播放");
                               // $("#audio").attr("src","/bits/FileDown?filename=");
                                $("#modalDialog").modal("show");
                            }




                            var general=function(){
                                $.ajax({
                                    url: basePath + "literature/setGeneralFile",
                                    data: {
                                        fileId:${Literature.fileId}
                                    },
                                    dataType: "json",
                                    type: "POST",
                                    success: function () {

                                        $("#general").append("<text id='message2'style='color:red;'> 收藏成功!</text>");
                                        $('#message2').delay(3000).hide(0);

                                    },
                                    error: function(){
                                        alert("出错了");
                                    }
                                })
                            }

                            var comment1 = function() {
                                var now = new Date();

                                var now1 = now.toLocaleString();

                                $.ajax({
                                    url: basePath + "comment/addComment",
                                    data: {
                                        fileId:${Literature.fileId},
                                        userName: $("#userName").val(),
                                        commentContent: $("#commentContext").val(),
                                        fileValue:$("#backing5").val(),
                                        commentTime:now1
                                    },
                                    dataType: "json",
                                    type: "POST",
                                    success: function () {
                                        //$("#general").attr("class","fa  fa-star");
                                        window.location.href = basePath + "literature/getLiteratureDetail?id=" + ${Literature.fileId};

                                        toast.success();
                                    },
                                    error: function(){
                                        alert("出错了");
                                    }
                                })
                            }
                        </script>




                        <!--<div class="product-page-content">
                            <div class="row">
                                <div class="col-md-1 col-md-1">
                                </div>
                                <div class="col-md-10 col-sm-10" >

                                    <ul id="myTab" class="nav nav-tabs">

                                        <li class="active">
                                            <a href="#Reviews" data-toggle="tab">用户评论</a>
                                        </li>

                                    </ul>
                                    <div id="myTabContent" class="tab-content">

                                        <div class="tab-pane fade in active" id="Reviews">
                                            <!--<p>There are no reviews for this product.</p>-->
                                          <!--  <c:forEach items="${CommentList}" var="CommentList" varStatus="cursor">
                                                <div class="review-item clearfix">
                                                    <div class="review-item-submitted">
                                                        <strong>${CommentList.userName}</strong>
                                                        <em>${CommentList.commentTime}</em>
                                                        <div class="rateit" data-rateit-value="${CommentList.fileValue}" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                                                    </div>
                                                    <div class="review-item-content">
                                                        <p>${CommentList.commentContent}</p>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                            <!-- BEGIN FORM-->
                                           <!-- <form  class="reviews-form" role="form" >

                                                <div class="form-group">
                                                    <label for="userName">姓名<span class="require">*</span>：</label>
                                                    <input type="text" class="form-control" id="userName" name="userName">
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">邮箱：</label>
                                                    <input type="text" class="form-control" id="email" >
                                                </div>
                                                <div class="form-group">
                                                    <label for="commentContext">评论 <span class="require">*</span>：</label>
                                                    <textarea class="form-control" rows="8" id="commentContext" name="commentContext" vlaue="aaa" ></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">打星：</label>
                                                    <input type="range" value="0" step="0.25"  id="backing5" name="fileValue">
                                                    <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                                                    </div>
                                                </div>
                                                <div class="padding-top-20">
                                                    <a  href="#" onclick="comment1()"><img src="../images/fa.png" /></a>
                                                </div>
                                            </form>
                                            <!-- END FORM-->
                                        <!--</div>
                                    </div>
                                </div>-->

                            <!--</div>-->


                    </div>
                </div>
            </div>

        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">
            <div class="col-md-12 col-sm-12">
                <h2>相关和推荐:</h2>
                <div class="owl-carousel owl-carousel4">

                    <c:forEach items="${relations}" var="relation" varStatus="cursor">
                    <div>
                        <div class="product-item">
                            <div class="pi-img-wrapper">
                                <p style="color:red;">相关</p>
                                <img style="width:300px; height:170px;" src="/bits/findLittleImg?filename=${relation.fileImgUrl}" class="img-responsive" alt="Berry Lace Dress">
                                <div>
                                    <a href="/bits/literature/getLiteratureDetail?id=${relation.fileId}" class="btn btn-default fancybox-button">${relation.fileName}</a>
                                </div>
                            </div>

                        </div>
                    </div>
                    </c:forEach>
                    <c:if  test="${not empty recommends}">
                        <c:forEach items="${recommends}" var="recommend" varStatus="cursor">
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <p style="color:red;">推荐！</p>
                                        <img style="width:300px; height:170px;" src="/bits/findLittleImg?filename=${recommend.fileImgUrl}" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="/bits/literature/getLiteratureDetail?id=${recommend.fileId}" class="btn btn-default fancybox-button">${recommend.fileName}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- END SIMILAR PRODUCTS -->
    </div>
</div>

<!-- BEGIN BRANDS -->


<!-- END BRANDS -->





<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10">
                2016 © 长春工业大学
            </div>
        </div>
    </div>
</div>
<script src="assets/plugins/respond.min.js"></script>
<![endif]-->
<script src="../assets/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="../assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
<script src="../assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
<script src='../assets/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="../assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
<script src="../assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>

<script src="../assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        Layout.initTwitter();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initUniform();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>