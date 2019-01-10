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
    <title>${User.username}&nbsp;的用户中心</title>
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
            <ul class="breadcrumb" style="margin-top: 30px;">
                <li><a href="javascript:void(0)" onclick="toBitHome()">首页</a></li>
                <li><a href="#">个人中心</a></li>
                <li><a href="#">个人资料</a></li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet box yellow-crusta">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>个人资料
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                                <a href="javascript:;" class="reload">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <form action="#" class="form-horizontal form-bordered" id="info">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">昵称</label>

                                    <div class="col-sm-4">
                                        <div class="input-group">
    											<span class="input-group-addon">
    											<i class="fa fa-user"></i>
    											</span>
                                            <input type="hidden" id="userId" value="${User.userId}">
                                            <input type="text"
                                                   name="username"
                                                   class="form-control"
                                                   value="${User.username}" id="username"/>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-sm-3 control-label">邮箱</label>--%>

                                    <%--<div class="col-sm-4">--%>
                                        <%--<div class="input-group">--%>
    											<%--<span class="input-group-addon">--%>
    											<%--<i class="fa fa-search"></i>--%>
    											<%--</span>--%>
                                            <%--<input type="text" id="email" name="email"--%>
                                                   <%--class="form-control"--%>
                                                   <%--value="${User.email}"/>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                <%--<label class="col-sm-3 control-label">关注主题</label>--%>
                                <%--<div class="col-md-9">--%>
                                <%--<select multiple="multiple" class="multi-select" id="my_multi_select1"--%>
                                <%--name="my_multi_select1[]">--%>
                                <%--<option>Dallas Cowboys</option>--%>
                                <%--<option>New York Giants</option>--%>
                                <%--<option selected>Philadelphia Eagles</option>--%>
                                <%--<option selected>Washington Redskins</option>--%>
                                <%--<option>Chicago Bears</option>--%>
                                <%--<option>Detroit Lions</option>--%>
                                <%--<option>Green Bay Packers</option>--%>
                                <%--<option>Minnesota Vikings</option>--%>
                                <%--<option selected>Atlanta Falcons</option>--%>
                                <%--<option>Carolina Panthers</option>--%>
                                <%--<option>New Orleans Saints</option>--%>
                                <%--<option>Tampa Bay Buccaneers</option>--%>
                                <%--<option>Arizona Cardinals</option>--%>
                                <%--<option>St. Louis Rams</option>--%>
                                <%--<option>San Francisco 49ers</option>--%>
                                <%--<option>Seattle Seahawks</option>--%>
                                <%--</select>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <div class="form-actions fluid">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn purple"><i class="fa fa-check"></i> 提交
                                                </button>
                                                <button type="button" class="btn default" onclick="toBitHome()">取消</button>
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
<script src="<c:url value="/js/user/UserInfoPage.js"/>" type="text/javascript"></script>
<script>
    $(document).ready(function (){
        UserInfoPage.init();
    })
</script>
</body>
</html>
<script type="text/javascript"
        src="<c:url value="/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"/>"></script>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/assets/global/plugins/jquery-multi-select/css/multi-select.css"/>"/>