<%--
  Created by IntelliJ IDEA.
  User: SunJQ
  Date: 15-4-5
  Time: 上午10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<html>
<head>
    <title>全库搜索</title>
    <link rel="stylesheet" type="text/css" href="../slider/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="../slider/css/default.css">

    <link href="../slider/css/bootstrap-slider.min.css" rel="stylesheet">

    <jsp:include page="../includes/style.jsp"/>
    <script>

        function a(){
            $("#X").hide();
            $("#Y").show();
            $("#gaoji").show();
        }
        function b(){
            $("#Y").hide();
            $("#X").show();
            $("#gaoji").hide();
        }
        function key2(){
            $("#key3").show();
            $("#jia").hide();
            $("#keyj2").show();
            $("#jia1").show();
        }
        function key3(){
            $("#key4").show();
            $("#jia1").hide();
            $("#jia2").show();
        }
        function key4(){
            $("#key5").show();
            $("#jia2").hide();
        }
        function keyj5(){
            $("#key5").hide();
            $("#jia2").show();
        }
        function keyj4(){
            $("#key4").hide();
            $("#key5").hide();
            $("#jia1").show();
        }
        function keyj3(){
            $("#key3").hide();
            $("#key4").hide();
            $("#key5").hide();
            $("#jia").show();
            $("#keyj2").hide();
        }
        function keyj2(){
            $("#key3").hide();
            $("#key4").hide();
            $("#key5").hide();
            $("#keyj2").hide();
            $("#jia").show();

        }

        function global(){
            $("#global").show();
            $("#picture").hide();
            $("#video").hide();
            $("#audio").hide();
            $("#file").hide();
            $("#global1").hide();
        }
        function picture(){
            $("#picture").show();
            $("#global").hide();
            $("#video").hide();
            $("#audio").hide();
            $("#file").hide();
            $("#global1").hide();

        }
        function video(){
            $("#video").show();
            $("#global").hide();
            $("#picture").hide();
            $("#audio").hide();
            $("#file").hide();
            $("#global1").hide();

        }
        function audio(){
            $("#audio").show();
            $("#global").hide();
            $("#picture").hide();
            $("#video").hide();
            $("#file").hide();
            $("#global1").hide();

        }
        function audio(){
            $("#audio").show();
            $("#global").hide();
            $("#picture").hide();
            $("#video").hide();
            $("#file").hide();
            $("#global1").hide();

        }
        function file(){
            $("#file").show();
            $("#global").hide();
            $("#picture").hide();
            $("#video").hide();
            $("#audio").hide();
            $("#global1").hide();

        }
        function global1(){
            $("#global1").show();
            $("#global").hide();
            $("#picture").hide();
            $("#video").hide();
            $("#file").hide();
            $("#audio").hide();

        }

    </script>

    <style>
        #ex1Slider .slider-selection {
            background: #BABABA;
        }
    </style>
