<%--
    Created by panzhuowen on 2015/2/7.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- BEGIN HEADER -->
<div class="pre-header">
    <div class="container">
        <div class="row">
            <%--<!-- BEGIN TOP BAR LEFT PART -->--%>
            <div class="col-md-6 col-sm-6 additional-shop-info">
            <ul class="list-unstyled list-inline">
                <li><i class="fa fa-desktop"></i><span>比特能.专家机器人</span></li>
                <li><i class="fa fa-envelope-o"></i><span>www.ccut.edu.cn</span></li>
            </ul>
            </div>
            <%--<!-- END TOP BAR LEFT PART -->--%>
            <!-- BEGIN TOP BAR MENU -->
            <c:if test="${User.username == null}">
                <div class="col-md-6 col-sm-6 additional-nav pull-right">
                    <ul class="list-unstyled list-inline pull-right">
                        <li><a href="#" onclick="toLogin()">登录</a></li>
                        <li><a href="#" onclick="toRegistration()">注册</a></li>
                    </ul>
                </div>
            </c:if>
            <c:if test="${User.username != null}">
                <div class="col-md-6 col-sm-6 additional-nav pull-right">
                    <ul class="list-unstyled list-inline pull-right">
                        <li><a href="javascript:void(0)" onclick="selfCenter('${User.userId}')">${User.username}</a></li>
                        <li><a href="javascript:void(0)" onclick="logout()">退出</a></li>
                    </ul>
                </div>
            </c:if>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
