<%--
  Created by IntelliJ IDEA.
  User: hao
  Date: 16-4-17
  Time: 上午10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>${User.username}&nbsp;的上传文件</title>
    <%@include file="../includes/style.jsp" %>
    <script src="<c:url value="/js/user/systemFile.js"/>"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/global/plugins/select2/select2.css"/>"/>
    <style>
        .portlet.box.green > .portlet-title {
            background-color: #65BE88;
        }

        .portlet.box.green {
            border: 1px solid #65BE88;
            border-top: 0;
        }

        label {
            font-size: 1.1em;
        }
    </style>

</head>
<body>
<%@include file="../includes/header.jsp" %>
<input hidden="hidden" type="text" value="${User.userId}" id="userId"/>

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="javascript:;" onclick="toHome()">首页</a></li>
            <li><a href="javascript:;">用户中心</a></li>
            <li class="active">我的上传</li>
        </ul>
        <div class="row margin-bottom-40">

            <!--表格-->
            <div class="sidebar col-md-2 col-sm-2">
                <ul class="list-group margin-bottom-25 sidebar-menu">

                    <li id="li11" class="list-group-item clearfix" style="background-color:#65BE88;text-align: center">
                        <a href="handleUpload" style="color: #fff;font-size: 16px;">我的上传 <i
                                class="fa fa-caret-right"></i></a></li>


                    <!-- <div style="padding-top: 10px;width: 100%" > </div><li id="li2"class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a href="handleFocus"  style="color: #949494;font-size: 16px;">我的关注 <i  style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>-->

                    <div style="padding-top: 10px;width: 100%"></div>

                    <li id="li3" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a
                            href="handleGeneral" style="color: #949494;font-size: 16px;">常用文档 <i style="color:#F3F1F2 ;"
                                                                                                 class="fa fa-caret-right"></i></a>
                    </li>

                    <div style="padding-top: 10px;width: 100%"></div>

                    <li id="li4" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a
                            href="handleHistory" style="color: #949494;font-size: 16px;">浏览历史 <i style="color:#F3F1F2 ;"
                                                                                                 class="fa fa-caret-right"></i></a>
                    </li>

                    <div style="padding-top: 10px;width: 100%"></div>

                    <li id="li5" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a
                            href="handleUserInfo" style="color: #949494;font-size: 16px;">个人资料 <i
                            style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>

                    <div style="padding-top: 10px;width: 100%"></div>
                    <li id="li6" class="list-group-item clearfix" style="background-color:#F3F1F2;text-align: center"><a
                            href="handlePassword" style="color: #949494;font-size: 16px;">修改密码 <i
                            style="color:#F3F1F2 ;" class="fa fa-caret-right"></i></a></li>

                </ul>
            </div>
            <div class="col-md-10 col-sm-10">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-arrow-up"></i>我的上传
                                </div>
                                <div class="actions">
                                    <a style="color: #fff;" class="btn btn-default" data-toggle="modal" href="#form"
                                       onclick="literatureListTable.upload()">
                                        <i class="fa  fa-upload  faa-shake animated-hover"></i>&nbsp;上传</a>
                                    <a style="color: #fff;" onclick="literatureListTable.reload()"
                                       class="btn btn-default"><i
                                            class="fa fa-refresh faa-spin animated-hover"></i>&nbsp;刷新</a>
                                </div>


                            </div>
                            <div class="portlet-body">
                                <div style="text-align:right">
                                    <form id="query">
                                        <a class="btn btn-default" data-target="#ruleUse"
                                           data-toggle="modal" id="">
                                            <i class="fa   fa-cogs faa-shake animated-hover"></i>&nbsp;规则使用</a>
                                        <a class="btn btn-default" data-target="#relationLotConfirm"
                                           data-toggle="modal" id="relationLot">
                                            <i class="fa  fa-share-alt faa-shake animated-hover"></i>&nbsp;一键关联</a>
                                        <a class="btn btn-default"
                                           data-target="#deleteLotdeleteRowConfirm" data-toggle="modal">
                                            <i class="fa  fa-minus-circle faa-shake animated-hover"></i>&nbsp;批量删除</a>
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover   table-striped" id="datatable_ajax"
                                           style="text-align: center;vertical-align: middle;">
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="20%">
                                        <col width="20%">
                                        <col width="15%">
                                        <col width="15%">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th style="text-align: center">
                                                文件编号
                                            </th>
                                            <th style="text-align: center">
                                                文件标题
                                            </th>
                                            <th style="text-align: center">
                                                文件类型
                                            </th>
                                            <th style="text-align: center">
                                                上传时间
                                            </th>
                                            <th style="text-align: center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalDialog" tabindex="-1" role="basic" aria-hidden="true" data-keyboard="false"
     data-backdrop="static">
    <div class="modal-dialog" style="width: 700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title" id="dialogTitle"></h4>
            </div>
            <div class="modal-body" style="padding-top: 0px; height: 900px;">
                <div class="portlet-body">
                    <iframe id="literatureEditIframe" style="border: medium none; width: 650px; height: 900px;"
                            frameBorder="0"></iframe>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="deleteRowConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body">确认删除当前行？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="deleteRow">删除</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteLotdeleteRowConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body">确认批量删除？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="deleteLot">删除</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="relationLotConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">确认</h4>
            </div>
            <div class="modal-body">确认关联？</div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="relationLotRow">确认</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="AutoRelation" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">关联规则</h4>
            </div>
            <div style="font-size:1.5em;">
                <label><b style="margin-left: 50px;">触发条件:</b></label><br>

                <div style="margin-left: 100px;">
                    <div class="form-group">
                        <label>文件类型:</label><br>
                        <select name="select" id="type" style="width: 400px;">
                            <option value="">无</option>
                            <option value="word">avi</option>
                            <option value="excel">excel</option>
                            <option value="excel_wps">excel_wps</option>
                            <option value="gif">gif</option>
                            <option value="html">html</option>
                            <option value="jpg">jpg</option>
                            <option value="mp3">mp3</option>
                            <option value="mp4">mp4</option>
                            <option value="ppt">ppt</option>
                            <option value="ppt_wps">ppt_wps</option>
                            <option value="png">png</option>
                            <option value="word">rar</option>
                            <option value="word">swf</option>
                            <option value="txt">txt</option>
                            <option value="wav">wav</option>
                            <option value="word">word</option>
                            <option value="word_wps">word_wps</option>
                            <option value="word">zip</option>
                        </select><br>
                    </div>
                    <div class="form-group">
                        <label>文件名中有关键字:</label><br>
                        <input value="" id="key" style="width: 400px;"><br>
                    </div>
                </div>
                <label><b style="margin-left: 50px;">触发动作:</b></label><br>

                <div style="margin-left: 100px;" class="form-group">
                    <div class="form-group">
                        <label>组合方式:</label><br>
                        <select name="select" id="rule" style="width: 400px;">
                            <option value="">无</option>
                            <option value="&&">与</option>
                            <option value="||">或</option>
                        </select><br>
                    </div>
                    <div class="form-group">
                        <label>将要关联的文件编号:</label><br>
                        <input value="" id="AutoRelationId" style="width: 400px;"><br>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal" id="cancel">确认</button>
                <button type="button" class="btn blue" id="sure">取消</button>
            </div>
            <script type="text/javascript">
                $("#sure").click(function () {
                    $("#type").val("");
                    $("#rule").val("");
                    $("#key").val("");
                    $("#AutoRelationId").val("");
                    $('#AutoRelation').modal('hide');
                })
            </script>
        </div>
    </div>
