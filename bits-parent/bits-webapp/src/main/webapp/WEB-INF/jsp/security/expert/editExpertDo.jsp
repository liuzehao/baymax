<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>专利编辑页</title>
    <%@include file="../../includes/adminCommon.jsp" %>
    <script src="<c:url value="/js/admin/systemExpert.js"/>" type="text/javascript"></script>
</head>
<body style="background: #ffffff">
<div class="page-container">
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet box">
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <form action="#" class="form-horizontal" id="editForm">
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">专家姓名：
                                            <span class="required" aria-required="true">* </span>
                                        </label>

                                        <div class="col-sm-6">
                                            <input id="id" name="id" type="hidden"
                                                   value="${expert.id}"/>
                                            <input id="expertName" name="" class="form-control input-medium" type="text"
                                                   value="${expert.expertName}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">专家单位：
                                            <span class="required" aria-required="true">* </span>
                                        </label>

                                        <div class="col-sm-6">
                                            <input id="expertOrg" name="" class="form-control input-medium" type="text"
                                                   value="${expert.expertOrg}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">专家领域：
                                            <span class="required" aria-required="true">* </span>
                                        </label>

                                        <div class="col-sm-6">
                                            <input id="expertTheme" name="expertTheme"
                                                   class="form-control input-medium" type="hidden"
                                                   value="<c:forEach items="${expert.themeList}" var="theme" varStatus="cursor">
                                                     <c:if test="${!cursor.last}">
                                                        <c:out value="${theme.themeName},"></c:out>
                                                     </c:if>
                                                     <c:if test="${cursor.last}">
                                                        <c:out value="${theme.themeName}"></c:out>
                                                     </c:if>
                                                 </c:forEach>
                                                 ">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions right">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn default green"
                                                        id="saves">保存
                                                </button>
                                                &nbsp
                                                <button type="button" class="btn default"
                                                        onclick="expertListTable.quit()">关闭
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
                            <!-- END FORM-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $().ready(function () {
        expertListTable.editSave()
    })
</script>
</body>
</html>
