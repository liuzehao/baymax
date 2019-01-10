<%--
  Created by IntelliJ IDEA.
  User: longshihui
  Date: 15-5-10
  Time: 下午1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>树懒问答</title>
    <jsp:include page="../includes/style.jsp"/>
    <style>
        .chats li.in .message {
            border-left: 2px solid #1BBC9B !important;
        }

        .chats li.in .message .arrow {
            border-right: 8px solid #1BBC9B !important;
        }

        .chats li .message .body {
            padding-top: 8px;
            padding-bottom: 8px;
        }

        .chats li .message a {
            text-decoration: none !important;
        }

        div.expertsWrap {
            padding-left: 0px;
            padding-right: 0px;
            width: 600px;
            height: 360px;
            overflow: auto
        }

        div.note {
            padding-left: 0px;
            padding-right: 0px;
            position: relative;
        }

        a.contact{
            position: absolute;
            right:0px;
            top:-15px;
            padding: 5px 10px 5px 15px!important;
            border-bottom-left-radius: 30px!important;
        }

        div.note img {
            width: 60px;
            height: 60px;
            border-radius: 50% !important;
        }

        a.theme {
            text-decoration: none !important;
            padding: 3px 3px;
            cursor: pointer;
            color: #000000;
            margin-left: 3px;
            margin-right: 3px;
            margin-bottom: 3px;
        }

        a.expertName {
            color: #767F88;
            font-size: 20px;
            font-weight: 500;
            text-decoration: none
        }

        #email{
            width: 600px;
            height: 400px;
        }

        .color1 {
            background-color: rgb(242, 229, 186);
        }

        .color2 {
            background-color: rgb(245, 222, 196);
        }

        .color3 {
            background-color: rgb(235, 227, 225);
        }

        .color4 {
            background-color: rgb(222, 235, 225);
        }

        .color5 {
            background-color: rgb(203, 214, 205);
        }

        .color6 {
            background-color: rgb(226, 211, 182);
        }

        .color7 {
            background-color: rgb(247, 196, 182);
        }

        .color8 {
            background-color: rgb(203, 214, 205);
        }

        .color9 {
            background-color: rgb(157, 185, 206);
        }

        .color10 {
            background-color: rgb(210, 173, 181);
        }
    </style>
</head>
<body style="overflow:hidden">
<jsp:include page="../includes/header.jsp"/>
<!-- BEGIN CONTENT -->
<div class="main">
    <div class="container">
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <div class="row" style="margin-top: 100px;">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-8" id="chats">
                        <div>
                        <p style="font-size:2em;font-weight: 900;color:rgb(228,101,53);letter-spacing:3px;display:inline;">树懒问答</p>
                            <p style="font-weight: 900;color:rgb(178,178,179);display:inline;margin-right: 360px;">SLOTH QUESTION ANSWER</p>
                            <div style="width:100px;display:inline;"></div>
                            <button class="btn red"style="display:inline;  " id="clear">清屏</button>
                        </div>
                        <div class="scroller" style="  margin-top: 5px;height: 4px; border-top: 2px solid #ddd;text-align: center;box-shadow: 3px 3px 10px #9edeff;"></div>
                        <div class="scroller" style=" margin-top: 5px;height: 420px;background-color:rgb(251,251,251)" data-always-visible="1" data-rail-visible1="1"; >
                            <ul class="chats">
                                <li class="in">
                                    <img class="avatar img-responsive" alt=""
                                         src="<c:url value="/assets/index/images/shulan2.png"/>"/>
                                    <div class="message">
											<span class="arrow">
											</span>
                                        <a href="#email" class="name">
                                            树小懒
                                        </a>
                                        <span class="datetime">
                                            ——&nbsp;
                                            <jsp:useBean id="now" class="java.util.Date"/>
                                            <fmt:formatDate value="${now}" type="both" dateStyle="long"
                                                            pattern="yyyy/MM/dd"/>
                                        </span>
                                        <span class="body">
                                            欢迎来到自动问答模块，您的问题将会由智慧的树小懒来解答。
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="chat-form">
                            <div class="input-cont">
                                <input class="form-control" type="text" placeholder="在这输入您的问题"/>
                            </div>
                            <div class="btn-cont">
									<span class="arrow">
									</span>
                                <a href="" class="btn blue icn-only" style="padding-top: 10px; padding-bottom: 10px;">
                                    <i class="fa fa-check icon-white"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row" style="display: none" id="answerExperts">
    <div class="col-md-12 expertsWrap" id="demo">
        <div class="note note-success col-md-12">
            <div class="col-md-2">
                <img src="<c:url value="/assets/admin/layout/img/avatar2.jpg"/>" alt="">
            </div>
            <div class="col-md-10">
                <a href="javascript:;" class="expertName" onclick="toExpertDetail('${hExpert.id}')">专家名</a>

                <p style="margin: 10px 0px">
                    <a href="javascript:;" class="theme"
                       onclick="toThemeExperts('${theme.id}')">材料科学</a>
                </p>
            </div>
        </div>
    </div>