</div>
<div class="modal fade" id="AutoFillForm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">自动填表</h4>
            </div>
            <div class="form-body" style="font-size:1.5em;">
                <label><b style="margin-left: 50px;">触发条件:</b></label><br>

                <div style="margin-left: 100px;">
                    <div class="form-group">
                        <label>文件类型:</label><br>
                        <select name="select" id="typeFill" style="width: 400px;">
                            <option value="">所有</option>
                            <option value="word">avi</option>
                            <option value="excel">excel</option>
                            <option value="excel_wps">excel_wps</option>
                            <option value="gif">gif</option>
                            <option value="html">html</option>
                            <option value="jpg">jpg</option>
                            <option value="mp3">mp3</option>
                            <option value="mp4">mp4</option>
                            <option value="ppt">ppt</option>
                            <option value="ppt_wps">ppt_wps</option>
                            <option value="png">png</option>
                            <option value="word">rar</option>
                            <option value="word">swf</option>
                            <option value="txt">txt</option>
                            <option value="wav">wav</option>
                            <option value="word">word</option>
                            <option value="word_wps">word_wps</option>
                            <option value="word">zip</option>
                        </select><br>
                    </div>
                    <div class="form-group">
                        <label>文件名中有关键字:</label><br>
                        <input value="" id="keyFill" style="width: 400px;"><br>
                    </div>
                </div>

                <label><b style="margin-left: 50px;">触发动作:</b></label><br>

                <div style="margin-left: 100px;">
                    <div class="form-group">
                        <label>组合方式:</label><br>
                        <select name="select" id="ruleFill" style="width: 400px;">
                            <option value="all">所有</option>
                            <option value="&&">与</option>
                            <option value="||">或</option>
                        </select><br>
                    </div>
                </div>

                <label><b style="margin-left: 50px;">触发操作:</b></label><br>

                <div style="width: 500px;">
                    <div style="margin-left: 100px;">
                        <div class="form-group">
                            <label>主题:</label><br>
                            <select name="select" id="autoFileTheme" style="width: 400px;">
                                <option>力学</option>


                                <option>物理学</option>


                                <option>生物学</option>


                                <option>天文学</option>


                                <option>自然地理学和测绘学</option>


                                <option>气象学</option>


                                <option>海洋学</option>


                                <option>地质学</option>


                                <option>资料科学</option>


                                <option>化学</option>


                                <option>无机化学</option>


                                <option>有机化学</option>


                                <option>燃料化学</option>


                                <option>一般化学工业</option>


                                <option>石油天然气工业</option>


                                <option>材料科学</option>


                                <option>矿产工程</option>


                                <option>金属学及金属工艺</option>


                                <option>冶金工业</option>


                                <option>轻工业手工业</option>


                                <option>环境科学与资源利用</option>


                                <option>工业通用技术及设备</option>


                                <option>机械工业</option>


                                <option>仪器仪表工业</option>


                                <option>航空航天科学与工程</option>


                                <option>武器工业与军事技术</option>


                                <option>铁路运输</option>


                                <option>公路与水路运输</option>


                                <option>汽车工业</option>


                                <option>船舶工业</option>


                                <option>水利水电工程</option>


                                <option>建筑科学与工程</option>


                                <option>动力工程</option>


                                <option>核科学技术</option>


                                <option>新能源</option>


                                <option>电力工业</option>


                                <option>植物保护</option>


                                <option>林业</option>


                                <option>基础医学</option>


                                <option>生物医学工程</option>


                                <option>无线电电子学</option>


                                <option>电信技术</option>


                                <option>计算机硬件技术</option>


                                <option>计算机软件及计算机应用</option>


                                <option>互联网技术</option>


                                <option>自动化技术</option>


                                <option>信息与传媒</option>


                                <option>文艺理论</option>


                                <option>世界文学</option>


                                <option>中国文学</option>


                                <option>中国语言文字</option>


                                <option>外国语言文字</option>


                                <option>音乐舞蹈</option>


                                <option>戏剧电影与电视艺术</option>


                                <option>美术书法雕刻与摄影</option>


                                <option>地理</option>


                                <option>文化</option>


                                <option>史学理论</option>


                                <option>世界历史</option>


                                <option>中国通史</option>


                                <option>中国民族与地方史志</option>


                                <option>中国古代史</option>


                                <option>中国现代史</option>


                                <option>考古</option>


                                <option>人物传记</option>


                                <option>哲学</option>


                                <option>逻辑学</option>


                                <option>伦理学</option>


                                <option>心理学</option>


                                <option>美学</option>


                                <option>宗教</option>


                                <option>马克思主义</option>


                                <option>中国共产党</option>


                                <option>政治学</option>


                                <option>中国政治与国际政治</option>


                                <option>思想政治教育</option>


                                <option>行政学及国家行政管理</option>


                                <option>政党及群众组织</option>


                                <option>军事</option>


                                <option>公安</option>


                                <option>法理法史</option>


                                <option>宪法</option>


                                <option>行政法及地方法治</option>


                                <option>民商法</option>


                                <option>刑法</option>


                                <option>经济法</option>


                                <option>诉讼法与司法制度</option>


                                <option>国际法</option>


                                <option>社会科学理论与方法</option>


                                <option>社会学及统计学</option>


                                <option>民族学</option>


                                <option>人口学与计划生育</option>


                                <option>人才学与劳动科学</option>


                                <option>教育理论与教育管理</option>


                                <option>学前教育</option>


                                <option>初等教育</option>


                                <option>中等教育</option>


                                <option>高等教育</option>


                                <option>职业教育</option>


                                <option>成人教育与特殊教育</option>


                                <option>体育</option>


                                <option>经济管理与可持续发展</option>


                                <option>经济理论及经济思想史</option>


                                <option>经济体制改革</option>


                                <option>经济统计</option>


                                <option>农业经济</option>


                                <option>工业经济</option>


                                <option>交通运输经济</option>


                                <option>企业经济</option>


                                <option>旅游</option>


                                <option>文化经济</option>


                                <option>信息经济与邮政经济</option>


                                <option>服务业经济</option>


                                <option>贸易经济</option>


                                <option>财政与税收</option>


                                <option>金融</option>


                                <option>证券</option>


                                <option>保险</option>


                                <option>投资</option>


                                <option>会计</option>


                                <option>审计</option>


                                <option>市场研究与信息</option>


                                <option>管理学</option>


                                <option>领导学与决策学</option>


                                <option>科学研究管理</option>


                                <option>农业基础科学</option>


                                <option>农业工程</option>


                                <option>农艺学</option>


                                <option>农作物</option>


                                <option>园艺</option>


                                <option>畜牧与动物医学</option>


                                <option>蚕蜂与野生动物保护</option>


                                <option>水产和渔业</option>


                                <option>医药卫生方针政策与法律法规研究</option>


                                <option>医学教育与医学边缘学科</option>


                                <option>预防医学与卫生学</option>


                                <option>中医学</option>


                                <option>中药学</option>


                                <option>中西医结合</option>


                                <option>临床医学</option>


                                <option>感染性疾病及传染病</option>


                                <option>心血管管理疾病</option>


                                <option>呼吸系统疾病</option>


                                <option>消化系统疾病</option>

                                </ss:Table>
                            </select><br>
                        </div>

                        <div class="form-group">
                            <label>关键词:</label><br>
                            <input value="" id="autoFileKey" style="width: 400px;"><br>
                        </div>
                        <div class="form-group">
                            <label>文件描述:</label><br>
            <textarea id="autoFileAbs" rows="3" class="form-control"
                      type="text" name="abs" style="width: 400px;"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal" id="sureFill">确认</button>
                <button type="button" class="btn blue" id="cancelFill">取消</button>
            </div>
            <script type="text/javascript">
                $("#cancelFill").click(function () {
                    $("#typeFill").val("");
                    $("#ruleFill").val("");
                    $("#keyFill").val("");
                    $("#autoFileKey").val("");
                    $("#autoFileThem").val("");
                    $("#autoFileAbs").val("");
                    $('#AutoFillForm').modal('hide');
                })
            </script>
        </div>
    </div>
