<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
  <meta charset="utf-8"/>
  <title>注册</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
  <meta content="" name="description"/>
  <meta content="" name="author"/>
  <!-- BEGIN GLOBAL MANDATORY STYLES -->

  <link href="<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/global/plugins/uniform/css/uniform.default.css"/>" rel="stylesheet" type="text/css"/>
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL STYLES -->
  <link href="<c:url value="/assets/global/plugins/select2/select2.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/admin/pages/css/login-soft.css"/>" rel="stylesheet" type="text/css"/>
  <!-- END PAGE LEVEL SCRIPTS -->
  <!-- BEGIN THEME STYLES -->
  <link href="<c:url value="/assets/global/css/components.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/global/css/plugins.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/admin/layout/css/layout.css"/>" rel="stylesheet" type="text/css"/>
  <link id="style_color" href="<c:url value="/assets/admin/layout/css/themes/default.css"/>" rel="stylesheet" type="text/css"/>
  <link href="<c:url value="/assets/admin/layout/css/custom.css"/>" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.min.css"/>"/>
  <!-- END THEME STYLES -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login"  style="background-image: url(<c:url value="/images/bg.jpg"/>)" >
<!-- BEGIN LOGO -->
<div class="logo">
  <a onclick="window.location.href='/bits/'">
    <%--<img src="<c:url value="/img/logo/logo2.png"/>" style="width:225px;height: 65px"/>--%>
  </a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">
  <!-- BEGIN LOGIN FORM -->
  <form class="registration-form" method="post" action="registration">
    <h3 class="form-title" style="text-align: center"><img src="./images/dsloth.png"/></h3>
    <br>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">账户</label>

      <div class="input-icon">
        <i class="fa fa-user" style="margin-top: 14px;"></i>
        <input  style="background: none; border-radius: 3px; color: #fff;height: 42px;line-height:42px;" class="form-control placeholder-no-fix" type="test" autocomplete="off" placeholder="账户"
                name="loginname" id="loginname" value=""/>
        <input type="hidden" id="checkId" value="2"/>
      </div>
    </div>
    <div class="form-group">
      <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
      <label class="control-label visible-ie8 visible-ie9">昵称</label>

      <div class="input-icon">
        <i class="fa fa-user" style="margin-top: 14px;"></i>
        <input  style="background: none; border-radius: 3px; color: #fff;height: 42px;line-height:42px;"class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="昵称"
                name="username" maxlength="20" id="username" value=""/>

      </div>
    </div>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">密码</label>

      <div class="input-icon">
        <i class="fa fa-lock" style="margin-top: 14px;"></i>
        <input style="background: none; border-radius: 3px; color: #fff;height: 42px;line-height:42px;"
               class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码"
               name="password" id="password" value=""/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">确认密码</label>

      <div class="input-icon">
        <i class="fa fa-lock" style="margin-top: 14px;"></i>
        <input style="background: none; border-radius: 3px; color: #fff;height: 42px;line-height:42px;"
               class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="确认密码"
               name="repassword" id="repassword" value=""/>
      </div>
    </div>
    <div class="form-actions">
      <button type="submit" class="btn " id="loginBtn" style="width: 300px;background-color:
#f90;color: #fff;border-radius:3px;height: 42px;border:1px solid #E98C01;">
        注册
      </button>
    </div>
    <div class="create-account pull-right">
      <p style="font-size: 15px;color: #fff;margin-top: -10px">已有账号 ?&nbsp; <a href="login" style="font-size: 15px;color: #fff;text-decoration:underline;margin-top: -10px">登陆 </a>
      </p>
    </div>
  </form>
  <!-- END LOGIN FORM -->
</div>
<!-- END LOGIN -->

<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<c:url value='/assets/global/plugins/respond.min.js'/>"></script>
<script src="<c:url value='/assets/global/plugins/excanvas.min.js'/>"></script>
<![endif]-->

<script src="<c:url value="/assets/global/plugins/jquery-1.11.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-migrate-1.2.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.blockui.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.cokie.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/uniform/jquery.uniform.min.js"/>" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/backstretch/jquery.backstretch.min.js"/>"
        type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/select2/select2.min.js"/>"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<c:url value="/assets/global/scripts/metronic.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/admin/layout/scripts/layout.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/Registration.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/global/toast.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/plugins/ccjcJS/ccjcJS.min.js"/>" ></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
  if (top != window) {
    top.location.href = "logout"
  }
  jQuery(document).ready(function () {
    Metronic.init(); // init metronic core components
    Layout.init(); // init current layout
    Registration.init();
  });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>