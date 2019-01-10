<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学者</title>
    <jsp:include page="../includes/style.jsp"/>
    <style>
        .thumbnail > img {
            width: 100%;
        }

        .thumbnail small {
            line-height: 1.4;
            height: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="#" onclick="toHome()">首页</a></li>
            <li class="active">主题详情</li>
        </ul>
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <div class="col-md-12 margin-bottom-20">
                    <div class="col-md-4">
                        <h1 style="display: inline-block">${currentTheme.themeName}</h1>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group pull-right">
                            <label class="control-label col-md-3"
                                   style="padding: 0 0; font-size: 1.2em">关注&nbsp;:</label>

                            <div class="col-md-9" style="height: 2em;">
                                <input type="checkbox" class="make-switch"
                                       data-on-color="success" data-off-color="danger" data-on-text="开"
                                       data-off-text="关" id="focusThisTheme"
                                <c:if test="${User.userId == null}">
                                    <c:out value="disabled=disabled"></c:out>
                                </c:if>
                                <c:if test="${!isFocus}">
                                    <c:out value="checked='checked'"></c:out>
                                </c:if>
                                        >
                                <input type="hidden" value="${currentTheme.id}" id="themeId">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content-page">
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>主题数据你知道
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body" style="height: 350px" id="dataKnow">
                        </div>
                    </div>
                    <div class="portlet">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>主题专家列表
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="row front-team">
                                <ul class="list-unstyled" id="expertList">
                                    <c:forEach items="${experts}" var="expert">
                                        <li class="col-md-3">
                                            <div class="thumbnail">
                                                <img alt="" src="<c:url value="${expert.img}"/>">

                                                <h3>
                                                    <strong style="cursor: pointer"
                                                            onclick="toExpertDetail('${expert.id}')">${expert.expertName}</strong>
                                                    <small>${expert.expertOrg}</small>
                                                </h3>
                                                <p>
                                                    <b>TA所发表的文献数:</b>&nbsp;${expert.literatureCount}<b>&nbsp;篇</b><br>
                                                    <b>TA所拥有的专利数:</b>&nbsp;${expert.patentCount}<b>&nbsp;个</b>
                                                </p>

                                                <div class="btn-group">
                                                    <button type="button" class="btn purple dropdown-toggle"
                                                            data-toggle="dropdown" data-hover="dropdown"
                                                            data-delay="1000" data-close-others="true">
                                                        TA的领域
                                                        <i class="fa fa-angle-down"></i>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <c:choose>
                                                            <c:when test="${expert.themeList.isEmpty()}">
                                                                <a href="#"><c:out value="暂无"></c:out></a>
                                                            </c:when>
                                                            <c:when test="${!expert.themeList.isEmpty()}">
                                                                <c:forEach items="${expert.themeList}" var="theme">
                                                                    <li>
                                                                        <a href="#"
                                                                           onclick="toThemeExperts('${theme.id}')">
                                                                                ${theme.themeName}
                                                                        </a>
                                                                    </li>
                                                                </c:forEach>
                                                            </c:when>
                                                        </c:choose>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">--%>
                    <%--<c:forEach items="${experts}" var="expert" varStatus="iter">--%>
                    <%--<div class="col-md-3">--%>
                    <%--<div class="thumbnail" style="height: 390px;">--%>
                    <%--<img style="width:250px;" src="<c:url value="${expert.img}"/>" alt=""/>--%>

                    <%--<h3>--%>
                    <%--<strong><a href="#"--%>
                    <%--onclick="toExpertDetail('${expert.id}')">${expert.expertName}</a></strong>--%>
                    <%--</h3>--%>
                    <%--<span style="font-size:15px;height: 40px;padding-top:10px;padding-bottom: 10px;">${expert.expertOrg}</span>--%>
                    <%--<br>--%>
                    <%--<span style="font-weight: bolder">--%>
                    <%--文献数:&nbsp;${expert.literatureCount}--%>
                    <%--</span>--%>
                    <%--<span style="font-weight: bolder">--%>
                    <%--专利数:&nbsp;${expert.patentCount}--%>
                    <%--</span>--%>
                    <%--<br>--%>

                    <%--<div class="btn-group">--%>
                    <%--<button type="button" class="btn purple dropdown-toggle"--%>
                    <%--data-toggle="dropdown" data-hover="dropdown"--%>
                    <%--data-delay="1000" data-close-others="true">--%>
                    <%--TA的领域--%>
                    <%--<i class="fa fa-angle-down"></i>--%>
                    <%--</button>--%>
                    <%--<ul class="dropdown-menu" role="menu">--%>
                    <%--<c:choose>--%>
                    <%--<c:when test="${expert.themeList.isEmpty()}">--%>
                    <%--<a href="#"><c:out value="暂无"></c:out></a>--%>
                    <%--</c:when>--%>
                    <%--<c:when test="${!expert.themeList.isEmpty()}">--%>
                    <%--<c:forEach items="${expert.themeList}" var="theme">--%>
                    <%--<li>--%>
                    <%--<a href="#"--%>
                    <%--onclick="toThemeExperts('${theme.id}')">--%>
                    <%--${theme.themeName}--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--</c:forEach>--%>
                    <%--</c:when>--%>
                    <%--</c:choose>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</c:forEach>--%>
                    <%--</div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/script.jsp"/>
<script src="<c:url value="/js/plugins/echarts-2.2.1/build/dist/echarts-all.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/frontend/Focus.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/plugins/pagination.js"/>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#focusThisTheme").on('switchChange.bootstrapSwitch', function (event, state) {
            var isChecked = state ? false : true;
            if (isChecked) {
                addUserFocusThemes([$("#themeId").val()]);
            } else {
                delUserFocusThemes([$("#themeId").val()]);
            }
        });
        $("#expertList").paging({
            itemSelector: "li.col-md-3",
            showItem: 8
        });

        function initChart(wrap){
            var option = {
                title : {
                    text: '该主题专家分布图',
                    subtext:'',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} 位专家 ({d}%)"
                },
                legend: {
                    orient : 'vertical',
                    x : 'left',
                    data:wrap.legend
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: false},
                        dataView : {show: false},
                        magicType : {show: false},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                series : [
                    {
                        name:'专家人数:',
                        type:'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:wrap.data
                    }
                ]
            };

            var chart = echarts.init($("#dataKnow").get(0));
            chart.setOption(option);
        }
        $.ajax({
            url:basePath + "/theme/getDetailThemeChart",
            dataType:"json",
            data:{
                themeId:"${currentTheme.id}"
            },
            type:"post",
            success:function(data){
                var wrap = {
                    legend:[],
                    data:[]
                };
                $.each(data,function (key,val){
                    wrap.legend.push(key);
                    wrap.data.push({name:key,value:val})
                });
                initChart(wrap);
            }
        })
    })
</script>
</body>
</html>
