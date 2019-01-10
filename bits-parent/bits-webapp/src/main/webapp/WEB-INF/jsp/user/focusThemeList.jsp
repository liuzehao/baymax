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
                <li><a href="index.html">首页</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">关注主题列表</a></li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN CONDENSED TABLE PORTLET-->
                    <div class="portlet box red">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i>关注主题列表
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                                <a href="javascript:;" class="reload">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table table-condensed table-hover">
                                    <col width="5%">
                                    <col width="85%">
                                    <col width="10%">
                                    <thead>
                                    <tr>
                                        <th>
                                        </th>
                                        <th style="text-align:center">
                                            主题领域
                                        </th>
                                        <th style="text-align:center">
                                           取消关注
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody style="text-align:center">
                                    <tr>
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            Mark
                                        </td>
                                        <td style="text-align:center"><a onclick="">
                                            <i class="fa fa-trash-o faa-spin animated-hover"
                                               style="color:grey"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            Mark
                                        </td>
                                        <td style="text-align:center"><a onclick="">
                                            <i class="fa fa-trash-o faa-spin animated-hover"
                                               style="color:grey"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            Mark
                                        </td>
                                        <td style="text-align:center"><a onclick="">
                                            <i class="fa fa-trash-o faa-spin animated-hover"
                                               style="color:grey"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            4
                                        </td>
                                        <td>
                                            Mark
                                        </td>
                                        <td style="text-align:center"><a onclick="">
                                            <i class="fa fa-trash-o faa-spin animated-hover"
                                               style="color:grey"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            5
                                        </td>
                                        <td>
                                            Mark
                                        </td>
                                        <td style="text-align:center"><a onclick="">
                                            <i class="fa fa-trash-o faa-spin animated-hover"
                                               style="color:grey"></i></a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END CONDENSED TABLE PORTLET-->
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
