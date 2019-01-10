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
    <title>角色管理</title>
    <%@include file="../../includes/adminCommon.jsp" %>
    <script src="<c:url value="/js/admin/systemRole.js"/>"></script>
</head>
<body>
<%@include file="../../includes/top.jsp" %>
<div class="main">
    <div class="page-container" data-options="tools:'#tab-tools'">
        <div class="page-sidebar-wrapper">
                <div class="page-sidebar navbar-collapse collapse" style="margin-top:50px">
                    <jsp:include page="../../includes/menu.jsp">
                        <jsp:param name="systemNum" value="2"/>
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
                                <a href="#">角色管理</a>
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
                                    <i class="fa fa-comments"></i>角色管理
                                </div>
                                <div class="actions">
                                    <a class="btn btn-default" data-toggle="modal" href="#form" id="add">
                                        <i class="fa fa-plus faa-shake animated-hover"></i>新增</a>
                                    <a onclick="" class="btn btn-default"><i
                                            class="fa fa-trash-o faa-spin animated-hover"></i>
                                        删除</a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div style="text-align:right">
                                    <form id="query">
                                        <input type="text" name="expertName" id="queryExpertName" value=""
                                               style="margin-bottom: 0" class="input-small" style="height:25px">
                                        <%--<input type="hidden" name="teacherId" id="teacherId" value="${teacherVO.teacherId}" autoHidden="autoHidden">--%>
                                        <a class="btn btn-xs btn-default blue" style="height:25px"
                                           onclick="">
                                            <i class="fa fa-search faa-shake animated-hover"></i>查询</a>
                                    </form>
                                </div>
                                <div class="table-responsive" >
                                    <table class="table table-bordered table-hover" id="datatable_ajax">
                                        <thead>
                                        <tr>
                                            <th>
                                                角色名称
                                            </th>
                                            <th>
                                                角色描述
                                            </th>
                                            <th>
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
<jsp:include page="../../includes/footer.jsp"/>
<div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
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
<script>
$(function (){
    roleListTable.init();
})
</script>
</body>
</html>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="<c:url value="/assets/global/plugins/select2/select2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/data-tables/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/data-tables/tabletools/js/dataTables.tableTools.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/data-tables/DT_bootstrap.js"/>"></script>
<!-- END PAGE LEVEL PLUGINS -->