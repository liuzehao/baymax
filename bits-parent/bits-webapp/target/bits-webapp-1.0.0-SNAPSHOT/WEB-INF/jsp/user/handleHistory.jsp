<%--
  Created by IntelliJ IDEA.
  User: hao
  Date: 16-4-17
  Time: 上午10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>${User.username}&nbsp;的浏览历史</title>
    <%@include file="../includes/style.jsp" %>
    <script src="<c:url value="/js/user/HistoryPage.js"/>"></script>

    <style>
        .portlet.box.red > .portlet-title {
            background-color: #EF9C3C;
        }
        .portlet.box.red {
            border: 1px solid #EF9C3C;
            border-top: 0;
        }
    </style>
</head>
<body>
<%@include file="../includes/header.jsp" %>
<input hidden="hidden" type="text" value="${User.userId}" id="userId"/>

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="javascript:;" onclick="toHome()">首页</a></li>
            <li><a href="javascript:;">用户中心</a></li>
            <li class="active">浏览历史</li>
        </ul>
        <div class="row margin-bottom-40">
            <div class="sidebar col-md-2 col-sm-2">
                <ul class="list-group margin-bottom-25 sidebar-menu">

                    <li id="li11" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handleUpload"  style="color:#949494;font-size: 16px;">我的上传 <i style="color:#F3F1F2 " class="fa fa-caret-right"></i></a></li>


                    <!--<div style="padding-top: 10px;width: 100%" > </div><li id="li2"class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleFocus"  style="color: #949494;font-size: 16px;">我的关注 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>-->

                    <div style="padding-top: 10px;width: 100%" > </div>

                    <li id="li3" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleGeneral" style="color: #949494;font-size: 16px;">常用文档 <i style="color:#F3F1F2 " class="fa fa-caret-right"></i></a></li>

                    <div style="padding-top: 10px;width: 100%" > </div>

                    <li id="li4" class="list-group-item clearfix" style="background-color:#EF9C3C;text-align: center"><a href="handleHistory"  style="color: #fff;font-size: 16px;">浏览历史 <i class="fa fa-caret-right"></i></a></li>

                    <div style="padding-top: 10px;width: 100%" > </div>

                    <li id="li5" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handleUserInfo"  style="color:#949494;font-size: 16px;">个人资料 <i style="color:#F3F1F2 " class="fa fa-caret-right"></i></a></li>

                    <div style="padding-top: 10px;width: 100%" > </div>
                    <li id="li6" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handlePassword" style="color: #949494;font-size: 16px;">修改密码 <i style="color:#F3F1F2 " class="fa fa-caret-right"></i></a></li>

                </ul>
            </div>
            <!--表格-->
            <div class="col-md-10 col-sm-10">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box red">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa  fa-table"></i>浏览历史
                                </div>
                            </div>
                            <div class="portlet-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover  table-striped " id="datatable_ajax" style="text-align: center">
                                        <col width="35%">
                                        <col width="35%">
                                        <col width="15%">
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;">
                                                文件标题
                                            </th>
                                            <th style="text-align: center;">
                                                检索时间
                                            </th>
                                            <th style="text-align: center;">
                                                操作
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
    <div class="modal-dialog" style="width: 700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="dialogTitle"></h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body">
                    <iframe id="literatureEditIframe" style="border: none;width:650px;height:750px;"
                            frameBorder="0"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteRowConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="test">确认</h4>
            </div>
            <div class="modal-body">确认删除当前行？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="deleteRow">删除</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        HistoryPage.init();
    })

</script>
</body>
</html>
