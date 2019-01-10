<%--
  Created by IntelliJ IDEA.
  User: Demon
  Date: 2015/5/18
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主题列表</title>
    <jsp:include page="../includes/style.jsp"/>
    <link href="<c:url value="/assets/frontend/pages/css/portfolio.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/frontend/pages/css/gallery.css"/>" rel="stylesheet" type="text/css">
    <style>
        .content-page a {
            font-weight: 600;
            color: #ffffff;
            text-decoration: none;
        }

        .content-page a:hover {
            color: #ffffff;
            text-decoration: none;
        }

        .owl-buttons {
            position: relative !important;
            margin: 10px auto;
            top: 0px !important;
            right: 0px !important;
            left: 0px !important;
            text-align: center;
        }
        strong{
            text-align: center;
        }
        .topIcon {
            position:absolute;
            top:0px;
            right:0px;
        }
    </style>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0)" onclick="toHome()">首页</a></li>
            <li class="active">主题</li>
        </ul>
        <!-- CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <div class="row margin-top-10 margin-bottom-10">
                    <div class="col-md-8">
                        <h1>主题</h1>
                    </div>
                    <div class="col-md-4">
                        <select class="form-control select2" id="fastSearch">
                            <option></option>
                            <c:forEach items="${cacheThemes}" var="theme">
                            <option value="${theme.id}">${theme.themeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="content-page">
                    <!--热门主题-->
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>热门主题
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="recent-work">
                                <div class="owl-carousel owl-carousel3">
                                    <c:forEach items="${TopTheme}" var="theme">
                                        <div class="recent-work-item">
                                            <em>
                                                <img src="<c:url value="${theme.img}"/>"
                                                     alt="${theme.themeName}"
                                                     class="img-responsive">
                                                <a href="javascript:void(0)" onclick="toThemeExperts('${theme.id}')"><i
                                                        class="fa fa-search"></i></a>
                                                <img class="topIcon" src=""/>
                                            </em>
                                            <a class="recent-work-description"
                                               href="javascript:void(0)" onclick="toThemeExperts('${theme.id}')">
                                                <strong>${theme.themeName}</strong>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--热门主题-->
                    <!--数据你知道-->
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>主题数据你知道
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body" style="height: 350px" id="dataKnow">
                        </div>
                    </div>
                    <!--数据你知道-->
                    <!--所有主题-->
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>所有主题
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="filter-v1">
                                <ul class="mix-filter">
                                    <li data-filter="all" class="filter active">所有主题</li>
                                    <c:forEach items="${parentTheme}" var="parentTheme">
                                        <li data-filter="${parentTheme.themeName}"
                                            class="filter">${parentTheme.themeName}</li>
                                    </c:forEach>
                                </ul>
                                <div class="row mix-grid thumbnails">
                                    <c:forEach items="${parentTheme}" var="parentTheme">
                                        <c:forEach items="${parentTheme.childThemeTree}" var="childTheme"
                                                   varStatus="iter">
                                            <div class="col-md-3 col-sm-4 mix mix_all ${parentTheme.themeName} gallery-item"
                                                 style="display: block; opacity: 1; ">
                                                <a title="${childTheme.themeName}">
                                                    <div class="dashboard-stat">
                                                        <div class="visual">
                                                            <i class="fa fa-bar-chart-o"></i>
                                                        </div>
                                                        <div class="details">
                                                            <h2>${childTheme.themeName}</h2>
                                                        </div>
                                                        <div class="more" style="font-size: 15px;font-weight: bolder;">
                                                                ${parentTheme.themeName}
                                                        </div>
                                                    </div>
                                                    <div class="zoomix">
                                                        <i class="fa fa-search" style="cursor: pointer"
                                                           onclick="toThemeExperts('${childTheme.id}')"></i>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--所有主题-->
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- BEGIN SIDEBAR & CONTENT -->
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
<script src="<c:url value="/assets/global/plugins/jquery-mixitup/jquery.mixitup.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/js/plugins/echarts-2.2.1/build/dist/echarts-all.js"/>"></script>
<script src="<c:url value="/js/frontend/ThemePage.js"/>" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        ThemePage.init();
        ThemePage.initBlockColor();
        ThemePage.initTopIcon();
        ThemePage.initChart();
        ThemePage.initSelect2();
    });

</script>
</body>
</html>
