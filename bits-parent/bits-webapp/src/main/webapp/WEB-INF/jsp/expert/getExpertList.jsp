<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-5
  Time: 下午3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学者</title>
    <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <ul class="breadcrumb">
                    <li><a href="#" onclick="toHome()">首页</a></li>
                    <li>学者</li>
                </ul>
            </div>
            <div class="col-md-6">
                <form class="form" method="get" action="search">
                    <div class="col-md-12">
                        <div class="col-md-3">
                            <select class="form-control input-small" name="field">
                                <option value="name">姓名</option>
                                <option value="organization">机构</option>
                            </select>
                        </div>
                        <div class="col-md-6" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" class="form-control" name="key">
                            <input type="hidden" value="expert" name="direction">
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="comments">
            <div class="row margin-bottom-40">
                <div class="col-md-12 col-sm-12">
                    <div class="content-page">
                        <c:forEach items="${result}" var="expert">
                            <div class="row">
                                <div class="col-md-4 col-sm-4">
                                    <img src="<c:url value="${expert.img}"/>" alt=""
                                         class="img-responsive" style="width:250px">
                                </div>
                                <div class="col-md-8 col-sm-8">
                                    <h2><a href="getExpertDetail?id=${expert.id}">${expert.expertName}</a></h2>

                                    <p></p>

                                    <p><i class="fa fa-tags"></i><span
                                            style="font-size:17px">&nbsp;单位:${expert.expertOrg}</span></p>

                                    <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;专家领域:
                                        <c:choose>
                                            <c:when test="${expert.themeList.isEmpty()}">
                                                <c:out value="暂无"></c:out>
                                            </c:when>
                                            <c:when test="${!expert.themeList.isEmpty()}">
                                                <c:forEach items="${expert.themeList}" var="theme">
                                                    <a href="#" class="btn default" onclick="toThemeExperts('${theme.id}')">
                                                    ${theme.themeName}
                                                    </a>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                    </span></p>
                                </div>

                            </div>
                            <hr class="blog-post-sep">
                        </c:forEach>
                        <ul class="pagination" style="padding-top: 50px">
                            <c:forEach items="${Pagination}" var="item">
                                ${item}
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/script.jsp"/>
<script src="<c:url value="/js/plugins/jquery-ias.min.js"/> "></script>
<script>
    $(document).ready(function () {
//        var ias = jQuery.ias({
//            container:'.content-page',
//            item:'.row',
//            pagination:'.pagination',
//            next:'li a:last',
//            delay:2000
//        });
//        ias.extension(new IASSpinnerExtension({}));
//        ias.extension(new IASNoneLeftExtension({
//            text: '没有更多了',
//            html:'<div class="row"><div class="col-md-12 text-center"></div></div>'
//        }));
    })

</script>
</body>
</html>
