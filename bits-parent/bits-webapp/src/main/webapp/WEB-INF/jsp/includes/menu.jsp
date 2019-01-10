<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String systemNum = request.getParameter("systemNum");       // 开始时间id
    String systemLeafNum = request.getParameter("systemLeafNum");
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<input type="hidden" id="systemNum" name="systemNum" value="<%=systemNum%>"/>
<input type="hidden" id="systemLeafNum" name="systemLeafNum" value="<%=systemLeafNum%>"/>

<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
    <li class="sidebar-toggler-wrapper">
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
        <div class="sidebar-toggler hidden-phone">
        </div>
        <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
    </li>
    <li class="sidebar-search-wrapper">
        <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
        <!-- END RESPONSIVE QUICK SEARCH FORM -->
    </li>
    <shiro:hasPermission name="admin">
        <%--<li id="system_1">--%>
            <%--<a href="javascript:;">--%>
                <%--<i class="fa fa-user faa-pulse animated-hover"></i>--%>
                <%--<span class="title">系统设置</span>--%>
                <%--<span class="arrow "> </span>--%>
            <%--</a>--%>
            <%--<ul class="sub-menu">--%>
                <%--<shiro:hasPermission name="user_admin">--%>
                    <%--<li id="systemLeaf_1_1"><a href="<%=basePath%>admin/user/getUserListPageDo">用户管理</a></li>--%>
                <%--</shiro:hasPermission>--%>
                <%--<shiro:hasPermission name="role_admin">--%>
                    <%--<li id="systemLeaf_1_2"><a href="<%=basePath%>admin/role/getRoleListPageDo">角色管理</a></li>--%>
                <%--</shiro:hasPermission>--%>
                <%--<shiro:hasPermission name="perm_admin">--%>
                    <%--<li id="systemLeaf_1_3"><a href="<%=basePath%>admin/permission/getPermissionListPageDo">权限管理</a></li>--%>
                <%--</shiro:hasPermission>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <shiro:hasPermission name="admin">
        <li id="system_1">
            <a href="<%=basePath%>admin/user/getUserList">
                <i class="fa fa-user faa-pulse animated-hover"></i>
                <span class="title">用户管理</span>
            </a>
        </li>
        </shiro:hasPermission>
       <%-- <shiro:hasPermission name="role_admin">
        <li id="system_2">
            <a href="<%=basePath%>admin/user/getRoleList">
                <i class="fa fa-users faa-pulse animated-hover"></i>
                <span class="title">角色管理</span>
            </a>
        </li>
        </shiro:hasPermission>--%>
        <shiro:hasPermission name="expert_admin">
        <li id="system_3">
            <a href="<%=basePath%>admin/user/getExpertList">
                <i class="fa fa-users faa-pulse animated-hover"></i>
                <span class="title">主题管理</span>
            </a>
        </li>
        </shiro:hasPermission>
        <shiro:hasPermission name="literature_admin">
        <li id="system_4">
            <a href="<%=basePath%>admin/user/getLiteratureList">
                <i class="fa fa-book faa-pulse animated-hover"></i>
                <span class="title">文件管理</span>
            </a>
        </li>
        </shiro:hasPermission>
    </shiro:hasPermission>
</ul>
<script type="text/javascript">
    var systemNum=$("#systemNum").val();
    var systemLeafNum=$("#systemLeafNum").val();
    $("#system_"+systemNum).addClass("active");
    $("#systemSpan_"+systemNum).addClass("selected");
    $("#systemLeaf_"+systemNum+"_"+systemLeafNum).addClass("active");

</script>