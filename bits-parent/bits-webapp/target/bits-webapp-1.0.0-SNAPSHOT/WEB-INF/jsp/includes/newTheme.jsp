<%--
  Created by IntelliJ IDEA.
  User: SunJQ
  Date: 2016/5/14
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<HEAD>
    <meta charset="utf-8">
    <title>详情</title>

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
    <script src="../assetsallP/global/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="../assetsallP/global/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="../assetsallP/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../assetsallP/global/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <META content="IE=11.0000" http-equiv="X-UA-Compatible">
    <META name="baidu-site-verification" content="HmwwEvMGyf">
    <META http-equiv="content-type" content="text/html; charset=utf-8">
    <META http-equiv="X-UA-Compatible" content="IE=Edge">

    <META name="Keywords" content="知识库,微信开发,机器学习,swift,Android,Python,Java,大数据,云计算,PHP,Ruby,C++,JavaScript">
    <META name="Description" content="CSDN知识库，按照技术领域和知识结构对海量技术资源进行筛选整理，并通过相关机制进行审核收录。保证入库知识的系统性与优质性。并且所含技术知识图谱有清晰的学习脉络，是技术开发者完善自我知识体系、提升进阶的参照坐标">
    <LINK href="../fileDetail_files/bootstrap.css" rel="stylesheet">
    <LINK href="../fileDetail_files/common.css" rel="stylesheet">
    <LINK href="../fileDetail_files/index.css" rel="stylesheet">
    <LINK href="../fileDetail_files/font-awesome.min.css" rel="stylesheet">
    <LINK href="../fileDetail_files/iconfont.min.css" rel="stylesheet">
    <LINK href="../fileDetail_files/icon.css" rel="stylesheet">
    <link href="../assetsallP/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <SCRIPT src="../fileDetail_files/jquery-1.11.1.min.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../fileDetail_files/bootstrap.min.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../fileDetail_files/statist.min.js" type="text/javascript"></SCRIPT>

    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>

    <META name="GENERATOR" content="MSHTML 11.00.9600.18321">
    <STYLE>
        .croot_25 {
            background-color: #E84D1C;
        }
        .addcolor .fades {
            transition:color 300ms ease-out;
            -webkit-transition:color 300ms ease-out;
            -moz-transition:color 300ms ease-out;
            -ms-transition:color 300ms ease-out;
            -o-transition:color 300ms ease-out;
        }
        .addcolor .c25 .root {
            color: #E84D1C !important;
        }
        .addcolor .c25 .iconfont:hover,
        .addcolor .c25 a:hover {
            color: #E84D1C !important;
        }
        .addcolor .c25 .iconfont:hover em,
        .addcolor .c25 a:hover em,
        .addcolor .c25 .iconfont:hover i,
        .addcolor .c25 a:hover i {
            color: #E84D1C !important;
        }
        .addcolor .c25 .gzb {
            border-color: #E84D1C !important;
            transition: background-color 300ms ease-out;
            -webkit-transition: background-color 300ms ease-out;
            -moz-transition: background-color 300ms ease-out;
            -ms-transition: background-color 300ms ease-out;
            -o-transition: background-color 300ms ease-out;
            color: #E84D1C !important;
        }
        .addcolor .c25 .gzb em {
            color: #E84D1C !important;
        }
        .addcolor .c25 .gzb:hover {
            color: #fff !important;
            background-color: #E84D1C !important;
        }
        .addcolor .c25 .gzb:hover em {
            color: #fff !important;
        }
        .addcolor .c25 .gz {
            transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -webkit-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -moz-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -ms-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            -o-transition: background-color 300ms ease-out, border-color 300ms ease-out;
            border-color: #E84D1C !important;
            color: #E84D1C !important;
        }
        .addcolor .c25 .gz:hover {
            color:#fff !important;
            background-color:#E84D1C !important;
        }
        .addcolor .c25 .tabs:hover {
            color:#E84D1C !important;
            border-color:#E84D1C !important;
        }
        .addcolor .c25 .lasttabs {
            color:#E84D1C !important;
            border-color:#E84D1C !important;
        }
        .addcolor .c25 .lasttabs:hover {
            color:#E84D1C !important;
            border-color:#E84D1C !important;
        }
        .addcolor .c25 .rroot {
            border-top:1px solid #E84D1C !important;
        }
        .addcolor .c25 .rroot em,
        .addcolor .c25 .rroot i {
            color:#E84D1C !important;
        }
        .addcolor .c25 .fa-search {
            color:#E84D1C !important;
        }
        .addcolor .c25 .tcolor {
            color:#E84D1C !important;
        }
        .addcolor .c25 .titlehover {
            border-left: 2px solid #E84D1C !important;
        }
        .addcolor .c25 .titlehover:hover i {
            color: #fff !important;
            background-color: #E84D1C !important;
        }
        .addcolor .c25 .titlehover:hover i:before,
        .addcolor .c25 .titlehover:hover i:after {
            border-right-color: #E84D1C !important;
        }
        .addcolor .c25 .addback{
            background-color: #E84D1C !important
        }
        .addcolor .c25 .tcolora{
            color: #E84D1C !important
        }
        .addcolor .c25 .tcolora:hover{
            color: #E84D1C !important
        }
    </STYLE>
</HEAD>
</html>
