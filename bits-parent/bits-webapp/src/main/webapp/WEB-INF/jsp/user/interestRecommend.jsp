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
    <meta content="width=device-width, initial-scale=1.0" name="关注该主题port"/>
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
            <ul class="breadcrumb" style="margin-top: 30px;">
                <li><a href="index.html">首页</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">兴趣推荐</a></li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN CONDENSED TABLE PORTLET-->
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-advance table-hover">
                        <thead>
                        <tr>
                            <th>
                                 Photo
                            </th>
                            <th>
                                 姓名
                            </th>
                            <th>
                                 单位
                            </th>
                            <th>
                                 研究领域
                            </th>
                            <th>
                                专家评分
                            </th>
                            <th>
                                关注
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar1.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Mark Nilson
                            </td>
                            <td>
                                 makr124
                            </td>
                            <td>
                                 19 Jan 2012
                            </td>
                            <td>
                                 1245
                            </td>
                            <td>
                                <a class="btn default btn-xs red-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar2.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Filip Rolton
                            </td>
                            <td>
                                 jac123
                            </td>
                            <td>
                                 09 Feb 2012
                            </td>
                            <td>
                                 15
                            </td>
                            <td>
                                <a class="btn default btn-xs blue-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar3.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Colin Fox
                            </td>
                            <td>
                                 col
                            </td>
                            <td>
                                 19 Jan 2012
                            </td>
                            <td>
                                 245
                            </td>
                            <td>
                                <a class="btn default btn-xs green-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar2.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Nick Stone
                            </td>
                            <td>
                                 sanlim
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 565
                            </td>
                            <td>
                                <a class="btn default btn-xs red-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar1.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Edward Cook
                            </td>
                            <td>
                                 sanlim
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 45245
                            </td>
                            <td>
                                <a class="btn default btn-xs green-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar2.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Nick Stone
                            </td>
                            <td>
                                 sanlim
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 24512
                            </td>
                            <td>
                                <a class="btn default btn-xs blue-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar1.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Elis Lim
                            </td>
                            <td>
                                 makr124
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 145
                            </td>
                            <td>
                                <a class="btn default btn-xs red-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar2.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 King Paul
                            </td>
                            <td>
                                 king123
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 456
                            </td>
                            <td>
                                <a class="btn default btn-xs blue-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar3.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Filip Larson
                            </td>
                            <td>
                                 fil
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 12453
                            </td>
                            <td>
                                <a class="btn default btn-xs green-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar2.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 Martin Larson
                            </td>
                            <td>
                                 larson12
                            </td>
                            <td>
                                 01 Apr 2011
                            </td>
                            <td>
                                 2453
                            </td>
                            <td>
                                <a class="btn default btn-xs red-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<c:url value="/assets/admin/pages/media/profile/avatar1.jpg"/>" alt=""/>
                            </td>
                            <td>
                                 King Paul
                            </td>
                            <td>
                                 sanlim
                            </td>
                            <td>
                                 11 Mar 2012
                            </td>
                            <td>
                                 905
                            </td>
                            <td>
                                <a class="btn default btn-xs green-stripe" href="#">
                                关注该主题 </a>
                            </td>
                        </tr>
                        </tbody>
                        </table>
                    </div>
                    <div class="margin-top-20" style="text-align: right">
                        <ul class="pagination">
                            <li>
                                <a href="#">
                                    Prev </a>
                            </li>
                            <li>
                                <a href="#">
                                    1 </a>
                            </li>
                            <li>
                                <a href="#">
                                    2 </a>
                            </li>
                            <li class="active">
                                <a href="#">
                                    3 </a>
                            </li>
                            <li>
                                <a href="#">
                                    4 </a>
                            </li>
                            <li>
                                <a href="#">
                                    5 </a>
                            </li>
                            <li>
                                <a href="#">
                                    Next </a>
                            </li>
                        </ul>
                    </div>
                    <!-- END CONDENSED TABLE PORTLET-->
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
