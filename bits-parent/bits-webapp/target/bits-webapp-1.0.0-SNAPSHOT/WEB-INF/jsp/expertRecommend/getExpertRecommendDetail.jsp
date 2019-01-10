<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-8
  Time: 下午1:51
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
<!-- BEGIN CONTENT -->
<div class="main">
    <div class="container">
        <!--BEGIN FIRST ROW-->
        <div class="row">
            <div class="col-md-12">
                <!--BEGIN PORTLET BOX-->
                <div class="tabbable tabs-left" style="min-height: 500px;">

                    <ul class="nav nav-tabs">
                        <c:forEach items="${resultMap}" var="map" varStatus="iter1">
                            <li class="">
                                <a href="#tab_6_${iter1.index}" data-toggle="tab">
                                        ${map.key}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="col-md-10">
                        <!--BEGIN CONTENT-->
                        <div class="tab-content">
                            <c:forEach items="${resultMap}" var="map" varStatus="iter2">
                                <div class="tab-pane fade" id="tab_6_${iter2.index}">
                                    <div class="row front-team">
                                        <ul class="list-unstyled">
                                            <c:forEach items="${map.value}" var="expert">
                                                <li class="col-md-3">
                                                    <div class="thumbnail">
                                                        <img src="<c:url value="${expert.img}"/>" alt="">
                                                        <h3>
                                                            <strong><a href="javascript:void(0)"
                                                                       onclick="toExpertDetail('${expert.id}')">${expert.expertName}</a></strong>
                                                            <small style="height: 40px;padding-top:10px;padding-bottom: 10px;">${expert.expertOrg}</small>
                                                        </h3>
                                                        <span style="font-weight: bolder">
                                                            文献数:&nbsp;${expert.literatureCount}
                                                        </span>
                                                        <span style="font-weight: bolder">
                                                            专利数:&nbsp;${expert.patentCount}
                                                        </span>

                                                        <div class="btn-group">
                                                            <button type="button" class="btn purple dropdown-toggle"
                                                                    data-toggle="dropdown" data-hover="dropdown"
                                                                    data-delay="1000" data-close-others="true">
                                                                TA的领域
                                                                <i class="fa fa-angle-down"></i>
                                                            </button>
                                                            <ul class="dropdown-menu" role="menu">
                                                                <c:choose>
                                                                    <c:when test="${expert.themeList.isEmpty()}">
                                                                        <a href="javascript:void(0)"><c:out value="暂无"></c:out></a>
                                                                    </c:when>
                                                                    <c:when test="${!expert.themeList.isEmpty()}">
                                                                        <c:forEach items="${expert.themeList}"
                                                                                   var="theme">
                                                                            <li>
                                                                                <a href="javascript:void(0)"
                                                                                   onclick="toThemeExperts('${theme.id}')">
                                                                                        ${theme.themeName}
                                                                                </a>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </c:when>
                                                                </c:choose>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <!--BEGIN CONTENT-->
                    </div>
                </div>
                <!--END PORTLET BOX-->
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/script.jsp"/>
<script>
    $(document).ready(function () {
        $(".nav-tabs > li:first").addClass("active");
        $(".tab-pane:first").addClass("active in");
    })
</script>
</body>
</html>
