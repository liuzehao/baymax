<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-6
  Time: 下午9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <jsp:include page="../includes/style.jsp"/>

</head>
<body>
<jsp:include page="../includes/frontend-top.jsp"/>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <%--demo样式可删除--%>
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="../index">首页</a></li>
            <li><a href="#">专家列表</a></li>
        </ul>
        <div class="comments">
            <div class="row margin-bottom-40">
                <div class="col-md-12 col-sm-12">
                    <div class="content-page">
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <img src="<c:url value="/assets/frontend/pages/img/people/img4-small.jpg"/>" alt=""
                                     class="img-responsive" style="width:250px">
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <h2><a href="getExpertDetail">周伟国</a></h2>

                                <p></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;单位:同济大学热能工程系</span></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;专家领域:电力工业；力学；新能源</span>
                                </p>
                            </div>
                        </div>
                        <hr class="blog-post-sep">
                        <div class="row">
                            <!-- BEGIN LEFT SIDEBAR -->
                            <div class="col-md-4 col-sm-4">
                                <img src="<c:url value="/assets/frontend/pages/img/people/img5-small.jpg"/>" alt=""
                                     class="img-responsive" style="width:250px">
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <h2><a>张伟</a></h2>

                                <p></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;单位:同济大学热能工程系</span></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;专家领域:电力工业；力学；新能源</span>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <img src="<c:url value="/assets/frontend/pages/img/people/img4-small.jpg"/>" alt=""
                                     class="img-responsive" style="width:250px">
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <h2><a href="getExpertDetail">李里</a></h2>

                                <p></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;单位:同济大学热能工程系</span></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;专家领域:电力工业；力学；新能源</span>
                                </p>
                            </div>
                        </div>
                        <hr class="blog-post-sep">
                        <div class="row">
                            <!-- BEGIN LEFT SIDEBAR -->
                            <div class="col-md-4 col-sm-4">
                                <img src="<c:url value="/assets/frontend/pages/img/people/img5-small.jpg"/>" alt=""
                                     class="img-responsive" style="width:250px">
                            </div>
                            <div class="col-md-8 col-sm-8">
                                <h2><a>倪萍</a></h2>

                                <p></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;单位:同济大学热能工程系</span></p>

                                <p><i class="fa fa-tags"></i><span style="font-size:17px">&nbsp;专家领域:电力工业；力学；新能源</span>
                                </p>
                            </div>
                        </div>
                        <ul class="pagination" style="padding-top: 50px">
                            <li><a href="#">Prev</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--demo样式结束--%>
</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/script.jsp"/>
</body>
</html>
