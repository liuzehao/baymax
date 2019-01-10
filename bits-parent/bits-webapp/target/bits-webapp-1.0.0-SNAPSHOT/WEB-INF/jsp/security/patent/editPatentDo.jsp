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
  <script src="<c:url value="/js/admin/systemPatent.js"/>" type="text/javascript"></script>
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
                        <label class="control-label col-sm-3">专利作者
                          <span class="required" aria-required="true">* </span>
                        </label>


                        <div class="col-sm-6">
                          <input id="id" name="id" type="hidden"
                                 value="${patent.id}"/>
                          <input type="text" class="form-control input-medium" id="inventor"
                                 name="inventor" placeholder="请输入姓名"
                                 value="${patent.inventor}"/>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="control-label col-sm-3">专利名称
                          <span class="required" aria-required="true">* </span>
                        </label>

                        <div class="col-sm-6">
                          <input type="text" class="form-control input-medium" id="title"
                                 name="title" placeholder="请输入用户名"
                                 value="${patent.title}"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="control-label col-sm-3">专利日期
                          <span class="required" aria-required="true">* </span>
                        </label>


                        <div class="col-sm-6">
                          <input type="text" class="form-control input-medium" id="date"
                                 name="date" placeholder="请输入日期"
                                 value="${patent.date}"/>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="control-label col-sm-3">申请机构
                          <span class="required" aria-required="true">* </span>
                        </label>

                        <div class="col-sm-6">
                          <input type="text" class="form-control input-medium" id="applicant"
                                 name="applicant" placeholder="请输入申请机构"
                                 value="${patent.applicant}"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label class="col-sm-3 control-label">专利简介
                          <span class="required" aria-required="true">* </span>
                        </label>

                        <div class="col-sm-6">
                          <textarea  id="abs" rows="3" class="form-control input-medium" type="text">${patent.abs}</textarea>
                        </div>
                      </div>
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
                                onclick="patentListTable.quit()">关闭
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
  $().ready(function() {
    patentListTable.editSave();
  })
</script>
</body>
</html>
