<%--
  Created by IntelliJ IDEA.
  User: hao pc
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
  <title>音频搜索</title>
  <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main" style="margin-top: 50px;">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <ul class="breadcrumb">
          <li><a href="javascript:void(0)" onclick="toHome()">首页</a></li>
          <li>音乐</li>
        </ul>
      </div>
      <div class="col-md-6">
        <form class="form" method="get" action="search">
          <div class="col-md-12">
            <div class="col-md-9" style="padding-left: 0px;padding-right: 0px;">
              <input type="text" class="form-control" name="key" placeholder="标题、概要内容、关键词">
            </div>
            <div class="col-md-3" style="padding-left: 0px;">
              <button class="btn green" type="submit">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN CONTENT -->
      <div class="col-md-12 col-sm-12">
        <div class="content-page">
          <c:forEach items="${result}" var="audio" varStatus="cursor">
            <div class="row">
              <div class="col-md-4 col-sm-4">
                <img class="img-responsive" alt="" src="/bits/findLittleImg?filename=${audio.fileImgUrl} " />
              </div>
              <!-- Carousel nav -->
              <div class="col-md-8 col-sm-8">
                <h2><a href="/bits/literature/getLiteratureDetail?id=${audio.fileId}">${audio.fileName}</a></h2>
                <ul class="blog-info">
                  <li><i class="fa fa-calendar"></i>${audio.fileTime}</li><br>
                </ul>
                <a href="/bits/FileDown?filename=${audio.fileNameFormer}" class="more"><i class="fa fa-toggle-down"></i>下载</a>
                <a href="#" id="setGeneralFile" onclick="general()"><i id="general" class="fa  fa-star-o"></i> 收藏</a>
                <script>
                  var general=function(){
                    $.ajax({
                      url: basePath + "literature/setGeneralFile",
                      data: {
                        fileId:${audio.fileId}
                      },
                      dataType: "json",
                      type: "POST",
                      success: function () {
                        $("#general").attr("class","fa  fa-star");
                        toast.success();
                      },
                      error: function(){
                        alert("出错了,请先登录");
                      }
                    })
                  }
                </script>
                <p>${audio.fileAbstract}</p>
                <audio controls="controls">
                  <source src="/bits/FileDown?filename=${audio.fileNameFormer}" />
                </audio>
              </div>
            </div>
            <hr class="blog-post-sep">
          </c:forEach>
          <ul class="pagination">
            <c:forEach items="${Pagination}" var="item">
              ${item}
            </c:forEach>
          </ul>
        </div>
        <!-- END LEFT SIDEBAR -->
      </div>
    </div>
  </div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
