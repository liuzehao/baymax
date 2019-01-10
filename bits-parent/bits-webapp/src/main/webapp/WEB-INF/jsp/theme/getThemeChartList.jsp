<%--
  Created by IntelliJ IDEA.
  User: SunJQ
  Date: 2016/5/13
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<html>
<HEAD>
    <META content="IE=11.0000" http-equiv="X-UA-Compatible">
    <META name="baidu-site-verification" content="HmwwEvMGyf">
    <META http-equiv="content-type" content="text/html; charset=utf-8">
    <META http-equiv="X-UA-Compatible" content="IE=Edge">
    <TITLE>信息科技 -树懒知识库 </TITLE>
    <META name="Keywords" content="知识库,微信开发,机器学习,swift,Android,Python,Java,大数据,云计算,PHP,Ruby,C++,JavaScript">
    <META name="Description" content="CSDN知识库，按照技术领域和知识结构对海量技术资源进行筛选整理，并通过相关机制进行审核收录。保证入库知识的系统性与优质性。并且所含技术知识图谱有清晰的学习脉络，是技术开发者完善自我知识体系、提升进阶的参照坐标">
    <LINK href="../themeChart_files/bootstrap.css" rel="stylesheet">
    <LINK href="../themeChart_files/common.css" rel="stylesheet">
    <LINK href="../themeChart_files/index.css" rel="stylesheet">
    <LINK href="../themeChart_files/font-awesome.min.css" rel="stylesheet">
    <LINK href="../themeChart_files/iconfont.min.css" rel="stylesheet">
    <LINK href="../themeChart_files/icon.css" rel="stylesheet">

    <SCRIPT src="../themeChart_files/jquery-1.11.1.min.js" type="text/javascript"></SCRIPT>

    <SCRIPT src="../themeChart_files/bootstrap.min.js" type="text/javascript"></SCRIPT>

    <SCRIPT src="../themeChart_files/statist.min.js" type="text/javascript"></SCRIPT>
    <link href="../assetsallP/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <SCRIPT type="text/javascript">window.NREUM||(NREUM={});NREUM.info = {"agent":"","beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"7dc04976a0","applicationID":"15009246","applicationTime":11.247632,"transactionName":"Z10AZEZSD0VTUExYCV4XJ0hEQQRFQVlLHiF1bE0fHlEARVccAlMHQ10rVBtAFURHUExEFFU=","queueTime":0,"ttGuid":"cd8d933d8716f0","agentToken":null}; window.NREUM||(NREUM={}),__nr_require=function(e,t,n){function r(n){if(!t[n]){var o=t[n]={exports:{}};e[n][0].call(o.exports,function(t){var o=e[n][1][t];return r(o||t)},o,o.exports)}return t[n].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<n.length;o++)r(n[o]);return r}({1:[function(e,t,n){function r(e,t){return function(){o(e,[(new Date).getTime()].concat(a(arguments)),null,t)}}var o=e("handle"),i=e(2),a=e(3);"undefined"==typeof window.newrelic&&(newrelic=NREUM);var u=["setPageViewName","setCustomAttribute","finished","addToTrace","inlineHit"],c=["addPageAction"],f="api-";i(u,function(e,t){newrelic[t]=r(f+t,"api")}),i(c,function(e,t){newrelic[t]=r(f+t)}),t.exports=newrelic,newrelic.noticeError=function(e){"string"==typeof e&&(e=new Error(e)),o("err",[e,(new Date).getTime()])}},{}],2:[function(e,t,n){function r(e,t){var n=[],r="",i=0;for(r in e)o.call(e,r)&&(n[i]=t(r,e[r]),i+=1);return n}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],3:[function(e,t,n){function r(e,t,n){t||(t=0),"undefined"==typeof n&&(n=e?e.length:0);for(var r=-1,o=n-t||0,i=Array(0>o?0:o);++r<o;)i[r]=e[t+r];return i}t.exports=r},{}],ee:[function(e,t,n){function r(){}function o(e){function t(e){return e&&e instanceof r?e:e?u(e,a,i):i()}function n(n,r,o){e&&e(n,r,o);for(var i=t(o),a=l(n),u=a.length,c=0;u>c;c++)a[c].apply(i,r);var s=f[g[n]];return s&&s.push([m,n,r,i]),i}function p(e,t){w[e]=l(e).concat(t)}function l(e){return w[e]||[]}function d(e){return s[e]=s[e]||o(n)}function v(e,t){c(e,function(e,n){t=t||"feature",g[n]=t,t in f||(f[t]=[])})}var w={},g={},m={on:p,emit:n,get:d,listeners:l,context:t,buffer:v};return m}function i(){return new r}var a="nr@context",u=e("gos"),c=e(2),f={},s={},p=t.exports=o();p.backlog=f},{}],gos:[function(e,t,n){function r(e,t,n){if(o.call(e,t))return e[t];var r=n();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(e,t,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return e[t]=r,r}var o=Object.prototype.hasOwnProperty;t.exports=r},{}],handle:[function(e,t,n){function r(e,t,n,r){o.buffer([e],r),o.emit(e,t,n)}var o=e("ee").get("handle");t.exports=r,r.ee=o},{}],id:[function(e,t,n){function r(e){var t=typeof e;return!e||"object"!==t&&"function"!==t?-1:e===window?0:a(e,i,function(){return o++})}var o=1,i="nr@id",a=e("gos");t.exports=r},{}],loader:[function(e,t,n){function r(){if(!w++){var e=v.info=NREUM.info,t=s.getElementsByTagName("script")[0];if(e&&e.licenseKey&&e.applicationID&&t){c(l,function(t,n){e[t]||(e[t]=n)});var n="https"===p.split(":")[0]||e.sslForHttp;v.proto=n?"https://":"http://",u("mark",["onload",a()],null,"api");var r=s.createElement("script");r.src=v.proto+e.agent,t.parentNode.insertBefore(r,t)}}}function o(){"complete"===s.readyState&&i()}function i(){u("mark",["domContent",a()],null,"api")}function a(){return(new Date).getTime()}var u=e("handle"),c=e(2),f=window,s=f.document;NREUM.o={ST:setTimeout,CT:clearTimeout,XHR:f.XMLHttpRequest,REQ:f.Request,EV:f.Event,PR:f.Promise,MO:f.MutationObserver},e(1);var p=""+location,l={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-943.min.js"},d=window.XMLHttpRequest&&XMLHttpRequest.prototype&&XMLHttpRequest.prototype.addEventListener&&!/CriOS/.test(navigator.userAgent),v=t.exports={offset:a(),origin:p,features:{},xhrWrappable:d};s.addEventListener?(s.addEventListener("DOMContentLoaded",i,!1),f.addEventListener("load",r,!1)):(s.attachEvent("onreadystatechange",o),f.attachEvent("onload",r)),u("mark",["firstbyte",a()],null,"api");var w=0},{}]},{},["loader"]);</SCRIPT>

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
    <META name="GENERATOR" content="MSHTML 11.00.9600.18321">
</HEAD>
<jsp:include page="../includes/header.jsp"/>
<jsp:include page="../includes/newTheme.jsp"/>
<BODY>


<DIV class="main clearfix">
    <LINK href="../themeChart_files/kl_struc.min.css"
          rel="stylesheet">
    <STYLE>
        .croot_1 {
            background-color: #E84D1C;
        }
        .addcolor .fades {
            transition:color 300ms ease-out;
            -webkit-transition:color 300ms ease-out;
            -moz-transition:color 300ms ease-out;
            -ms-transition:color 300ms ease-out;
            -o-transition:color 300ms ease-out;
        }
        .addcolor .c1 .root {
            color: #E84D1C !important;
        }
        .addcolor .c1 .iconfont:hover,
        .addcolor .c1 a:hover {
            color: #E84D1C !important;
        }
        .addcolor .c1 .iconfont:hover em,
        .addcolor .c1 a:hover em,
        .addcolor .c1 .iconfont:hover i,
        .addcolor .c1 a:hover i {
            color: #E84D1C !important;
        }
        .addcolor .c1 .gzb {
            border-color: #E84D1C !important;
            transition: background-color 300ms ease-out;
            -webkit-transition: background-color 300ms ease-out;
            -moz-transition: background-color 300ms ease-out;
            -ms-transition: background-color 300ms ease-out;
            -o-transition: background-color 300ms ease-out;
            color: #E84D1C !important;
        }
        .addcolor .c1 .gzb em {
            color: #E84D1C !important;
        }
        .addcolor .c1 .gzb:hover {
            color: #fff !important;
            background-color: #E84D1C !important;
        }
        .addcolor .c1 .gzb:hover em {
            color: #fff !important;
        }
        .addcolor .c1 .gz {
            transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -webkit-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -moz-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -ms-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -o-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            border-color: #E84D1C !important;
            color: #E84D1C !important;
        }
        .addcolor .c1 .gz:hover {
            color:#fff !important;
            background-color:#E84D1C !important;
        }
        .addcolor .c1 .tabs:hover {
            color:#E84D1C !important;
            border-color:#E84D1C !important;
        }
        .addcolor .c1 .lasttabs {
            color:#E84D1C !important;
            border-color:#E84D1C !important;
        }
        .addcolor .c1 .lasttabs:hover {
            color:#E84D1C !important;
            border-color:#E84D1C !important;
        }
        .addcolor .c1 .rroot {
            border-top:1px solid #E84D1C !important;
        }
        .addcolor .c1 .rroot em,
        .addcolor .c1 .rroot i {
            color:#E84D1C !important;
        }
        .addcolor .c1 .fa-search {
            color:#E84D1C !important;
        }
        .addcolor .c1 .tcolor {
            color:#E84D1C !important;
        }
        .addcolor .c1 .titlehover {
            border-left: 2px solid #E84D1C !important;
        }
        .addcolor .c1 .titlehover:hover i {
            color: #fff !important;
            background-color: #E84D1C !important;
        }
        .addcolor .c1 .titlehover:hover i:before,
        .addcolor .c1 .titlehover:hover i:after {
            border-right-color: #E84D1C !important;
        }
        .addcolor .c1 .addback{
            background-color: #E84D1C !important
        }
        .addcolor .c1 .tcolora{
            color: #E84D1C !important
        }
        .addcolor .c1 .tcolora:hover{
            color: #E84D1C !important
        }
    </STYLE>

    <DIV class="header_top addcolor">
        <DIV class="banner_div croot_1">
            <DIV class="mainCol padding15px clearfix"><A class="banner_log" href="/bits/theme/getThemeDetail">
                <SPAN>
                    <IMG width="80" height="80" alt="" src="../newTheme_files/xinxi.jpg">
                </SPAN>
                <EM>信息科技</EM>
            </A>


            </DIV>
        </DIV>
        <SCRIPT>
            $('.searchbtn').click(function(){
                goSearch();
            });

            $('.searchiput').keydown(function(){
                if(event.keyCode==13)
                    goSearch();
            });

            function goSearch(){
                if($('#kwd').val()===''){
                    alert('请填写搜索关键字') ;
                }
                else
                    window.location.href="/search/1/"+$('#kwd').val();
            }
        </SCRIPT>

        <DIV class="mainCol clearfix padding15px">
            <DIV class="structure_chart">
                <DIV class="kl_title">
                    信息科技知识结构
                </DIV>
                <DIV class="kl_str" id="mapRow">

                </DIV>
                </DIV>
            </DIV>
        </DIV>
        <SCRIPT src="../themeChart_files/d3.min.js" type="text/javascript" charset="utf-8"></SCRIPT>

        <SCRIPT src="../themeChart_files/strucMap.min.js" type="text/javascript"></SCRIPT>

        <SCRIPT>
            $(function () {
                var options = {
                    width: 1140,
                    height: 940
                };
                var nodestr = "[{&#34;course&#34;:&#34;0&#34;,&#34;fixed&#34;:true,&#34;href&#34;:&#34;http://lib.csdn.net/base/computernetworks&#34;,&#34;id&#34;:37,&#34;index&#34;:0,&#34;prop&#34;:{&#34;course&#34;:&#34;0&#34;,&#34;name&#34;:&#34;信息科技&#34;,&#34;subject&#34;:&#34;信息科技&#34;},&#34;x&#34;:560,&#34;y&#34;:480},{&#34;course&#34;:&#34;504&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/504&#34;,&#34;id&#34;:&#34;504&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;504&#34;,&#34;name&#34;:&#34;无线电电子学&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1019,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1019&#34;,&#34;id&#34;:1019,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1019,&#34;name&#34;:&#34;电信技术&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1020,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1020&#34;,&#34;id&#34;:1020,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1020,&#34;name&#34;:&#34;计算机硬件技术&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1021,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1021&#34;,&#34;id&#34;:1021,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1021,&#34;name&#34;:&#34;计算机软件技术及应用&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:&#34;505&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/505&#34;,&#34;id&#34;:&#34;505&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;505&#34;,&#34;name&#34;:&#34;互联网技术&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1022,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1022&#34;,&#34;id&#34;:1022,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1022,&#34;name&#34;:&#34;自动化技术&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1023,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1023&#34;,&#34;id&#34;:1023,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1023,&#34;name&#34;:&#34;TCP&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1024,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1024&#34;,&#34;id&#34;:1024,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1024,&#34;name&#34;:&#34;UDP&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:&#34;506&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/506&#34;,&#34;id&#34;:&#34;506&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;506&#34;,&#34;name&#34;:&#34;信息与传媒&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1025,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1025&#34;,&#34;id&#34;:1025,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1025,&#34;name&#34;:&#34;傅里叶分析&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:&#34;507&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/507&#34;,&#34;id&#34;:&#34;507&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;507&#34;,&#34;name&#34;:&#34;网络层&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1026,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1026&#34;,&#34;id&#34;:1026,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1026,&#34;name&#34;:&#34;路由算法&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1027,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1027&#34;,&#34;id&#34;:1027,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1027,&#34;name&#34;:&#34;网络层拥塞控制办法&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1028,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1028&#34;,&#34;id&#34;:1028,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1028,&#34;name&#34;:&#34;网络层服务质量&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1029,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1029&#34;,&#34;id&#34;:1029,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1029,&#34;name&#34;:&#34;网络互联&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1030,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1030&#34;,&#34;id&#34;:1030,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1030,&#34;name&#34;:&#34;Internet&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1031,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1031&#34;,&#34;id&#34;:1031,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1031,&#34;name&#34;:&#34;Internet控制协议&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:&#34;508&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/508&#34;,&#34;id&#34;:&#34;508&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;508&#34;,&#34;name&#34;:&#34;数据链路层&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1032,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1032&#34;,&#34;id&#34;:1032,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1032,&#34;name&#34;:&#34;数据链路层&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:&#34;509&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/509&#34;,&#34;id&#34;:&#34;509&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;509&#34;,&#34;name&#34;:&#34;介质访问控制子层&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1033,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1033&#34;,&#34;id&#34;:1033,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1033,&#34;name&#34;:&#34;介质访问控制子层&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:&#34;510&#34;,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/node/510&#34;,&#34;id&#34;:&#34;510&#34;,&#34;index&#34;:1,&#34;prop&#34;:{&#34;course&#34;:&#34;510&#34;,&#34;name&#34;:&#34;应用层&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1034,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1034&#34;,&#34;id&#34;:1034,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1034,&#34;name&#34;:&#34;域名系统和邮件服务&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1035,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1035&#34;,&#34;id&#34;:1035,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1035,&#34;name&#34;:&#34;万维网&#34;,&#34;subject&#34;:&#34;&#34;}},{&#34;course&#34;:1036,&#34;href&#34;:&#34;http://lib.csdn.net/computernetworks/knowledge/1036&#34;,&#34;id&#34;:1036,&#34;index&#34;:2,&#34;prop&#34;:{&#34;course&#34;:1036,&#34;name&#34;:&#34;流式音视频&#34;,&#34;subject&#34;:&#34;&#34;}}]".replace(/&#34;/g, '"').replace(/\t/g,'');
                var linkstr = "[{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:1,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:1,&#34;target&#34;:2,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:1,&#34;target&#34;:3,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:1,&#34;target&#34;:4,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:5,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:5,&#34;target&#34;:6,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:5,&#34;target&#34;:7,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:5,&#34;target&#34;:8,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:9,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:9,&#34;target&#34;:10,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:11,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:11,&#34;target&#34;:12,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:11,&#34;target&#34;:13,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:11,&#34;target&#34;:14,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:11,&#34;target&#34;:15,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:11,&#34;target&#34;:16,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:11,&#34;target&#34;:17,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:18,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:18,&#34;target&#34;:19,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:20,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:20,&#34;target&#34;:21,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:0,&#34;target&#34;:22,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:22,&#34;target&#34;:23,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:22,&#34;target&#34;:24,&#34;type&#34;:&#34;REL&#34;},{&#34;desc&#34;:&#34;&#34;,&#34;source&#34;:22,&#34;target&#34;:25,&#34;type&#34;:&#34;REL&#34;}]".replace(/&#34;/g, '"').replace(/\t/g,'');
                var a = ${a},
                        n =${r},
                        c = ["#1f77b4", "#ff7f0e", "#2ca02c", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"],
                        l = options.width,
                        i = options.height,
                        o = d3.select("#mapRow").append("svg").attr({
                            id: "map",
                            width: l,
                            height: i
                        }),
                        s = o.append("g"),
                        u = d3.layout.force();
                u.on("tick",//节点更新
                        function() {
                            s.selectAll("line.link").each(function(t) {
                                var e, r, a, n, c = d3.select(this);
                                if ("NEXT" == t.type) {
                                    var l = t.target.x - t.source.x,
                                            i = t.target.y - t.source.y,
                                            o = Math.sqrt(l * l + i * i),
                                            s = l / o,
                                            u = i / o,
                                            d = 35,
                                            f = 35;
                                    e = t.source.x + d * s,
                                            r = t.target.x - f * s,
                                            a = t.source.y + d * u,
                                            n = t.target.y - f * u,
                                            c.attr("marker-end", "url(#arrow)")
                                } else e = t.source.x,
                                        a = t.source.y,
                                        r = t.target.x,
                                        n = t.target.y;
                                c.attr("x1", e),
                                        c.attr("x2", r),
                                        c.attr("y1", a),
                                        c.attr("y2", n)
                            }),//线更新
                                    s.selectAll("g.node").selectAll("circle.ring").attr({
                                        cx: function(t) {
                                            return t.x
                                        },
                                        cy: function(t) {
                                            return t.y
                                        }
                                    }),//节点圆圈位置
                                    s.selectAll("g.node").selectAll("circle.outline").attr({
                                        cx: function(t) {
                                            return t.x
                                        },
                                        cy: function(t) {
                                            return t.y
                                        }
                                    }),//节点线
                                    s.selectAll("g.node").selectAll("text").attr({
                                        x: function(t) {
                                            return t.x - 35
                                        },
                                        y: function(t) {
                                            return t.y - 35
                                        }
                                    }),//文字位置
                                    d.attr({
                                        x: function(t) {
                                            return (t.source.x + t.target.x) / 2 - 25
                                        },
                                        y: function(t) {
                                            return (t.source.y + t.target.y) / 2 + 5
                                        },
                                        transform: function(t) {
                                            var e = t.target.x - t.source.x,
                                                    r = t.target.y - t.source.y,
                                                    a = 360 * Math.atan(r / e) / (2 * Math.PI),
                                                    n = (t.target.x + t.source.x) / 2,
                                                    c = (t.target.y + t.source.y) / 2;
                                            return "rotate(" + a + "," + n + "," + c + ")"
                                        }
                                    })
                        }).charge( - 1300).linkDistance(200).nodes(a).links(n).size([l, i]).alpha(.1),
                        o.append("svg:defs").append("svg:marker").attr("id", "arrow").attr("viewBox", "0 -5 10 10").attr("refX", 6).attr("markerWidth", 5).attr("markerHeight", 5).attr("orient", "auto").append("svg:path").attr("d", "M0,-5L10,0L0,5").attr("fill", "#6ac6ff"),
                        s.selectAll("line.link").data(n).enter().append("line").attr("class", "link");
                var d = s.selectAll("link.desc").data(n).enter().append("text").attr("class", "desc").text(function(t) {
                            return t.desc
                        }),
                        f = (u.drag().on("dragstart",
                                function(t) {
                                    t.fixed = !0
                                }), s.selectAll("g.node").data(a)),
                        p = f.enter().append("g").attr("class",
                                function(t, e) {
                                    return 0 === e ? "node active": "node"
                                }).call(u.drag).on("click",
                                function(t) {
                                    d3.event.defaultPrevented || window.open(t.href)
                                });
                p.append("circle").attr({
                    r: 29,
                    "class": "ring"
                }),
                        p.append("circle").attr({
                            r: 25,
                            "class": "outline"
                        }).style({
                            fill: function(t) {
                                return c[t.index]
                            },
                            stroke: "#5CA8DB",
                            "stroke-width": "2px"
                        }),
                        p.append("text").text(function(t) {
                            return t.prop.name
                        }).style("fill", "black"),
                        u.start();
                for (var g = 0; 50 > g; g++) u.tick();
                var x = setInterval(function() {
                            u.alpha() < .01 ? clearInterval(x) : u.tick()
                        },
                        80)
            });
        </SCRIPT>

        <STYLE>
            .bdshare-button-style0-32 a{
                float: none;
                width:auto;
                line-height: normal;
                height: auto;
                background:none;
                cursor: pointer;
                margin: 0;
                text-indent: inherit;
                overflow: auto;
                color:#8295a3;
            }
            .bd_weixin_popup {
                overflow: hidden;
            }
        </STYLE>
    </DIV>
    <script src="../assetsallP/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>

    <SCRIPT src="../themeChart_files/toolbar.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeChart_files/knowledge_base.min.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeChart_files/navs.min.js" type="text/javascript"></SCRIPT>
</DIV>
</BODY>
</HTML>
