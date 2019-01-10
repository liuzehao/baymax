<%--
  Created by IntelliJ IDEA.
  User: SunJQ
  Date: 2016/5/9
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<html>

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>主题</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <!--fa 图标显示-->
    <link href="../assetsallP/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">





    <link href="../assetsallP/frontend/layout/css/style.css" rel="stylesheet">
    <link href="../assetsallP/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
    <link href="../assetsallP/frontend/pages/css/style-layer-slider.css" rel="stylesheet">
    <link href="../assetsallP/frontend/layout/css/style-responsive.css" rel="stylesheet">
    <link href="../assetsallP/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
    <link href="../assets3_0/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">

    <link href="../assetsallP/frontend/layout/css/custom.css" rel="stylesheet">
<META name="baidu-site-verification" content="HmwwEvMGyf">
<META http-equiv="content-type" content="text/html; charset=utf-8">
<META http-equiv="X-UA-Compatible" content="IE=Edge">
<TITLE>知识库 -你身边的技术百科全书 - CSDN</TITLE>
<META name="Keywords" content="知识库,微信开发,机器学习,swift,Android,Python,Java,大数据,云计算,PHP,Ruby,C++,JavaScript">

<META name="Description" content="CSDN知识库，按照技术领域和知识结构对海量技术资源进行筛选整理，并通过相关机制进行审核收录。保证入库知识的系统性与优质性。并且所含技术知识图谱有清晰的学习脉络，是技术开发者完善自我知识体系、提升进阶的参照坐标">
<link href="../assetsallP/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

