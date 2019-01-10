<%--
  Created by IntelliJ IDEA.
  User: Shy
  Date: 2015/8/10
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>${User.username}&nbsp;的个人信息</title>
  <%@include file="../includes/style.jsp"%>
  <style>
    .color1{
      background-color: rgb(242,229,186);
    }
    .color2{
      background-color: rgb(245,222,196);
    }
    .color3{
      background-color: rgb(235,227,225);
    }
    .color4{
      background-color: rgb(222,235,225);
    }
    .color5{
      background-color: rgb(203,214,205);
    }
    .color6{
      background-color: rgb(226,211,182);
    }
    .color7{
      background-color: rgb(247,196,182);
    }
    .color8{
      background-color: rgb(203,214,205);
    }
    .color9{
      background-color: rgb(157,185,206);
    }
    .color10{
      background-color: rgb(210,173,181);
    }
    table a{
      text-decoration: none !important;
      padding: 3px 3px;
      cursor: pointer;
    }

    .portlet.box.green > .portlet-title {
      background-color: #69BA6B;
    }
    .portlet.box.green {
      border: 1px solid #CFCFCF;
      border-top: 0;
    }
  </style>
  <script>
    function a() {
      var user = {
        userId: $("#userId").val(),
        username: $("#username").val(),
      };
      if ($("#email").val() != "")
        user = $.extend(user, {email: $("#email").val()});
      $.ajax({
        url: basePath + "userCenter/updateUserInfo",
        type: "post",
        data: user,
        dataType: "json",
        success: function (data) {
          setTimeout(function () {
            toast.success("修改成功!")
          }, 500);
          setTimeout(function () {
            location.reload()
          }, 3000);
        }
      })
    }
  </script>

</head>
<body>
<%@include file="../includes/header.jsp"%>
<input hidden="hidden" type="text" value="${User.userId}" id="userId"/>
<div class="main">
  <div class="container">
    <ul class="breadcrumb">
      <li><a href="javascript:;" onclick="toHome()">首页</a></li>
      <li><a href="javascript:;">用户中心</a></li>
      <li class="active">个人资料</li>
    </ul>
    <div class="row margin-bottom-40">
      <div class="sidebar col-md-2 col-sm-2">
        <ul class="list-group margin-bottom-25 sidebar-menu">

          <li id="li11" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handleUpload"  style="color: #949494;font-size: 16px;">我的上传 <i style="color:#F3F1F2 " class="fa fa-caret-right"></i></a></li>


          <!--<<div style="padding-top: 10px;width: 100%" > </div>li id="li2"class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleFocus"  style="color: #949494;font-size: 16px;">我的关注 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>-->

          <div style="padding-top: 10px;width: 100%" > </div>

          <li id="li3" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleGeneral" style="color: #949494;font-size: 16px;">常用文档 <i style="color:#F3F1F2 "  class="fa fa-caret-right"></i></a></li>

          <div style="padding-top: 10px;width: 100%" > </div>

          <li id="li4" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleHistory"  style="color: #949494;font-size: 16px;">浏览历史 <i style="color:#F3F1F2 "  class="fa fa-caret-right"></i></a></li>

          <div style="padding-top: 10px;width: 100%" > </div>

          <li id="li5" class="list-group-item clearfix"  style="background-color:#69BA6B;text-align: center"><a href="handleUserInfo"  style="color: #fff;font-size: 16px;">个人资料 <i  class="fa fa-caret-right"></i></a></li>

          <div style="padding-top: 10px;width: 100%" > </div>
          <li id="li6" class="list-group-item clearfix"  style="background-color:#F3F1F2;text-align: center"><a href="handlePassword"  style="color: #949494;font-size: 16px;">修改密码 <i style="color:#F3F1F2 "  class="fa fa-caret-right"></i></a></li>

        </ul>
      </div>

      <div class="col-md-10 col-sm-10">


        <div class="row">
          <div class="col-md-12">
            <div class="portlet box green">
              <div class="portlet-title">
                <div class="caption">
                  <i class="fa fa-user" style="color: #fff"></i>个人资料
                </div>

              </div>
              <div class="portlet-body">
                <table class="table table-bordered">
                  <tbody>
                  <tr>
                    <td align="center" width="15%">登陆账号</td>
                    <td align="center"><input type="text" class="form-control input-medium" id="loginName" style="border:none;"
                                              value="${User.loginName}"></td>
                  </tr>
                  <tr>
                    <td align="center" width="15%">昵称</td>
                    <td align="center"><input type="text" class="form-control input-medium" id="username" style="border:none;"
                                              value="${User.username}"></td>
                  </tr>
                  <tr>
                    <td align="center" width="15%">邮箱</td>
                    <td align="center"><input type="text" class="form-control input-medium" id="email" style="border:none;"
                                              value="${User.email}"></td>
                  </tr>



                  <tr style="text-align: center">
                    <td style="text-align:center">
                      修改
                    </td>
                    <td style="text-align:center">
                      <a  onclick="a()" href="#"><img src="../images/baocun.png"/></a>
                    </td>

                  </tr>
                  </tbody>
                </table>
              </div>

            </div>
          </div>
        </div>

      </div>
      <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!--<div class="form-actions fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="col-md-offset-7 col-md-5">
            <button class="btn btn-primary btn-lg" role="button" id="save"><i class="fa fa-edit"></i>
              保存
            </button>
          </div>
        </div>
      </div>
    </div>-->
  </div>
</div>
<%@include file="../includes/script.jsp"%>
<script>
  $("#save").click(function(){
    $.ajax({
      url: basePath + "userCenter/editUser",
      data: {
        userId: $("#userId").val(),
        loginName: $("#loginName").val(),
        username: $("#username").val(),
        email: $("#email").val()
      },
      dataType: "json",
      type: "POST",
      success: function () {
        toast.success();
      },
      error:function () {
      },
    })
  });
  $(document).ready(function (){
    var color = [
      "color1",
      "color2",
      "color3",
      "color4",
      "color5",
      "color6",
      "color7",
      "color8",
      "color9",
      "color10"
    ];
    var l = color.length;
    $("a","#focusTheme").each(function(index){
      $(this).addClass(color[index % l]);
    });
    $("a","#focusExpert").each(function(index){
      $(this).addClass(color[index % l]);
    });
  })
</script>
</body>
</html>
