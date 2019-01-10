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
    <title>${User.username}&nbsp;的密码管理</title>
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
                <li><a href="javascript:void(0)" onclick="toBitHome()">首页</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">修改密码</a></li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet box blue-madison">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>修改密码
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                                <a href="javascript:;" class="reload">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <input type="hidden" id="userId" value="${User.userId}">
                            <form action="#" class="form-horizontal form-bordered" id="passwordForm">
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">新密码：</label>

                                        <div class="col-md-9">
                                            <div class="input-inline input-medium">
                                                <input type="password" value="" name="password"
                                                       class="form-control" id="password">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">再次输入：</label>

                                        <div class="col-md-9">
                                            <div class="input-inline input-medium">
                                                <input type="password" value="" name="repassword"
                                                       class="form-control" id="repassword">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn green"><i class="fa fa-check"></i>
                                                        提交
                                                    </button>
                                                    <button type="button" class="btn default" onclick="toBitHome()">取消</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/user/ChangePasswordPage.js"/>" type="text/javascript"></script>
<script>
    $(document).ready(function (){
        ChangePasswordPage.init()
    })
</script>
</body>
</html>
