<%--
  Created by IntelliJ IDEA.
  User: SunJQ
  Date: 2016/5/11
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<!-- saved from url=(0023)http://qikan.cqvip.com/ -->
<HTML >
<HEAD>

    <TITLE>智能搜索</TITLE>


    <LINK href="../newSearch_files/globa.css" rel=stylesheet type=text/css>
    <LINK href="../newSearch_files/jquery.autocomplete.css" rel=stylesheet type=text/css>
    <SCRIPT src="../newSearch_files/jquery-1.9.1.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/jquery.cookie.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/jquery.emailtip.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/libextentions.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/jquery.easyselectbox.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/common.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/splitie.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/searchexpression.yui.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/searchrelativesubject.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/jquery.belatedPNG.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/jquery.autocomplete.min.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/echarts.js" type=text/javascript></SCRIPT>

    <SCRIPT src="../newSearch_files/userBehavior.min.js" type=text/javascript></SCRIPT>
    <!--[if IE 6]>
    <script type="text/javascript">
        $(document).ready(function() {
            $("img[src$='.png']").fixPng();
        });
    </script>
    <![endif]-->
    <LINK href="../newSearch_files/index.css" rel=stylesheet type=text/css>
    <SCRIPT src="../newSearch_files/index.min.js" type=text/javascript></SCRIPT>

    <script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>

</HEAD>

<BODY class=s-980>

<DIV id=header>
    <DIV class=inner>

        <DIV id=search>
            <DIV class=search-box>
                <INPUT id=hidSearchKeysHidden type=hidden>
                <INPUT name=txtMainSearchType class="search-input watermark" id=txtMainSearchType style="COLOR: rgb(153,153,153)" onkeydown=search_enterKeydown(event); type=text>
                <INPUT class=search-btn id=btnMainSearchType type=button>
            </DIV>
            <DIV class=search-adv>
                <A onclick="onidshow('pagesearch-factor')" href="javascript:void(0);">高级检索</A>
            </DIV>
        </DIV>
        <DIV class=search-relative id=searchRelative style="DISPLAY: none">
            <DIV class=relative-arrow></DIV>
            <DIV class=relative-op>
                <A class=close href="http://qikan.cqvip.com/#"></A>
            </DIV>
            <DIV class=relative-intro>
                <STRONG>推荐查询主题</STRONG>--点击查看检索词可扩展的如下查询主题：
            </DIV>
            <DIV class=relative-words>
                <P class=words-list></P>
            </DIV>
        </DIV>
    </DIV>
