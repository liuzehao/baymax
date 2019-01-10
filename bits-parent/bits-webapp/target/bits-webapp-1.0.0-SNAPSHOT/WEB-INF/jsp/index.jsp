<%--
  Created by IntelliJ IDEA.
  User: Shy
  Date: 2015/8/3
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>比特能专家</title>
    <link rel="stylesheet" href="<c:url value="/js/plugins/onepage-scroll/onepage-scroll.css"/>"/>
    <link href="<c:url value="/assets/global/plugins/slider-revolution-slider/rs-plugin/css/settings.css"/> "
          rel="stylesheet"/>
    <link href="<c:url value="/assets/frontend/pages/css/style-revolution-slider.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/assets/global/css/components.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/assets/global/css/plugins.css"/>" rel="stylesheet"/>
    <link href="<c:url value="/assets/admin/layout/css/layout.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/frontend/layout/css/style.css"/>" rel="stylesheet"/>
    <!--animate-->
    <link href="<c:url value="/css/animate/animate.css"/>" type="text/css" rel="stylesheet"/>
    <style>


        section#view3 {
            background-image: url("<c:url value="/image/onepage/network.png"/>");
            background-repeat: no-repeat;
            background-position: right;
            background-size: cover;
        }

        section#view4 {
            background-image: url("<c:url value="/image/onepage/answer.jpg"/>");
            background-repeat: no-repeat;
            background-position: left;
            background-size: cover;
        }

        section#view2 img {
            position: absolute;
            left: -100px;
        }

        section#view2 {
            background-image: url("<c:url value="/image/onepage/recommend.png"/>");
            background-repeat: no-repeat;
            background-position: left;
            background-size: cover;
        }

        .header {
            background-color: rgba(255, 255, 255, 0.5) !important;
        }

        body.page-header-fixed.custom {
            padding-top: 0px !important;
        }

        .header-navigation ul > li.active > a,
        .header-navigation ul > li > a:hover,
        .header-navigation ul > li > a:focus,
        .header-navigation ul > li.open > a,
        .header-navigation ul > li.open > a:hover,
        .header-navigation ul > li.open > a:focus {
            background: rgba(252, 252, 252, 0.3) !important;

        }

        .header-navigation .dropdown-menu li > a {
            color: #333;
        }

        .header-navigation .dropdown-menu > li > a:hover {
            color: #333;
            background-color: rgba(230, 64, 12, 0.3) !important;
        }

        .header-navigation .dropdown-menu {
            background-color: rgba(252, 252, 252, 0.4) !important;;
        }

        section.footer {
            height: 35% !important;
            width: 100% !important;
            background-color: #313030;
            display: inline-block;
            text-align: center;
        }

        section.footer .detail {
            display: inline-block;
            color: #FFFFFF;
            width: 100%;
            font-size: 20px;
            vertical-align: middle;
            padding: 0px 7%;
        }

        section.footer .detail div {
            text-align: center;
            margin: 3% 2%;
            float: left;
        }

        .onepage-pagination li a {
            padding: 10px 15px 10px 10px;
            width: 10px;
            height: 10px;
            display: block;
        }

        .onepage-pagination li a:before {
            content: '';
            position: absolute;
            width: 10px;
            height: 10px;
            background: #E45000;
            border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
        }

        .onepage-pagination li a.active:before {
            content: '';
            position: absolute;
            width: 12px;
            height: 12px;
            background: rgb(255, 255, 255);
            border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border: 2px solid #E45000;
            margin-top: 0;
            left: 9px;
        }

        .explain-left {
            position: absolute;
            top: 25%;
            left: 6%;
            width: auto;
            height: auto;
        }

        .explain-right {
            position: absolute;
            top: 25%;
            right: 10%;
            width: auto;
            height: auto;
        }

        .explain-header h1 {
            font-size: 5em;
            display: inline-block;
            font-weight: bold;
        }

        .explain-header i {
            position: relative;
            left: -0.4em;
        }

        .explain-detail {
            text-align: center;
        }

        .explain-detail p {
            font-size: 2em;
            text-decoration: none;
        }

        a {
            text-decoration: none !important;
        }
    </style>