</div>
<div class="modal fade" id="relationConfirm" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body">
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="输入需要关联的文件编号" id="relationId">
                                <span class="input-group-btn">
                                       <button class="btn btn-default" type="button" id="relation">关联</button>
                                </span>
                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="ruleUse" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body">
                <div style="margin-left: 200px;">

                    <button class="btn btn-default" type="button" id="btnRelation" style="margin-bottom: 30px;"><i class="fa   fa-paperclip faa-shake animated-hover" ></i>关联规则</button><br>

                    <button class="btn btn-default" type="button" id="btnFill"><i class="fa   fa-table faa-shake animated-hover"></i>自动填表</button>

                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<script>
    $("#btnFill").click(function () {
        $('#ruleUse').modal('hide');
        $('#AutoFillForm').modal('show');
        $.ajax({
            url: basePath + "theme/getThemeNames",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#autoFileTheme").select2({
                    tags: data,
                    placeholder: "请选择一个主题"
                })
            },
            error: function () {
                toast.error("请检查网络连接");
            }
        });
    });
    $("#btnRelation").click(function () {
        $('#ruleUse').modal('hide');
        $('#AutoRelation').modal('show');
    });
    $(function () {

        literatureListTable.init();
    });
    $("#checkAll").live("click", function () {
        if ($(this).attr("checked") === "checked") {
            $("input[name='checkList']").attr("checked", $(this).attr("checked"));
        } else {
            $("input[name='checkList']").prop("checked", false);
        }
    });
    relationLot = function (id1, id2) {
        $("#relationLotRow").click(function () {
            if (id1 == 0 || id2 == 0) {
                $('#relationLotConfirm').modal('hide');
                toast.relationError();
                return;
            }
            $.ajax({
                url: basePath + 'file/relation?id=' + id1 + '&relationId=' + id2,
                type: "GET",
                success: function () {
                    $('#relationLotConfirm').modal('hide');
                    toast.success();
                },
            })
        });
    }
    $("#relationLot").click(function () {
        var aArray = new Array();
        var i = 0;
        $("input[name='checkList']:checked").each(function () {
            aArray[i] = $(this).attr("id");
            if ($(this).attr("flag") == "0") {
                aArray[i] = 0;
            }
            i++;
        })
        var a = 0, t = 0, length = aArray.length;
        var flag = aArray.length - 1;
        for (a; a < flag; a++) {
            for (t = a + 1; t < length; t++) {
                relationLot(aArray[a], aArray[t]);
            }
        }
    });
    $("#deleteLot").click(function () {
        $("input[name='checkList']:checked").each(function () {
            $.ajax({
                url: basePath + "file/delFileDo?id=" + $(this).attr("id"),
                type: "GET",
                success: function () {
                    var $table = parent.$("#datatable_ajax");
                    $table.DataTable().draw();
                    $('#deleteLotdeleteRowConfirm').modal('hide');
                    toast.success();
                },
                error: doError

            })
        })
    });

</script>
<script type="text/javascript" src="<c:url value="/assets/global/plugins/select2/select2.min.js"/>"></script>
</body>
</html>