</DIV>
<DIV class="layer-box advance" id=objectsearch-factor style="DISPLAY: none">
    <DIV class=close>
        <A onclick="onidclose('objectsearch-factor')" href="javascript:void(0);">
            <IMG width=21 height=21 alt="" src="../newSearch_files/layer-close.png">
        </A>
    </DIV>
    <H5 class=layer-title>
        <A onclick="isshowclose('pagesearch-factor','objectsearch-factor')" href="javascript:void(0);">高级检索</A>
        <A class=current onclick="isshowclose('objectsearch-factor','pagesearch-factor')" href="javascript:void(0);">检索式检索</A>
    </H5>
    <DIV class=layer-cnt id=object-factor>
        <DIV class=format-intro>
            <P>
                <STRONG>检索规则说明：</STRONG>AND代表“并且”；OR代表“或者”；NOT代表“不包含”；(注意必须大写,运算符两边需空一格)
            </P>
            <P>
                <STRONG>检 索 范 例 ：</STRONG>范例一： (K=图书馆学 OR K=情报学) AND A=范并思　　　　范例二：J=计算机应用与软件
                AND (U=C++ OR U=Basic) NOT M=Visual
            </P>
            <TEXTAREA class=input-area id=searchusercontent rows=2 cols=20>

            </TEXTAREA>
        </DIV>
        <H6 class=layer-cnt-h>时间限定 </H6>
        <DIV class=filter id=re_searchtimefilter>
            <STRONG>
                <INPUT name=radresearhtime type=radio CHECKED value=1>时间：
            </STRONG>
            <DIV class=t>
                <SELECT name=re_dropAiStartTime id=re_dropAiStartTime>
                    <OPTION value=1989 selected>1989</OPTION>
                    <OPTION value=1990>1990</OPTION>
                    <OPTION value=1991>1991</OPTION> <OPTION value=1992>1992</OPTION> <OPTION
                        value=1993>1993</OPTION> <OPTION value=1994>1994</OPTION> <OPTION
                        value=1995>1995</OPTION> <OPTION value=1996>1996</OPTION> <OPTION
                        value=1997>1997</OPTION> <OPTION value=1998>1998</OPTION> <OPTION
                        value=1999>1999</OPTION> <OPTION value=2000>2000</OPTION> <OPTION
                        value=2001>2001</OPTION> <OPTION value=2002>2002</OPTION> <OPTION
                        value=2003>2003</OPTION> <OPTION value=2004>2004</OPTION> <OPTION
                        value=2005>2005</OPTION> <OPTION value=2006>2006</OPTION> <OPTION
                        value=2007>2007</OPTION> <OPTION value=2008>2008</OPTION> <OPTION
                        value=2009>2009</OPTION> <OPTION value=2010>2010</OPTION> <OPTION
                        value=2011>2011</OPTION> <OPTION value=2012>2012</OPTION> <OPTION
                        value=2013>2013</OPTION> <OPTION value=2014>2014</OPTION> <OPTION
                        value=2015>2015</OPTION> <OPTION value=2016>2016</OPTION></SELECT>
            </DIV><SPAN>-</SPAN>
            <DIV class=t>
                <SELECT name=re_dropAiEndTime id=re_dropAiEndTime> <OPTION
                        value=2016 selected>2016</OPTION> <OPTION value=2015>2015</OPTION> <OPTION
                        value=2014>2014</OPTION> <OPTION value=2013>2013</OPTION> <OPTION
                        value=2012>2012</OPTION> <OPTION value=2011>2011</OPTION> <OPTION
                        value=2010>2010</OPTION> <OPTION value=2009>2009</OPTION> <OPTION
                        value=2008>2008</OPTION> <OPTION value=2007>2007</OPTION> <OPTION
                        value=2006>2006</OPTION> <OPTION value=2005>2005</OPTION> <OPTION
                        value=2004>2004</OPTION> <OPTION value=2003>2003</OPTION> <OPTION
                        value=2002>2002</OPTION> <OPTION value=2001>2001</OPTION> <OPTION
                        value=2000>2000</OPTION> <OPTION value=1999>1999</OPTION> <OPTION
                        value=1998>1998</OPTION> <OPTION value=1997>1997</OPTION> <OPTION
                        value=1996>1996</OPTION> <OPTION value=1995>1995</OPTION> <OPTION
                        value=1994>1994</OPTION> <OPTION value=1993>1993</OPTION> <OPTION
                        value=1992>1992</OPTION> <OPTION value=1991>1991</OPTION> <OPTION
                        value=1990>1990</OPTION> <OPTION value=1989>1989</OPTION>
                </SELECT>
            </DIV>
            <STRONG style="MARGIN-LEFT: 40px">
                <INPUT name=radresearhtime type=radio value=2>更新时间：</STRONG>
            <DIV class=sel>
                <SELECT class=endtime id=re_searchtimeupdatefilter>
                    <OPTION value=1 selected>一个月内</OPTION>
                    <OPTION value=2>三个月内</OPTION>
                    <OPTION value=3>半年内</OPTION> <OPTION value=4>一年内</OPTION>
                    <OPTION value=5>当年内</OPTION></SELECT>
            </DIV>
        </DIV>
        <H6 class=layer-cnt-h>期刊范围 </H6>
        <DIV class=filter id=re_searchjournaltype>
            <LABEL>
                <INPUT id=Checkbox71 type=checkbox value=1>全部期刊
            </LABEL>
            <LABEL>
                <INPUT id=Checkbox72 type=checkbox value=核心刊>核心期刊
            </LABEL>
            <LABEL>
                <INPUT id=Checkbox73 type=checkbox value=ei>EI来源期刊
            </LABEL>
            <LABEL>
                <INPUT id=Checkbox74 type=checkbox value=sci>SCI来源期刊
            </LABEL>
            <LABEL>
                <INPUT id=Checkbox75 type=checkbox value=cas>CAS来源期刊
            </LABEL>
            <LABEL>
                <INPUT id=Checkbox76 type=checkbox value=cscd>CSCD来源期刊
            </LABEL>
            <LABEL>
                <INPUT id=Checkbox77 type=checkbox value=cssci>CSSCI来源期刊
            </LABEL>
        </DIV>
        <H6 class=layer-cnt-h>学科限定 </H6>
        <DIV class="filter class-sel" id=re_searchdomainfilter>
            <DIV class="class ">
                <DIV class=class1 id=searchdomainone>
                    <DIV class=cn1 id=div36>
                        <SPAN class=domain id=Span1></SPAN>
                        <LABEL><INPUT id=Checkbox5 type=checkbox value=30>医药卫生</LABEL>
                    </DIV>
                    <DIV class=class2 id=Div37 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=;></SPAN><LABEL><INPUT id=Checkbox6 type=checkbox
                                                                            value=441>公共卫生与预防医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox7 type=checkbox
                                                                             value=516>毒理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox8 type=checkbox
                                                                             value=443>环境卫生学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox9 type=checkbox
                                                                             value=444>劳动卫生</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox10 type=checkbox
                                                                             value=445>军事预防医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox11 type=checkbox
                                                                             value=446>营养与食品卫生学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox12 type=checkbox
                                                                             value=447>妇幼卫生保健</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox13 type=checkbox
                                                                             value=448>流行病学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox14 type=checkbox
                                                                             value=449>卫生事业管理</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox15 type=checkbox
                                                                             value=450>卫生统计学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox16 type=checkbox
                                                                             value=451>中医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox17 type=checkbox
                                                                             value=452>中医基础理论</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox18 type=checkbox
                                                                             value=453>中医临床基础</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox19 type=checkbox
                                                                             value=454>中医诊断学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox20 type=checkbox
                                                                             value=455>针灸推拿学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox21 type=checkbox
                                                                             value=456>中医内科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox22 type=checkbox
                                                                             value=457>中医外科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox23 type=checkbox
                                                                             value=458>中医妇科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox24 type=checkbox
                                                                             value=459>中医儿科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox25 type=checkbox
                                                                             value=460>中医肿瘤科</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox26 type=checkbox
                                                                             value=461>中医骨伤科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox27 type=checkbox
                                                                             value=462>中医皮科</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox28 type=checkbox
                                                                             value=463>中医五官科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox29 type=checkbox
                                                                             value=464>中药学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox30 type=checkbox
                                                                             value=465>方剂学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox31 type=checkbox
                                                                             value=466>民族医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox32 type=checkbox
                                                                             value=467>中西医结合</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox33 type=checkbox
                                                                             value=468>基础医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox65 type=checkbox
                                                                             value=469>生物医学工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox66 type=checkbox
                                                                             value=470>人体解剖和组织胚胎学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox67 type=checkbox
                                                                             value=471>人体生理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox68 type=checkbox
                                                                             value=472>病理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox69 type=checkbox
                                                                             value=473>病原生物学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox70 type=checkbox
                                                                             value=474>医学寄生虫学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox535
                                                                             type=checkbox value=475>免疫学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox536
                                                                             type=checkbox value=476>医学遗传学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox537
                                                                             type=checkbox value=477>医学心理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox538
                                                                             type=checkbox value=478>法医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox539
                                                                             type=checkbox value=479>放射医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox540
                                                                             type=checkbox value=480>航空、航天与航海医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox541
                                                                             type=checkbox value=481>临床医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox542
                                                                             type=checkbox value=482>诊断学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox543
                                                                             type=checkbox value=483>影像医学与核医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox544
                                                                             type=checkbox value=484>治疗学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox545
                                                                             type=checkbox value=485>运动医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox546
                                                                             type=checkbox value=486>护理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox547
                                                                             type=checkbox value=487>康复医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox548
                                                                             type=checkbox value=488>急诊医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox549
                                                                             type=checkbox value=489>内科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox550
                                                                             type=checkbox value=490>心血管疾病</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox551
                                                                             type=checkbox value=491>血液循环系统疾病</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox552
                                                                             type=checkbox value=492>呼吸系统</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox553
                                                                             type=checkbox value=493>消化系统</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox554
                                                                             type=checkbox value=494>内分泌</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox555
                                                                             type=checkbox value=495>老年医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox556
                                                                             type=checkbox value=496>外科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox557
                                                                             type=checkbox value=497>麻醉学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox558
                                                                             type=checkbox value=498>整形外科</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox559
                                                                             type=checkbox value=499>骨科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox560
                                                                             type=checkbox value=500>泌尿科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox561
                                                                             type=checkbox value=501>妇产科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox562
                                                                             type=checkbox value=502>儿科</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox563
                                                                             type=checkbox value=503>肿瘤</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox564
                                                                             type=checkbox value=504>神经病学与精神病学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox565
                                                                             type=checkbox value=505>皮肤病学与性病学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox566
                                                                             type=checkbox value=506>耳鼻咽喉科</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox567
                                                                             type=checkbox value=507>眼科</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox568
                                                                             type=checkbox value=508>口腔医学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox569
                                                                             type=checkbox value=509>药学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox570
                                                                             type=checkbox value=510>药物化学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox571
                                                                             type=checkbox value=511>药物分析学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox572
                                                                             type=checkbox value=512>生药学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox573
                                                                             type=checkbox value=513>药剂学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox574
                                                                             type=checkbox value=514>药理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox575
                                                                             type=checkbox value=515>药品</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox576
                                                                             type=checkbox value=516>毒理学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox577
                                                                             type=checkbox value=517>微生物与生化药学</LABEL></DIV></DIV>
                    <DIV class=cn1 id=div38><SPAN id=Span2></SPAN><LABEL><INPUT id=Checkbox578
                                                                                type=checkbox value=35>农业科学</LABEL></DIV>
                    <DIV class=class2 id=Div39 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox579
                                                                             type=checkbox value=518>农业基础科学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox580
                                                                             type=checkbox value=519>肥料学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox581
                                                                             type=checkbox value=520>土壤学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox582
                                                                             type=checkbox value=521>农业气象学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox583
                                                                             type=checkbox value=522>农业工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox584
                                                                             type=checkbox value=523>农业机械化工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox585
                                                                             type=checkbox value=524>农业电气化与自动化</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox586
                                                                             type=checkbox value=525>农业水土工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox587
                                                                             type=checkbox value=526>农艺学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox588
                                                                             type=checkbox value=527>作物栽培与耕作技术</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox589
                                                                             type=checkbox value=528>作物遗传育种</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox590
                                                                             type=checkbox value=529></LABEL>农产品加工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox591
                                                                             type=checkbox value=530></LABEL>植物保护</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox592
                                                                             type=checkbox value=531></LABEL>植物病理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox593
                                                                             type=checkbox value=532></LABEL>农业昆虫与害虫防治</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox594
                                                                             type=checkbox value=533></LABEL>农药学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox595
                                                                             type=checkbox value=534></LABEL>作物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox596
                                                                             type=checkbox value=535></LABEL>茶叶生产加工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox597
                                                                             type=checkbox value=536></LABEL>中草药栽培</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox598
                                                                             type=checkbox value=537></LABEL>烟草工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox599
                                                                             type=checkbox value=538></LABEL>园艺学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox600
                                                                             type=checkbox value=539></LABEL>果树学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox601
                                                                             type=checkbox value=540></LABEL>蔬菜学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox602
                                                                             type=checkbox value=541></LABEL>观赏园艺</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox603
                                                                             type=checkbox value=542></LABEL>林学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox604
                                                                             type=checkbox value=543></LABEL>林木遗传育种</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox605
                                                                             type=checkbox value=544></LABEL>森林经理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox606
                                                                             type=checkbox value=545></LABEL>森林保护学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox607
                                                                             type=checkbox value=546></LABEL>森林工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox608
                                                                             type=checkbox value=547></LABEL>木材科学与技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox609
                                                                             type=checkbox value=548></LABEL>畜牧兽医</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox610
                                                                             type=checkbox value=549></LABEL>畜牧学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox611
                                                                             type=checkbox value=550></LABEL>饲料科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox612
                                                                             type=checkbox value=551></LABEL>草业科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox613
                                                                             type=checkbox value=552></LABEL>兽医学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox614
                                                                             type=checkbox value=553></LABEL>基础兽医学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox615
                                                                             type=checkbox value=554></LABEL>预防兽医学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox616
                                                                             type=checkbox value=555></LABEL>临床兽医学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox617
                                                                             type=checkbox value=556></LABEL>野生动物驯养</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox618
                                                                             type=checkbox value=557></LABEL>特种经济动物饲养</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox619
                                                                             type=checkbox value=558></LABEL>水产科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox620
                                                                             type=checkbox value=559></LABEL>渔业资源</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox621
                                                                             type=checkbox value=560></LABEL>水产养殖</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox622
                                                                             type=checkbox value=561></LABEL>捕捞与储运</DIV></DIV>
                    <DIV class=cn1 id=div40><SPAN id=Span3></SPAN><LABEL><INPUT id=Checkbox623
                                                                                type=checkbox value=257>一般工业技术</LABEL></DIV>
                    <DIV class=class2 id=Div41 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox624
                                                                             type=checkbox value=562>工程设计测绘</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox625
                                                                             type=checkbox value=563>材料科学与工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox626
                                                                             type=checkbox value=564>工业设计</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox627
                                                                             type=checkbox value=565>包装工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox628
                                                                             type=checkbox value=566>制冷工程</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox629
                                                                             type=checkbox value=567>真空技术</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox630
                                                                             type=checkbox value=568>摄影技术</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox631
                                                                             type=checkbox value=569>计量学</LABEL></DIV></DIV>
                    <DIV class=cn1 id=div42><SPAN id=Span4></SPAN><LABEL><INPUT id=Checkbox632
                                                                                type=checkbox value=13>矿业工程</LABEL></DIV>
                    <DIV class=class2 id=Div43 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox633
                                                                             type=checkbox value=570>矿山地质测量</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox634
                                                                             type=checkbox value=571></LABEL>矿井建设</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox635
                                                                             type=checkbox value=572></LABEL>矿山机电</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox636
                                                                             type=checkbox value=573></LABEL>矿井通风与安全</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox637
                                                                             type=checkbox value=574></LABEL>矿山开采</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox638
                                                                             type=checkbox value=575></LABEL>煤矿开采</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox639
                                                                             type=checkbox value=576></LABEL>金属矿开采</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox640
                                                                             type=checkbox value=577></LABEL>非金属矿开采</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox641
                                                                             type=checkbox value=578></LABEL>选矿</DIV></DIV>
                    <DIV class=cn1 id=div44><SPAN id=Span5></SPAN><LABEL><INPUT id=Checkbox642
                                                                                type=checkbox value=14>石油与天然气工程</LABEL></DIV>
                    <DIV class=class2 id=Div45 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox643
                                                                             type=checkbox value=137></LABEL>油气勘探</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox644
                                                                             type=checkbox value=138></LABEL>油气井工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox645
                                                                             type=checkbox value=139></LABEL>油气田开发工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox646
                                                                             type=checkbox value=140></LABEL>油气加工工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox647
                                                                             type=checkbox value=579></LABEL>油气储运工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox648
                                                                             type=checkbox value=580></LABEL>石油机械设备</DIV></DIV>
                    <DIV class=cn1 id=div46><SPAN id=Span6></SPAN><LABEL><INPUT id=Checkbox649
                                                                                type=checkbox value=15>冶金工程</LABEL></DIV>
                    <DIV class=class2 id=Div47 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox650
                                                                             type=checkbox value=141>冶金物理化学</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox651
                                                                             type=checkbox value=143>粉末冶金</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox652
                                                                             type=checkbox value=144>冶金机械及自动化</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox653
                                                                             type=checkbox value=145>钢铁冶金</LABEL></DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox654
                                                                             type=checkbox value=146>有色金属冶金</LABEL></DIV></DIV>
                    <DIV class=cn1 id=div48><SPAN id=Span7></SPAN><LABEL><INPUT id=Checkbox655
                                                                                type=checkbox value=16>金属学及工艺</LABEL></DIV>
                    <DIV class=class2 id=Div49 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox656
                                                                             type=checkbox value=147></LABEL>金属学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox657
                                                                             type=checkbox value=148></LABEL>物理冶金</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox658
                                                                             type=checkbox value=149></LABEL>合金</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox659
                                                                             type=checkbox value=627></LABEL>金属材料</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox660
                                                                             type=checkbox value=150></LABEL>热处理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox661
                                                                             type=checkbox value=151></LABEL>金属表面处理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox662
                                                                             type=checkbox value=152></LABEL>铸造</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox663
                                                                             type=checkbox value=153></LABEL>金属压力加工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox664
                                                                             type=checkbox value=154></LABEL>焊接</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox665
                                                                             type=checkbox value=155></LABEL>金属切削加工及机床</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox666
                                                                             type=checkbox value=156></LABEL>刀具与模具</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox667
                                                                             type=checkbox value=157></LABEL>公差测量技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox668
                                                                             type=checkbox value=158></LABEL>钳工工艺</DIV></DIV>
                    <DIV class=cn1 id=div50><SPAN id=Span8></SPAN><LABEL><INPUT id=Checkbox669
                                                                                type=checkbox value=17>机械工程</LABEL></DIV>
                    <DIV class=class2 id=Div51 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox670
                                                                             type=checkbox value=159></LABEL>机械设计及理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox671
                                                                             type=checkbox value=160></LABEL>机械制造及自动化</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox672
                                                                             type=checkbox value=161></LABEL>仪器科学与技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox673
                                                                             type=checkbox value=581></LABEL>精密仪器及机械</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox674
                                                                             type=checkbox value=582></LABEL>测试计量技术及仪器</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox675
                                                                             type=checkbox value=583></LABEL>车辆工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox676
                                                                             type=checkbox value=584></LABEL>光学工程</DIV></DIV>
                    <DIV class=cn1 id=div52><SPAN id=Span9></SPAN><LABEL><INPUT id=Checkbox677
                                                                                type=checkbox value=268>兵器科学与技术</LABEL></DIV>
                    <DIV class=class2 id=Div53 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox678
                                                                             type=checkbox value=585></LABEL>兵器发射理论与技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox679
                                                                             type=checkbox value=586></LABEL>武器系统与运用工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox680
                                                                             type=checkbox value=587></LABEL>火炮、自动武器与弹药工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox681
                                                                             type=checkbox value=588></LABEL>军事化学与烟火技术</DIV></DIV>
                    <DIV class=cn1 id=div54><SPAN id=Span10></SPAN><LABEL><INPUT id=Checkbox682
                                                                                 type=checkbox value=168>动力工程及工程热物理</LABEL></DIV>
                    <DIV class=class2 id=Div55 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox683
                                                                             type=checkbox value=167></LABEL>热能工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox684
                                                                             type=checkbox value=168></LABEL>工程热物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox685
                                                                             type=checkbox value=169></LABEL>动力机械及工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox686
                                                                             type=checkbox value=170></LABEL>生物能</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox687
                                                                             type=checkbox value=171></LABEL>流体机械及工程</DIV></DIV>
                    <DIV class=cn1 id=div56><SPAN id=Span11></SPAN><LABEL><INPUT id=Checkbox688
                                                                                 type=checkbox value=29>核科学技术</LABEL></DIV>
                    <DIV class=class2 id=Div57 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox689
                                                                             type=checkbox value=589></LABEL>核能科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox690
                                                                             type=checkbox value=590></LABEL>核燃料循环与材料</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox691
                                                                             type=checkbox value=591></LABEL>核技术及应用</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox692
                                                                             type=checkbox value=592></LABEL>辐射防护及环境保护</DIV></DIV>
                    <DIV class=cn1 id=div58><SPAN id=Span12></SPAN><LABEL><INPUT id=Checkbox693
                                                                                 type=checkbox value=20>电气工程</LABEL></DIV>
                    <DIV class=class2 id=Div59 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox694
                                                                             type=checkbox value=180></LABEL>电工理论与新技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox695
                                                                             type=checkbox value=181></LABEL>电机</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox696
                                                                             type=checkbox value=182></LABEL>电力系统及自动化</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox697
                                                                             type=checkbox value=186></LABEL>电器</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox698
                                                                             type=checkbox value=184></LABEL>高电压与绝缘技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox699
                                                                             type=checkbox value=185></LABEL>电力电子与电力传动</DIV></DIV>
                    <DIV class=cn1 id=div60><SPAN id=Span13></SPAN><LABEL><INPUT id=Checkbox700
                                                                                 type=checkbox value=19>电子电信</LABEL></DIV>
                    <DIV class=class2 id=Div61 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox701
                                                                             type=checkbox value=173></LABEL>物理电子学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox702
                                                                             type=checkbox value=174></LABEL>微电子学与固体电子学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox703
                                                                             type=checkbox value=175></LABEL>电路与系统</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox704
                                                                             type=checkbox value=176></LABEL>信息与通信工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox705
                                                                             type=checkbox value=177></LABEL>通信与信息系统</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox706
                                                                             type=checkbox value=178></LABEL>信号与信息处理</DIV></DIV>
                    <DIV class=cn1 id=div62><SPAN id=Span14></SPAN><LABEL><INPUT id=Checkbox707
                                                                                 type=checkbox value=21>自动化与计算机技术</LABEL></DIV>
                    <DIV class=class2 id=Div63 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox708
                                                                             type=checkbox value=593></LABEL>控制科学与工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox709
                                                                             type=checkbox value=594></LABEL>控制理论与控制工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox710
                                                                             type=checkbox value=595></LABEL>检测技术与自动化装置</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox711
                                                                             type=checkbox value=596></LABEL>计算机科学与技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox712
                                                                             type=checkbox value=597></LABEL>计算机系统结构</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox713
                                                                             type=checkbox value=598></LABEL>计算机软件与理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox714
                                                                             type=checkbox value=599></LABEL>计算机应用技术</DIV></DIV>
                    <DIV class=cn1 id=div64><SPAN id=Span15></SPAN><LABEL><INPUT id=Checkbox715
                                                                                 type=checkbox value=12>化学工程</LABEL></DIV>
                    <DIV class=class2 id=Div65 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox716
                                                                             type=checkbox value=123></LABEL>无机化工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox717
                                                                             type=checkbox value=124></LABEL>电化学工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox718
                                                                             type=checkbox value=122></LABEL>高温制品工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox719
                                                                             type=checkbox value=125></LABEL>硅酸盐工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox720
                                                                             type=checkbox value=600></LABEL>玻璃工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox721
                                                                             type=checkbox value=601></LABEL>水泥工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox722
                                                                             type=checkbox value=602></LABEL>搪瓷工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox723
                                                                             type=checkbox value=603></LABEL>陶瓷工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox724
                                                                             type=checkbox value=126></LABEL>有机化工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox725
                                                                             type=checkbox value=127></LABEL>高聚物工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox726
                                                                             type=checkbox value=604></LABEL>合成树脂塑料工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox727
                                                                             type=checkbox value=605></LABEL>橡胶工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox728
                                                                             type=checkbox value=606></LABEL>化纤工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox729
                                                                             type=checkbox value=128></LABEL>化学肥料工业</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox730
                                                                             type=checkbox value=129></LABEL>农药化工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox731
                                                                             type=checkbox value=130></LABEL>制药化工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox732
                                                                             type=checkbox value=131></LABEL>煤化学工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox733
                                                                             type=checkbox value=132></LABEL>炸药化工</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox734
                                                                             type=checkbox value=133></LABEL>精细化工</DIV></DIV>
                    <DIV class=cn1 id=div66><SPAN id=Span16></SPAN><LABEL><INPUT id=Checkbox735
                                                                                 type=checkbox value=25>轻工技术与工程</LABEL></DIV>
                    <DIV class=class2 id=Div67 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox736
                                                                             type=checkbox value=607></LABEL>纺织科学与工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox737
                                                                             type=checkbox value=608></LABEL>纺织工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox738
                                                                             type=checkbox value=609></LABEL>纺织材料与纺织品设计</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox739
                                                                             type=checkbox value=610></LABEL>纺织化学与染整工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox740
                                                                             type=checkbox value=611></LABEL>服装设计与工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox741
                                                                             type=checkbox value=612></LABEL>食品科学与工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox742
                                                                             type=checkbox value=613></LABEL>食品科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox743
                                                                             type=checkbox value=614></LABEL>粮食、油脂及植物蛋白工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox744
                                                                             type=checkbox value=615></LABEL>制糖工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox745
                                                                             type=checkbox value=616></LABEL>农产品加工及贮藏工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox746
                                                                             type=checkbox value=617></LABEL>水产品加工及贮藏工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox747
                                                                             type=checkbox value=618></LABEL>发酵工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox748
                                                                             type=checkbox value=619></LABEL>皮革化学与工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox749
                                                                             type=checkbox value=620></LABEL>制浆造纸工程</DIV></DIV>
                    <DIV class=cn1 id=div68><SPAN id=Span17></SPAN><LABEL><INPUT id=Checkbox750
                                                                                 type=checkbox value=22>建筑科学</LABEL></DIV>
                    <DIV class=class2 id=Div69 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox751
                                                                             type=checkbox value=195></LABEL>建筑理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox752
                                                                             type=checkbox value=196></LABEL>建筑设计及理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox753
                                                                             type=checkbox value=197></LABEL>建筑技术科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox754
                                                                             type=checkbox value=198></LABEL>土木工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox755
                                                                             type=checkbox value=199></LABEL>岩土工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox756
                                                                             type=checkbox value=622></LABEL>结构工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox757
                                                                             type=checkbox value=623></LABEL>城市规划与设计</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox758
                                                                             type=checkbox value=624></LABEL>市政工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox759
                                                                             type=checkbox value=625></LABEL>供热、供燃气、通风及空调工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox760
                                                                             type=checkbox value=626></LABEL>桥梁与隧道工程</DIV></DIV>
                    <DIV class=cn1 id=div70><SPAN id=Span18></SPAN><LABEL><INPUT id=Checkbox761
                                                                                 type=checkbox value=23>水利工程</LABEL></DIV>
                    <DIV class=class2 id=Div71 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox762
                                                                             type=checkbox value=204></LABEL>水文学及水资源</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox763
                                                                             type=checkbox value=205></LABEL>水力学及河流动力学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox764
                                                                             type=checkbox value=206></LABEL>水工结构工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox765
                                                                             type=checkbox value=207></LABEL>水利水电工程</DIV></DIV>
                    <DIV class=cn1 id=div72><SPAN id=Span19></SPAN><LABEL><INPUT id=Checkbox766
                                                                                 type=checkbox value=26>交通运输工程</LABEL></DIV>
                    <DIV class=class2 id=Div73 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox767
                                                                             type=checkbox value=208></LABEL>道路与铁道工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox768
                                                                             type=checkbox value=209></LABEL>交通信息工程及控制</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox769
                                                                             type=checkbox value=210></LABEL>交通运输规划与管理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox770
                                                                             type=checkbox value=211></LABEL>载运工具运用工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox771
                                                                             type=checkbox value=212></LABEL>船舶与海洋工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox772
                                                                             type=checkbox value=213></LABEL>船舶及航道工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox773
                                                                             type=checkbox value=214></LABEL>轮机工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox774
                                                                             type=checkbox value=215></LABEL>水声工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox775
                                                                             type=checkbox value=621></LABEL>港口、海岸及近海工程</DIV></DIV>
                    <DIV class=cn1 id=div74><SPAN id=Span20></SPAN><LABEL><INPUT id=Checkbox776
                                                                                 type=checkbox value=27>航空宇航科学技术</LABEL></DIV>
                    <DIV class=class2 id=Div75 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox777
                                                                             type=checkbox value=216></LABEL>飞行器设计</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox778
                                                                             type=checkbox value=217></LABEL>航空宇航推进理论与工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox779
                                                                             type=checkbox value=218></LABEL>航空宇航制造工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox780
                                                                             type=checkbox value=219></LABEL>人机与环境工程</DIV></DIV>
                    <DIV class=cn1 id=div76><SPAN id=Span21></SPAN><LABEL><INPUT id=Checkbox781
                                                                                 type=checkbox value=28>环境科学与工程</LABEL></DIV>
                    <DIV class=class2 id=Div77 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox782
                                                                             type=checkbox value=221></LABEL>环境科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox783
                                                                             type=checkbox value=222></LABEL>环境工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox784
                                                                             type=checkbox value=223></LABEL>灾害防治</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox785
                                                                             type=checkbox value=226></LABEL>安全科学</DIV></DIV>
                    <DIV class=cn1 id=div78><SPAN id=Span22></SPAN><LABEL><INPUT id=Checkbox786
                                                                                 type=checkbox value=266>自然科学总论</LABEL></DIV>
                    <DIV class=class2 id=Div79 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox787
                                                                             type=checkbox value=376></LABEL>系统科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox788
                                                                             type=checkbox value=377></LABEL>科学技术哲学</DIV></DIV>
                    <DIV class=cn1 id=div80><SPAN id=Span23></SPAN><LABEL><INPUT id=Checkbox789
                                                                                 type=checkbox value=267>理学</LABEL></DIV>
                    <DIV class=class2 id=Div81 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox790
                                                                             type=checkbox value=378></LABEL>数学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox791
                                                                             type=checkbox value=379></LABEL>基础数学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox792
                                                                             type=checkbox value=380></LABEL>计算数学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox793
                                                                             type=checkbox value=381></LABEL>概率论与数理统计</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox794
                                                                             type=checkbox value=382></LABEL>应用数学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox795
                                                                             type=checkbox value=383></LABEL>运筹学与控制论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox796
                                                                             type=checkbox value=384></LABEL>力学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox797
                                                                             type=checkbox value=385></LABEL>一般力学与力学基础</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox798
                                                                             type=checkbox value=386></LABEL>固体力学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox799
                                                                             type=checkbox value=387></LABEL>流体力学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox800
                                                                             type=checkbox value=388></LABEL>工程力学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox801
                                                                             type=checkbox value=389></LABEL>物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox802
                                                                             type=checkbox value=390></LABEL>理论物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox803
                                                                             type=checkbox value=391></LABEL>声学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox804
                                                                             type=checkbox value=392></LABEL>光学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox805
                                                                             type=checkbox value=393></LABEL>电磁学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox806
                                                                             type=checkbox value=394></LABEL>无线电物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox807
                                                                             type=checkbox value=395></LABEL>电子物理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox808
                                                                             type=checkbox value=396></LABEL>凝聚态物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox809
                                                                             type=checkbox value=397></LABEL>半导体物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox810
                                                                             type=checkbox value=398></LABEL>固体物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox811
                                                                             type=checkbox value=399></LABEL>低温物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox812
                                                                             type=checkbox value=400></LABEL>高压高温物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox813
                                                                             type=checkbox value=401></LABEL>等离子体物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox814
                                                                             type=checkbox value=402></LABEL>热学与物质分子运动论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox815
                                                                             type=checkbox value=403></LABEL>原子与分子物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox816
                                                                             type=checkbox value=404></LABEL>粒子物理与原子核物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox817
                                                                             type=checkbox value=405></LABEL>应用物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox818
                                                                             type=checkbox value=406></LABEL>化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox819
                                                                             type=checkbox value=407></LABEL>无机化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox820
                                                                             type=checkbox value=408></LABEL>有机化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox821
                                                                             type=checkbox value=409></LABEL>高分子化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox822
                                                                             type=checkbox value=410></LABEL>物理化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox823
                                                                             type=checkbox value=411></LABEL>分析化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox824
                                                                             type=checkbox value=412></LABEL>晶体学</DIV></DIV>
                    <DIV class=cn1 id=div82><SPAN id=Span24></SPAN><LABEL><INPUT id=Checkbox825
                                                                                 type=checkbox value=10>天文地球</LABEL></DIV>
                    <DIV class=class2 id=Div83 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox826
                                                                             type=checkbox value=115></LABEL>天文学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox827
                                                                             type=checkbox value=413></LABEL>天体物理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox828
                                                                             type=checkbox value=414></LABEL>天体测量</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox829
                                                                             type=checkbox value=415></LABEL>天体力学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox830
                                                                             type=checkbox value=116></LABEL>测绘科学与技术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox831
                                                                             type=checkbox value=416></LABEL>大地测量学与测量工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox832
                                                                             type=checkbox value=417></LABEL>摄影测量与遥感</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox833
                                                                             type=checkbox value=418></LABEL>地图制图学与地理信息工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox834
                                                                             type=checkbox value=117></LABEL>地球物理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox835
                                                                             type=checkbox value=419></LABEL>固体地球物理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox836
                                                                             type=checkbox value=420></LABEL>地震学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox837
                                                                             type=checkbox value=421></LABEL>水文科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox838
                                                                             type=checkbox value=422></LABEL>空间物理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox839
                                                                             type=checkbox value=118></LABEL>大气科学及气象学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox840
                                                                             type=checkbox value=423></LABEL>大气物理学与大气环境</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox841
                                                                             type=checkbox value=424></LABEL>地质学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox842
                                                                             type=checkbox value=425></LABEL>矿物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox843
                                                                             type=checkbox value=426></LABEL>岩石学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox844
                                                                             type=checkbox value=427></LABEL>矿床学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox845
                                                                             type=checkbox value=428></LABEL>地质矿产勘探</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox846
                                                                             type=checkbox value=429></LABEL>工程地质学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox847
                                                                             type=checkbox value=430></LABEL>地球化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox848
                                                                             type=checkbox value=431></LABEL>古生物学与地层学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox849
                                                                             type=checkbox value=432></LABEL>构造地质学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox850
                                                                             type=checkbox value=433></LABEL>第四纪地质学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox851
                                                                             type=checkbox value=120></LABEL>海洋科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox852
                                                                             type=checkbox value=434></LABEL>物理海洋学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox853
                                                                             type=checkbox value=435></LABEL>海洋化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox854
                                                                             type=checkbox value=436></LABEL>海洋生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox855
                                                                             type=checkbox value=437></LABEL>海洋地质</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox856
                                                                             type=checkbox value=121></LABEL>自然地理学</DIV></DIV>
                    <DIV class=cn1 id=div84><SPAN id=Span25></SPAN><LABEL><INPUT id=Checkbox857
                                                                                 type=checkbox value=9>生物学</LABEL></DIV>
                    <DIV class=class2 id=Div85 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox858
                                                                             type=checkbox value=101></LABEL>普通生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox859
                                                                             type=checkbox value=438></LABEL>生态学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox860
                                                                             type=checkbox value=439></LABEL>水生生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox861
                                                                             type=checkbox value=440></LABEL>神经生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox862
                                                                             type=checkbox value=102></LABEL>细胞生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox863
                                                                             type=checkbox value=103></LABEL>遗传学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox864
                                                                             type=checkbox value=104></LABEL>生理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox865
                                                                             type=checkbox value=105></LABEL>生物化学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox866
                                                                             type=checkbox value=106></LABEL>生物物理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox867
                                                                             type=checkbox value=107></LABEL>分子生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox868
                                                                             type=checkbox value=112></LABEL>生物工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox869
                                                                             type=checkbox value=113></LABEL>古生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox870
                                                                             type=checkbox value=111></LABEL>微生物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox871
                                                                             type=checkbox value=108></LABEL>植物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox872
                                                                             type=checkbox value=109></LABEL>动物学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox873
                                                                             type=checkbox value=110></LABEL>昆虫学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox874
                                                                             type=checkbox value=114></LABEL>人类学</DIV></DIV>
                    <DIV class=cn1 id=div86><SPAN id=Span26></SPAN><LABEL><INPUT id=Checkbox875
                                                                                 type=checkbox value=261>文化科学</LABEL></DIV>
                    <DIV class=class2 id=Div87 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox876
                                                                             type=checkbox value=329></LABEL>传播学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox877
                                                                             type=checkbox value=330></LABEL>新闻学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox878
                                                                             type=checkbox value=331></LABEL>图书馆学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox879
                                                                             type=checkbox value=332></LABEL>档案学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox880
                                                                             type=checkbox value=333></LABEL>情报学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox881
                                                                             type=checkbox value=334></LABEL>教育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox882
                                                                             type=checkbox value=335></LABEL>教育技术学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox883
                                                                             type=checkbox value=336></LABEL>教育学原理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox884
                                                                             type=checkbox value=337></LABEL>课程与教学论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox885
                                                                             type=checkbox value=338></LABEL>学前教育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox886
                                                                             type=checkbox value=339></LABEL>高等教育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox887
                                                                             type=checkbox value=340></LABEL>成人教育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox888
                                                                             type=checkbox value=341></LABEL>职业技术教育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox889
                                                                             type=checkbox value=342></LABEL>特殊教育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox890
                                                                             type=checkbox value=343></LABEL>体育学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox891
                                                                             type=checkbox value=344></LABEL>运动人体科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox892
                                                                             type=checkbox value=345></LABEL>体育训练</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox893
                                                                             type=checkbox value=346></LABEL>民族体育</DIV></DIV>
                    <DIV class=cn1 id=div88><SPAN id=Span27></SPAN><LABEL><INPUT id=Checkbox894
                                                                                 type=checkbox value=2>经济管理</LABEL></DIV>
                    <DIV class=class2 id=Div89 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox895
                                                                             type=checkbox value=313></LABEL>管理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox896
                                                                             type=checkbox value=314></LABEL>人力资源管理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox897
                                                                             type=checkbox value=315></LABEL>政治经济学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox898
                                                                             type=checkbox value=316></LABEL>世界经济</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox899
                                                                             type=checkbox value=317></LABEL>国民经济</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox900
                                                                             type=checkbox value=318></LABEL>会计学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox901
                                                                             type=checkbox value=319></LABEL>企业管理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox902
                                                                             type=checkbox value=320></LABEL>产业经济</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox903
                                                                             type=checkbox value=321></LABEL>市场营销</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox904
                                                                             type=checkbox value=322></LABEL>广告</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox905
                                                                             type=checkbox value=323></LABEL>旅游管理</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox906
                                                                             type=checkbox value=324></LABEL>国际贸易</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox907
                                                                             type=checkbox value=325></LABEL>财政学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox908
                                                                             type=checkbox value=326></LABEL>金融学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox909
                                                                             type=checkbox value=327></LABEL>保险</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox910
                                                                             type=checkbox value=328></LABEL>劳动经济</DIV></DIV>
                    <DIV class=cn1 id=div90><SPAN id=Span28></SPAN><LABEL><INPUT id=Checkbox911
                                                                                 type=checkbox value=259>政治法律</LABEL></DIV>
                    <DIV class=class2 id=Div91 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox912
                                                                             type=checkbox value=286></LABEL>政治学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox913
                                                                             type=checkbox value=287></LABEL>国际共产主义运动</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox914
                                                                             type=checkbox value=288></LABEL>中共党史</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox915
                                                                             type=checkbox value=289></LABEL>国际政治</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox916
                                                                             type=checkbox value=290></LABEL>外交学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox917
                                                                             type=checkbox value=291></LABEL>国际关系</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox918
                                                                             type=checkbox value=292></LABEL>中外政治制度</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox919
                                                                             type=checkbox value=293></LABEL>法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox920
                                                                             type=checkbox value=294></LABEL>法学理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox921
                                                                             type=checkbox value=295></LABEL>宪法学与行政法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox922
                                                                             type=checkbox value=296></LABEL>刑法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox923
                                                                             type=checkbox value=297></LABEL>民商法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox924
                                                                             type=checkbox value=298></LABEL>诉讼法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox925
                                                                             type=checkbox value=299></LABEL>经济法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox926
                                                                             type=checkbox value=300></LABEL>环境与资源保护法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox927
                                                                             type=checkbox value=301></LABEL>国际法学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox928
                                                                             type=checkbox value=302></LABEL>军事法学</DIV></DIV>
                    <DIV class=cn1 id=div92><SPAN id=Span29></SPAN><LABEL><INPUT id=Checkbox929
                                                                                 type=checkbox value=8>哲学宗教</LABEL></DIV>
                    <DIV class=class2 id=Div93 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox930
                                                                             type=checkbox value=269></LABEL>哲学理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox931
                                                                             type=checkbox value=270></LABEL>马克思主义哲学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox932
                                                                             type=checkbox value=271></LABEL>世界哲学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox933
                                                                             type=checkbox value=272></LABEL>中国哲学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox934
                                                                             type=checkbox value=273></LABEL>外国哲学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox935
                                                                             type=checkbox value=274></LABEL>思维科学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox936
                                                                             type=checkbox value=275></LABEL>逻辑学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox937
                                                                             type=checkbox value=276></LABEL>伦理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox938
                                                                             type=checkbox value=277></LABEL>美学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox939
                                                                             type=checkbox value=278></LABEL>宗教学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox940
                                                                             type=checkbox value=279></LABEL>心理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox941
                                                                             type=checkbox value=280></LABEL>基础心理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox942
                                                                             type=checkbox value=281></LABEL>发展与教育心理学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox943
                                                                             type=checkbox value=281></LABEL>应用心理学</DIV></DIV>
                    <DIV class=cn1 id=div94><SPAN id=Span30></SPAN><LABEL><INPUT id=Checkbox944
                                                                                 type=checkbox value=258>社会学</LABEL></DIV>
                    <DIV class=class2 id=Div95 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox945
                                                                             type=checkbox value=283></LABEL>统计学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox946
                                                                             type=checkbox value=284></LABEL>人口学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox947
                                                                             type=checkbox value=285></LABEL>民族学</DIV></DIV>
                    <DIV class=cn1 id=div96><SPAN id=Span31></SPAN><LABEL><INPUT id=Checkbox948
                                                                                 type=checkbox value=260>军事</LABEL></DIV>
                    <DIV class=class2 id=Div97 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox949
                                                                             type=checkbox value=303></LABEL>军事理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox950
                                                                             type=checkbox value=304></LABEL>战略学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox951
                                                                             type=checkbox value=305></LABEL>战役学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox952
                                                                             type=checkbox value=306></LABEL>战术学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox953
                                                                             type=checkbox value=307></LABEL>军队指挥学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox954
                                                                             type=checkbox value=308></LABEL>军事通信学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox955
                                                                             type=checkbox value=309></LABEL>军事情报学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox956
                                                                             type=checkbox value=310></LABEL>军事装备学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox957
                                                                             type=checkbox value=311></LABEL>军事工程</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox958
                                                                             type=checkbox value=312></LABEL>军事地形</DIV></DIV>
                    <DIV class=cn1 id=div98><SPAN id=Span32></SPAN><LABEL><INPUT id=Checkbox959
                                                                                 type=checkbox value=262>语言文字</LABEL></DIV>
                    <DIV class=class2 id=Div99 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox960
                                                                             type=checkbox value=347></LABEL>语言学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox961
                                                                             type=checkbox value=348></LABEL>汉语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox962
                                                                             type=checkbox value=349></LABEL>少数民族语言</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox963
                                                                             type=checkbox value=350></LABEL>英语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox964
                                                                             type=checkbox value=351></LABEL>法语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox965
                                                                             type=checkbox value=352></LABEL>德语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox966
                                                                             type=checkbox value=353></LABEL>西班牙语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox967
                                                                             type=checkbox value=354></LABEL>俄语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox968
                                                                             type=checkbox value=355></LABEL>日语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox969
                                                                             type=checkbox value=356></LABEL>阿拉伯语</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox970
                                                                             type=checkbox value=357></LABEL>世界语</DIV></DIV>
                    <DIV class=cn1 id=div100><SPAN id=Span33></SPAN><LABEL><INPUT id=Checkbox971
                                                                                  type=checkbox value=263>文学</LABEL></DIV>
                    <DIV class=class2 id=Div101 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox972
                                                                             type=checkbox value=358></LABEL>文学理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox973
                                                                             type=checkbox value=359></LABEL>世界文学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox974
                                                                             type=checkbox value=360></LABEL>中国文学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox975
                                                                             type=checkbox value=361></LABEL>其他各国文学</DIV></DIV>
                    <DIV class=cn1 id=div102><SPAN id=Span34></SPAN><LABEL><INPUT id=Checkbox976
                                                                                  type=checkbox value=264>艺术</LABEL></DIV>
                    <DIV class=class2 id=Div103 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox977
                                                                             type=checkbox value=362></LABEL>艺术理论</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox978
                                                                             type=checkbox value=363></LABEL>美术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox979
                                                                             type=checkbox value=364></LABEL>摄影艺术</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox980
                                                                             type=checkbox value=365></LABEL>艺术设计</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox981
                                                                             type=checkbox value=366></LABEL>音乐</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox982
                                                                             type=checkbox value=367></LABEL>舞蹈</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox983
                                                                             type=checkbox value=368></LABEL>戏剧戏曲</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox984
                                                                             type=checkbox value=369></LABEL>电影电视艺术</DIV></DIV>
                    <DIV class=cn1 id=div104><SPAN id=Span35></SPAN><LABEL><INPUT id=Checkbox985
                                                                                  type=checkbox value=265>历史地理</LABEL></DIV>
                    <DIV class=class2 id=Div105 style="DISPLAY: none">
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox986
                                                                             type=checkbox value=370></LABEL>历史学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox987
                                                                             type=checkbox value=371></LABEL>中国史</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox988
                                                                             type=checkbox value=372></LABEL>世界史</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox989
                                                                             type=checkbox value=373></LABEL>考古学及博物馆学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox990
                                                                             type=checkbox value=374></LABEL>民俗学</DIV>
                        <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox991
                                                                             type=checkbox value=375></LABEL>人文地理学</DIV></DIV></DIV></DIV></DIV>
        <DIV class=submit><INPUT class=btn-s onclick=RetrievalSearchExpression() type=button value=检索>
            <INPUT class=btn-c onclick="onidclose('objectsearch-factor')" type=reset value=取消>
        </DIV></DIV></DIV>
