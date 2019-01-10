
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../includes/adminCommon.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>文献管理</title>
    <script src="<c:url value="/js/admin/systemLiterature.js"/>"></script>
</head>
<body>
<%@include file="../../includes/top.jsp" %>
<div class="main">
    <div class="page-container" data-options="tools:'#tab-tools'">
        <div class="page-sidebar-wrapper">
            <div class="page-sidebar navbar-collapse collapse" style="margin-top:50px">
                <jsp:include page="../../includes/menu.jsp">
                    <jsp:param name="systemNum" value="4"/>
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
                                <a href="#">文献管理</a>
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
                                    <i class="fa fa-comments"></i>文献管理
                                </div>
                                <div class="actions">
                                    <a class="btn btn-default" data-toggle="modal" href="#form" id="add" onclick="literatureListTable.addLiteratureInfo()">
                                        <i class="fa fa-plus faa-shake animated-hover" ></i>新增</a>
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
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="datatable_ajax">

                                        <col width="10%">
                                        <col width="35%">
                                        <col width="40%">
                                        <col width="15%">
                                        <thead>
                                        <tr>
                                            <th>
                                                文献作者
                                            </th>
                                            <th>
                                                文献题目
                                            </th>
                                            <th>
                                                作者单位
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
<div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog" style="width: 900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="dialogTitle"></h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body">
                    <iframe id="literatureEditIframe" style="border: none;width:858px;height:350px;" frameBorder="0"></iframe>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
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
    literatureListTable.init();
})
</script>
</body>
</html>
