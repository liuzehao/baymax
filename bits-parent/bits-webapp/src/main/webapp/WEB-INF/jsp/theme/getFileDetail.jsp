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
<head>
    <jsp:include page="../includes/header.jsp"/>
    <jsp:include page="../includes/newTheme.jsp"/>
<BODY>
<DIV class="main clearfix">
    <DIV>
        <LINK href="../fileDetail_files/kn_knowledge_home.min.css" rel="stylesheet">


        <DIV class="header_top addcolor">
            <DIV class="mainCol padding15px addcolor">
                <DIV class="my_knowledge clearfix">
                    <DIV class="kn_right whitebk w860px">
                        <DIV class="rightcontent">
                            <DIV class="kn_top c25">
                                <DIV class="title">${themeName}</DIV>
                            </DIV>
                            <a href="${url}">返回上一级</a>
                            <A name="md"></A>
                            <DIV id="content_list_div">
                                <DIV class="atab ">
                                    <A class="rroot" onclick="" href="javascript:;">
                                        <I class="iconfont icon_0"></I>
                                        <EM>全部 84</EM>
                                    </A>
                                    <A onclick="" href="javascript:;">
                                        <I title="文章" class="fa fa-file-text-o"></I>
                                        <EM>84</EM>
                                    </A>
                                    <A onclick="" href="javascript:;">
                                        <I title="图片" class="fa fa-image"></I>
                                        <EM>0</EM>
                                    </A>
                                    <A onclick="" href="javascript:;">
                                        <I title="音频" class="fa fa-headphones "></I>
                                        <EM>0</EM>
                                    </A>
                                    <!--onclick="getContentByType(2)" 用了请求不同类型的文件-->
                                    <A  href="javascript:;">
                                        <I title="视频" class="fa  fa-film"></I>
                                        <EM>0</EM>
                                    </A>
                                </DIV>
                                <DIV class="divlist03 ">
                                    <UL class="list03">
<c:forEach items="${files}" var="files" varStatus="cursor" end="4">
                                        <LI class="clearfix c25">
                                            <DIV class="scontentright tracking-ad" data-mod="popu_142_lib_25">
                                                <P class="title">
                                                    <A title="${files.fileName}" href="/bits/literature/getLiteratureDetail?id=${files.fileId}" target="_blank" contentid="${files.fileId}">${files.fileName}</A>
                                                    <EM class="gray">&nbsp;&nbsp;来自&nbsp;&nbsp;</EM>
                                                    <I>匿名</I>
                                                </P>
                                                <P class="content">
                                                    <SPAN>${file.fileTime}&nbsp;&nbsp;</SPAN>
                                                    <EM class="gray">收录到&nbsp;&nbsp;</EM>
                                                    <A href="http://lib.csdn.net/node/414" target="_blank">${themeName}&nbsp;&nbsp;</A>
                                                    <EM class="gray">-&nbsp;&nbsp;</EM>
                                                    <A class="tabs" href="http://lib.csdn.net/knowledge/701" target="_blank">${themeName}</A>
                                                </P>
                                            </DIV>
                                        </LI>
    </c:forEach>
                                    </UL>
                                </DIV>
                                <DIV class="csdn-pagination hide-set page1">
                                    <SPAN class="page-nav">
                                        <B>共&nbsp;<I>84条9页</I></B>
                                        <A class="btn btn-xs btn-default" href="http://lib.csdn.net/node/414#md" data-page="1">首页</A>
                                        <A class="btn btn-xs btn-default btn-prev" href="http://lib.csdn.net/node/414#md" data-page="0">&lt;</A>         <!--<a href="#md" data-page='1' class="btn btn-xs btn-default">1</a>-->
                            <A class="btn btn-xs btn-default active cblue" href="http://lib.csdn.net/node/414#md" data-page="1">1</A>
                                        <A class="btn btn-xs btn-default " href="http://lib.csdn.net/node/414#md" data-page="2">2</A>
                                        <A class="btn btn-xs btn-default " href="http://lib.csdn.net/node/414#md" data-page="3">3</A>
                                        <A class="btn btn-xs btn-default " href="http://lib.csdn.net/node/414#md" data-page="4">4</A>
                                        <A class="btn btn-xs btn-default " href="http://lib.csdn.net/node/414#md" data-page="5">5</A>
                                        <SPAN class="ellipsis">...</SPAN>                 <!--<a href="#" data-page="" class="btn btn-xs btn-default"></a>-->

                                        <A class="btn btn-xs btn-default" href="http://lib.csdn.net/node/414#md" ata-page="9">末页</A>
                                    </SPAN>
                                </DIV>

                            </DIV>
                        </DIV>
                    </DIV>
                </DIV>
            </DIV>


        </DIV>
        <SCRIPT src="../fileDetail_files/publib_footer.js" type="text/javascript"></SCRIPT>

        <SCRIPT src="../fileDetail_files/toolbar.js" type="text/javascript"></SCRIPT>

        <SCRIPT src="../fileDetail_files/knowledge_base.min.js" type="text/javascript"></SCRIPT>

        <script src="../assetsallP/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
        <SCRIPT src="../fileDetail_files/navs.min.js" type="text/javascript"></SCRIPT>
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
    </DIV>
</DIV>
</BODY>
</HTML>
