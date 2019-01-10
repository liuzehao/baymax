<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Global styles START -->
<link href="<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.css"/> " rel="stylesheet">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="<c:url value="/assets/global/plugins/fancybox/source/jquery.fancybox.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/global/plugins/slider-revolution-slider/rs-plugin/css/settings.css"/> " rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/global/plugins/select2/select2.css"/>"/>
<!-- Page level plugin styles END -->

<!-- BEGIN PAGE LEVEL STYLES -->
<link href="<c:url value="/assets/admin/pages/css/timeline.css"/>" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
<link href="<c:url value="/assets/admin/pages/css/news.css"/>" rel="stylesheet" type="text/css"/>
<!-- Theme styles START -->
<link href="<c:url value="/assets/global/css/components.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/admin/layout/css/layout.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/frontend/layout/css/style.css"/> " rel="stylesheet">
<link id="style_color" href="<c:url value="/assets/admin/layout/css/themes/light.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/frontend/pages/css/style-revolution-slider.css"/> " rel="stylesheet"><!-- metronic revo slider styles -->
<link href="<c:url value="/assets/frontend/layout/css/style-responsive.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/global/css/plugins.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/frontend/layout/css/custom.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.min.css"/>" rel="stylesheet" type="text/css">
<%--<link href="<c:url value="/css/global/global.css"/>" rel="stylesheet" type="text/css"/>--%>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/plugins/autoComplete/autoComplete.css"/>"/>
<%--<link rel="stylesheet" type="text/css" href="<c:url value="/js/plugins/onepage-scroll/onepage-scroll.css"/>"/>--%>

<!--开始表格支持-->
<link href="<c:url value="/js/plugins/font-awesome-4.1.0/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/css/global/font-awesome-animation.min.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/global/plugins/uniform/css/uniform.default.css"/>" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->

<link rel="shortcut icon" href="favicon.ico"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/global/plugins/jquery-tags-input/jquery.tagsinput.css"/>"/>
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<c:url value='/assets/global/plugins/respond.min.js'/>"></script>
<script src="<c:url value='/assets/global/plugins/excanvas.min.js'/>"></script>
<![endif]-->
<script src="<c:url value="/assets/global/plugins/jquery-1.11.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-migrate-1.2.1.min.js"/>" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<c:url value="/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"/>" type="text/javascript"></script>
<%--<script src="<c:url value="/js/plugins/ccjcJS/ccjcJS.min.js"/>" type="text/javascript"></script>--%>
<script src="<c:url value="/assets/global/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.blockui.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery.cokie.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/uniform/jquery.uniform.min.js"/>" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="<c:url value="/assets/global/plugins/select2/select2.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/plugins/data-tables/jquery.dataTables.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/plugins/data-tables/DT_bootstrap.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/global/bootstrap-datepicker.zh-CN.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/bootstrap-toastr/toastr.js"/>"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<c:url value="/assets/global/scripts/metronic.js"/>"></script>
<script src="<c:url value="/assets/admin/layout/scripts/layout.js"/>"></script>
<script src="<c:url value="/js/global/datatable.js"/>"></script>
<script src="<c:url value="/js/global/toast.js"/>"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!--统计图展示可能用到了的插件-->
<script src="<c:url value="/assets/global/plugins/flot/jquery.flot.canvas.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/flot/jquery.flot.js"/>"type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/admin/pages/scripts/index.js"/>" type="text/javascript"></script>

<script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/js/plugins/autoComplete/autoComplete.js"/>" type=text/javascript></script>
<script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/global/plugins/jquery-tags-input/jquery.tagsinput.min.js"/>" type="text/javascript"></script>