<DIV class="layer-box advance" id=pagesearch-factor style="DISPLAY: none">
    <DIV class=close>
        <A onclick="onidclose('pagesearch-factor')" href="javascript:void(0);">
            <IMG width=21 height=21 alt="" src="../newSearch_files/layer-close.png">
        </A>
    </DIV>
    <H5 class=layer-title>
        <A class=current onclick="isshowclose('pagesearch-factor','objectsearch-factor')" href="javascript:void(0);">高级检索</A>
        <A onclick="isshowclose('objectsearch-factor','pagesearch-factor')" href="javascript:void(0);">检索式检索</A>
    </H5>
    <DIV class=layer-cnt>
        <DIV>
            <DIV class="search-list adv-object" id=basic-factor>
                <DIV class=sinput-top>
                    <DIV class=sel>
                        <INPUT id=hidAikey1 type=hidden value=M>
                        <SELECT id=Select11 value="M">
                            <OPTION value=U>U=任意字段</OPTION> <OPTION value=M selected>
                            M=题名或关键词</OPTION> <OPTION value=T>T=题名</OPTION> <OPTION
                                value=K>K=关键词</OPTION> <OPTION value=R>R=文摘</OPTION> <OPTION
                                value=A>A=作者</OPTION> <OPTION value=F>F=第一作者</OPTION> <OPTION
                                value=S>S=机构</OPTION> <OPTION value=J>J=刊名</OPTION> <OPTION
                                value=C>C=分类号</OPTION> <OPTION value=Y>Y=参考文献</OPTION> <OPTION
                                value=Z>Z=作者简介</OPTION> <OPTION value=I>I=基金资助</OPTION> <OPTION
                                value=L>L=栏目信息</OPTION>
                        </SELECT>
                    </DIV>
                    <DIV class=input>
                        <INPUT name=txtRowPut1 id=txtRowPut1 type=text>
                        <SPAN class=in-sel>
                            <INPUT id=hidAijq1 type=hidden value=%>
                            <SELECT id=Select25 value="%">
                                <OPTION class=exact value=&amp;>精确</OPTION>
                                <OPTION value=% selected>模糊</OPTION>
                            </SELECT>
                        </SPAN>
                        <SPAN class=class-view
                              style="DISPLAY: none"><INPUT id=Button1 onclick="SelectClass('txtRowPut1')" type=button value=查看分类表></SPAN>
                    </DIV>
                </DIV>
                <DIV class=sinput>
                    <DIV class=s>
                        <SELECT id=Select13>
                            <OPTION value=* selected>与</OPTION>
                            <OPTION value=+>或</OPTION> <OPTION value=->非</OPTION>
                        </SELECT>
                    </DIV>
                    <DIV class=sel>
                        <SELECT id=Select12 value="A">
                            <OPTION value=U>U=任意字段</OPTION>
                            <OPTION value=M>M=题名或关键词</OPTION> <OPTION value=T>T=题名</OPTION> <OPTION
                                value=K>K=关键词</OPTION> <OPTION value=R>R=文摘</OPTION> <OPTION value=A
                                                                                             selected>A=作者</OPTION> <OPTION value=F>F=第一作者</OPTION> <OPTION
                                value=S>S=机构</OPTION> <OPTION value=J>J=刊名</OPTION> <OPTION
                                value=C>C=分类号</OPTION> <OPTION value=Y>Y=参考文献</OPTION> <OPTION
                                value=Z>Z=作者简介</OPTION> <OPTION value=I>I=基金资助</OPTION> <OPTION
                                value=L>L=栏目信息</OPTION></SELECT> </DIV>
                    <DIV class=input>
                        <INPUT name=txtRowPut2 id=txtRowPut2 type=text>
                        <SPAN class=in-sel>
                            <SELECT id=Select26 value="%">
                                <OPTION class=exact value=&amp;>精确</OPTION> <OPTION value=% selected>模糊</OPTION>
                            </SELECT>
                        </SPAN>
                        <SPAN class=class-view style="DISPLAY: none">
                            <INPUT id=Button2 onclick="SelectClass('txtRowPut2')" type=button value=查看分类表>
                        </SPAN>
                    </DIV>
                </DIV>
                <DIV class=sinput>
                    <DIV class=s>
                        <INPUT id=hidAigx3 type=hidden value=*>
                        <SELECT id=Select14>
                            <OPTION value=* selected>与</OPTION>
                            <OPTION value=+>或</OPTION> <OPTION
                                value=->非</OPTION>
                        </SELECT>
                    </DIV>
                    <DIV class=sel>
                        <SELECT id=Select15 value="C">
                            <OPTION value=U>U=任意字段</OPTION>
                            <OPTION value=M>M=题名或关键词</OPTION> <OPTION value=T>T=题名</OPTION> <OPTION
                                value=K>K=关键词</OPTION> <OPTION value=R>R=文摘</OPTION> <OPTION
                                value=A>A=作者</OPTION> <OPTION value=F>F=第一作者</OPTION> <OPTION
                                value=S>S=机构</OPTION> <OPTION value=J>J=刊名</OPTION>
                            <OPTION value=C selected>C=分类号</OPTION> <OPTION value=Y>Y=参考文献</OPTION> <OPTION
                                value=Z>Z=作者简介</OPTION> <OPTION value=I>I=基金资助</OPTION> <OPTION
                                value=L>L=栏目信息</OPTION>
                        </SELECT>
                    </DIV>
                    <DIV class=input>
                        <INPUT name=txtRowPut3 id=txtRowPut3 type=text>
                        <SPAN class=in-sel>
                            <SELECT id=Select27 value="%">
                                <OPTION class=exact value=&amp;>精确</OPTION> <OPTION value=% selected>模糊</OPTION>
                            </SELECT>
                        </SPAN>
                        <SPAN class=class-view>
                            <INPUT id=btnClass onclick="SelectClass('txtRowPut3')" type=button value=查看分类表>
                        </SPAN>
                    </DIV>
                </DIV>
                <DIV class=sinput style="DISPLAY: none">
                    <DIV class=s>
                        <SELECT id=Select17>
                            <OPTION value=* selected>与</OPTION> <OPTION value=+>或</OPTION>
                            <OPTION value=->非</OPTION></SELECT>
                    </DIV>
                    <DIV class=sel><SELECT id=Select16 value="S">
                        <OPTION value=U>U=任意字段</OPTION>
                        <OPTION value=M>M=题名或关键词</OPTION> <OPTION value=T>T=题名</OPTION> <OPTION
                            value=K>K=关键词</OPTION> <OPTION value=R>R=文摘</OPTION> <OPTION
                            value=A>A=作者</OPTION> <OPTION value=F>F=第一作者</OPTION> <OPTION value=S
                                                                                          selected>S=机构</OPTION> <OPTION value=J>J=刊名</OPTION> <OPTION
                            value=C>C=分类号</OPTION> <OPTION value=Y>Y=参考文献</OPTION> <OPTION
                            value=Z>Z=作者简介</OPTION> <OPTION value=I>I=基金资助</OPTION> <OPTION
                            value=L>L=栏目信息</OPTION></SELECT> </DIV>
                    <DIV class=input>
                        <INPUT name=txtRowPut4 id=txtRowPut4 type=text>
                        <SPAN class=in-sel>
                            <SELECT id=Select28 value="%">
                                <OPTION class=exact value=&amp;>精确</OPTION> <OPTION value=% selected>模糊</OPTION>
                            </SELECT>
                        </SPAN>
                        <SPAN class=class-view style="DISPLAY: none">
                            <INPUT id=Button3 onclick="SelectClass('txtRowPut4')" type=button value=查看分类表>
                        </SPAN>
                    </DIV>
                </DIV>
                <DIV class=sinput style="DISPLAY: none">
                    <DIV class=s>
                        <SELECT id=Select18>
                            <OPTION value=* selected>与</OPTION> <OPTION
                                value=+>或</OPTION> <OPTION value=->非</OPTION>
                        </SELECT>
                    </DIV>
                    <DIV class=sel>
                        <SELECT id=Select19 value="J">
                            <OPTION value=U>U=任意字段</OPTION>
                            <OPTION value=M>M=题名或关键词</OPTION> <OPTION value=T>T=题名</OPTION> <OPTION
                                value=K>K=关键词</OPTION> <OPTION value=R>R=文摘</OPTION> <OPTION
                                value=A>A=作者</OPTION> <OPTION value=F>F=第一作者</OPTION> <OPTION
                                value=S>S=机构</OPTION> <OPTION value=J selected>J=刊名</OPTION> <OPTION
                                value=C>C=分类号</OPTION> <OPTION value=Y>Y=参考文献</OPTION> <OPTION
                                value=Z>Z=作者简介</OPTION> <OPTION value=I>I=基金资助</OPTION> <OPTION
                                value=L>L=栏目信息</OPTION>
                        </SELECT>
                    </DIV>
                    <DIV class=input>
                        <INPUT name=txtRowPut5 id=txtRowPut5 type=text>
                        <SPAN class=in-sel>
                            <SELECT id=Select29 value="%">
                                <OPTION class=exact value=&amp;>精确</OPTION> <OPTION value=% selected>模糊</OPTION>
                            </SELECT>
                        </SPAN>
                        <SPAN class=class-view style="DISPLAY: none">
                            <INPUT id=Button4 onclick="SelectClass('txtRowPut5')" type=button value=查看分类表>
                        </SPAN>
                    </DIV>
                </DIV>
                <DIV class=sel-op>
                    <INPUT class=add onclick="addsearchitem('basic-factor')" type=button>
                    <INPUT class=cut onclick="cutsearchitem('basic-factor')" type=button>
                </DIV>
            </DIV>
            <H6 class=layer-cnt-h>时间限定 </H6>
            <DIV class=filter id=basic_searchtimefilter>
                <STRONG>
                    <INPUT name=radsearhtime type=radio CHECKED value=1>时间：</STRONG>
                <DIV class=t>
                    <SELECT name=basic_dropAiStartTime id=basic_dropAiStartTime>
                        <OPTION value=1989 selected>1989</OPTION> <OPTION value=1990>1990</OPTION>
                        <OPTION value=1991>1991</OPTION> <OPTION value=1992>1992</OPTION> <OPTION
                            value=1993>1993</OPTION> <OPTION value=1994>1994</OPTION> <OPTION
                            value=1995>1995</OPTION> <OPTION value=1996>1996</OPTION> <OPTION
                            value=1997>1997</OPTION> <OPTION value=1998>1998</OPTION> <OPTION
                            value=1999>1999</OPTION> <OPTION value=2000>2000</OPTION> <OPTION
                            value=2001>2001</OPTION> <OPTION value=2002>2002</OPTION> <OPTION
                            value=2003>2003</OPTION> <OPTION value=2004>2004</OPTION> <OPTION
                            value=2005>2005</OPTION> <OPTION value=2006>2006</OPTION> <OPTION
                            value=2007>2007</OPTION> <OPTION value=2008>2008</OPTION> <OPTION
                            value=2009>2009</OPTION> <OPTION value=2010>2010</OPTION> <OPTION
                            value=2011>2011</OPTION> <OPTION value=2012>2012</OPTION> <OPTION
                            value=2013>2013</OPTION> <OPTION value=2014>2014</OPTION> <OPTION
                            value=2015>2015</OPTION> <OPTION value=2016>2016</OPTION>
                    </SELECT>
                </DIV><SPAN>-</SPAN>
                <DIV class=t>
                    <SELECT name=basic_dropAiEndTime id=basic_dropAiEndTime> <OPTION
                            value=2016 selected>2016</OPTION> <OPTION value=2015>2015</OPTION> <OPTION
                            value=2014>2014</OPTION> <OPTION value=2013>2013</OPTION> <OPTION
                            value=2012>2012</OPTION> <OPTION value=2011>2011</OPTION> <OPTION
                            value=2010>2010</OPTION> <OPTION value=2009>2009</OPTION> <OPTION
                            value=2008>2008</OPTION> <OPTION value=2007>2007</OPTION> <OPTION
                            value=2006>2006</OPTION> <OPTION value=2005>2005</OPTION> <OPTION
                            value=2004>2004</OPTION> <OPTION value=2003>2003</OPTION> <OPTION
                            value=2002>2002</OPTION> <OPTION value=2001>2001</OPTION> <OPTION
                            value=2000>2000</OPTION> <OPTION value=1999>1999</OPTION> <OPTION
                            value=1998>1998</OPTION> <OPTION value=1997>1997</OPTION> <OPTION
                            value=1996>1996</OPTION> <OPTION value=1995>1995</OPTION> <OPTION
                            value=1994>1994</OPTION> <OPTION value=1993>1993</OPTION> <OPTION
                            value=1992>1992</OPTION> <OPTION value=1991>1991</OPTION> <OPTION
                            value=1990>1990</OPTION> <OPTION value=1989>1989</OPTION>
                    </SELECT>
                </DIV>

                <STRONG style="MARGIN-LEFT: 40px">
                    <INPUT name=radsearhtime type=radio value=2>更新时间：
                </STRONG>
                <DIV class=sel>
                    <SELECT class=endtime id=basic_searchtimeupdatefilter>
                        <OPTION value=1 selected>一个月内</OPTION>
                        <OPTION value=2>三个月内</OPTION>
                        <OPTION value=3>半年内</OPTION>
                        <OPTION value=4>一年内</OPTION>
                        <OPTION value=5>当年内</OPTION>
                    </SELECT>
                </DIV>
            </DIV>
            <H6 class=layer-cnt-h>期刊范围 </H6>
            <DIV class=filter id=basic_searchjournaltype>
                <LABEL>
                    <INPUT id=chkAll type=checkbox value=1>全部期刊
                </LABEL>
                <LABEL>
                    <INPUT id=chkHxk type=checkbox value=核心刊>核心期刊
                </LABEL>
                <LABEL>
                    <INPUT id=chkEi type=checkbox value=ei>EI来源期刊
                </LABEL>
                <LABEL>
                    <INPUT id=chkSci type=checkbox value=sci>SCI来源期刊
                </LABEL>
                <LABEL>
                    <INPUT id=chkCas type=checkbox value=cas>CAS来源期刊
                </LABEL>
                <LABEL>
                    <INPUT id=chkCscd type=checkbox value=cscd>CSCD来源期刊
                </LABEL>
                <LABEL>
                    <INPUT id=chkCssci type=checkbox value=cssci>CSSCI来源期刊
                </LABEL>
            </DIV>
            <H6 class=layer-cnt-h>学科限定</H6>
            <DIV class="filter class-sel" id=basic_searchdomainfilter>
                <DIV class="class ">
                    <DIV class=class1 id=searchdomaintwo>
                        <DIV class=cn1 id=div1>
                            <SPAN class=domain id=zone1></SPAN>
                            <LABEL>
                                <INPUT id=Checkbox1 type=checkbox value=30>医药卫生
                            </LABEL>
                        </DIV>
                        <DIV class=class2 id=zones1 style="DISPLAY: none">
                            <DIV class=cn2>
                                <SPAN onclick=;></SPAN>
                                <LABEL>
                                    <INPUT id=Checkbox2 type=checkbox value=441>公共卫生与预防医学</LABEL>
                            </DIV>
                            <DIV class=cn2>
                                <SPAN onclick=""></SPAN>
                                <LABEL>
                                    <INPUT id=Checkbox3 type=checkbox value=516>毒理学
                                </LABEL>
                            </DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox4 type=checkbox
                                                                                 value=443>环境卫生学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox34 type=checkbox
                                                                                 value=444>劳动卫生</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox35 type=checkbox
                                                                                 value=445>军事预防医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox36 type=checkbox
                                                                                 value=446>营养与食品卫生学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox37 type=checkbox
                                                                                 value=447>妇幼卫生保健</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox38 type=checkbox
                                                                                 value=448>流行病学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox39 type=checkbox
                                                                                 value=449>卫生事业管理</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox40 type=checkbox
                                                                                 value=450>卫生统计学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox41 type=checkbox
                                                                                 value=451>中医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox42 type=checkbox
                                                                                 value=452>中医基础理论</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox43 type=checkbox
                                                                                 value=453>中医临床基础</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox44 type=checkbox
                                                                                 value=454>中医诊断学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox45 type=checkbox
                                                                                 value=455>针灸推拿学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox46 type=checkbox
                                                                                 value=456>中医内科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox47 type=checkbox
                                                                                 value=457>中医外科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox48 type=checkbox
                                                                                 value=458>中医妇科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox49 type=checkbox
                                                                                 value=459>中医儿科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox50 type=checkbox
                                                                                 value=460>中医肿瘤科</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox51 type=checkbox
                                                                                 value=461>中医骨伤科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox52 type=checkbox
                                                                                 value=462>中医皮科</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox53 type=checkbox
                                                                                 value=463>中医五官科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox54 type=checkbox
                                                                                 value=464>中药学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox55 type=checkbox
                                                                                 value=465>方剂学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox56 type=checkbox
                                                                                 value=466>民族医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox57 type=checkbox
                                                                                 value=467>中西医结合</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox58 type=checkbox
                                                                                 value=468>基础医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox59 type=checkbox
                                                                                 value=469>生物医学工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox60 type=checkbox
                                                                                 value=470>人体解剖和组织胚胎学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox61 type=checkbox
                                                                                 value=471>人体生理学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox62 type=checkbox
                                                                                 value=472>病理学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox63 type=checkbox
                                                                                 value=473>病原生物学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox64 type=checkbox
                                                                                 value=474>医学寄生虫学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox78 type=checkbox
                                                                                 value=475>免疫学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox79 type=checkbox
                                                                                 value=476>医学遗传学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox80 type=checkbox
                                                                                 value=477>医学心理学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox81 type=checkbox
                                                                                 value=478>法医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox82 type=checkbox
                                                                                 value=479>放射医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox83 type=checkbox
                                                                                 value=480>航空、航天与航海医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox84 type=checkbox
                                                                                 value=481>临床医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox85 type=checkbox
                                                                                 value=482>诊断学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox86 type=checkbox
                                                                                 value=483>影像医学与核医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox87 type=checkbox
                                                                                 value=484>治疗学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox88 type=checkbox
                                                                                 value=485>运动医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox89 type=checkbox
                                                                                 value=486>护理学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox90 type=checkbox
                                                                                 value=487>康复医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox91 type=checkbox
                                                                                 value=488>急诊医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox92 type=checkbox
                                                                                 value=489>内科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox93 type=checkbox
                                                                                 value=490>心血管疾病</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox94 type=checkbox
                                                                                 value=491>血液循环系统疾病</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox95 type=checkbox
                                                                                 value=492>呼吸系统</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox96 type=checkbox
                                                                                 value=493>消化系统</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox97 type=checkbox
                                                                                 value=494>内分泌</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox98 type=checkbox
                                                                                 value=495>老年医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox99 type=checkbox
                                                                                 value=496>外科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox100
                                                                                 type=checkbox value=497>麻醉学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox101
                                                                                 type=checkbox value=498>整形外科</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox102
                                                                                 type=checkbox value=499>骨科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox103
                                                                                 type=checkbox value=500>泌尿科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox104
                                                                                 type=checkbox value=501>妇产科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox105
                                                                                 type=checkbox value=502>儿科</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox106
                                                                                 type=checkbox value=503>肿瘤</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox107
                                                                                 type=checkbox value=504>神经病学与精神病学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox108
                                                                                 type=checkbox value=505>皮肤病学与性病学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox109
                                                                                 type=checkbox value=506>耳鼻咽喉科</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox110
                                                                                 type=checkbox value=507>眼科</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox111
                                                                                 type=checkbox value=508>口腔医学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox112
                                                                                 type=checkbox value=509>药学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox113
                                                                                 type=checkbox value=510>药物化学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox114
                                                                                 type=checkbox value=511>药物分析学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox115
                                                                                 type=checkbox value=512>生药学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox116
                                                                                 type=checkbox value=513>药剂学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox117
                                                                                 type=checkbox value=514>药理学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox118
                                                                                 type=checkbox value=515>药品</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox119
                                                                                 type=checkbox value=516>毒理学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox120
                                                                                 type=checkbox value=517>微生物与生化药学</LABEL></DIV></DIV>
                        <DIV class=cn1 id=div2><SPAN id=zone2></SPAN><LABEL><INPUT id=Checkbox121
                                                                                   type=checkbox value=35>农业科学</LABEL></DIV>
                        <DIV class=class2 id=zones2 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox168
                                                                                 type=checkbox value=518>农业基础科学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox169
                                                                                 type=checkbox value=519>肥料学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox170
                                                                                 type=checkbox value=520>土壤学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox171
                                                                                 type=checkbox value=521>农业气象学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox172
                                                                                 type=checkbox value=522>农业工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox173
                                                                                 type=checkbox value=523>农业机械化工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox174
                                                                                 type=checkbox value=524>农业电气化与自动化</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox175
                                                                                 type=checkbox value=525>农业水土工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox176
                                                                                 type=checkbox value=526>农艺学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox177
                                                                                 type=checkbox value=527>作物栽培与耕作技术</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox178
                                                                                 type=checkbox value=528>作物遗传育种</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox179
                                                                                 type=checkbox value=529></LABEL>农产品加工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox180
                                                                                 type=checkbox value=530></LABEL>植物保护</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox181
                                                                                 type=checkbox value=531></LABEL>植物病理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox182
                                                                                 type=checkbox value=532></LABEL>农业昆虫与害虫防治</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox183
                                                                                 type=checkbox value=533></LABEL>农药学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox184
                                                                                 type=checkbox value=534></LABEL>作物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox185
                                                                                 type=checkbox value=535></LABEL>茶叶生产加工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox186
                                                                                 type=checkbox value=536></LABEL>中草药栽培</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox187
                                                                                 type=checkbox value=537></LABEL>烟草工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox188
                                                                                 type=checkbox value=538></LABEL>园艺学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox189
                                                                                 type=checkbox value=539></LABEL>果树学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox190
                                                                                 type=checkbox value=540></LABEL>蔬菜学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox191
                                                                                 type=checkbox value=541></LABEL>观赏园艺</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox192
                                                                                 type=checkbox value=542></LABEL>林学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox193
                                                                                 type=checkbox value=543></LABEL>林木遗传育种</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox194
                                                                                 type=checkbox value=544></LABEL>森林经理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox195
                                                                                 type=checkbox value=545></LABEL>森林保护学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox196
                                                                                 type=checkbox value=546></LABEL>森林工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox197
                                                                                 type=checkbox value=547></LABEL>木材科学与技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox198
                                                                                 type=checkbox value=548></LABEL>畜牧兽医</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox199
                                                                                 type=checkbox value=549></LABEL>畜牧学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox200
                                                                                 type=checkbox value=550></LABEL>饲料科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox201
                                                                                 type=checkbox value=551></LABEL>草业科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox202
                                                                                 type=checkbox value=552></LABEL>兽医学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox203
                                                                                 type=checkbox value=553></LABEL>基础兽医学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox204
                                                                                 type=checkbox value=554></LABEL>预防兽医学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox205
                                                                                 type=checkbox value=555></LABEL>临床兽医学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox206
                                                                                 type=checkbox value=556></LABEL>野生动物驯养</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox207
                                                                                 type=checkbox value=557></LABEL>特种经济动物饲养</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox208
                                                                                 type=checkbox value=558></LABEL>水产科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox209
                                                                                 type=checkbox value=559></LABEL>渔业资源</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox210
                                                                                 type=checkbox value=560></LABEL>水产养殖</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox211
                                                                                 type=checkbox value=561></LABEL>捕捞与储运</DIV></DIV>
                        <DIV class=cn1 id=div3><SPAN id=zone3></SPAN><LABEL><INPUT id=Checkbox122
                                                                                   type=checkbox value=257>一般工业技术</LABEL></DIV>
                        <DIV class=class2 id=zones3 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox123
                                                                                 type=checkbox value=562>工程设计测绘</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox124
                                                                                 type=checkbox value=563>材料科学与工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox125
                                                                                 type=checkbox value=564>工业设计</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox126
                                                                                 type=checkbox value=565>包装工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox127
                                                                                 type=checkbox value=566>制冷工程</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox128
                                                                                 type=checkbox value=567>真空技术</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox129
                                                                                 type=checkbox value=568>摄影技术</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox130
                                                                                 type=checkbox value=569>计量学</LABEL></DIV></DIV>
                        <DIV class=cn1 id=div4><SPAN id=zone4></SPAN><LABEL><INPUT id=Checkbox131
                                                                                   type=checkbox value=13>矿业工程</LABEL></DIV>
                        <DIV class=class2 id=zones4 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox212
                                                                                 type=checkbox value=570>矿山地质测量</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox213
                                                                                 type=checkbox value=571></LABEL>矿井建设</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox214
                                                                                 type=checkbox value=572></LABEL>矿山机电</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox215
                                                                                 type=checkbox value=573></LABEL>矿井通风与安全</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox216
                                                                                 type=checkbox value=574></LABEL>矿山开采</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox217
                                                                                 type=checkbox value=575></LABEL>煤矿开采</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox218
                                                                                 type=checkbox value=576></LABEL>金属矿开采</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox219
                                                                                 type=checkbox value=577></LABEL>非金属矿开采</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox220
                                                                                 type=checkbox value=578></LABEL>选矿</DIV></DIV>
                        <DIV class=cn1 id=div5><SPAN id=zone5></SPAN><LABEL><INPUT id=Checkbox132
                                                                                   type=checkbox value=14>石油与天然气工程</LABEL></DIV>
                        <DIV class=class2 id=zones5 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox221
                                                                                 type=checkbox value=137></LABEL>油气勘探</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox222
                                                                                 type=checkbox value=138></LABEL>油气井工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox223
                                                                                 type=checkbox value=139></LABEL>油气田开发工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox224
                                                                                 type=checkbox value=140></LABEL>油气加工工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox225
                                                                                 type=checkbox value=579></LABEL>油气储运工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox226
                                                                                 type=checkbox value=580></LABEL>石油机械设备</DIV></DIV>
                        <DIV class=cn1 id=div6><SPAN id=zone6></SPAN><LABEL><INPUT id=Checkbox133
                                                                                   type=checkbox value=15>冶金工程</LABEL></DIV>
                        <DIV class=class2 id=zones6 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox134
                                                                                 type=checkbox value=141>冶金物理化学</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox135
                                                                                 type=checkbox value=143>粉末冶金</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox136
                                                                                 type=checkbox value=144>冶金机械及自动化</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox137
                                                                                 type=checkbox value=145>钢铁冶金</LABEL></DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox138
                                                                                 type=checkbox value=146>有色金属冶金</LABEL></DIV></DIV>
                        <DIV class=cn1 id=div7><SPAN id=zone7></SPAN><LABEL><INPUT id=Checkbox139
                                                                                   type=checkbox value=16>金属学及工艺</LABEL></DIV>
                        <DIV class=class2 id=zones7 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox227
                                                                                 type=checkbox value=147></LABEL>金属学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox228
                                                                                 type=checkbox value=148></LABEL>物理冶金</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox229
                                                                                 type=checkbox value=149></LABEL>合金</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox230
                                                                                 type=checkbox value=627></LABEL>金属材料</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox231
                                                                                 type=checkbox value=150></LABEL>热处理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox232
                                                                                 type=checkbox value=151></LABEL>金属表面处理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox233
                                                                                 type=checkbox value=152></LABEL>铸造</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox234
                                                                                 type=checkbox value=153></LABEL>金属压力加工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox235
                                                                                 type=checkbox value=154></LABEL>焊接</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox236
                                                                                 type=checkbox value=155></LABEL>金属切削加工及机床</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox237
                                                                                 type=checkbox value=156></LABEL>刀具与模具</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox238
                                                                                 type=checkbox value=157></LABEL>公差测量技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox239
                                                                                 type=checkbox value=158></LABEL>钳工工艺</DIV></DIV>
                        <DIV class=cn1 id=div8><SPAN id=zone8></SPAN><LABEL><INPUT id=Checkbox140
                                                                                   type=checkbox value=17>机械工程</LABEL></DIV>
                        <DIV class=class2 id=zones8 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox240
                                                                                 type=checkbox value=159></LABEL>机械设计及理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox241
                                                                                 type=checkbox value=160></LABEL>机械制造及自动化</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox242
                                                                                 type=checkbox value=161></LABEL>仪器科学与技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox243
                                                                                 type=checkbox value=581></LABEL>精密仪器及机械</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox244
                                                                                 type=checkbox value=582></LABEL>测试计量技术及仪器</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox245
                                                                                 type=checkbox value=583></LABEL>车辆工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox246
                                                                                 type=checkbox value=584></LABEL>光学工程</DIV></DIV>
                        <DIV class=cn1 id=div9><SPAN id=zone9></SPAN><LABEL><INPUT id=Checkbox141
                                                                                   type=checkbox value=268>兵器科学与技术</LABEL></DIV>
                        <DIV class=class2 id=zones9 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox247
                                                                                 type=checkbox value=585></LABEL>兵器发射理论与技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox248
                                                                                 type=checkbox value=586></LABEL>武器系统与运用工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox249
                                                                                 type=checkbox value=587></LABEL>火炮、自动武器与弹药工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox250
                                                                                 type=checkbox value=588></LABEL>军事化学与烟火技术</DIV></DIV>
                        <DIV class=cn1 id=div10><SPAN id=zone10></SPAN><LABEL><INPUT id=Checkbox142
                                                                                     type=checkbox value=168>动力工程及工程热物理</LABEL></DIV>
                        <DIV class=class2 id=zones10 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox254
                                                                                 type=checkbox value=167></LABEL>热能工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox255
                                                                                 type=checkbox value=168></LABEL>工程热物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox256
                                                                                 type=checkbox value=169></LABEL>动力机械及工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox257
                                                                                 type=checkbox value=170></LABEL>生物能</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox258
                                                                                 type=checkbox value=171></LABEL>流体机械及工程</DIV></DIV>
                        <DIV class=cn1 id=div11><SPAN id=zone11></SPAN><LABEL><INPUT id=Checkbox143
                                                                                     type=checkbox value=29>核科学技术</LABEL></DIV>
                        <DIV class=class2 id=zones11 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox261
                                                                                 type=checkbox value=589></LABEL>核能科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox262
                                                                                 type=checkbox value=590></LABEL>核燃料循环与材料</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox263
                                                                                 type=checkbox value=591></LABEL>核技术及应用</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox264
                                                                                 type=checkbox value=592></LABEL>辐射防护及环境保护</DIV></DIV>
                        <DIV class=cn1 id=div12><SPAN id=zone12></SPAN><LABEL><INPUT id=Checkbox144
                                                                                     type=checkbox value=20>电气工程</LABEL></DIV>
                        <DIV class=class2 id=zones12 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox268
                                                                                 type=checkbox value=180></LABEL>电工理论与新技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox269
                                                                                 type=checkbox value=181></LABEL>电机</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox270
                                                                                 type=checkbox value=182></LABEL>电力系统及自动化</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox271
                                                                                 type=checkbox value=186></LABEL>电器</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox272
                                                                                 type=checkbox value=184></LABEL>高电压与绝缘技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox273
                                                                                 type=checkbox value=185></LABEL>电力电子与电力传动</DIV></DIV>
                        <DIV class=cn1 id=div13><SPAN id=zone13></SPAN><LABEL><INPUT id=Checkbox145
                                                                                     type=checkbox value=19>电子电信</LABEL></DIV>
                        <DIV class=class2 id=zones13 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox275
                                                                                 type=checkbox value=173></LABEL>物理电子学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox276
                                                                                 type=checkbox value=174></LABEL>微电子学与固体电子学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox277
                                                                                 type=checkbox value=175></LABEL>电路与系统</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox278
                                                                                 type=checkbox value=176></LABEL>信息与通信工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox279
                                                                                 type=checkbox value=177></LABEL>通信与信息系统</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox280
                                                                                 type=checkbox value=178></LABEL>信号与信息处理</DIV></DIV>
                        <DIV class=cn1 id=div14><SPAN id=zone14></SPAN><LABEL><INPUT id=Checkbox146
                                                                                     type=checkbox value=21>自动化与计算机技术</LABEL></DIV>
                        <DIV class=class2 id=zones14 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox282
                                                                                 type=checkbox value=593></LABEL>控制科学与工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox283
                                                                                 type=checkbox value=594></LABEL>控制理论与控制工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox284
                                                                                 type=checkbox value=595></LABEL>检测技术与自动化装置</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox285
                                                                                 type=checkbox value=596></LABEL>计算机科学与技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox286
                                                                                 type=checkbox value=597></LABEL>计算机系统结构</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox287
                                                                                 type=checkbox value=598></LABEL>计算机软件与理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox288
                                                                                 type=checkbox value=599></LABEL>计算机应用技术</DIV></DIV>
                        <DIV class=cn1 id=div15><SPAN id=zone15></SPAN><LABEL><INPUT id=Checkbox147
                                                                                     type=checkbox value=12>化学工程</LABEL></DIV>
                        <DIV class=class2 id=zones15 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox289
                                                                                 type=checkbox value=123></LABEL>无机化工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox290
                                                                                 type=checkbox value=124></LABEL>电化学工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox291
                                                                                 type=checkbox value=122></LABEL>高温制品工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox292
                                                                                 type=checkbox value=125></LABEL>硅酸盐工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox293
                                                                                 type=checkbox value=600></LABEL>玻璃工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox294
                                                                                 type=checkbox value=601></LABEL>水泥工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox295
                                                                                 type=checkbox value=602></LABEL>搪瓷工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox296
                                                                                 type=checkbox value=603></LABEL>陶瓷工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox297
                                                                                 type=checkbox value=126></LABEL>有机化工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox298
                                                                                 type=checkbox value=127></LABEL>高聚物工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox299
                                                                                 type=checkbox value=604></LABEL>合成树脂塑料工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox300
                                                                                 type=checkbox value=605></LABEL>橡胶工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox301
                                                                                 type=checkbox value=606></LABEL>化纤工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox302
                                                                                 type=checkbox value=128></LABEL>化学肥料工业</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox303
                                                                                 type=checkbox value=129></LABEL>农药化工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox304
                                                                                 type=checkbox value=130></LABEL>制药化工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox305
                                                                                 type=checkbox value=131></LABEL>煤化学工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox306
                                                                                 type=checkbox value=132></LABEL>炸药化工</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox307
                                                                                 type=checkbox value=133></LABEL>精细化工</DIV></DIV>
                        <DIV class=cn1 id=div16><SPAN id=zone16></SPAN><LABEL><INPUT id=Checkbox148
                                                                                     type=checkbox value=25>轻工技术与工程</LABEL></DIV>
                        <DIV class=class2 id=zones16 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox251
                                                                                 type=checkbox value=607></LABEL>纺织科学与工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox252
                                                                                 type=checkbox value=608></LABEL>纺织工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox253
                                                                                 type=checkbox value=609></LABEL>纺织材料与纺织品设计</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox259
                                                                                 type=checkbox value=610></LABEL>纺织化学与染整工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox260
                                                                                 type=checkbox value=611></LABEL>服装设计与工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox265
                                                                                 type=checkbox value=612></LABEL>食品科学与工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox266
                                                                                 type=checkbox value=613></LABEL>食品科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox267
                                                                                 type=checkbox value=614></LABEL>粮食、油脂及植物蛋白工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox274
                                                                                 type=checkbox value=615></LABEL>制糖工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox281
                                                                                 type=checkbox value=616></LABEL>农产品加工及贮藏工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox308
                                                                                 type=checkbox value=617></LABEL>水产品加工及贮藏工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox309
                                                                                 type=checkbox value=618></LABEL>发酵工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox310
                                                                                 type=checkbox value=619></LABEL>皮革化学与工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox311
                                                                                 type=checkbox value=620></LABEL>制浆造纸工程</DIV></DIV>
                        <DIV class=cn1 id=div17><SPAN id=zone17></SPAN><LABEL><INPUT id=Checkbox149
                                                                                     type=checkbox value=22>建筑科学</LABEL></DIV>
                        <DIV class=class2 id=zones17 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox312
                                                                                 type=checkbox value=195></LABEL>建筑理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox313
                                                                                 type=checkbox value=196></LABEL>建筑设计及理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox314
                                                                                 type=checkbox value=197></LABEL>建筑技术科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox315
                                                                                 type=checkbox value=198></LABEL>土木工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox316
                                                                                 type=checkbox value=199></LABEL>岩土工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox317
                                                                                 type=checkbox value=622></LABEL>结构工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox318
                                                                                 type=checkbox value=623></LABEL>城市规划与设计</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox408
                                                                                 type=checkbox value=624></LABEL>市政工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox409
                                                                                 type=checkbox value=625></LABEL>供热、供燃气、通风及空调工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox410
                                                                                 type=checkbox value=626></LABEL>桥梁与隧道工程</DIV></DIV>
                        <DIV class=cn1 id=div18><SPAN id=zone18></SPAN><LABEL><INPUT id=Checkbox150
                                                                                     type=checkbox value=23>水利工程</LABEL></DIV>
                        <DIV class=class2 id=zones18 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox319
                                                                                 type=checkbox value=204></LABEL>水文学及水资源</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox320
                                                                                 type=checkbox value=205></LABEL>水力学及河流动力学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox321
                                                                                 type=checkbox value=206></LABEL>水工结构工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox322
                                                                                 type=checkbox value=207></LABEL>水利水电工程</DIV></DIV>
                        <DIV class=cn1 id=div19><SPAN id=zone19></SPAN><LABEL><INPUT id=Checkbox151
                                                                                     type=checkbox value=26>交通运输工程</LABEL></DIV>
                        <DIV class=class2 id=zones19 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox326
                                                                                 type=checkbox value=208></LABEL>道路与铁道工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox327
                                                                                 type=checkbox value=209></LABEL>交通信息工程及控制</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox328
                                                                                 type=checkbox value=210></LABEL>交通运输规划与管理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox329
                                                                                 type=checkbox value=211></LABEL>载运工具运用工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox330
                                                                                 type=checkbox value=212></LABEL>船舶与海洋工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox331
                                                                                 type=checkbox value=213></LABEL>船舶及航道工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox332
                                                                                 type=checkbox value=214></LABEL>轮机工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox323
                                                                                 type=checkbox value=215></LABEL>水声工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox324
                                                                                 type=checkbox value=621></LABEL>港口、海岸及近海工程</DIV></DIV>
                        <DIV class=cn1 id=div20><SPAN id=zone20></SPAN><LABEL><INPUT id=Checkbox152
                                                                                     type=checkbox value=27>航空宇航科学技术</LABEL></DIV>
                        <DIV class=class2 id=zones20 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox333
                                                                                 type=checkbox value=216></LABEL>飞行器设计</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox334
                                                                                 type=checkbox value=217></LABEL>航空宇航推进理论与工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox335
                                                                                 type=checkbox value=218></LABEL>航空宇航制造工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox336
                                                                                 type=checkbox value=219></LABEL>人机与环境工程</DIV></DIV>
                        <DIV class=cn1 id=div21><SPAN id=zone21></SPAN><LABEL><INPUT id=Checkbox153
                                                                                     type=checkbox value=28>环境科学与工程</LABEL></DIV>
                        <DIV class=class2 id=zones21 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox340
                                                                                 type=checkbox value=221></LABEL>环境科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox341
                                                                                 type=checkbox value=222></LABEL>环境工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox342
                                                                                 type=checkbox value=223></LABEL>灾害防治</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox343
                                                                                 type=checkbox value=226></LABEL>安全科学</DIV></DIV>
                        <DIV class=cn1 id=div22><SPAN id=zone22></SPAN><LABEL><INPUT id=Checkbox154
                                                                                     type=checkbox value=266>自然科学总论</LABEL></DIV>
                        <DIV class=class2 id=zones22 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox352
                                                                                 type=checkbox value=376></LABEL>系统科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox353
                                                                                 type=checkbox value=377></LABEL>科学技术哲学</DIV></DIV>
                        <DIV class=cn1 id=div23><SPAN id=zone23></SPAN><LABEL><INPUT id=Checkbox155
                                                                                     type=checkbox value=267>理学</LABEL></DIV>
                        <DIV class=class2 id=zones23 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox347
                                                                                 type=checkbox value=378></LABEL>数学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox348
                                                                                 type=checkbox value=379></LABEL>基础数学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox349
                                                                                 type=checkbox value=380></LABEL>计算数学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox350
                                                                                 type=checkbox value=381></LABEL>概率论与数理统计</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox351
                                                                                 type=checkbox value=382></LABEL>应用数学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox354
                                                                                 type=checkbox value=383></LABEL>运筹学与控制论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox355
                                                                                 type=checkbox value=384></LABEL>力学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox356
                                                                                 type=checkbox value=385></LABEL>一般力学与力学基础</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox357
                                                                                 type=checkbox value=386></LABEL>固体力学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox358
                                                                                 type=checkbox value=387></LABEL>流体力学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox359
                                                                                 type=checkbox value=388></LABEL>工程力学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox360
                                                                                 type=checkbox value=389></LABEL>物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox361
                                                                                 type=checkbox value=390></LABEL>理论物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox362
                                                                                 type=checkbox value=391></LABEL>声学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox363
                                                                                 type=checkbox value=392></LABEL>光学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox364
                                                                                 type=checkbox value=393></LABEL>电磁学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox365
                                                                                 type=checkbox value=394></LABEL>无线电物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox366
                                                                                 type=checkbox value=395></LABEL>电子物理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox367
                                                                                 type=checkbox value=396></LABEL>凝聚态物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox368
                                                                                 type=checkbox value=397></LABEL>半导体物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox369
                                                                                 type=checkbox value=398></LABEL>固体物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox325
                                                                                 type=checkbox value=399></LABEL>低温物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox337
                                                                                 type=checkbox value=400></LABEL>高压高温物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox338
                                                                                 type=checkbox value=401></LABEL>等离子体物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox339
                                                                                 type=checkbox value=402></LABEL>热学与物质分子运动论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox344
                                                                                 type=checkbox value=403></LABEL>原子与分子物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox345
                                                                                 type=checkbox value=404></LABEL>粒子物理与原子核物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox346
                                                                                 type=checkbox value=405></LABEL>应用物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox519
                                                                                 type=checkbox value=406></LABEL>化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox521
                                                                                 type=checkbox value=407></LABEL>无机化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox522
                                                                                 type=checkbox value=408></LABEL>有机化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox520
                                                                                 type=checkbox value=409></LABEL>高分子化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox411
                                                                                 type=checkbox value=410></LABEL>物理化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox523
                                                                                 type=checkbox value=411></LABEL>分析化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox524
                                                                                 type=checkbox value=412></LABEL>晶体学</DIV></DIV>
                        <DIV class=cn1 id=div24><SPAN id=zone24></SPAN><LABEL><INPUT id=Checkbox156
                                                                                     type=checkbox value=10>天文地球</LABEL></DIV>
                        <DIV class=class2 id=zones24 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox370
                                                                                 type=checkbox value=115></LABEL>天文学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox371
                                                                                 type=checkbox value=413></LABEL>天体物理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox372
                                                                                 type=checkbox value=414></LABEL>天体测量</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox373
                                                                                 type=checkbox value=415></LABEL>天体力学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox374
                                                                                 type=checkbox value=116></LABEL>测绘科学与技术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox375
                                                                                 type=checkbox value=416></LABEL>大地测量学与测量工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox376
                                                                                 type=checkbox value=417></LABEL>摄影测量与遥感</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox377
                                                                                 type=checkbox value=418></LABEL>地图制图学与地理信息工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox378
                                                                                 type=checkbox value=117></LABEL>地球物理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox379
                                                                                 type=checkbox value=419></LABEL>固体地球物理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox380
                                                                                 type=checkbox value=420></LABEL>地震学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox381
                                                                                 type=checkbox value=421></LABEL>水文科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox382
                                                                                 type=checkbox value=422></LABEL>空间物理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox383
                                                                                 type=checkbox value=118></LABEL>大气科学及气象学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox384
                                                                                 type=checkbox value=423></LABEL>大气物理学与大气环境</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox385
                                                                                 type=checkbox value=424></LABEL>地质学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox386
                                                                                 type=checkbox value=425></LABEL>矿物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox387
                                                                                 type=checkbox value=426></LABEL>岩石学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox388
                                                                                 type=checkbox value=427></LABEL>矿床学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox389
                                                                                 type=checkbox value=428></LABEL>地质矿产勘探</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox390
                                                                                 type=checkbox value=429></LABEL>工程地质学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox525
                                                                                 type=checkbox value=430></LABEL>地球化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox526
                                                                                 type=checkbox value=431></LABEL>古生物学与地层学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox527
                                                                                 type=checkbox value=432></LABEL>构造地质学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox528
                                                                                 type=checkbox value=433></LABEL>第四纪地质学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox529
                                                                                 type=checkbox value=120></LABEL>海洋科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox530
                                                                                 type=checkbox value=434></LABEL>物理海洋学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox531
                                                                                 type=checkbox value=435></LABEL>海洋化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox532
                                                                                 type=checkbox value=436></LABEL>海洋生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox533
                                                                                 type=checkbox value=437></LABEL>海洋地质</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox534
                                                                                 type=checkbox value=121></LABEL>自然地理学</DIV></DIV>
                        <DIV class=cn1 id=div25><SPAN id=zone25></SPAN><LABEL><INPUT id=Checkbox157
                                                                                     type=checkbox value=9>生物学</LABEL></DIV>
                        <DIV class=class2 id=zones25 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox391
                                                                                 type=checkbox value=101></LABEL>普通生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox392
                                                                                 type=checkbox value=438></LABEL>生态学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox393
                                                                                 type=checkbox value=439></LABEL>水生生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox394
                                                                                 type=checkbox value=440></LABEL>神经生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox395
                                                                                 type=checkbox value=102></LABEL>细胞生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox396
                                                                                 type=checkbox value=103></LABEL>遗传学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox397
                                                                                 type=checkbox value=104></LABEL>生理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox398
                                                                                 type=checkbox value=105></LABEL>生物化学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox399
                                                                                 type=checkbox value=106></LABEL>生物物理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox400
                                                                                 type=checkbox value=107></LABEL>分子生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox401
                                                                                 type=checkbox value=112></LABEL>生物工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox402
                                                                                 type=checkbox value=113></LABEL>古生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox403
                                                                                 type=checkbox value=111></LABEL>微生物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox404
                                                                                 type=checkbox value=108></LABEL>植物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox405
                                                                                 type=checkbox value=109></LABEL>动物学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox406
                                                                                 type=checkbox value=110></LABEL>昆虫学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox407
                                                                                 type=checkbox value=114></LABEL>人类学</DIV></DIV>
                        <DIV class=cn1 id=div26><SPAN id=zone26></SPAN><LABEL><INPUT id=Checkbox158
                                                                                     type=checkbox value=261>文化科学</LABEL></DIV>
                        <DIV class=class2 id=zones26 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox412
                                                                                 type=checkbox value=329></LABEL>传播学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox413
                                                                                 type=checkbox value=330></LABEL>新闻学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox414
                                                                                 type=checkbox value=331></LABEL>图书馆学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox415
                                                                                 type=checkbox value=332></LABEL>档案学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox416
                                                                                 type=checkbox value=333></LABEL>情报学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox417
                                                                                 type=checkbox value=334></LABEL>教育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox418
                                                                                 type=checkbox value=335></LABEL>教育技术学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox419
                                                                                 type=checkbox value=336></LABEL>教育学原理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox420
                                                                                 type=checkbox value=337></LABEL>课程与教学论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox421
                                                                                 type=checkbox value=338></LABEL>学前教育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox422
                                                                                 type=checkbox value=339></LABEL>高等教育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox423
                                                                                 type=checkbox value=340></LABEL>成人教育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox424
                                                                                 type=checkbox value=341></LABEL>职业技术教育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox425
                                                                                 type=checkbox value=342></LABEL>特殊教育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox515
                                                                                 type=checkbox value=343></LABEL>体育学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox516
                                                                                 type=checkbox value=344></LABEL>运动人体科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox517
                                                                                 type=checkbox value=345></LABEL>体育训练</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox518
                                                                                 type=checkbox value=346></LABEL>民族体育</DIV></DIV>
                        <DIV class=cn1 id=div27><SPAN id=zone27></SPAN><LABEL><INPUT id=Checkbox159
                                                                                     type=checkbox value=2>经济管理</LABEL></DIV>
                        <DIV class=class2 id=zones27 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox426
                                                                                 type=checkbox value=313></LABEL>管理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox427
                                                                                 type=checkbox value=314></LABEL>人力资源管理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox428
                                                                                 type=checkbox value=315></LABEL>政治经济学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox429
                                                                                 type=checkbox value=316></LABEL>世界经济</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox430
                                                                                 type=checkbox value=317></LABEL>国民经济</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox431
                                                                                 type=checkbox value=318></LABEL>会计学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox432
                                                                                 type=checkbox value=319></LABEL>企业管理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox433
                                                                                 type=checkbox value=320></LABEL>产业经济</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox434
                                                                                 type=checkbox value=321></LABEL>市场营销</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox435
                                                                                 type=checkbox value=322></LABEL>广告</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox436
                                                                                 type=checkbox value=323></LABEL>旅游管理</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox437
                                                                                 type=checkbox value=324></LABEL>国际贸易</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox438
                                                                                 type=checkbox value=325></LABEL>财政学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox439
                                                                                 type=checkbox value=326></LABEL>金融学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox513
                                                                                 type=checkbox value=327></LABEL>保险</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox514
                                                                                 type=checkbox value=328></LABEL>劳动经济</DIV></DIV>
                        <DIV class=cn1 id=div28><SPAN id=zone28></SPAN><LABEL><INPUT id=Checkbox160
                                                                                     type=checkbox value=259>政治法律</LABEL></DIV>
                        <DIV class=class2 id=zones28 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox440
                                                                                 type=checkbox value=286></LABEL>政治学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox441
                                                                                 type=checkbox value=287></LABEL>国际共产主义运动</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox442
                                                                                 type=checkbox value=288></LABEL>中共党史</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox443
                                                                                 type=checkbox value=289></LABEL>国际政治</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox444
                                                                                 type=checkbox value=290></LABEL>外交学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox445
                                                                                 type=checkbox value=291></LABEL>国际关系</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox446
                                                                                 type=checkbox value=292></LABEL>中外政治制度</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox447
                                                                                 type=checkbox value=293></LABEL>法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox448
                                                                                 type=checkbox value=294></LABEL>法学理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox449
                                                                                 type=checkbox value=295></LABEL>宪法学与行政法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox450
                                                                                 type=checkbox value=296></LABEL>刑法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox451
                                                                                 type=checkbox value=297></LABEL>民商法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox452
                                                                                 type=checkbox value=298></LABEL>诉讼法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox453
                                                                                 type=checkbox value=299></LABEL>经济法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox498
                                                                                 type=checkbox value=300></LABEL>环境与资源保护法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox511
                                                                                 type=checkbox value=301></LABEL>国际法学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox512
                                                                                 type=checkbox value=302></LABEL>军事法学</DIV></DIV>
                        <DIV class=cn1 id=div29><SPAN id=zone29></SPAN><LABEL><INPUT id=Checkbox161
                                                                                     type=checkbox value=8>哲学宗教</LABEL></DIV>
                        <DIV class=class2 id=zones29 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox454
                                                                                 type=checkbox value=269></LABEL>哲学理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox455
                                                                                 type=checkbox value=270></LABEL>马克思主义哲学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox456
                                                                                 type=checkbox value=271></LABEL>世界哲学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox457
                                                                                 type=checkbox value=272></LABEL>中国哲学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox458
                                                                                 type=checkbox value=273></LABEL>外国哲学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox459
                                                                                 type=checkbox value=274></LABEL>思维科学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox460
                                                                                 type=checkbox value=275></LABEL>逻辑学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox461
                                                                                 type=checkbox value=276></LABEL>伦理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox462
                                                                                 type=checkbox value=277></LABEL>美学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox463
                                                                                 type=checkbox value=278></LABEL>宗教学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox464
                                                                                 type=checkbox value=279></LABEL>心理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox465
                                                                                 type=checkbox value=280></LABEL>基础心理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox466
                                                                                 type=checkbox value=281></LABEL>发展与教育心理学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox467
                                                                                 type=checkbox value=281></LABEL>应用心理学</DIV></DIV>
                        <DIV class=cn1 id=div30><SPAN id=zone30></SPAN><LABEL><INPUT id=Checkbox162
                                                                                     type=checkbox value=258>社会学</LABEL></DIV>
                        <DIV class=class2 id=zones30 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox472
                                                                                 type=checkbox value=283></LABEL>统计学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox473
                                                                                 type=checkbox value=284></LABEL>人口学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox474
                                                                                 type=checkbox value=285></LABEL>民族学</DIV></DIV>
                        <DIV class=cn1 id=div31><SPAN id=zone31></SPAN><LABEL><INPUT id=Checkbox163
                                                                                     type=checkbox value=260>军事</LABEL></DIV>
                        <DIV class=class2 id=zones31 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox468
                                                                                 type=checkbox value=303></LABEL>军事理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox469
                                                                                 type=checkbox value=304></LABEL>战略学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox470
                                                                                 type=checkbox value=305></LABEL>战役学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox471
                                                                                 type=checkbox value=306></LABEL>战术学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox475
                                                                                 type=checkbox value=307></LABEL>军队指挥学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox476
                                                                                 type=checkbox value=308></LABEL>军事通信学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox477
                                                                                 type=checkbox value=309></LABEL>军事情报学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox489
                                                                                 type=checkbox value=310></LABEL>军事装备学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox490
                                                                                 type=checkbox value=311></LABEL>军事工程</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox491
                                                                                 type=checkbox value=312></LABEL>军事地形</DIV></DIV>
                        <DIV class=cn1 id=div32><SPAN id=zone32></SPAN><LABEL><INPUT id=Checkbox164
                                                                                     type=checkbox value=262>语言文字</LABEL></DIV>
                        <DIV class=class2 id=zones32 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox478
                                                                                 type=checkbox value=347></LABEL>语言学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox479
                                                                                 type=checkbox value=348></LABEL>汉语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox480
                                                                                 type=checkbox value=349></LABEL>少数民族语言</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox481
                                                                                 type=checkbox value=350></LABEL>英语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox482
                                                                                 type=checkbox value=351></LABEL>法语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox483
                                                                                 type=checkbox value=352></LABEL>德语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox484
                                                                                 type=checkbox value=353></LABEL>西班牙语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox485
                                                                                 type=checkbox value=354></LABEL>俄语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox486
                                                                                 type=checkbox value=355></LABEL>日语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox487
                                                                                 type=checkbox value=356></LABEL>阿拉伯语</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox488
                                                                                 type=checkbox value=357></LABEL>世界语</DIV></DIV>
                        <DIV class=cn1 id=div33><SPAN id=zone33></SPAN><LABEL><INPUT id=Checkbox165
                                                                                     type=checkbox value=263>文学</LABEL></DIV>
                        <DIV class=class2 id=zones33 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox494
                                                                                 type=checkbox value=358></LABEL>文学理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox495
                                                                                 type=checkbox value=359></LABEL>世界文学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox496
                                                                                 type=checkbox value=360></LABEL>中国文学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox497
                                                                                 type=checkbox value=361></LABEL>其他各国文学</DIV></DIV>
                        <DIV class=cn1 id=div34><SPAN id=zone34></SPAN><LABEL><INPUT id=Checkbox166
                                                                                     type=checkbox value=264>艺术</LABEL></DIV>
                        <DIV class=class2 id=zones34 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox492
                                                                                 type=checkbox value=362></LABEL>艺术理论</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox493
                                                                                 type=checkbox value=363></LABEL>美术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox499
                                                                                 type=checkbox value=364></LABEL>摄影艺术</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox500
                                                                                 type=checkbox value=365></LABEL>艺术设计</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox501
                                                                                 type=checkbox value=366></LABEL>音乐</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox502
                                                                                 type=checkbox value=367></LABEL>舞蹈</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox503
                                                                                 type=checkbox value=368></LABEL>戏剧戏曲</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox510
                                                                                 type=checkbox value=369></LABEL>电影电视艺术</DIV></DIV>
                        <DIV class=cn1 id=div35><SPAN id=zone35></SPAN><LABEL><INPUT id=Checkbox167
                                                                                     type=checkbox value=265>历史地理</LABEL></DIV>
                        <DIV class=class2 id=zones35 style="DISPLAY: none">
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox504
                                                                                 type=checkbox value=370></LABEL>历史学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox505
                                                                                 type=checkbox value=371></LABEL>中国史</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox506
                                                                                 type=checkbox value=372></LABEL>世界史</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox507
                                                                                 type=checkbox value=373></LABEL>考古学及博物馆学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox508
                                                                                 type=checkbox value=374></LABEL>民俗学</DIV>
                            <DIV class=cn2><SPAN onclick=""></SPAN><LABEL><INPUT id=Checkbox509
                                                                                 type=checkbox value=375></LABEL>人文地理学</DIV>
                        </DIV>
                    </DIV>
                </DIV>
            </DIV>
        </DIV>
        <DIV class=submit>
            <INPUT class=btn-s onclick="RetrievalBasicExpression('basic-factor')" type=button value=检索>
            <INPUT class=btn-c onclick="    onidclose('pagesearch-factor')" type=reset value=取消>
        </DIV>
        <SCRIPT src="../newSearch_files/domainOpTf.js" type=text/javascript></SCRIPT>
    </DIV>
