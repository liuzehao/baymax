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
    <script src="<c:url value="/js/user/systemFile.js"/>" type="text/javascript"></script>
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
                                                <label class="col-sm-11 control-label"  style="padding-left: 0px;">文件图片(只能一张)：</label>
                                                <input id="input-repl-1a" name="input" type="file" class="file-loading"
                                                       accept="image/*">
                                            </div>
                                        </div>
                                    </div>
                                    <!--结束-->
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label" id="test">文件名：</label>

                                            <div class="col-sm-6">
                                                <input id="title" name="title" class="form-control input-max"
                                                       type="text" value="${literature.fileName}"
                                                       placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">关键词:</label>

                                            <div class="col-sm-6">
                                                <input id="keywords" name="title" class="form-control input-max"
                                                       type="text" placeholder="请以;分隔">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">选择领域：
                                            </label>

                                            <div class="col-sm-6">
                                                <input class="form-control input-max select2" type="hidden"
                                                       id="expertTheme" name="expertTheme" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label class="col-sm-12 control-label margin-bottom-15"
                                                   style="text-align:left">文件简介:</label>

                                            <div class="col-sm-12">
                                                    <textarea id="abs" rows="3" class="form-control"
                                                              type="text" name="abs" placeholder="选填"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="id" value="${literature.fileId}">
                                    <input type="hidden" id="type" value="${literature.fileType}">
                                </div>

                                <div class="form-actions right">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-offset-3 col-md-9" style="margin-left: 250px;">
                                                <button type="submit" class="btn default red"
                                                        id="saves">发布
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
        literatureListTable.init();
       var type="${literature.fileType}";
       var name= "${literature.fileName}";
        if (parent.parent.$("#ruleFill").val() == "&&"&&${literature.flag}==0) {
            if (type == parent.parent.$("#typeFill").val() &&name.match(parent.parent.$("#keyFill").val())) {
                $("#abs").val(parent.parent.$("#autoFileAbs").val());
                $("#keywords").val(parent.parent.$("#autoFileKey").val());
                $("#expertTheme").attr("value",parent.parent.$("#autoFileTheme").attr("value"));
            }
        }
        if (parent.parent.$("#ruleFill").val() == "||"&&${literature.flag}==0) {
            if (type == parent.parent.$("#typeFill").val() || name.match(parent.parent.$("#keyFill").val())) {
                $("#abs").val(parent.parent.$("#autoFileAbs").val());
                $("#keywords").val(parent.parent.$("#autoFileKey").val());
                $("#expertTheme").attr("value",parent.parent.$("#autoFileTheme").attr("value"));
            }
        }
        if (parent.parent.$("#ruleFill").val() == "all"&&${literature.flag}==0) {
            $("#abs").val(parent.parent.$("#autoFileAbs").val());
            $("#keywords").val(parent.parent.$("#autoFileKey").val());
            $("#expertTheme").attr("value",parent.parent.$("#autoFileTheme").attr("value"));
        }
    })

    var id = $("#id").val();
    $("#input-repl-1a").fileinput({
        uploadUrl:"http://111.116.20.180/bits/uploadFileOne?fileId=" + id,
        autoReplace: true,
        overwriteInitial: true,
        showUploadedThumbs: false,
        maxFileCount: 1,
        initialPreview: [
            "<img style='height:160px' src='<c:url value='/image/default.jpg'/>'>",
        ],
        initialCaption: '默认图片',
        initialPreviewShowDelete: false,
        showRemove: false,
        showClose: false,
        layoutTemplates: {actionDelete: ''}, // disable thumbnail deletion
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
</script>
</body>
</html>
