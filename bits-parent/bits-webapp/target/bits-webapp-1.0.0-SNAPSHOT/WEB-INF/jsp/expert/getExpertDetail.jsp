<%--
  Created by IntelliJ IDEA.
  User: longshihui
  Date: 15-4-5
  Time: 上午11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>专家:&nbsp;${expert.expertName}</title>
    <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="#" onclick="toHome()">首页</a></li>
            <li class="active">专家详细信息</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <div class="content-page">
                    <div class="row">
                        <div class="col-md-5">
                            <h2 style="margin-bottom: 0; padding-top:0">基本信息</h2>
                        </div>
                        <div class="col-md-7" style="height: 44px">
                            <div class="form-group pull-right">
                                <label class="control-label col-md-3"
                                       style="padding: 0 0; font-size: 1.2em">关注&nbsp;:</label>

                                <div class="col-md-9" style="height: 2em;">
                                    <input type="checkbox" class="make-switch"
                                           data-on-color="success" data-off-color="danger" data-on-text="开"
                                           data-off-text="关" id="focusBtn"
                                    <c:if test="${User.userId == null}">
                                        <c:out value="disabled=disabled"></c:out>
                                    </c:if>
                                    <c:if test="${!isFocus}">
                                        <c:out value="checked='checked'"></c:out>
                                    </c:if>
                                            >
                                    <input type="hidden" value="${expert.id}" id="expertId">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 0 0; background-color: #EEEEEE; margin: 20px 0; height: 1px"></div>
                        <div class="col-md-4 col-sm-4">
                            <img src="<c:url value="${expert.img}"/>" alt=""
                                 class="img-responsive" style="width:250px">
                        </div>
                        <div class="col-md-8 col-sm-8">
                            <h2>${expert.expertName}</h2>

                            <p></p>

                            <p><i class="fa fa-tags"></i><span
                                    style="font-size:17px">&nbsp;单位:${expert.expertOrg}</span></p>

                            <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;专家领域:
                             <c:choose>
                                 <c:when test="${!expert.themeList.isEmpty()}">
                                     <c:forEach items="${expert.themeList}" var="theme">
                                         <a href="#" class="btn default" onclick="toThemeExperts('${theme.id}')">
                                                 ${theme.themeName}
                                         </a>
                                     </c:forEach>
                                 </c:when>
                                 <c:when test="${expert.themeList.isEmpty()}">
                                     <span style="font-size:17px;font-weight: bolder"><c:out value="暂无"></c:out></span>
                                 </c:when>
                             </c:choose>
                            </span>
                            </p>
                        </div>
                        <div class="col-md-8 col-sm-8">
                            <a href="#literature" class="btn default blue-stripe">去文献</a><br><br>
                            <a href="#patent" class="btn default purple-stripe">去专利</a>
                        </div>
                    </div>
                    <hr class="blog-post-sep">
                    <h2 id="literature">&nbsp;${expert.expertName}&nbsp;的文献</h2>
                    <hr class="blog-post-sep">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="comments" id="literatureList">
                                <c:choose>
                                    <c:when test="${literatureList == null || literatureList.isEmpty()}">
                                        <h3><c:out value="暂无"></c:out></h3>
                                    </c:when>
                                    <c:when test="${literatureList != null && !literatureList.isEmpty()}">
                                        <c:forEach items="${literatureList}" var="literature">
                                            <div class="note">
                                                <h4 class="block">
                                                    <a href="#"
                                                       onclick="toLiteratureDetail('${literature.id}')">${literature.title}
                                                    </a>
                                                </h4>

                                                <p><i class="fa fa-tags"></i><span>&nbsp;简介:${literature.abs}</span>
                                                </p>

                                                <p><i class="fa fa-tags"></i>
                                                        <span>&nbsp;时间:&nbsp;
                                                         ${literature.appDate}
                                                        </span>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <hr class="blog-post-sep">
                    <h2 id="patent">${expert.expertName}&nbsp;的专利</h2>
                    <hr class="blog-post-sep">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="comments" id="patentList">
                                <c:choose>
                                    <c:when test="${patentList != null && !patentList.isEmpty()}">
                                        <c:forEach items="${patentList}" var="patent">
                                            <div class="note">
                                                <h4 class="block">
                                                    <a href="#" onclick="toPatentDetail('${patent.id}')">
                                                            ${patent.title}
                                                    </a></h4>

                                                <p><i class="fa fa-tags"></i><span>&nbsp;简介:${patent.abs}</span>
                                                </p>

                                                <p><i class="fa fa-tags"></i>
                                                        <span>&nbsp;时间:&nbsp;
                                                        ${patent.date}
                                                        </span>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
<script src="<c:url value="/js/plugins/pagination.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/frontend/ExpertDetailPage.js"/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/js/frontend/Focus.js"/>"></script>
<script>
    $(document).ready(function () {
        ExpertDetailPage.init();
        $("#literatureList").paging({
            itemSelector:"div.note"
        })
        $("#patentList").paging({
            itemSelector:"div.note"
        })
        $("#focusBtn").on('switchChange.bootstrapSwitch', function (event, state) {
            var isChecked = state? false:true;
            if (isChecked) {
                addUserFocusExperts([$("#expertId").val()]);
            } else {
                delUserFocusExperts([$("#expertId").val()]);
            }
        });
    })
</script>
</body>
</html>