</DIV>

<DIV id=body style="display:none;">
    <DIV class=inner>
        <DIV class=object-show-box id=divShowBox>
            <DIV class=object-show-list>
                <DIV class=object-show-loading>
                    <DIV class=object-show-loading2>
                        <INPUT id=hidDomainIDs type=hidden value='{"indexarticlelist":265,"indexjournallist":16,"indexsubjectlist":10,"indexwriterlist":23,"indexorganlist":18,"indexfundlist":35}'>
                        <INPUT id=hidDomainNames type=hidden value='{"indexarticlelist":"历史地理","indexjournallist":"金属学及工艺","indexsubjectlist":"天文地球","indexwriterlist":"水利工程","indexorganlist":"动力工程及工程热物理","indexfundlist":"农业科学"}'>
                        <INPUT id=hidIsLike type=hidden value=0>
                        <DIV class="object-show  clear" id=indexarticlelist></DIV>
                        <DIV class="object-show clear" id=indexjournallist style="DISPLAY: none"></DIV>
                        <DIV class="object-show clear" id=indexsubjectlist style="DISPLAY: none"></DIV>
                        <DIV class="object-show author clear" id=indexwriterlist style="DISPLAY: none"></DIV>
                        <DIV class="object-show clear" id=indexorganlist style="DISPLAY: none"></DIV>
                        <DIV class="object-show clear" id=indexfundlist style="DISPLAY: none"></DIV>
                        <DIV class="object-show clear" id=indexdomainlist style="DISPLAY: none"></DIV>
                        <DIV class="object-show clear" id=indexarealist style="DISPLAY: none"></DIV>
                    </DIV>
                </DIV>
            </DIV>
        </DIV>
        <DIV class=object-show-arrow>
            <A class=arrow-left id=btnLeft href="javascript:void(0);"></A>
            <A class=arrow-right id=btnRight href="javascript:void(0);"></A>
        </DIV>
    </DIV>