</head>
<body class="page-header-fixed custom">
<%@include file="includes/header.jsp" %>
<div class="main">


            <section id="view1">
                <%@include file="includes/pageSlider.jsp" %>
            </section>


            <section id="view2" class="img-responsive">
                <div class="explain-right">
                    <div class="explain-header">
                        <i class="fa fa-group fa-4x"></i>
                        <h1>专家推荐</h1>
                    </div>
                    <div class="explain-detail">
                        <p>给定相关主题的内容</p>
                        <p>推荐领域的核心专家</p>
                        <p>
                            <a href="expertRecommend/getExpertRecommend" class="">了解详情</a>
                        </p>
                    </div>
                </div>
            </section>


            <section id="view3" class="img-responsive">

                <div class="explain-left">
                    <div class="explain-header">
                        <i class="fa fa-cloud fa-4x"></i>

                        <h1>领域专家网络</h1>
                    </div>
                    <div class="explain-detail">
                        <p>呈现某一主题的专家网络</p>

                        <p>提供更多相关领域的专家</p>

                        <p>
                            <a href="expertWeb/getExpertWeb" class="">了解详情</a>
                        </p>
                    </div>
                </div>
            </section>

    <section id="view4" class="img-responsive">
                <div class="explain-right">
                    <div class="explain-header" style="color: white">
                        <i class="fa  fa-question-circle fa-4x"></i>

                        <h1>自动问答</h1>
                    </div>
                    <div class="explain-detail" style="color: white">
                        <p>多个专家机器人合作解答</p>

                        <p>对复杂问题进行“会诊”</p>

                        <p>为您解决相关领域的问题</p>

                        <p>
                            <a href="autoAnswer/getPage" class="">了解详情</a>
                        </p>
                    </div>
                </div>
            </section>
            <section class="footer">
                <div class="detail">
                    <div>
                        <a class="" href="javascript:;">
                            <img src="<c:url value="/image/img/logo/logo_large.png"/>"
                                 alt="BIT.ROBORT">
                        </a>
                    </div>
                    <div>
                <span>
                    <a class="" href="javascript:;">
                        <img src="<c:url value="/image/img/logo/team.png"/>"
                             alt="BIT.ROBORT">
                    </a>
                </span>
                    </div>
                    <div>
                <span>
                    <a class="" href="javascript:;">
                        <img src="<c:url value="/image/img/logo/ccut_logo_black.png"/>"
                             alt="BIT.ROBORT" style="position: relative; top:-30px">
                    </a>
                </span>
                    </div>
                </div>
            </section>

</div>
<script src="<c:url value="/js/jquery-1.11.1.min.js"/>" type="text/javascript"></script>
<!--onepage插件-->
<script src="<c:url value="/js/plugins/onepage-scroll/custom/jquery.onepage-scroll.custom.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/js/plugins/onepage-scroll/jquery.onepage-scroll.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.plugins.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/frontend/pages/scripts/revo-slider-init.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootbox/bootbox.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/frontend/layout/scripts/layout.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
<script type="text/javascript">
    var animate = function ($) {
        function a1(view_index) {
            $(".explain-header", "section[data-index=" + view_index + "]").addClass("animated bounceInDown").css({opacity: 1});
        }

        function a2(view_index) {
            setTimeout(function () {
                $(".explain-detail p:not(:has(a))", "section[data-index=" + view_index + "]").addClass("animated bounceInRight").css({opacity: 1});
            }, 300)
        }

        function a3(view_index) {
            setTimeout(function () {
                $(".explain-detail p:last", "section[data-index=" + view_index + "]").addClass("animated bounceInUp").css({opacity: 1});
            }, 600)
        }

        return {
            run: function (view_index) {
                var animateQueue = [a1(view_index), a2(view_index), a3(view_index)];
                $(window).queue("animate", animateQueue);
                $(window).dequeue("animate");
            },
            init: function () {
                $(window).clearQueue("animate")
                $(".explain-header,.explain-detail p").removeClass("animated bounceInDown bounceInUp bounceInRight bounceInLeft").css({opacity: 0});
            }
        }
    }(window.jQuery);

    $(".main").onepage_scroll({
        sectionContainer: "section",     // 可自定义选择器
        easing: "ease",                  // 接受 CSS3 动画类型： "ease", "linear", "ease-in","ease-out", "ease-in-out", or even cubic bezier value such as "cubic-bezier(0.175, 0.885, 0.420, 1.310)"
        animationTime: 1000,             // 每个板块的动画时间
        pagination: true,                // 是否显示分页
        updateURL: true,                // 是否随着用户滚动更新URL
        beforeMove: function (index) {
            animate.init();
        },  // 页面滚动前回调函数
        afterMove: function (index) {
            animate.run(index);
        },   // 页面滚动后回调函数
        loop: true,                     // 页面循环滚动
        keyboard: true,                  // 是否激活键盘控制
        responsiveFallback: false,        // 改变浏览器大小后恢复到正常的滚动，如设计宽度小于600px时，恢复正常滚动
        direction: "vertical"            // 滚动方向，选项 "vertical" 和 "horizontal". 默认值 "vertical".
    });
    RevosliderInit.initRevoSlider();
    Layout.init();
</script>
</body>
</html>
