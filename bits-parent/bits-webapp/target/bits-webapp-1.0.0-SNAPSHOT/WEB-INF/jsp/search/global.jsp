<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-9
  Time: 上午11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>搜索结果</title>
    <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="#">首页</a></li>
            <li class="active">全局搜索结果</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12">
                <h1>搜索结果</h1>
                <div class="content-page">
                    <div class="row">
                        <div class="col-md-8">
                        <c:forEach items="${result}" var="bean">
                            <div class="search-result-item">
                                <h4><a href="${bean.url}"
                                        style="color: blue" target="_blank">${bean.title}</a>
                                </h4>
                                <p>${bean.abs}</p>
                                <span>时间:&nbsp;</span><a class="search-link" href="#">${bean.date}</a>
                            </div>
                        </c:forEach>
                            <div class="row">
                                <div class="col-md-4 col-sm-4 items-info">搜到大约&nbsp;${totalHits}&nbsp;条记录</div>
                                <div class="col-md-8 col-sm-8">
                                    <ul class="pagination pull-right">
                                        <c:forEach items="${Pagination}" var="item">
                                            ${item}
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4"></div>

                </div>
            </div>
            <!-- END CONTENT -->
        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
