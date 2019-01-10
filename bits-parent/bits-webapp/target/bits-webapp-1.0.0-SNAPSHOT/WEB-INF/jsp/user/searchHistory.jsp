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
    <title>${User.username}&nbsp;的检索历史</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <script src="<c:url value="/js/user/systemFile.js"/>"></script>
</head>
<body>
<jsp:include page="../includes/top.jsp"/>
<input type="hidden" value="${User.userId}" id="userId">
<div class="page-container" style="min-height:1033px">
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse" style="margin-top:50px">
            <%@include file="../includes/userMenu.jsp" %>
        </div>
    </div>
    <div class="page-content-wrapper">
        <div class="page-content">
            <ul class="breadcrumb" style="margin-top: 30px">
                <li><a href="javascript:void(0)" onclick="toBitHome()">首页</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">检索历史</a></li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN CONDENSED TABLE PORTLET-->
                    <div class="portlet box green">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i>检索历史列表
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                                <a href="javascript:;" class="reload" id="#reloadTable">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered" id="historyInfo">
                                    <col width="10%">
                                    <col width="50%">
                                    <col width="20%">
                                    <col width="20%">
                                    <thead>
                                    <tr>
                                        <th class="text-center">
                                            检索过的专家
                                        </th>
                                        <th class="text-center">
                                            专家领域
                                        </th>
                                        <th class="text-center">
                                            检索时间
                                        </th>
                                        <th class="text-center">
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
                    <!-- END CONDENSED TABLE PORTLET-->
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
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body">确认删除当前历史记录？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="deleteRow">删除</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<script src="<c:url value="/js/user/HistoryPage.js"/>" type="text/javascript"></script>
<script>
    $(document).ready(function (){
        HistoryPage.init();
    })
</script>
</body>
</html>