</DIV>


<SCRIPT src="../newSearch_files/feedback.min.js" type=text/javascript></SCRIPT>



<SCRIPT src="../newSearch_files/login.min.js" type=text/javascript></SCRIPT>


<SCRIPT type=text/javascript>
    var $menu = $('#myTab a');
    $menu.click(function () {
        $(this).addClass('current').siblings().removeClass('current');
        var index = $menu.index(this);
        if (index == 0) {
            $("#switch").removeClass("text").addClass("code");
        } else {
            $("#switch").removeClass("code").addClass("text");
        }
        $('.tabs_content_wrap > .layer-cnt').eq(index).show().siblings().hide();
    });

    $("#switch").click(function() {
        if ($(this).attr("class") == "code") {
            $('.tabs_content_wrap > .layer-cnt').eq(1).show().siblings().hide();
            $(this).removeClass("code").addClass("text");
            $("#myTab a").eq(1).addClass('current').siblings().removeClass('current');
        } else {
            $('.tabs_content_wrap > .layer-cnt').eq(0).show().siblings().hide();
            $(this).removeClass("text").addClass("code");
            $("#myTab a").eq(0).addClass('current').siblings().removeClass('current');
        }
    });

    var qrimgstr = "";
    var iCount;
    function loadQr() {
        clearInterval(iCount);
        $.ajax({
            url: "/ajax/mobilehandler.ashx?"  +Math.random() + "&op=WebQrCreate",
            dataType: "json",
            beforeSend: function () {

            },
            success: function (json) {

                if (json.code == 200) {
                    $("#qrImglogin").attr("src", "/ajax/QRCodeHandler.ashx?" + Math.random() + "&qrstr=" + json.qrstr);
                    qrimgstr = json.qrstr;
                    iCount = setInterval(show, 3000);
                }
                else {

                }
            },
            error: function (json) {

            }
        });
    }

    function show() {
        $.ajax({
            url: "/ajax/mobilehandler.ashx?" + Math.random() + "&op=WebQrAutoLogin" + "&qrstr=" + qrimgstr,
            dataType: "json",
            beforeSend: function () {

            },
            success: function (json) {

                if (json.code == 200) {

                    clearInterval(iCount);

                    window.location.reload(); //刷新页面 后台登录

                }
                else if (json.isexpire) {
                    clearInterval(iCount); //二维码超时
                }

            },
            error: function (json) {

            }
        });
    }

