<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-7
  Time: 上午11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>专家图谱</title>
    <jsp:include page="../includes/style.jsp"/>

</head>
<body>
<jsp:include page="../includes/frontend-top.jsp"/>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <%--demo样式可删除--%>
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li><a href="#">专家图谱</a></li>
        </ul>
        <div style="height:auto;padding:20px" class="col-md-12">
            <div style="padding: 20px">
                <img style="padding:10px;width:1000px"
                     src="<c:url value="/assets/admin/pages/media/gallery/expertWeb.png"/>">
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
