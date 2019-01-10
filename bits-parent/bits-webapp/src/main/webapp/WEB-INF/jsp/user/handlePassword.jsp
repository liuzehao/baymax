<%--
  Created by IntelliJ IDEA.
  User: Shy
  Date: 2015/8/10
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>${User.username}&nbsp;的密码管理</title>
  <%@include file="../includes/style.jsp"%>
  <style>
    .portlet.box.green > .portlet-title {
      background-color: #7B72E9;
    }
    .portlet.box.green {
      border: 1px solid #7B72E9;
      border-top: 0;
    }
    .btn {
      padding: 7px 14px;
      font-size: 14px;
      text-transform: uppercase;
      border-radius:0px ;
    }
    .btn-primary {
      border: none;
      background: #7B72E9;
      color: #fff;
    }
    .btn-primary:hover,
    .btn-primary:focus,
    .btn-primary:active {
      color: #fff;
      background: #A49EF0;
      border: none;
    }
  </style>
</head>
<body>
<%@include file="../includes/header.jsp"%>
<div class="main">
  <div class="container">
    <ul class="breadcrumb">
      <li><a href="javascript:;" onclick="toHome()">首页</a></li>
      <li><a href="javascript:;">用户中心</a></li>
      <li class="active">修改密码</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN SIDEBAR -->
      <div class="sidebar col-md-2 col-sm-2">
        <ul class="list-group margin-bottom-25 sidebar-menu">

          <li id="li11" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handleUpload"  style="color: #949494;font-size: 16px;">我的上传 <i style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>


          <!--          <div style="padding-top: 10px;width: 100%" > </div><li id="li2"class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleFocus"  style="color: #949494;font-size: 16px;">我的关注 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>-->

          <div style="padding-top: 10px;width: 100%" > </div>

          <li id="li3" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleGeneral" style="color: #949494;font-size: 16px;">常用文档 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>

          <div style="padding-top: 10px;width: 100%" > </div>

          <li id="li4" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleHistory" style="color: #949494;font-size: 16px;">浏览历史 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>

          <div style="padding-top: 10px;width: 100%" > </div>

          <li id="li5" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handleUserInfo"  style="color: #949494;font-size: 16px;">个人资料 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>

          <div style="padding-top: 10px;width: 100%" > </div>
          <li id="li6" class="list-group-item clearfix"  style="background-color:#7B72E9;text-align: center"><a href="handlePassword"  style="color: #fff;font-size: 16px;">修改密码 <i class="fa fa-caret-right"></i></a></li>

        </ul>
      </div>
      <!-- END SIDEBAR -->
      <!-- BEGIN CONTENT -->
      <div class="col-md-10 col-sm-10">

        <div class="row">
          <div class="col-md-12">
            <div class="portlet box green">
              <div class="portlet-title">
                <div class="caption">
                  <i class="fa fa-user" style="color: #fff"></i>修改密码
                </div>
              </div>
              <div class="portlet-body">
                <div class="row">
                  <div class="col-md-7 col-sm-7">
                    <form class="form-horizontal form-without-legend" role="form" action="#" id="passwordForm">
                      <input type="hidden" id="userId" value="${User.userId}">
                      <div class="form-group">
                        <label for="password" class="col-lg-4 control-label">新密码 <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="password" class="form-control" id="password" name="password">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="repassword" class="col-lg-4 control-label">确认密码<span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="password" class="form-control" id="repassword" name="repassword">
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                          <button type="submit" class="btn btn-primary"  >完成修改</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <div class="col-md-4 col-sm-4 pull-right">
                    <div class="form-info">
                      <h2><em style="color:#7B72E9">提示</em></h2>
                      <p>修改密码后需要重新登陆</p>
                    </div>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
  </div>
</div>
<%@include file="../includes/script.jsp"%>
<script src="<c:url value="/js/user/ChangePasswordPage.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"/>"
        type="text/javascript"></script>
<script type="text/javascript">
  $(document).ready(function (){
    ChangePasswordPage.init();
  })
</script>
</body>
</html>
