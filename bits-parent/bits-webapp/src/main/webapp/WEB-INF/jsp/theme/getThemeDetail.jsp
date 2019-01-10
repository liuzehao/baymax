<%@ page import="com.ccut.bits.literature.model.Literature" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
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
    <META name="baidu-site-verification" content="HmwwEvMGyf">
    <META http-equiv="content-type" content="text/html; charset=utf-8">
    <META http-equiv="X-UA-Compatible" content="IE=Edge">
    <TITLE>C# -  知识库 -你身边的技术百科全书 - CSDN</TITLE>
    <META name="Keywords" content="知识库,微信开发,机器学习,swift,Android,Python,Java,大数据,云计算,PHP,Ruby,C++,JavaScript">
    <META name="Description" content="CSDN知识库，按照技术领域和知识结构对海量技术资源进行筛选整理，并通过相关机制进行审核收录。保证入库知识的系统性与优质性。并且所含技术知识图谱有清晰的学习脉络，是技术开发者完善自我知识体系、提升进阶的参照坐标">
    <LINK href="../themeDetail_files/bootstrap.css" rel="stylesheet">
    <LINK href="../themeDetail_files/common.css" rel="stylesheet">
    <LINK href="../themeDetail_files/index.css" rel="stylesheet">
    <LINK href="../themeDetail_files/font-awesome.min.css"rel="stylesheet">
    <LINK href="../themeDetail_files/iconfont.min.css" rel="stylesheet">
    <LINK href="../themeDetail_files/icon.css" rel="stylesheet">
    <LINK href="../images/web/favicon.ico" rel="SHORTCUT ICON">
    <SCRIPT src="../themeDetail_files/jquery-1.11.1.min.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeDetail_files/bootstrap.min.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeDetail_files/statist.min.js" type="text/javascript"></SCRIPT>
    <LINK id="colors" href="/min/colors.min.css" rel="stylesheet">
    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
    <META name="GENERATOR" content="MSHTML 11.00.9600.18283">
    <script>
        function getThemeChartList(id){
            location.href = basePath + "theme/getThemeChartList?id="+id;
        }
    </script>
    <script>
        function getChildrenThemeDetail(id){
           a=${childrenThemeId[0]}+id;
            location.href = basePath + "theme/getFileDetail?id="+a;

        }
    </script>
</HEAD>
<jsp:include page="../includes/header.jsp"/>
<BODY>
<LINK href="../themeDetail_files/kn_knowledge_index.min.css" rel="stylesheet">
<SCRIPT src="../themeDetail_files/main.js" type="text/javascript" charset="utf-8"></SCRIPT>
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
        color: #E84D1C!important;
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
        border-color:#E84D1C!important;
        color: #E84D1C!important;
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
        color: #E84D1C!important
    }
    .addcolor .c25 .tcolora:hover{
        color: #E84D1C !important
    }
