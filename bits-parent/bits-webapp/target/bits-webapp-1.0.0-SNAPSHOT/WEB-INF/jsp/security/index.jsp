<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js"> <!--<![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>主页</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@ include file="../includes/adminCommon.jsp" %>
</head>
<body class="page-header-fixed">
<%@include file="../includes/top.jsp" %>
<div class="page-container" data-options="tools:'#tab-tools'">
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <%@include file="../includes/menu.jsp" %>
        </div>
    </div>
    <div class="page-content-wrapper" data-options="tools:'#tab-tools'">
        <div class="page-content" style="min-height:689px">
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <ul class="page-breadcrumb breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">首页</a>
                            <i class="fa fa-angle-right"></i>
                        </li>
                        <li class="pull-right">
                            <span id="nowTime"></span>
                        </li>
                    </ul>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>主题专家统计
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                                <a href="#portlet-config" data-toggle="modal" class="config">
                                </a>
                                <a href="javascript:;" class="reload">
                                </a>
                                <a href="javascript:;" class="remove">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div id="chart_1_1_legendPlaceholder">
                            </div>
                            <div id="chart_1_1" class="chart">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                        <!-- BEGIN PORTLET-->
                        <div class="portlet solid grey-cararra bordered">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-bullhorn"></i>主题知识趋势分析
                                </div>
                                <div class="tools">
                                    <div class="btn-group pull-right">
                                        <a href="" class="btn grey-steel btn-sm dropdown-toggle" data-toggle="dropdown"
                                           data-hover="dropdown" data-close-others="true">
                                            主题类别 <span class="fa fa-angle-down">
                                									</span>
                                        </a>
                                        <ul class="dropdown-menu pull-right">
                                            <li class="active">
                                                <a href="javascript:;">
                                                   基础科学
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                   工程科技1辑
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    工程科技2辑
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                  农业科技
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    医药卫生科技
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    信息科技
                                                </a>
                                            </li>
                                            <li >
                                                <a href="javascript:;">
                                                    哲学与人文科学
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    社会科学1辑
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                    社会科学2辑
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;">
                                                   经济与管理科学
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div id="site_activities_loading">
                                    <img src="<c:url value="/assets/admin/layout/img/loading.gif"/>" alt="loading"/>
                                </div>
                                <div id="site_activities_content" class="display-none">
                                    <div id="site_activities" style="height: 228px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END PORTLET-->
                    </div>
                        <!-- END PORTLET-->
                    </div>
                </div>
            </div>
        </div>
    <!-- BEGIN FOOTER -->
    <%@include file="../includes/footer.jsp" %>
    <!-- END FOOTER -->
</body>
</html>
<script>
    $(function () {
        window.setInterval(setNowTime, 1000);
    });
    function setNowTime() {
        var nowDate = format(new Date(), "yyyy-MM-dd hh:mm:ss");
        $("#nowTime").html(nowDate)
    }

    function format(date, fmt) {
        var o = {
            "M+": date.getMonth() + 1,                 //月份
            "d+": date.getDate(),                    //日
            "h+": date.getHours(),                   //小时
            "m+": date.getMinutes(),                 //分
            "s+": date.getSeconds()                 //秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
