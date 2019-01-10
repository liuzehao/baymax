<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-17
  Time: 上午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>用户管理</title>
    <%@include file="../../includes/adminCommon.jsp" %>
    <script src="<c:url value="/js/admin/systemUser.js"/>"></script>
</head>
<body>
<%@include file="../../includes/top.jsp" %>
<div class="main">
    <div class="page-container" data-options="tools:'#tab-tools'">
        <div class="page-sidebar-wrapper">
                <div class="page-sidebar navbar-collapse collapse" style="margin-top:50px">
                    <jsp:include page="../../includes/menu.jsp">
                        <jsp:param name="systemNum" value="1"/>
                    </jsp:include>
            </div>
        </div>
        <div class="page-content-wrapper">
            <div class="page-content" style="min-height:1033px !important">
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                        <ul class="page-breadcrumb breadcrumb" style="margin-top: 40px;margin-bottom: 40px">
                            <li>
                                <i class="fa fa-home"></i>
                                <a href="#">首页</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">用户管理</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                        </ul>
                        <!-- END PAGE TITLE & BREADCRUMB-->
                    </div>
                </div>
                <!-- BEGIN PAGE HEADER-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box blue">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-comments"></i>用户管理
                                </div>
                                <div class="actions">
                                    <a class="btn btn-default" data-toggle="modal" onclick="userListTable.addUserInfo()" id="add">
                                        <i class="fa fa-plus faa-shake animated-hover"></i>新增</a>
                                    <a onclick="userListTable.reset()" class="btn btn-default"><i
                                            class="fa fa-refresh faa-spin animated-hover"></i>
                                        重置</a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div style="text-align:right">
                                    <form id="query">
                                        <input id="loginName" type="text" name="expertName" value=""
                                               style="margin-bottom: 0" class="input-small" style="height:25px">
                                        <%--<input type="hidden" name="teacherId" id="teacherId" value="${teacherVO.teacherId}" autoHidden="autoHidden">--%>
                                        <a class="btn btn-xs btn-default blue" style="height:25px"
                                           onclick="userListTable.search()">
                                            <i class="fa fa-search faa-shake animated-hover"></i>查询</a>

                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="datatable_ajax">
                                        <col width="30%">
                                        <col width="25%">
                                        <col width="30%">
                                        <col width="15%">
                                        <thead>
                                        <tr>
                                            <th>
                                                账号
                                            </th>
                                            <th>
                                                用户名
                                            </th>
                                            <th>
                                                用户邮箱
                                            </th>
                                            <th>操作</th>
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
<jsp:include page="../../includes/footer.jsp"/>
<div class="row">
    <div id="form" class="modal fade" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color:dodgerblue;">
                    <button class="close" aria-hidden="true" data-dismiss="modal" type="button"
                            onclick=""></button>
                    <h4 class="modal-title" style="color: #fff;font-family:Microsoft Yahei; font-weight: 300;">
                        新增用户</h4>
                </div>
                <form class="form-horizontal" role="form" id="info">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">用户姓名：</label>

                            <div class="col-md-6">
                                <input id="userName" name="" class="form-control input-medium" type="text"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">用户邮箱：</label>

                            <div class="col-md-6">
                                <input id="email" name="" class="form-control input-medium" type="text"
                                       placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">关注主题：</label>

                            <div class="col-md-6">
                                <input id="themeName" name="" autocomplete="off"
                                       class="form-control input-medium" type="text" flag=""
                                       placeholder="请选择主题">
                                <input type="hidden" name="collegeId" id="collegeId" value="" autoHidden="autoHidden">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn blue" type="submit">保存</button>
                        <button class="btn default" data-dismiss="modal" type="button" id="close">退出</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" style="width: 900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="dialogTitle"></h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body">
                    <iframe id="userEditIframe" style="border: none;width:858px;height:350px;" frameBorder="0"></iframe>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- END FOOTER -->
<div class="modal fade" id="deleteRowConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body">确认删除当前行？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="deleteRow">删除</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
</body>
</html>
<script>
    $(function(){
        userListTable.init();
    })
</script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="<c:url value="/assets/global/plugins/select2/select2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/data-tables/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/data-tables/tabletools/js/dataTables.tableTools.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/data-tables/DT_bootstrap.js"/>"></script>
<!-- END PAGE LEVEL PLUGINS -->