</SCRIPT>


<SCRIPT type=text/javascript>
    $(document).ready(function () {
        $("#loginLoading").load("/user/loginheader.aspx?" + Math.random());
    });
</SCRIPT>

<SCRIPT type=text/javascript>
    $(function () {
        var encodestr = $("#hifBaseLog").val().trim();
        var BaseGch = "";
        var BaseArticleId = "";
        var BaseClass = "";
        var BaseObjectType = 0;
        var BaseObjectValue = "";

        if (encodestr != "") {
            var parames = encodestr.split(';');
            BaseGch = parames[0];
            BaseArticleId = parames[1];
            BaseClass = parames[2];
            BaseObjectType = parames[3];
            BaseObjectValue = parames[4];
        }

        var obj = {};
        obj.remark = "期刊7";
        obj.user_id = 0;
        obj.user_ip_address = "219.149.54.162";
        obj.user_group_id = 0;
        obj.site_id = 11;
        if (BaseGch) {
            obj.gch = BaseGch;
        }
        if (BaseArticleId) {
            obj.article_id = BaseArticleId;
        }
        if (BaseClass) {
            obj.full_class_ids = BaseClass;
        }
        if (BaseObjectType) {
            obj.object_id = BaseObjectType;
        }
        if (BaseObjectValue) {
            obj.object_value = BaseObjectValue;
        }

        var user_type = 0;
        if (user_type) {
            obj.user_type = user_type;
        }

        loadScript("http://log.cqvip.com/VipCloud/Service/Log/js/analysis.js", function () { vipLog("view", obj, "LIBBEHAVIORANALYSIS"); });
    });
</SCRIPT>

<SCRIPT>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?fee827c3dc795c5122daf5ee854c1683";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</SCRIPT>

<SCRIPT>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-2219013-37', 'auto');
    ga('send', 'pageview');

</SCRIPT>
</BODY></HTML>

