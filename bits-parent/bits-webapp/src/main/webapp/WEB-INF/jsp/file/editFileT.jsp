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
    <title>用户编辑页</title>
    <%@include file="../includes/adminCommon.jsp" %>
    <link href="<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet"
          type="text/css"/>
    <link href="<c:url value="/assets/global/plugins/bootstrap-fileinput-master/css/fileinput.css"/>" rel="stylesheet"
          type="text/css"/>
    <script src="<c:url value="/assets/global/plugins/bootstrap-fileinput-master/js/fileinput.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/assets/global/plugins/bootstrap-fileinput-master/js/plugins/canvas-to-blob.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/assets/global/plugins/bootstrap-fileinput-master/js/fileinput_locale_zh.js"/>"
            type="text/javascript"></script>
    <script src="<c:url value="/js/user/systemFileT.js"/>" type="text/javascript"></script>
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
                                    <div class="row">
                                        <!--上传图片-->
                                        <div class="col-sm-11"
                                             style="width: 578px; padding-left: 30px;margin-left: 15px;">
                                            <div class="form-group">
                                                <label class="col-sm-11 control-label" id="" style="padding-left: 0px;">文件图片(只能一张)：</label>
                                                <input id="input-repl-1a" name="input" type="file" class="file-loading"
                                                       accept="image/*">
                                            </div>
                                        </div>
                                    </div>
                                    <!--结束-->
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" id="test">文件名：</label>
                                            <span class="required" aria-required="true">* </span>

                                            <div class="col-sm-6">
                                                <input id="title" name="title" class="form-control input-medium"
                                                       type="text" value="${literature.fileName}"
                                                       placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">关键词:</label>
                                            <span class="required" aria-required="true">* </span>

                                            <div class="col-sm-6">
                                                <input id="keywords" name="title" class="form-control input-medium"
                                                       type="text" placeholder="请以;分隔"
                                                       value="${literature.fileKeywords}">
                                            </div>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="col-sm-6">
                                      <div class="form-group">
                                        <label class="col-sm-3 control-label">选择领域：
                                          <span class="required" aria-required="true">* </span>
                                        </label>
                                        <div class="col-sm-6">
                                          <input class="form-control input-medium select2" type="hidden" id="expertTheme" name="expertTheme">
                                        </div>
                                      </div>
                                    </div>
                -->
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">选择主题：
                                                <span class="required" aria-required="true">* </span>
                                            </label>

                                            <div class="col-sm-6">
                                                <input id="expertTheme" name="expertTheme"
                                                       class="form-control input-medium" type="hidden"
                                                       value="<c:forEach items="${literature.themeList}" var="theme" varStatus="cursor">
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

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-12 control-label margin-bottom-15"
                                                   style="text-align:left">文件简介:</label>

                                            <div class="col-sm-12">
                                                    <textarea id="abs" rows="3" class="form-control"
                                                              type="text" name="abs"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="id" value="${literature.fileId}">
                                </div>

                                <div class="form-actions right">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn default red"
                                                        id="edit">修改
                                                </button>
                                                &nbsp
                                                <button type="button" class="btn default"
                                                        onclick="literatureListTable.quit()">关闭
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
    $(document).ready(function () {
        literatureListTable.editSave();
    })
    $("#abs").text("${literature.fileAbstract}");
    var id = $("#id").val();
    $("#input-repl-1a").fileinput({
        uploadUrl:"http://111.116.20.180/bits/uploadFileOne?fileId=" + id,
        autoReplace: true,
        overwriteInitial: true,
        showUploadedThumbs: false,
        maxFileCount: 1,
        initialPreview: [
            "<img style='height:160px' src='<c:url value='/findLittleImg?filename=${literature.fileImgUrl}'/>'>"
        ],
        initialCaption: 'Initial-Image.jpg',
        initialPreviewShowDelete: false,
        showRemove: false,
        showClose: false,
        layoutTemplates: {actionDelete: ''}, // disable thumbnail deletion
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
</script>
</body>
</html>

