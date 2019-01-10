<%--
  Created by IntelliJ IDEA.
  User: SunJQ
  Date: 15-4-5
  Time: 上午10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<link href="<c:url value="/assets/frontend/layout/css/style.css"/> " rel="stylesheet">
<link href="<c:url value="/assets/header/headerN.css"/> " rel="stylesheet">
<head>
    <style>


    .header-navigation {

        font-size: 1.4em;
        padding: 0 10px;
        text-decoration: none;
        text-transform: uppercase;
    }
        .font{
            font-family: "Vollkorn",serif;
            font-size: 	16.9px;
            padding: 0 10px;
            text-decoration: none;
            text-transform: uppercase;
        }
    .header-navigation .dropdown-menu > li:first-child {
        border-top: solid 0px #ea4c1d;
    }
</style>
    <script>
        $(window).scroll(function() {
            // 当滚动到最底部以上100像素时， 加载新内容
            if ( $(this).scrollTop() > 100) {

                $("#primary-nav1").slideUp(150);
                $("#primary-nav2").fadeIn(200);

            }
            if($(this).scrollTop()<100){
                $("#primary-nav2").slideUp(150);
                $("#primary-nav1").fadeIn(200);


            }
        });


        $(function(){
            $("input[type='search']").bind('keypress',function(event){
                if(event.keyCode == "13")
                {
                    location.href = basePath + "search?key="+$("input[type='search']").val()+"&direction=all";
                }
            });
        });

    </script>
<script>
    function logout() {
        location.href = basePath + "logout";
    }
    function toSearch(){
        location.href = basePath + "literature/search";
    }
    function toHome() {
        location.href = basePath;
    }
    function selfCenter(){
        location.href = basePath + "userCenter/handleUpload";
    }
    function toLogin(){
        location.href = basePath + "login";
    }
    function toRegistration(){
        location.href = basePath + "registration";
    }
    function toBack(){
        window.history.back();
    }
    function toLiterature(){
        location.href = basePath + "literature/getLiteratureList";
    }
    function toPatent(){
        location.href = basePath + "patent/getPatentList";
    }
    function toExpert(){
        location.href = basePath + "expert/getExpertList";
    }
    function toTheme(){
        location.href = basePath + "theme/getThemeList";
    }
    function toLiteratureDetail(id){
        location.href = basePath + "literature/getLiteratureDetail?id=" + id;
    }
    function toPatentDetail(id){
        location.href = basePath + "patent/getPatentDetail?id=" + id;
    }
    function toExpertDetail(id){
        location.href = basePath + "expert/getExpertDetail?id=" + id;
    }
    function toThemeExperts(themeId){
        window.location.href = basePath + "expert/getThemeExperts?themeId=" + themeId;
    }
    function toAnswer(){
        location.href = basePath + "autoAnswer/getPage";
    }
    function toNetwork(){
        location.href = basePath + "expertWeb/getExpertWeb";
    }
    function toRecommend(){
        location.href = basePath + "expertRecommend/getExpertRecommend";
    }
    function toFile(){
        location.href = basePath + "file/getFileList";
    }
    function toVideo(){
        location.href = basePath + "video/getVideoList";
    }
    function toPicture(){
        location.href = basePath + "picture/getAllPictureList";
    }
    function toAudio(){
        location.href = basePath + "audio/getAudioList";
    }
    function toGlobalSearch(){
        location.href=basePath+"global/getGlobalPage";
    }

</script>
</head>
<body>



<!--<div class="header" style="height: 80px;">
    <div class="container" style="margin-left: 345px;">
        <!-- BEGIN NAVIGATION -->
        <!--<div class="header-navigation pull-right font-transform-inherit" style="width: 1180px;font-family:'Vollkorn',serif;font-size:1.3em">
            <ul >
                <li style="margin-left:120px; margin-right: 20px;">
                    <a href="#"  onclick="toHome()" >主页</a>
                </li>
                <li style="margin-left: 20px; margin-right: 20px;">
                    <a href="#" onclick="toSearch()">
                        全库搜索
                        <i class="fa fa-angle-down"></i>
                    </a>
                </li>
                <li style="margin-left: 20px; margin-right: 20px;"><a data-hover="主题分类" onclick="toTheme()" class="scroll" style="cursor:pointer;">主题分类</a></li>
                <li class="dropdown" style="margin-left: 20px; margin-right: 20px;">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="javascript:;">
                        知识应用
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:;" onclick="toNetwork()">主题知识网络</a></li>
                        <li><a href="javascript:;" onclick="toRecommend()">知识推荐</a></li>
                        <li><a href="javascript:;" onclick="toAnswer()">树小懒问答</a></li>
                    </ul>
                </li>
                <li style="margin-left: 20px; margin-right: 20px;"><a data-hover="使用手册" href="#mail" class="scroll" style="cursor:pointer;">使用手册</a></li>
                <li>
                    <c:if test="${User.username == null}">
                        <button class="button font " id="login-btn" onclick="toLogin()" style=" margin: 25px 0px 0px 70px;">
                            登陆
                        </button>
                    </c:if>
                    <c:if test="${User.username != null}">
                        <button class="button  font" onclick="logout()" id="logout" style="margin-left: 50px; padding: 7px 25px; margin-top: 25px;font-size: 0.9em;height: 34px;" >注销</button>
                        <button class="button font " id="user-center" onclick="selfCenter('${User.userId}')"style=" padding: 7px 25px; margin-top: 25px;font-size: 0.9em;height: 34px;">${User.username}</button>
                    </c:if>
                </li>
                <li><input type="search"  style="margin-left: 40px;margin-top: 23px;" ></li>
            </ul>
        </div>
        <!-- END NAVIGATION -->
    <!--</div>
