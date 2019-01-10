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
    <%@include file="../../includes/adminCommon.jsp" %>
    <script src="<c:url value="/js/admin/systemLiterature.js"/>" type="text/javascript"></script>
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
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">文献作者：</label>

                                                <div class="col-sm-6">
                                                    <input id="authorCn" name="authorCn"
                                                           class="form-control input-medium"
                                                           type="text" value="${literature.authorCn}"
                                                           placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">文献题目：</label>

                                                <div class="col-sm-6">
                                                    <input id="title" name="title" class="form-control input-medium"
                                                           type="text" value="${literature.title}"
                                                           placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">作者单位：</label>

                                                <div class="col-sm-6">
                                                    <input id="unit" name="unit" autocomplete="off"
                                                           class="form-control input-medium" type="text"
                                                           placeholder="" value="${literature.unit}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">文献时间：</label>

                                                <div class="col-sm-6">
                                                    <input id="appDate" name="appDate" autocomplete="off"
                                                           class="form-control input-medium" type="text"
                                                           placeholder="" value="${literature.appDate}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">文献来源：</label>

                                                <div class="col-sm-6">
                                                    <input id="journalCn" name="journalCn" autocomplete="off"
                                                           class="form-control input-medium" type="text"
                                                           placeholder="" value="${literature.journalCn}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="col-sm-12 control-label margin-bottom-15" style="text-align:left">文献简介:</label>

                                                <div class="col-sm-12">
                                                    <textarea id="abs" rows="3" class="form-control"
                                                              type="text" name="abs">${literature.abs}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="hidden" id="id" value="${literature.id}">
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
</script>
</body>
</html>
