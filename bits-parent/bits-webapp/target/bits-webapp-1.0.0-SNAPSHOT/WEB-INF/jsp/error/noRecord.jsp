<%--
  Created by IntelliJ IDEA.
  User: Demon
  Date: 2015/5/20
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>没有找到相关记录</title>
  <jsp:include page="../includes/style.jsp"/>
</head>
<body class="corporate">
<jsp:include page="../includes/frontend-top.jsp"/>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
  <div class="container">
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
      <!-- BEGIN CONTENT -->
      <div class="col-md-12 col-sm-12">
        <div class="content-page page-404" style="min-height: 450px">
          <div class="number">
            404
          </div>
          <div class="details">
            <h3>未找到任何记录！</h3>
            <p>
              你可以点击下面返回<br>
              <button type="button" class="btn red" onclick="toBack()">返回</button>
            </p>
          </div>
        </div>
      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
  </div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