</div>
<div class="row" style="display: none">
    <div class="col-md-12" id="email">
        <div class="col-md-12">
            <div class="form-body">
                <div class="form-group">
                    <label>你的邮箱</label>

                    <div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-envelope"></i>
											</span>
                        <input type="text" class="form-control" placeholder="邮箱地址" id="usermail">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">密码</label>

                    <div class="input-group">
                        <input type="password" class="form-control" id="password" placeholder="邮箱密码">
											<span class="input-group-addon">
											<i class="fa fa-user"></i>
											</span>
                    </div>
                </div>
                <div class="form-group">
                    <label>邮件标题</label>

                    <div class="input-icon">
                        <i class="fa fa-bell-o"></i>
                        <input type="text" class="form-control" placeholder="标题" id="title">
                    </div>
                </div>
                <div class="form-group">
                    <label>内容</label>
                    <textarea class="form-control" rows="3" id="body"></textarea>
                </div>
                <div class="form-actions">
                    <button type="button" class="btn default pull-right" id="cancel">取消</button>
                    <button type="button" class="btn blue pull-right" id="send">发送</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../includes/script.jsp"/>
<script src="<c:url value="/js/frontend/AutoAnswerPage.js"/>" type="text/javascript"></script>
<script>
    function clearEmailForm(){
        $("#email input,textarea").val("");
    }
    $("#cancel").on("click",function (){
        $.fancybox.close();
        clearEmailForm();
    });
    $("#send").on("click",function (){
        $.ajax({
            url:basePath + "/autoAnswer/sendMail",
            type:"post",
            dataType:"json",
            data:{
                email:"391424924@qq.com",
                subject:$("#title","#email").val(),
                body:$("#body","#email").val(),
                user:$("#usermail","#email").val(),
                password:$("#password","#email").val()
            },
            success:function (data){
                if(data == 0)
                toast.error("表示标题或内容无意义!")
                if(data == 1)
                toast.error("表示连接时出错，确认账号密码是否正确以及smtp服务是否开启!")
                if(data == 2) {
                    toast.info("邮件发送成功!");
                    $.fancybox.close();
                    clearEmailForm();
                }
            }
        })
    });
    AutoAnswerPage.init();
    (function () {

        var cont = $('#chats');
        var list = $('.chats', cont);
        var form = $('.chat-form', cont);
        var input = $('input', form);
        var btn = $('.btn', form);

        var handleClick = function (e) {
            e.preventDefault();

            var text = input.val();
            if (text.length == 0 || $.trim(text) == "") {
                return;
            }

            var time = new Date();
            var time_str = time.toLocaleDateString();
            var tpl = '';
            tpl += '<li class="out">';
            tpl += '<img class="avatar" alt="" src="' + basePath + '/assets/admin/layout/img/avatar1.jpg"/>';
            tpl += '<div class="message">';
            tpl += '<span class="arrow"></span>';
            tpl += '<a href="#" class="name">你</a>&nbsp;';
            tpl += '<span class="datetime">—— ' + time_str + '</span>';
            tpl += '<span class="body">';
            tpl += text;
            tpl += '</span>';
            tpl += '</div>';
            tpl += '</li>';

            var msg = list.append(tpl);

            AutoAnswerPage.getAnswer();
            if(input.val().match("什么是")||input.val().match("是什么")){
              AutoAnswerPage.getFile();
            }
            input.val("");
            $('.scroller', cont).slimScroll({
                scrollTo: list.height()
            });
        };

        btn.click(handleClick);
        input.keypress(function (e) {
            if (e.which == 13) {
                handleClick(e);
                return false; //<---- Add this line
            }
        });
    })();
    $(".chats li.in .message .name").fancybox({
        'centerOnScroll': true
    });
    $(window).on("unload", function () {
        console.log("触发");
    })
</script>
</body>
</html>
