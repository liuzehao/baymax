<%--
    Created by panzhuowen on 2015/2/11.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>500 Page</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"/> " rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"/> " rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.min.css"/> " rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/uniform/css/uniform.default.css"/> " rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="<c:url value="/assets/admin/pages/css/error.css"/> " rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="<c:url value="/assets/global/css/components.css"/> " rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/global/css/plugins.css"/> " rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/admin/layout/css/layout.css"/> " rel="stylesheet" type="text/css"/>
    <link id="style_color" href="<c:url value="/assets/admin/layout/css/themes/default.css"/> " rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/assets/admin/layout/css/custom.css"/> " rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-500-full-page">
<div class="row">
    <div class="col-md-12 page-500">
        <div class=" number">
            500
        </div>
        <div class=" details">
            <h3>服务器上出现某些错误.</h3>
            <p>
                我们正在加紧抢修中!<br/>
                请稍后在进行访问.<br/><br/>
            </p>
        </div>
    </div>
</div>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<c:url value='/assets/global/plugins/respond.min.js'/>"></script>
<script src="<c:url value='/assets/global/plugins/excanvas.min.js'/>"></script>
<![endif]-->
<script src="<c:url value="/assets/global/plugins/jquery-1.11.0.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-migrate-1.2.1.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap/js/bootstrap.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.blockui.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.cokie.min.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/uniform/jquery.uniform.min.js"/> " type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="<c:url value="/assets/global/scripts/metronic.js"/> " type="text/javascript"></script>
<script src="<c:url value="/assets/admin/layout/scripts/layout.js"/> " type="text/javascript"></script>
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>