</STYLE>
<DIV class="header_top addcolor">
    <DIV class="banner_div croot_25">
        <DIV class="mainCol padding15px clearfix"><A class="banner_log" href="http://lib.csdn.net/base/25"><SPAN>
            <IMG width="80" height="80" alt="" src="${parentTheme['img']}"></SPAN><EM>${parentTheme['themeName']}</EM></A>
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
                window.location.href="/search/25/"+$('#kwd').val();
        }


    </SCRIPT>
    <!-- 知识库简介-->
    <DIV class="curbannerbottom whitebk">
        <DIV class="mainCol clearfix padding15px">
            <DIV class="kn_left w860px">
                <P>
                    ${parentTheme['keyWord']}
                </P>
            </DIV>
            <SCRIPT>
                function subscriptionPop(){
                    $('#subscriptionPop')[0].style.display = 'block';
                };
                function noneSubscriptionPop(){
                    $('#subscriptionPop')[0].style.display = 'none';
                };
            </SCRIPT>

        </DIV>
    </DIV><!-- 知识库简介end-->
    <DIV class="mainCol padding15px addcolor">
        <div id="show_list" class="kn_left w860px"><!-- 最近浏览-->                 <!-- 最近浏览end-->
            <!-- 最新收录-->
            <div class="kn_column01 clearfix"><span class="title">最新收录</span>
                <ul class="listbtn">
                    <li class=""></li>
                    <li class="root"></li>
                    <li class=""></li>
                    <li class=""></li>
                    <li class=""></li></ul>
                <div class="clearfix">
                </div>
                <div class="divscroll divlist03 clearfix">
                    <div data-mod="popu_142_lib_25" class="divoverhide tracking-ad">
                        <ul class="list03 clearfix" style="width: 4000px; left: -800px;">
                       <c:forEach items="${childrenTheme}" var="childrenTheme" varStatus="cursor" end="4">
                           <c:forEach items="${childrenTheme.value}" var="file" varStatus="cursor"  end="0">
                            <li class="c25">
                                <div class="siconleft">
                                    <a target="_blank"><i class="fa fa-file-text-o" title="文档"></i></a>
                                </div>
                                <div class="scontentright">
                                    <p class="title">
                                        <a contentid="${file.fileId}" href="/bits/literature/getLiteratureDetail?id=${file.fileId}" title="${file.fileName}" target="_blank">${file.fileName}</a>
                                    </p>
                                    <p class="content">
                                        <span>${file.fileTime}&nbsp;&nbsp;</span>
                                        <em class="gray">收录到&nbsp;&nbsp;</em>
                                        <b><a href="http://lib.csdn.net/node/731" target="_blank">${childrenTheme.key}</a>&nbsp;&nbsp;</b>
                                        <em class="gray">-&nbsp;&nbsp;</em>
                                        <a href="http://lib.csdn.net/knowledge/731" class="tabs" target="_blank">${childrenTheme.key}</a>
                                    </p>
                                </div>
                            </li>
                               </c:forEach>
                       </c:forEach>
                        </ul>
                    </div>
                </div>
            </div><!-- 最新收录end-->
            <!--知识分类-->
            <div class="kn_column kn_title">
                ${parentTheme['themeName']}知识分类
            </div>
            <div class="kn_column01 kn_column02">
                <div class="kn_content c25">
                     <c:forEach items="${childrenTheme}" var="childrenTheme" varStatus="cursor">
                    <div class="kn_tops clearfix">
                        <a onclick="getChildrenThemeDetail(${cursor.index})" href="#" class="title titlehover">${childrenTheme.key}<i>${fn:length(childrenTheme.value)}</i></a>
                        <div class="clearfix"></div><!-- 三级节点-->
                        <!-- 三级节点end-->
                    </div>
                    <div data-mod="popu_142_lib_25" class="kn_bottoms clearfix tracking-ad">
                        <div class="kn_bottom_left c25">
                            <span class="title">&nbsp;</span>
                         <c:forEach items="${childrenTheme.value}" var="file" varStatus="cursor"  begin="0" end="4">
                            <a contentid="${file.fileId}" href="/bits/literature/getLiteratureDetail?id=${file.fileId}" class="divtext" title="${file.fileName}" target="_blank">
                                <i class="fa fa-file-text-o" title="文档"></i> ${file.fileName}
                            </a>
                         </c:forEach>
                        </div>
                        <div class="kn_bottom_right c25">
                            <span class="title">&nbsp;</span>
                         <c:forEach items="${childrenTheme.value}" var="file" varStatus="cursor"  begin="5" end="9">
                            <a contentid="4576" href="/bits/literature/getLiteratureDetail?id=${file.fileId}" class="divtext" title="${file.fileName}" target="_blank">
                                <i class="fa fa-file-text-o" title="文档"></i> ${file.fileName}
                            </a>
                         </c:forEach>
                        </div>
                    </div>
                     </c:forEach>
                </div>
            </div><!--知识分类end-->
            <br><br><br><br>
        </div>
        <DIV class="kn_right w270px c25">
            <DIV class="kn_right_column whitebk">
                <DIV class="mtop ">
                    <A href="#" onclick="getThemeChartList(${parentTheme['id']})">
                        <IMG src="../themeDetail_files/strucimg.jpg" >
                    </A>
                </DIV>
                <DIV class="mbottom clearfix">
                    <A class="titles tcolor" href="#" onclick="getThemeChartList()">${parentTheme['themeName']}</A>
                    <DIV class="clearfix">
                    </DIV>
                    <div class="divleft">
                        <ul class="divlist">
                            <c:forEach items="${childrenTheme}" var="childrenTheme" varStatus="cursor"  begin="0"  step="2">
                            <li>
                                <a href="#" onclick="getChildrenThemeDetail(${cursor.index})" class="tcolora">${childrenTheme.key}</a>
                                <span></span>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <DIV class="divline"></DIV>
                    <div class="divright">
                        <ul class="divlist">
                            <c:forEach items="${childrenTheme}" var="childrenTheme" varStatus="cursor"  begin="1"  step="2">
                            <li>
                                <a href="#" onclick="getChildrenThemeDetail(${cursor.index})" class="tcolora">${childrenTheme.key}</a>
                                <span></span>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </DIV>
            </DIV>
            <DIV class="kn_right_column whitebk">
                <DIV class="jilu"><SPAN class="title">本库已收录</SPAN>
                    <P><EM class="tcolor">303</EM>&nbsp;&nbsp;条${parentTheme['themeName']}相关知识内容</P>
                </DIV>
                <DIV class="jilunum c1">
                    <A class="fades" href="javascript:;"><I title="文档" class="fa fa-file-text-o"></I>303</A>
                    <A class="fades" href="javascript:;"><I title="图片" class="fa fa-image "></I>0</A>
                    <A class="fades" href="javascript:;"><I title="音频" class="fa fa-headphones "></I>0</A>
                    <A class="fades" href="javascript:;"><I title="视频" class="fa  fa-film"></I>0</A>
                </DIV>
            </DIV>

            <DIV class="marklayer whitebk">
            </DIV>
        </DIV>
    </DIV>
    <SCRIPT src="../themeDetail_files/publib_footer.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeDetail_files/toolbar.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeDetail_files/knowledge_base.min.js" type="text/javascript"></SCRIPT>
    <SCRIPT src="../themeDetail_files/navs.min.js" type="text/javascript"></SCRIPT>
    <script src="../assetsallP/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
</DIV>
</BODY>
</HTML>