</head>
<body>
<jsp:include page="../includes/header.jsp"/>
<div class="main">
    <div class="container">
        <br><br><br><br>
        <div class="row">
            <div class="col-md-12" style="text-align: center;">
                <a  style="font-size: 100px; font-style:italic; "><img src="../images/sloth2.png"/></a>
            </div>
        </div>
        <br>

        <br>
        <div class="row">
            <div class="col-md-10 col-sm-10 col-md-offset-2" >
                <form class="form" method="get" action="search1" id="global">

                    <div class="row" >
                        <div class="col-md-12" style="text-align: center">
                            <div class="col-md-2"></div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#e84d1c;font-size: 16px;" onclick="global() ">全局</a>
                            </div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="picture()">图片</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="video()">视频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="audio()">音频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="file()">文档</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="global1()"> 全网</a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12">
                        <div class="col-md-8" style="padding-left: 0px;padding-right: 0px;">
                            <input  style="height:42px;line-height: 42px;" type="text" class="form-control" name="key" placeholder="全局搜索">

                            <input type="hidden" value="all2" name="direction">

                            <input name="userId"   value="${User.userId}" style="display: none" >
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit" style="height:42px;">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>&nbsp;&nbsp;

                            <a href="#" onclick="a()" id="X">显示高级搜索</a>
                            <a href="#" onclick="b()"  id ="Y" style="display: none">隐藏高级搜索</a>
                        </div>

                    </div>
                </form>
                <!--图片-->
                <form class="form" method="get" action="search1"  id="picture" style="display: none">

                    <div class="row" >
                        <div class="col-md-12" style="text-align: center" >
                            <div class="col-md-2"></div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="global()">全局</a>
                            </div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#e84d1c;font-size: 16px; " onclick="picture()">图片</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="video()">视频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="audio()">音频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="file()">文档</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="global1()"> 全网</a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12">
                        <div class="col-md-8" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" style="height:42px;" class="form-control" name="key" placeholder="图片搜索">

                            <input type="hidden" value="picture" name="direction">

                            <input name="userId"   value="${User.userId}" style="display: none" >
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit" style="height:42px;">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>&nbsp;&nbsp;

                            <a href="#" onclick="a()" id="X">显示高级搜索</a>
                            <a href="#" onclick="b()"  id ="Y" style="display: none">隐藏高级搜索</a>
                        </div>

                    </div>
                </form>

                <!--视频-->
                <form class="form" method="get" action="search1"  id="video" style="display: none">

                    <div class="row" >
                        <div class="col-md-12" style="text-align: center" >
                            <div class="col-md-2"></div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="global()">全局</a>
                            </div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="picture()">图片</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#e84d1c;font-size: 16px;" onclick="video()">视频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="audio()">音频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="file()">文档</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="global1()"> 全网</a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12">
                        <div class="col-md-8" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" style="height:42px;" class="form-control" name="key" placeholder="视频搜索">

                            <input type="hidden" value="video" name="direction">

                            <input name="userId"   value="${User.userId}" style="display: none" >
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit" style="height:42px;">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>&nbsp;&nbsp;

                            <a href="#" onclick="a()" id="X">显示高级搜索</a>
                            <a href="#" onclick="b()"  id ="Y" style="display: none">隐藏高级搜索</a>
                        </div>

                    </div>
                </form>

                <!--audio-->
                <form class="form" method="get" action="search1"  id="audio" style="display: none">

                    <div class="row" >
                        <div class="col-md-12" style="text-align: center" >
                            <div class="col-md-2"></div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="global()">全局</a>
                            </div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="picture()">图片</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="video()">视频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#e84d1c;font-size: 16px; " onclick="audio()">音频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="file()">文档</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="global1()"> 全网</a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12">
                        <div class="col-md-8" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" style="height:42px;" class="form-control" name="key" placeholder="音频搜索">

                            <input type="hidden" value="audio" name="direction">

                            <input name="userId"   value="${User.userId}" style="display: none" >
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit" style="height:42px;">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>&nbsp;&nbsp;

                            <a href="#" onclick="a()" id="X">显示高级搜索</a>
                            <a href="#" onclick="b()"  id ="Y" style="display: none">隐藏高级搜索</a>
                        </div>

                    </div>
                </form>

                <!--file-->
                <form class="form" method="get" action="search1"  id="file" style="display: none">

                    <div class="row" >
                        <div class="col-md-12" style="text-align: center" >
                            <div class="col-md-2"></div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="global()">全局</a>
                            </div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="picture()">图片</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="video()">视频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="audio()">音频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#e84d1c;font-size: 16px; " onclick="file()">文档</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="global1()"> 全网</a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12">
                        <div class="col-md-8" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" style="height:42px;" class="form-control" name="key" placeholder="文件搜索">

                            <input type="hidden" value="literature" name="direction">

                            <input name="userId"   value="${User.userId}" style="display: none" >
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit" style="height:42px;">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>&nbsp;&nbsp;

                            <a href="#" onclick="a()" id="X">显示高级搜索</a>
                            <a href="#" onclick="b()"  id ="Y" style="display: none">隐藏高级搜索</a>
                        </div>

                    </div>
                </form>
                <!--全网-->
                <form class="form" method="get" action="search1"  id="global1" style="display: none">
                    <div class="row" >
                        <div class="col-md-12" style="text-align: center" >
                            <div class="col-md-2"></div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="global()">全局</a>
                            </div>
                            <div class="col-md-1 " style="text-align: center">
                                <a href="#" name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="picture()">图片</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px;" onclick="video()">视频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5;font-size: 16px; " onclick="audio()">音频</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#B5B5B5 ;font-size: 16px;" onclick="file()">文档</a>
                            </div>
                            <div class="col-md-1" style="text-align: center">
                                <a href="#"  name="flag" style="color:#e84d1c;font-size: 16px; " onclick="global1()"> 全网</a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </div>
                    <br>
                    <div class="col-md-12">
                        <div class="col-md-8" style="padding-left: 0px;padding-right: 0px;">
                            <input type="text" style="height:42px;" class="form-control" name="key" placeholder="全网搜索">
                            <input type="hidden" value="global1" name="direction">
                            <input name="userId"   value="${User.userId}" style="display: none" >
                        </div>
                        <div class="col-md-3" style="padding-left: 0px;">
                            <button class="btn green" type="submit" style="height:42px;">&nbsp;<i class="fa fa-search"></i>&nbsp;</button>&nbsp;&nbsp;

                            <a href="#" onclick="a()" id="X">显示高级搜索</a>
                            <a href="#" onclick="b()"  id ="Y" style="display: none">隐藏高级搜索</a>
                        </div>

                    </div>
                </form>

            </div>
        </div>

        </div><br><br><br>
        <div class="row" style="display: none;" id ="gaoji" >
            <div class="col-md-10  col-sm-10  col-md-offset-1 " >
                <form class="form" method="get" action="search1">

                    <!--key-->
                    <div class="col-md-12">
                        <div class="col-md-1"></div><div class="col-md-2" style="width: 12%"></div>
                        <div class="col-md-2" style="width: 12%">

                            <select class="form-control" name="field" >
                                <option value="AllTitle">标题</option>
                                <option value="author">作者</option>
                                <option value="AllAbs">摘要</option>
                                <option value="AllKey">关键字</option>
                                <option value="author">类型</option>
                                <option value="AllInAbs">内容</option>
                            </select>
                        </div>
                        <div class="col-md-4" style="padding-left: 0px;padding-right: 0px;width: 30%">
                            <input type="text" class="form-control" name="key" placeholder="输入对应搜索内容">

                            <input type="hidden" value="all1" name="direction">
                        </div>
                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate11">
                                <option value="no" selected style="display: none">词频</option>
                                <option value="precise">1</option>
                                <option value="fuzzy">2</option>
                                <option value="fuzzy">3</option>
                            </select>
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate">
                                <option value="precise">精确</option>
                                <option value="fuzzy">模糊</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12"><br></div>
                    <!--key end-->

                    <!--key1-->
                    <div class="col-md-12">
                        <div class="col-md-1" ></div>
                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control"  name="judge">
                                <option value="must">并且</option>
                                <option value="should">或者</option>
                                <option value="notmust">不包含</option>
                            </select>
                        </div>
                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="field1" >
                                <option value="AllAbs">摘要</option>
                                <option value="AllTitle">标题</option>
                                <option value="author">作者</option>
                                <option value="AllKey">关键字</option>
                                <option value="author">类型</option>
                                <option value="AllInAbs">内容</option>
                            </select>
                        </div>
                        <div class="col-md-2" style="padding-left: 0px;padding-right: 0px;width: 30%" >
                            <input type="text" class="form-control" name="key1" placeholder="输入对应搜索内容">

                            <input type="hidden" value="all1" name="direction">
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate11">
                                <option value="no" selected style="display: none">词频</option>
                                <option value="precise">1</option>
                                <option value="fuzzy">2</option>
                                <option value="fuzzy">3</option>
                            </select>
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate1">
                                <option value="precise">精确</option>
                                <option value="fuzzy">模糊</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12"><br></div>
                    <!--key1 end-->
                    <!--key2-->
                    <div class="col-md-12">
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#" onclick="key2()"  id="jia">
                                <img src="../images/jia.jpg" />
                            </a>
                        </div>

                        <div class="col-md-2" style="width: 12%">

                            <select class="form-control"  name="judge1">
                                <option value="must">并且</option>
                                <option value="should">或者</option>
                                <option value="notmust">不包含</option>
                            </select>
                        </div>
                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="field2" >
                                <option value="AllKey">关键字</option>
                                <option value="AllAbs">摘要</option>
                                <option value="AllTitle">标题</option>
                                <option value="author">作者</option>
                                <option value="author">类型</option>
                                <option value="AllInAbs">内容</option>
                            </select>

                        </div>
                        <div class="col-md-4" style="padding-left: 0px;padding-right: 0px; width: 30%">
                            <input type="text" class="form-control" name="key2" placeholder="输入对应搜索内容">

                            <input type="hidden" value="all1" name="direction">
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate11">
                                <option value="no" selected style="display: none">词频</option>
                                <option value="precise">1</option>
                                <option value="fuzzy">2</option>
                                <option value="fuzzy">3</option>
                            </select>
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate2">
                                <option value="precise">精确</option>
                                <option value="fuzzy">模糊</option>
                            </select>
                        </div>
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#" onclick="keyj2()" id="keyj2" style="display: none"><img src="../images/jian.jpg" /></a>
                        </div>
                    </div>
                    <div class="col-md-12"><br></div>
                    <!--key2 end-->
                    <!--key3-->
                    <div class="col-md-12" style="display: none" id="key3">
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#" onclick="key3()" id="jia1"><img src="../images/jia.jpg" /></a>
                        </div>
                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control"  name="judge2">
                                <option value="must">并且</option>
                                <option value="should">或者</option>
                                <option value="notmust">不包含</option>
                            </select>
                        </div>
                        <div class="col-md-2 "  style="width: 12%">
                            <select class="form-control" name="field3" >
                                <option value="AllInAbs">内容</option>
                                <option value="AllKey">关键字</option>
                                <option value="AllAbs">摘要</option>
                                <option value="AllTitle">标题</option>
                                <option value="author">作者</option>
                                <option value="author">类型</option>

                            </select>

                        </div>
                        <div class="col-md-4" style="padding-left: 0px;padding-right: 0px;width: 30%">
                            <input type="text" class="form-control" name="key3" placeholder="输入对应搜索内容">

                            <input type="hidden" value="all1" name="direction">
                        </div>
                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate11">
                                <option value="no" selected style="display: none">词频</option>
                                <option value="precise">1</option>
                                <option value="fuzzy">2</option>
                                <option value="fuzzy">3</option>
                            </select>
                        </div>

                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control" name="accurate3">
                                <option value="precise">精确</option>
                                <option value="fuzzy">模糊</option>
                            </select>
                        </div>
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#" onclick="keyj3()" ><img src="../images/jian.jpg" /></a>
                        </div>

                    </div>
                    <div class="col-md-12"><br></div>
                    <!--key3 end-->
                    <!--key4-->
                    <div class="col-md-12" style="display: none" id="key4">
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#"  onclick="key4()" id ="jia2"><img src="../images/jia.jpg" /></a>
                        </div>

                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control"  name="judge3">
                                <option value="must">并且</option>
                                <option value="should">或者</option>
                                <option value="notmust">不包含</option>
                            </select>
                        </div>
                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control" name="field4" >
                                <option value="AllInAbs">内容</option>
                                <option value="AllKey">关键字</option>
                                <option value="AllAbs">摘要</option>
                                <option value="AllTitle">标题</option>
                                <option value="author">作者</option>
                                <option value="author">类型</option>
                            </select>

                        </div>
                        <div class="col-md-4" style="padding-left: 0px;padding-right: 0px;width: 30%">
                            <input type="text" class="form-control" name="key4" placeholder="输入对应搜索内容">
                            <input type="hidden" value="all1" name="direction">
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate11">
                                <option value="no" selected style="display: none">词频</option>
                                <option value="precise">1</option>
                                <option value="fuzzy">2</option>
                                <option value="fuzzy">3</option>
                            </select>
                        </div>
                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control" name="accurate4">
                                <option value="precise">精确</option>
                                <option value="fuzzy">模糊</option>
                            </select>
                        </div>
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#" onclick="keyj4()" ><img src="../images/jian.jpg" /></a>
                        </div>
                    </div>
                    <div class="col-md-12"><br></div>
                    <!--key4 end-->
                    <!--key5-->
                    <div class="col-md-12" style="display: none" id="key5">
                        <div class="col-md-1" style=" text-align: right ;">
                        </div>
                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control"  name="judge4">
                                <option value="must">并且</option>
                                <option value="should">或者</option>
                                <option value="notmust">不包含</option>
                            </select>
                        </div>
                        <div class="col-md-2"  style="width: 12%">
                            <select class="form-control" name="field5">
                                <option value="AllInAbs">内容</option>
                                <option value="AllKey">关键字</option>
                                <option value="AllAbs">摘要</option>
                                <option value="AllTitle">标题</option>
                                <option value="author">作者</option>
                                <option value="author">类型</option>
                            </select>

                        </div>
                        <div class="col-md-4" style="padding-left: 0px;padding-right: 0px; width: 30%">
                            <input type="text" class="form-control" name="key5" placeholder="输入对应搜索内容">

                            <input type="hidden" value="all1" name="direction">
                        </div>

                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate11">
                                <option value="no" selected style="display: none">词频</option>
                                <option value="precise">1</option>
                                <option value="fuzzy">2</option>
                                <option value="fuzzy">3</option>
                            </select>
                        </div>
                        <div class="col-md-2" style="width: 12%">
                            <select class="form-control" name="accurate5">
                                <option value="precise">精确</option>
                                <option value="fuzzy">模糊</option>
                            </select>
                        </div>
                        <div class="col-md-1" style=" text-align: right ;">
                            <a href="#" onclick="keyj5()" ><img src="../images/jian.jpg" /></a>
                        </div>
                    </div>
                    <!--key5 end-->
                    <div class="row">
                        <div class="col-md-10 col-md-offset-2 ">
                            <div class=" col-md-2  " style="text-align: right; padding-top: 1.5%;" >
                                模糊度:
                            </div>
                            <div class="col-md-6">
                               <input  name="fuzzy" id="ex1" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="15" data-slider-step="1" data-slider-value="7"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12"><br></div>
                    <div class="row">
                        <div class="col-md-10   col-md-offset-1 ">
                            <div class="col-md-12"  >
                                <div class=" col-md-2 " style="text-align: right ; vertical-align: middle ;padding-top: 1%">
                                    上传日期：
                                </div>
                                <div class="col-md-2">
                                    <select class="form-control " name="year" id="year">
                                        <option value="no">不限</option>
                                        <option value="1990">1990</option><option value="1991">1991</option>
                                        <option value="1992">1992</option><option value="1993">1993</option>
                                        <option value="1994">1994</option><option value="1995">1995</option>
                                        <option value="1996">1996</option><option value="1997">1997</option>
                                        <option value="1998">1998</option><option value="1999">1999</option>
                                        <option value="2000">2000</option><option value="2001">2001</option>
                                        <option value="2002">2002</option><option value="2003">2003</option>
                                        <option value="2004">2004</option><option value="2005">2005</option>
                                        <option value="2006">2006</option><option value="2007">2007</option>
                                        <option value="2008">2008</option><option value="2009">2009</option>
                                        <option value="2010">2010</option><option value="2011">2011</option>
                                        <option value="2012">2012</option><option value="2013">2013</option>
                                        <option value="2014">2014</option><option value="2015">2015</option>
                                        <option value="2016">2016</option>
                                    </select>
                                </div>
                                <div class="col-md-1 " style="text-align: center ;padding-top: 1%;width: 5%;">
                                    至
                                </div>
                                <div class="col-md-2">
                                    <select class="form-control " name="year1" id="year1">
                                        <option value="no">不限</option>
                                        <option value="2016">2016</option><option value="2015">2015</option>
                                        <option value="2014">2014</option><option value="2013">2013</option>
                                        <option value="2012">2012</option><option value="2011">2011</option>
                                        <option value="2010">2010</option><option value="2009">2009</option>
                                        <option value="2008">2008</option><option value="2007">2007</option>
                                        <option value="2006">2006</option><option value="2005">2005</option>
                                        <option value="2004">2004</option><option value="2003">2003</option>
                                        <option value="2002">2002</option><option value="2001">2001</option>
                                        <option value="2000">2000</option><option value="1999">1999</option>
                                        <option value="1998">1998</option><option value="1997">1997</option>
                                        <option value="1996">1996</option><option value="1995">1995</option>
                                        <option value="1994">1994</option><option value="1993">1993</option>
                                        <option value="1992">1992</option><option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                    </select>
                                </div>
                                <div class="col-md-2" style="text-align: center ;padding-top: 1%">
                                    更新时间：
                                </div>
                                <div class="col-md-3" style="width: 18%">
                                    <SELECT  class="form-control ">
                                        <OPTION value=1 selected>一个月内</OPTION>
                                        <OPTION value=2>三个月内</OPTION>
                                        <OPTION value=3>半年内</OPTION>
                                        <OPTION value=4>一年内</OPTION>
                                        <OPTION value=5>当年内</OPTION>
                                    </SELECT>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12"><br><br></div>
                        <div class="col-md-12">
                            <div class="col-md-2 col-md-offset-4" style="text-align: center">
                                <button class="btn green" type="submit" >检索</button>
                            </div>
                            <div class="col-md-2 " style="text-align: center">
                                <a class="btn default" onclick="b()" >取消</a>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
        </div>
        <!-- BEGIN SIDEBAR & CONTENT -->
    </div>
</div>

<jsp:include page="../includes/script.jsp"/>


<script type='text/javascript' src="../slider/js/bootstrap-slider.min.js"></script>
<script type='text/javascript'>
    $(document).ready(function() {
        /* Example 1 */
        $('#ex1').slider({
            formatter: function(value) {
                return '模糊度: ' + value;
            }
        });
    });
</script>

</body>
</html>
