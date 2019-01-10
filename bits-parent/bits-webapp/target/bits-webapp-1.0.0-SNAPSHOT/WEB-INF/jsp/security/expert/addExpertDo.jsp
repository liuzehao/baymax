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
  <title>专利新增页</title>
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
              <form action="#" class="form-horizontal" id="addForm">
                <div class="form-body">
                  <div class="form-group">
                    <label class="col-sm-3 control-label">专家姓名：
                      <span class="required" aria-required="true">* </span>
                    </label>

                    <div class="col-sm-6">
                      <input id="expertName" name="expertName" class="form-control input-medium" type="text"
                             placeholder="请输入专家姓名">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label">专家单位：
                      <span class="required" aria-required="true">* </span>
                    </label>

                    <div class="col-sm-6">
                      <input id="expertOrg" name="expertOrg" class="form-control input-medium" type="text"
                             placeholder="请输入单位名称">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-3 control-label">专家领域：
                      <span class="required" aria-required="true">* </span>
                    </label>

                    <div class="col-sm-6">
                      <input class="form-control input-medium select2" type="hidden" id="expertTheme" name="expertTheme">
                      <%--<input id="expertTheme" name="" autocomplete="off"--%>
                             <%--class="form-control input-medium" type="text" flag="themeAutoCompleteList"--%>
                             <%--placeholder="请选择领域" autocomplete="off">--%>
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
  $().ready(function() {
    expertListTable.addSave();
  })
</script>
</body>
</html>
