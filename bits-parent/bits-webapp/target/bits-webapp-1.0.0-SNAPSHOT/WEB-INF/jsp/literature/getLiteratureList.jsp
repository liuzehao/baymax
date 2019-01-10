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
    <title>文献</title>
    <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <div class="row"style="margin-top: 100px;">
            <div class="col-md-6">
                <ul class="breadcrumb">
                    <li><a href="javascript:void(0)" onclick="toHome()">首页</a></li>
                    <li>文献</li>
                </ul>
            </div>
            <div class="col-md-6">
                <form class="form" method="get" action="search">
                    <div class="col-md-12">
                        <div class="col-md-9" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" class="form-control" name="key" placeholder="标题、概要内容、关键词">
                            <input type="hidden" value="literature" name="direction">
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
                    <c:forEach items="${result}" var="literature" varStatus="cursor">
                        <div class="row">
                            <div class="col-md-4 col-sm-4">

                                    <c:choose>
                                    <c:when test="${empty literature.fileImgUrl}">
                                        <img class="img-responsive"  style="height: 200px;width: 300px;" alt="" src="<c:url value="/assets/frontend/pages/img/works/img2.jpg"/>"/>
                                </c:when>
                                <c:when test="${not empty literature.fileImgUrl}" >
                                    <img class="img-responsive" style="height: 280px;width: 300px;"alt="" src="<c:url value="/findLittleImg?filename=${literature.fileImgUrl}"/>"/>
                                </c:when>
                                </c:choose>

                            </div>
                            <!-- Carousel nav -->
                            <div class="col-md-8 col-sm-8">
                                <h2><a href="/bits/literature/getLiteratureDetail?id=${literature.id}">${literature.title}</a></h2>
                                <ul class="blog-info">
                                    <li><i class="fa fa-calendar"></i>${literature.appDate}</li><br>
                                    <li><i class="fa fa-comments"></i>${literature.id}</li><br>

                                    <li><i class="fa fa-tags"></i> ${literature.fileKeywords}</li>
                                </ul>
                                <p>${literature.abs}</p>
                                <a href="/bits/literature/getLiteratureDetail?id=${literature.id}" class="more">更多..<i class="icon-angle-right"></i></a>
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
