<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-6
  Time: 下午7:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>主题专家网</title>
    <jsp:include page="../includes/style.jsp"/>

</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form action="getThemeWeb" class="content-search-view2 margin-bottom-10" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="主题关键词"
                               flag="themeAutoCompleteList" autocomplete="off" name="themeName">
                               <span class="input-group-btn">
                                 <button type="submit" class="btn btn-primary">检索</button>
                               </span>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-12" style="height: 30px; background-color: rgb(221,84,49); color:#ffffff; font-size: 20px;display: table-cell">
            <i class="fa fa-group" style="vertical-align: middle"></i>
            <span style="vertical-align: middle">主题专家网</span>
        </div>
        <div class="col-md-12 margin-top-20">
            <div class="col-md-4">
                <img style="height:270px;width:340px"
                     src="<c:url value="/assets/admin/pages/media/gallery/expertWeb.png"/>">
            </div>
            <div class="col-md-8">
                <ul style="font-size: 20px; list-style: none">
                    <li>输入您希望查询的主题信息，我们可以为您提供该主题的专家列表</li>
                    <li>为您展现同一主题某专家的学术网络</li>
                    <li>以图谱的形式呈现，给您更直观的检索结果</li>
                </ul>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
