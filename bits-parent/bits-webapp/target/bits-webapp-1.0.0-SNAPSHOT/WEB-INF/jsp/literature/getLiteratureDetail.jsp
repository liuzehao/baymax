<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-5
  Time: 上午11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title></title>
    <jsp:include page="../includes/style.jsp"/>

</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li><a href="javascript:void(0)" onclick="toLiterature()">文献</a></li>
            <li class="active">文献详情</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <div class="content-page">
                    <div class="row">
                        <!-- BEGIN LEFT SIDEBAR -->
                        <div class="col-md-12 col-sm-12 blog-item">
                            <h2>${Literature.title}</h2>
                            <ul class="blog-info">
                                <li><i class="fa fa-calendar"></i> ${Literature.appDate}</li>
                                <li><i class="fa fa-comments"></i> ${Literature.unit}同济大学热能工程系;</li>
                                <li><i class="fa fa-tags"></i>${Literature.authorCn}</li>
                            </ul>
                            <p>${Literature.abs}</p>
                        </div>
                        <hr>
                        <h2>相关专家</h2>

                        <div class="comments">
                            <c:forEach items="${Experts}" var="expert">
                                <div class="media">
                                    <a href="javascript:void(0)" class="pull-left">
                                        <img src="<c:url value="${expert.img}"/>"
                                             alt=""
                                             class="media-object" style="width:100px">
                                    </a>

                                    <div class="media-body">
                                        <h4 class="media-heading">
                                            <a href="javascript:void(0)" onclick="toExpertDetail('${expert.id}')">${expert.expertName}
                                            </a></h4>

                                        <p></p>

                                        <p><i class="fa fa-tags"></i><span>&nbsp;单位:${expert.expertOrg}</span></p>

                                        <p><i class="fa fa-tags"></i><span>&nbsp;专家领域:
                                            <c:choose>
                                                <c:when test="${!expert.themeList.isEmpty()}">
                                                    <c:forEach items="${expert.themeList}" var="theme">
                                                        <a href="javascript:void(0)" class="btn default" onclick="toThemeExperts('${theme.id}')">${theme.themeName}</a>
                                                    </c:forEach>
                                                </c:when>
                                                <c:when test="${expert.themeList.isEmpty()}">
                                                    <span style="font-size:17px;font-weight: bolder"><c:out value="暂无"></c:out></span>
                                                </c:when>
                                            </c:choose>
                                        </span></p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
