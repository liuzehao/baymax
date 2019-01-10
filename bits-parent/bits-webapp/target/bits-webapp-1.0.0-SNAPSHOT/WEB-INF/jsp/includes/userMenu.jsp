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
<ul class="page-sidebar-menu" data-auto-scroll="false" data-auto-speed="200">
    <li class="start">
        <a id="userCenterIndex">
            <table>
                <tr>
                    <td>
                        <span>昵称:</span><br/><span
                            id="userName">${User.loginName}</span><br/>
                    </td>
                </tr>
            </table>
        </a>
    </li>
    <li id="system_1">
        <a href="<%=basePath%>userCenter/userCenterInfo">
            <i class="fa fa-signal"></i>
                       <span class="title">
                           个人资料
                       </span>
        </a>
    </li>
    <li id="system_2">
        <a href="<%=basePath%>userCenter/changePassword">
            <i class="fa fa-italic"></i>
                       <span class="title">
                           修改密码
                       </span>
        </a>
    </li>
    <li id="system_3">
        <a href="<%=basePath%>userCenter/searchHistory">
            <i class="fa fa-plus"></i>
                       <span class="title">
                           检索历史
                       </span>
        </a>
    </li>
    <%--<li id="system_4">--%>
        <%--<a href="<%=basePath%>userCenter/focusThemeList">--%>
            <%--<i class="fa fa-book"></i>--%>
                       <%--<span class="title">--%>
                           <%--关注主题列表--%>
                       <%--</span>--%>
        <%--</a>--%>
    <%--</li>--%>
    <%--<li id="system_5">--%>
        <%--<a href="<%=basePath%>userCenter/interestRecommend">--%>
            <%--<i class="fa fa-star"></i>--%>
                      <%--<span class="title">--%>
                          <%--兴趣推荐--%>
                      <%--</span>--%>
        <%--</a>--%>
    <%--</li>--%>
</ul>