<LINK href="../newTheme_files/common.css" rel="stylesheet">
<LINK href="../newTheme_files/index.css" rel="stylesheet">
<LINK href="../newTheme_files/font-awesome.min.css" rel="stylesheet">
<LINK href="../newTheme_files/iconfont.min.css" rel="stylesheet">
<LINK href="../newTheme_files/icon.css" rel="stylesheet">
<LINK href="/images/web/favicon.ico" rel="SHORTCUT ICON">
<script src="../assetsallP/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="../assetsallP/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="../assetsallP/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<SCRIPT src="../newTheme_files/statist.min.js" type="text/javascript"></SCRIPT>
<LINK id="colors" href="/min/colors.min.css" rel="stylesheet">
<SCRIPT type="text/javascript">window.NREUM||(NREUM={});NREUM.info = {"agent":"","beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"7dc04976a0","applicationID":"15009246","applicationTime":207.418212,"transactionName":"Z10AZEZSD0VTUExYCV4XJ0hEQQRFQVlLHiF1bE0fHg==","queueTime":0,"ttGuid":"e8adcba1cc7568","agentToken":null}; window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(e,t){return function(){o(e,[(new Date).getTime()].concat(a(arguments)),null,t)}}var o=e("handle"),i=e(2),a=e(3);"undefined"==typeof window.newrelic&&(newrelic=NREUM);var u=["setPageViewName","setCustomAttribute","finished","addToTrace","inlineHit"],c=["addPageAction"],f="api-";i(u,function(e,t){newrelic[t]=r(f+t,"api")}),i(c,function(e,t){newrelic[t]=r(f+t)}),t.exports=newrelic,newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),o("err",[e,(new Date).getTime()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(0>o?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?u(e,a,i):i()}function n(n,r,o){e&&e(n,r,o);for(var i=t(o),a=l(n),u=a.length,c=0;u>c;c++)a[c].apply(i,r);var s=f[g[n]];return s&&s.push([m,n,r,i]),i}function p(e,t){w[e]=l(e).concat(t)}function l(e){return w[e]||[]}function d(e){return s[e]=s[e]||o(n)}function v(e,t){c(e,function(e,n){t=t||"feature",g[n]=t,t in f||(f[t]=[])})}var w={},g={},m={on:p,emit:n,get:d,listeners:l,context:t,buffer:v};return m}function i(){return new r}var a="nr@context",u=e("gos"),c=e(2),f={},s={},p=t.exports=o();p.backlog=f},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!w++){var e=v.info=NREUM.info,t=s.getElementsByTagName("script")[0];if(e&&e.licenseKey&&e.applicationID&&t){c(l,function(t,n){e[t]||(e[t]=n)});var n="https"===p.split(":")[0]||e.sslForHttp;v.proto=n?"https://":"http://",u("mark",["onload",a()],null,"api");var r=s.createElement("script");r.src=v.proto+e.agent,t.parentNode.insertBefore(r,t)}}}function o(){"complete"===s.readyState&&i()}function i(){u("mark",["domContent",a()],null,"api")}function a(){return(new Date).getTime()}var u=e("handle"),c=e(2),f=window,s=f.document;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:f.XMLHttpRequest,REQ:f.Request,EV:f.Event,PR:f.Promise,MO:f.MutationObserver},e(1);var p=""+location,l={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-943.min.js"},d=window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&!/CriOS/.test(navigator.userAgent),v=t.exports={offset:a(),origin:p,features:{},xhrWrappable:d};s.addEventListener?(s.addEventListener("DOMContentLoaded",i,!1),f.addEventListener("load",r,!1)):(s.attachEvent("onreadystatechange",o),f.attachEvent("onload",r)),u("mark",["firstbyte",a()],null,"api");var w=0},{}]},{},["loader"]);</SCRIPT>

<SCRIPT>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?6bcd52f51e9b3dce32bec4a3997715ac";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</SCRIPT>
    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
<META name="GENERATOR" content="MSHTML 11.00.9600.18283">


    <script>
        function getThemeDetail(id) {

            location.href = basePath + "theme/getThemeDetail?id="+id;
        }
    </script>
</HEAD>
<jsp:include page="../includes/header.jsp"/>
<BODY>


<DIV class="main clearfix">
   <LINK href="../newTheme_files/kn_index.min.css" rel="stylesheet">
    <STYLE>
        a.fc31 {
            color: #cb1910 !important;
        }
        a.fc31:hover {
            color: #a70c04 !important;
        }


        a.fc14 {
            color: #274e70 !important;
        }
        a.fc14:hover {
            color: #143447 !important;
        }


        a.fc15 {
            color: #97c024 !important;
        }
        a.fc15:hover {
            color: #80a615 !important;
        }


        a.fc13 {
            color: #437b99 !important;
        }
        a.fc13:hover {
            color: #326a88 !important;
        }


        a.fc17 {
            color: #76aac6  !important;
        }
        a.fc17:hover {
            color: #5c93b0 !important;
        }


        a.fc16 {
            color: #325d6b !important;
        }
        a.fc16:hover {
            color: #1a3b46 !important;
        }

    </STYLE>
    <LINK href="../newTheme_files/kn_index.min.css" rel="stylesheet">
    <DIV class="header_top">
        <DIV class="banner">
            <P class="text" style="padding-top: 130px;">知识库，你身边的百科全书</P>
        </DIV>
    </DIV>



    <SCRIPT>
        $('.search_btn').click(function(){
            goSearch();
        });

        $('.searchiput').keydown(function(){
            if(event.keyCode==13)
                goSearch();
        });

        function goSearch(e){
            if($('#kwd').val()===''){
                alert('请填写搜索关键字') ;
            }
            else if($('#serchhide').val() ===''){
                alert('请选择知识库') ;
            }
            else{
                window.location.href="/search/" + $('#serchhide').val() + "/" + $('#kwd').val();
            }
        }
    </SCRIPT>

    <DIV class="mainCol clearfix padding15px">
        <DIV class="kn_cloumn ">
            <UL class="list01 clearfix">
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1462327594341_341.jpg">
                        </DIV><SPAN><A href="#"  onclick="getThemeDetail(6)"><IMG width="80" height="80" alt="" src="../newTheme_files/xinxi.jpg"></A></SPAN></DIV>
                    <P><A class="title" href="#" onclick="getThemeDetail(6)">信息科技</A><SPAN class="content">信息科学技术专业培养具有扎实的数学、物理、电子和计算机的基础知识，系统地掌握光学信息处理技术、现代电子学技术和计算机应用技术的基本技能，能在特别是光机电算一体化产业从事科学研究的高级专门人才</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1461807588401_401.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(4)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/nongye.png"></A></SPAN></DIV>
                    <P><A class="title"  onclick="getThemeDetail(4)" href="#">农业技术</A><SPAN
                            class="content">为了加强农业技术推广工作，促使农业科研成果和实用技术尽快应用于农业生产，保障农业的发展，实现农业现代化，制定本法。</SPAN></P></LI>

                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1461035533624_624.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(5)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/yiyao.png"></A></SPAN></DIV>
                    <P><A class="title" onclick="getThemeDetail(5)" href="#">医药卫生</A><SPAN class="content">医疗学是连接健康科学和化学科学的医疗行业，它承担着确保药品的安全和有效使用的职责。主要任务使病患得以以伤害最小，效益最大的方式治疗或治愈疾病。</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1460535308967_967.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(7)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/zhexue.png"></A></SPAN></DIV>
                    <P><A class="title" onclick="getThemeDetail(7)" href="#">哲学与人文</A><SPAN class="content">哲学与人文研究对象与研究者自身都具有强烈的主体性、个体性、多变性和丰富性。学科包括文学、历史、哲学、艺术、宗教、美学、伦理学。</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1459143634893_893.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(1)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/jichu.png"></A></SPAN></DIV>
                    <P><A class="title"  onclick="getThemeDetail(1)" href="#">基础科学</A><SPAN class="content">基础科学以自然现象和物质运动形式为研究对象，探索自然界发展规律的科学。包括数学、物理学、化学、生物学、天文学、地球科学、逻辑学七门基础学科及其分支学科、边缘学科。</SPAN></P></LI>

                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1458526868518_518.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(2)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/gongcheng.png"></A></SPAN></DIV>
                    <P><A class="title"   onclick="getThemeDetail(2)"href="#">工程科技1辑</A><SPAN
                            class="content">工程造福人类，科技创造未来。历史证明，工程科技创新驱动着历史车轮飞速旋转，推动人类从蒙昧走向文明、从游牧文明走向农业文明、工业文明，走向信息化时代。</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1452500783519_519.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(3)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/gongcheng1.png"></A></SPAN></DIV>
                    <P><A class="title" onclick="getThemeDetail(3)" href="#">工程科技2辑</A><SPAN
                            class="content">工程造福人类，科技创造未来。历史证明，工程科技创新驱动着历史车轮飞速旋转，推动人类从蒙昧走向文明、从游牧文明走向农业文明、工业文明，走向信息化时代。</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1453169124795_795.jpg">
                        </DIV><SPAN><A href="#" onclick="getThemeDetail(8)"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/shehui.png"></A></SPAN></DIV>
                    <P><A class="title"  onclick="getThemeDetail(8)"href="#">社会科学1辑</A><SPAN class="content">社会科学包括哲学类、经济学类、法学类、教育学类、文学类、 艺术类 、历史学类、管理学类、政治学类 、马克思主义理论类、新闻传播学类、社会学类、中国语言文学类、外国语言文学类等多个学科的所有专业。</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1456818036186_186.jpg">
                        </DIV><SPAN><A onclick="getThemeDetail(9)"href="#"><IMG width="80"
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/shehui1.png"></A></SPAN></DIV>
                    <P><A class="title" onclick="getThemeDetail(9)" href="#">社会科学2辑</A><SPAN class="content">社会科学包括哲学类、经济学类、法学类、教育学类、文学类、 艺术类 、历史学类、管理学类、政治学类 、马克思主义理论类、新闻传播学类、社会学类、中国语言文学类、外国语言文学类等多个学科的所有专业。</SPAN></P></LI>
                <LI>
                    <DIV class="spantop bk0">
                        <DIV class="imgtop"><IMG width="360" height="94" alt="" src="../newTheme_files/1454051093847_847.jpg">
                        </DIV><SPAN><A onclick="getThemeDetail(10)"href="#"><IMG width="80"
                                                                               height="80" alt=""
                                                                               height="80" alt=""
                                                                               src="../newTheme_files/jingji.png"></A></SPAN></DIV>
                    <P><A class="title"  onclick="getThemeDetail(10)"href="#">经济管理</A><SPAN class="content">对行为主体基本倾向的抽象化认识形成经济学与管理学中的人性假设。经济学与管理学有不一样的派别，在经济学与管理学各自内部不一样派别之间的对人性假设的认识也不一致。</SPAN></P></LI>

            </UL>
        </DIV>
    </DIV>
</DIV>
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10">
                2016 © 长春工业大学
            </div>
        </div>
    </div>
</div>

<SCRIPT src="../newTheme_files/toolbar.js" type="text/javascript"></SCRIPT>

<SCRIPT src="../newTheme_files/knowledge_base.min.js" type="text/javascript"></SCRIPT>

<SCRIPT src="../newTheme_files/navs.min.js" type="text/javascript"></SCRIPT>

<script src="../assetsallP/plugins/respond.min.js"></script>
<![endif]-->
<script src="../assetsallP/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="../assetsallP/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="../assetsallP/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assetsallP/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
<script src="../assetsallP/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script src="../assetsallP/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
<script src="../assetsallP/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
<script src='../assetsallP/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
<script src="../assetsallP/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="../assetsallP/global/plugins/slider-layer-slider/js/greensock.js" type="text/javascript"></script><!-- External libraries: GreenSock -->
<script src="../assetsallP/global/plugins/slider-layer-slider/js/layerslider.transitions.js" type="text/javascript"></script><!-- LayerSlider script files -->
<script src="../assetsallP/global/plugins/slider-layer-slider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script><!-- LayerSlider script files -->
<script src="../assetsallP/frontend/pages/scripts/layerslider-init.js" type="text/javascript"></script>
<script src="../assets3_0/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
<!-- END LayerSlider -->

<script src="../assetsallP/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        Layout.init();
        Layout.initOWL();
        LayersliderInit.initLayerSlider();
        Layout.initImageZoom();
        Layout.initTouchspin();
        Layout.initTwitter();
    });
</script>
</BODY></HTML>