</div>-->

<nav id="primary-nav1" class="navbar navbar-default  navbar-fixed-top" style="height:120px;box-shadow: 0px 2px 2px 1px rgba(0, 0, 0, 0.15);">
    <div class = "container">
        <div class = "navbar-header navbar-left">
            <a href = "#" class = "navbar-brand">
                <img src="<c:url value="/images/newsloth4.png"/>"style="height: 82px ; width:200px;" />
            </a>

        </div>
        <div class = "collapse navbar-collapse header-navigation " style="width: 80%"  id="navbar-collapse">

            <ul class = "nav  navbar-nav navbar-right" style="margin-top:18px">
                <li><a href="#"  onclick="toHome()" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa fa-home" ></span>&nbsp;首页</a></li>
                <li>&nbsp;&nbsp;</li>
                <li><a href = "#"  onclick="toTheme()"><span class="fa fa-list"></span>&nbsp;主题分类</a></li>
                <li>&nbsp;&nbsp;</li>
                <li ><a  href="#" onclick="toAnswer()"><span class="fa  fa-comments-o"></span>树小懒问答</a></li>

                <li>&nbsp;&nbsp;</li>
                <li><a href = "#"onclick="toSearch()" ><span class="fa fa-search"></span>&nbsp;全局检索</a></li>
                <li>&nbsp;&nbsp;</li>


                <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <c:if test="${User.username == null}">
                    <LI style="float: right">

                        <A href="#"    onclick="toLogin()" >
                        <SPAN >
  									<img style="margin-bottom: -12%;margin-top: -13%;" src="<c:url value="/images/deng.png"/>"/>
                        </SPAN>
                        </A>
                    </LI>
                    <li>&nbsp;&nbsp;</li>
                </c:if>
                <c:if test="${User.username != null}">
                    <LI style="float: right">
                        <A href="#"  style="color:#7B72E9"  onclick="selfCenter('${User.userId}')">
                            <SPAN class="fa fa-user"></SPAN>&nbsp;${User.username}

                        </A>
                    </LI>
                    <li>&nbsp;&nbsp;</li>
                </c:if>
                <c:if test="${User.username != null}">
                    <LI style="float: right" >

                        <A href="#"  onclick="logout()"   style="color:#FEAD1B" >
                        <SPAN >
                           注销

                        </SPAN>
                        </A>
                    </LI>
                </c:if>




            </ul>

        </div>
    </div>
</nav>


<nav id="primary-nav2" class="navbar navbar-default  navbar-fixed-top" style="height:78px;background-color: rgba(62, 70, 81,0.9);display: none">
    <div class = "container">
        <div class = "navbar-header">
            <a href = "#" class = "navbar-brand">
                <img style="height: 50px ; width:120px;" src="<c:url value="/images/newsloth4.png"/>"/>
            </a>

        </div>
        <div class = "collapse navbar-collapse  header-navigation "  style="width: 80%" id="navbar-collapse">
            <ul class = "nav navbar-nav navbar-right" >
                <li><a href="#" style="color:#D8DADC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="fa fa-home" ></span>&nbsp;首页</a></li>
                <li>&nbsp;&nbsp;</li>
                <li><a href = "#" style="color:#D8DADC"><span class="fa fa-list"></span>&nbsp;主题分类</a></li>
                <li>&nbsp;&nbsp;</li>
                <li ><a  href="#" onclick="toAnswer()"style="color:#D8DADC "><span class="fa  fa-comments-o"></span>树小懒问答</a></li>
                <li>&nbsp;&nbsp;</li>
                <li><a href = "index.html"  style="color:#D8DADC"><span class="fa fa-search"></span>&nbsp;全局检索</a></li>


                <c:if test="${User.username == null}">
                    <LI style="float: right">
                        <A href="#"    onclick="toLogin()" style="color: #1abc9c" >
                        <SPAN class="fa fa-user"></SPAN>&nbsp;Login
                        </A>
                    </LI>
                    <li>&nbsp;&nbsp;</li>
                </c:if>
                <c:if test="${User.username != null}">
                    <LI style="float: right">
                        <A href="#"  style="color:#7B72E9"  onclick="selfCenter('${User.userId}')">
                            <SPAN class="fa fa-user"></SPAN>&nbsp;${User.username}

                        </A>
                    </LI>
                    <li>&nbsp;&nbsp;</li>
                </c:if>
                <c:if test="${User.username != null}">
                    <LI style="float: right" >

                        <A href="#"  onclick="logout()"   style="color:#FEAD1B" >
                        <SPAN >
                           注销

                        </SPAN>
                        </A>
                    </LI>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<br><br><br><br><br><br>

</body>
</html>
