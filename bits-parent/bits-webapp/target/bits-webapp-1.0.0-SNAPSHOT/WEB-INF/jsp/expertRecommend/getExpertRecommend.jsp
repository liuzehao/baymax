<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-7
  Time: 下午12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主题专家推荐</title>
    <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form action="getExpertRecommendDetail" class="content-search-view2 margin-bottom-10" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="主题关键词" name="content">
                               <span class="input-group-btn">
                                 <button type="submit" class="btn btn-primary">检索</button>
                               </span>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-12" style="height: 30px; background-color: rgb(65,133,190); color:#ffffff; font-size: 20px;display: table-cell">
            <i class="fa fa-group" style="vertical-align: middle"></i>
            <span style="vertical-align: middle">主题专家推荐</span>
        </div>

        <div class="col-md-12 margin-top-20">
            <div class="col-md-4">
                <img class="img-response"
                     src="<c:url value="/image/img/340x280.jpg"/>"
                        >
            </div>
            <div class="col-md-8">
                <ul style="font-size: 20px; list-style: none">
                    <li>输入您希望查询的主题信息，我们可以为您提供该主题的专家列表</li>
                    <li>通过专家在某领域的等级为您的查询结果排序</li>
                    <li>以列表的形式，为您有优先呈现核心专家</li>
                </ul>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
