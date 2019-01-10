<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>领域专家网络</title>
    <jsp:include page="../includes/style.jsp"/>
</head>
<body>
<jsp:include page="../includes/frontend-top.jsp"/>
<jsp:include page="../includes/header.jsp"/>
<input type="hidden" value="${themeId}" id="themeName"/>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="height:600px"></div>
<!-- ECharts单文件引入 -->
<jsp:include page="../includes/script.jsp"/>
<script src="<c:url value="/assets/global/plugins/jquery-mixitup/jquery.mixitup.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/js/jquery-1.11.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/plugins/echarts-2.2.1/build/dist/echarts-all.js"/>"></script>
<script src="<c:url value="/js/frontend/ExpertWeb.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/global/toast.js"/>"></script>

<script type="text/javascript">
    $(document).ready(function () {
        ExpertWeb.initChart();
    });
</script>
</body>
</html>