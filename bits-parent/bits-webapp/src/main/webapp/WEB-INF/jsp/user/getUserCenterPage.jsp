<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-20
  Time: 上午10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@ include file="../includes/adminCommon.jsp" %>
</head>
<body>
<jsp:include page="../includes/top.jsp"/>
<div class="page-container" style="min-height:1033px">
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse" style="margin-top:50px">
            <%@include file="../includes/userMenu.jsp" %>
        </div>
    </div>
    <div class="page-content-wrapper">
        <div class="page-content">
            <ul class="breadcrumb" style="margin-top: 30px">
                <li><a href="javascript:void(0)" onclick="toHome()">首页</a></li>
                <li>个人中心</li>
            </ul>
            <div class="row">
                <div class="col-md-6">
                    <div class="top-news">
                        <a href="#" class="btn red">
                								<span>
                								World News </span>
                            <em>
                                <i class="fa fa-tags"></i>
                                UK, Canada, Asia </em>
                            <i class="fa fa-globe top-news-icon"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Odio dignissimos ducimus </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Berlin, Germany</strong>
                            <em>2 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image3.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Sanditiis praesentium vo </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Ankara, Turkey</strong>
                            <em>5 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image5.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint praesentium voluptatum
                            delenitioccaecati cupiditate non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                    <div class="top-news">
                        <a href="#" class="btn green">
                								<span>
                								Finance </span>
                            <em>
                                <i class="fa fa-tags"></i>
                                Money, Business, Google </em>
                            <i class="fa fa-briefcase top-news-icon"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Odio dignissimos ducimus </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Berlin, Germany</strong>
                            <em>2 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image3.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Sanditiis praesentium vo </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Ankara, Turkey</strong>
                            <em>5 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image5.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint praesentium voluptatum
                            delenitioccaecati cupiditate non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="top-news">
                        <a href="#" class="btn purple">
                                                <span>
                                                Science </span>
                            <em>
                                <i class="fa fa-tags"></i>
                                Hi-Tech, Medicine, Space </em>
                            <i class="fa fa-beaker top-news-icon"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Odio dignissimos ducimus </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Berlin, Germany</strong>
                            <em>2 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image3.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Sanditiis praesentium vo </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Ankara, Turkey</strong>
                            <em>5 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image5.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint praesentium voluptatum
                            delenitioccaecati cupiditate non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                    <div class="top-news">
                        <a href="#" class="btn yellow">
                        <span>
                        Sport </span>
                            <em>
                                <i class="fa fa-tags"></i>
                                Football, Swimming, Tennis </em>
                            <i class="fa fa-trophy top-news-icon"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Odio dignissimos ducimus </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Berlin, Germany</strong>
                            <em>2 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image3.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                    <div class="news-blocks">
                        <h3>
                            <a href="page_news_item.html">
                                Sanditiis praesentium vo </a>
                        </h3>

                        <div class="news-block-tags">
                            <strong>Ankara, Turkey</strong>
                            <em>5 hours ago</em>
                        </div>
                        <p>
                            <img class="news-block-img pull-right"
                                 src="<c:url value="/assets/admin/pages/media/gallery/image5.jpg"/>" alt="">At vero eos
                            et accusamus
                            et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque
                            corrupti quos dolores et quas molestias excepturi sint praesentium voluptatum
                            delenitioccaecati cupiditate non provident
                        </p>
                        <a href="page_news_item.html" class="news-block-btn">
                            Read more <i class="m-icon-swapright m-icon-black"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    function changeIframe(src) {
        $("#iframe").attr("src", src);
    }
</script>