$(function () {
    //下拉框显示
    $("#objectsearch-factor select,#pagesearch-factor select,#selMainSearchType").easySelectBox({ speed: 300 });

    //获取搜索参数值
    //var searchKeys = GetQueryString("key");
    var request = g_getUrlParms();
    var searchKeys = request["key"];
    if (searchKeys) {
        var uvalue = searchKeys.match(/(\[[|*\+\-×＋－]\])?U=[^\[]*/gi);
        if (uvalue && uvalue.length > 0) {
            $("#txtMainSearchType").removeClass("watermark"); //移除检索框class
            $("#txtMainSearchType").css("color", "black"); //移除检索框文字加入颜色
            var searchPut = "";
            for (var urlValue = 0; urlValue < uvalue.length; urlValue++) {                
                searchPut += uvalue[urlValue].replace("U=", "").replace("[*]", " AND ").replace("[+]", " OR ").replace("[-]", " NOT ").replace("[×]", " * ").replace("[＋]", " + ").replace("[－]", " - ");
            }            
            var searchvalue = searchPut.replace(/(0x005b)/g, "[").replace(/(0x005d)/g, "]").replace(/(0x005a)/g, "=").replace(/(‘)/g, "'").replace(/(’)/g, "'").replace(/(\“)/g, "\"").replace(/(\”)/g, "\"");
            searchvalue = searchvalue.replace("(", "").replace(")", "");
            $("#hidSearchKeysHidden").val(searchvalue); //隐藏检索赋值
            $("#txtMainSearchType").val(searchvalue); //检索框赋值
        } else {
            if ($("#menuselected").length == 1) {
                GetWaterMark($("#menuselected>ul>li.current").children("a").attr("rel").toLocaleLowerCase());
            } else {
                GetWaterMark("");
            }
        }
    } else {
        if ($("#menuselected").length == 1) {
            GetWaterMark($("#menuselected>ul>li.current").children("a").attr("rel").toLocaleLowerCase());
        } else {
            GetWaterMark("");
        }
    }

    //简单检索切换
    $("#menuselected>ul>li").children("a").on("click", function () {
        var request = g_getUrlParms();
        var searchKeys = request["key"], pindex = request["uf"];
        var type = $(this).attr("rel");
        if (searchKeys) {
            //去掉除基本检索外的所有表达式
            searchKeys = searchKeys.replace(/(\[\*]|\[\+]|\[-]|\[×]|\[＋]|\[－])?(\()?(QK|ZY|YY|UT|CID)=(\w+)?(-\w+)?([^u4e00-u9fa5]+)?(\))?/g, "");
            var ivalue = searchKeys.substring(0, 3);
            if (ivalue == "[*]" || ivalue == "[+]" || ivalue == "[-]" || ivalue == "[×]" || ivalue == "[＋]" || ivalue == "[－]") {
                searchKeys = searchKeys.substring(3, searchKeys.length);
            }
            //跳转替换U并去除所有的精确检索
            searchKeys = searchKeys.replace(/\w+?=/g, "U=").replace(/(\[|\])/g, "").replace(/(\*|\+|\-|×|＋|－)/g, "[$1]");
            //if (type == "Articles") {
            //    var reg = /(CID)/g;
            //    if (reg.test(searchKeys)) {
            //        searchKeys = searchKeys.replace(reg, "ZY");
            //        if (pindex != 1) {
            //            pindex = 1;
            //        }
            //    }
            //} else {
            //    if (pindex == 1) {
            //        searchKeys = searchKeys.replace(/(ZY)/g, "CID");
            //    }
            //}
        }
        var cf = GetQueryString("rf"), zys = "";
        if (cf) {
            var regzy = /ZY=\d+/g;
            zys = cf.match(regzy);
        }
        geturl(type, searchKeys, zys, pindex);
    });

    //简单检索
    $("#btnMainSearchType").on("click", function () {
        setCookie("MainSearch", "true");
        search();
    });

    //高级检索模糊禁用
    $("#basic-factor>div>div.sel").children("select").change(function() {
        var selValue = $(this).attr("value"), line = $(this).parent().next().find(".easy-select-box");
        var spanClass = $(this).parent().next().find("span.class-view");
        spanClass.hide();
        if (selValue == "R" || selValue == "Y" || selValue == "I" || selValue == "U" || selValue == "Z") {
            line.addClass("notclick");
            line.prev().find("option").removeAttr("selected");
            line.prev().find("option[value='%']").attr("selected", "selected");
            line.children("a.disp").html("模糊").removeClass("exact");
    }else if (selValue == "F") {
        line.addClass("notclick");
        line.prev().find("option").removeAttr("selected");
        line.prev().find("option[value='&']").attr("selected", "selected");
        line.children("a.disp").html("精确").addClass("exact");
    } else {
        line.removeClass("notclick");
        if (selValue == "C") {
            spanClass.show();
        }
    }
});

    //绑定自动补全
    bindAutoComplete();

    //处理搜索关键字框获得焦点的情况，移除水印并清空水印值
    $("#txtMainSearchType").focusin(function () {
        $("#txtMainSearchType").removeClass("watermark");
        $("#txtMainSearchType").css("color", "black");
        if ($("#hidSearchKeysHidden").val()) {
            $("#txtMainSearchType").val($("#hidSearchKeysHidden").val());
        } else {
            $("#txtMainSearchType").val("");
        }
    });

    //处理搜索关键字框失去焦点的情况，判断是否该加水印
    $("#txtMainSearchType").focusout(function () {
        if ($(this).val()) {
            $("#hidSearchKeysHidden").val($(this).val());
        } else {
            $("#hidSearchKeysHidden").val("");
            if ($("#menuselected").length==1) {
                GetWaterMark($("#menuselected>ul>li.current").children("a").attr("rel").toLocaleLowerCase());
            } else {
                GetWaterMark("");
            }
            $("#searchRelative").hide();
        }
    });

    JournalRange('basic_searchjournaltype');
    JournalRange('re_searchjournaltype');
});

//简单检索表达式
function search() {
    var type = "";
    if ($("#menuselected").length == 1) {
       type = $("#menuselected>ul>li.current").children("a").attr("rel");
    }
    var value = $("#txtMainSearchType").val().replace(/(\;|\,|\<|\>)/g, "").replace(/(\))/g, "）").replace(/(\()/g, "（").replace(/(\[)/g, "0x005b").replace(/(\])/g, "0x005d").replace(/(\')/g, "‘").replace(/(\')/g, "’").replace(/(\")/g, "“").replace(/(\")/g, "”").replace(/(\=)/g, "0x005a").replace(/( AND )/g, "[*]").replace(/( OR )/g, "[+]").replace(/( NOT )/g, "[-]").replace(/( \* )/g, "[×]").replace(/( \+ )/g, "[＋]").replace(/( \- )/g, "[－]");
    var key = "U";
    var inputValues = [];
    var str1 = "";
    if (value && value != "") {
        inputValues = split(value, /(\[[\*|\+|\-|\×|\＋|\－]\])/);
        if (inputValues.length > 1) {
            for (var put = 0; put < inputValues.length; put++) {
                if (put % 2 == 0) {
                    str1 += key + "=" + inputValues[put];
                } else {
                    str1 += inputValues[put];
                }
            }
        } else {
            str1 += key + "=" + inputValues[0];
        }
    }
    if (value == "" || $("#txtMainSearchType").hasClass('watermark')) {
        //alert("请输入检索条件！");
        //return false;
        geturl(type, "");
    } else {
        geturl(type, str1);
    }
}

//自动补全方法
function bindAutoComplete() {
    $("#txtMainSearchType").AutoComplete({
        'data': "/ajax/AutoCompleteHandler.ashx",
        "ajaxParams": function () {
            var type = "articles";
            if ($("#hifOutObjectType").val()) {
                type = $("#hifOutObjectType").val();
            }
            return { "objtype": type.toLowerCase() };
        },
        'ajaxDataType': 'json',
        'width': 'auto', //490
        'itemHeight': 25,
        'leftOffset': -6,
        'maxItems': 30,
        'maxHeight': 232,
        'beforeLoadDataHandler': function (keyword) {
            return keyword.length >= 2;
        },
        'onerror': function (msg) { alert(msg); },
        "afterSelectedHandler": function () {
            search();
        }
    });
}

//添加条件项
function addsearchitem(divclass) {
    var items = $("#" + divclass).children().prevAll("div.sinput:visible");
    if (items.length > 0) {
        items.next().show();
    }
}

//取消条件项
function cutsearchitem(divclass) {
    var items = $("#"+divclass).children().prevAll("div.sinput:visible");
    if (items.length > 2) {
        items.first().children("div.input").children('input[type=text]').attr("value", "");
        items.first().hide();
    }
}

/********检索条件*********/
function searchfactor(divclass) {
    var str1 = "";
    $("#" + divclass + ">:not('div.sel-op')").each(function (a, b) {
    var inputValue = $(this).children("div.input").find("input:text").val().replace(/(\;|\,|\<|\>)/g, "").replace(/(\()/g, "（").replace(/(\))/g, "）").replace(/(\')/g, "‘").replace(/(\')/g, "’").replace(/(\")/g, "“").replace(/(\")/g, "”").replace(/(\[)/g, "0x005b").replace(/(\])/g, "0x005d").replace(/(\=)/g, "0x005a").replace(/( AND )/g, "[*]").replace(/( OR )/g, "[+]").replace(/( NOT )/g, "[-]").replace(/( \* )/g, "[*]").replace(/( \+ )/g, "[+]").replace(/( \- )/g, "[-]").toLocaleLowerCase();
    inputValue = $.trim(inputValue);
        var selKey = $(this).children("div.sel").find("select").attr("value");//
        var selSearch = $(this).children("div.input").find("select").attr("value");
        var inputValues = [];
        if (inputValue && inputValue != "") {
            inputValues = split(inputValue, /(\[[\*|\+|\-]\])/);
            if (a === 0) {
                if (selSearch == "&") {
                    if (inputValues.length > 1) {
                        str1 += "(";
                        for (var put = 0; put < inputValues.length; put++) {
                            if (put % 2 == 0) {
                                str1 += selKey + "=[" + inputValues[put] + "]";
                            } else {
                                str1 += inputValues[put];
                            }
                        }
                        str1 += ")";
                    } else {
                        str1 += selKey + "=[" + inputValues[0] + "]";
                    }
                } else {
                    if (inputValues.length > 1) {
                        str1 += "(";
                        for (var put = 0; put < inputValues.length; put++) {
                            if (put % 2 == 0) {
                                str1 += selKey + "=" + inputValues[put];
                            } else {
                                str1 += inputValues[put];
                            }
                        }
                        str1 += ")";
                    } else {
                        str1 += selKey + "=" + inputValues[0];
                    }
                }
            } else {
                var selAndor = "[" + $(this).children("div.s").find("select").attr("value") + "]";
                if (str1 != "") {
                    str1 += selAndor;
                }
                if (selSearch == "&") {
                    if (inputValues.length > 1) {
                        str1 += "(";
                        for (var put = 0; put < inputValues.length; put++) {
                            if (put % 2 == 0) {
                                str1 += selKey + "=[" + inputValues[put] + "]";
                            } else {
                                str1 += inputValues[put];
                            }
                        }
                        str1 += ")";
                    } else {
                        str1 += selKey + "=[" + inputValues[0] + "]";
                    }
                } else {
                    if (inputValues.length > 1) {
                        str1 += "(";
                        for (var put = 0; put < inputValues.length; put++) {
                            if (put % 2 == 0) {
                                str1 += selKey + "=" + inputValues[put];
                            } else {
                                str1 += inputValues[put];
                            }
                        }
                        str1 += ")";
                    } else {
                        str1 += selKey + "=" + inputValues[0];
                    }
                }
            }
        }
    });
    str1 = str1.replace(/(\;|\,|\<|\>)/g, "");
    //alert(str1)
    return str1;
}

/********扩展条件*********/
function searchfactormore(frontName) {
    var str = "";
    //时间
    var timetype = "";
    if (frontName == "re_") {
        timetype=$("#" + frontName + "searchtimefilter").find('input:radio[name="radresearhtime"]:checked').val();
    } else {
        timetype=$("#" + frontName + "searchtimefilter").find('input:radio[name="radsearhtime"]:checked').val();
    }
    if (timetype == 1) {
        var starttime, endtime;
        starttime = $("#" + frontName + "dropAiStartTime").attr("value");
        endtime = $("#" + frontName + "dropAiEndTime").attr("value");
        var d = new Date(), nowYear = d.getFullYear();
        if (starttime == 1989 && endtime == nowYear) {
            str = "";
        } else {
            if (endtime < starttime) {
                return str="false";
            }
            str="YY=" + starttime + "-" + endtime;
        }
    } else {
        var utvalue = $("#" + frontName + "searchtimeupdatefilter").attr("value");
        if (typeof (utvalue) == "undefined") { utvalue = 1; }
        str = "UT=" + utvalue;
    }
    //期刊范围
    //var radio = "";
    //if (frontName == "re_") {
    //    radio = $("#" + frontName + "searchjournaltype :checked").val();
    //} else {
    //    radio = $("#" + frontName + "searchjournaltype :checked").val();
    //}
    //if (radio != 1) {
    //    if (str != "") {
    //        str += "[*]QK=" + radio;
    //    } else {
    //        str += "QK=" + radio;
    //    }
    //}

    var radion = "";
    if (str != "") {
        radion = "[*](";
    } else {
        radion = "(";
    }
    $("#" + frontName + "searchjournaltype input:checkbox:checked").each(function (a, b) {
        if ($(this).val() != 1) {
            if (radion == "[*](" || radion == "(") {
                radion += "QK=" + $(this).val();
            } else {
                radion += "[+]QK=" + $(this).val();
            }
        }
    });
    if (radion == "(" || radion == "[*](") {
        radion = "";
    } else {
        radion += ")";
    }
    str += radion;
    //学科导航
    var str1;
    if (str != "") {
        str1 = "[*](";
    } else {
        str1 = "(";
    }
    $("#" + frontName + "searchdomainfilter>div>div>div>label").each(function (a, b) {
        if ($(this).find("input:checkbox:checked").prop("checked") == true) {
            if (str1 == "[*](" || str1 == "(") {
                str1 += "ZY=" + $(this).find("input:checkbox").val();
            } else {
                str1 += "[+]ZY=" + $(this).find("input:checkbox").val();
            }
        }
    });
    $("#" + frontName + "searchdomainfilter>div>div>div>div>label").each(function (a, b) {
        if ($(this).find("input:checkbox:checked").prop("checked") == true) {
            if (str1 == "[*](" || str1 == "(") {
                str1 += "ZY=" + $(this).find("input:checkbox").val();
            } else {
                str1 += "[+]ZY=" + $(this).find("input:checkbox").val();
            }
        }
    });
    if (str1 == "(" || str1 == "[*](") {
        str1 = "";
    } else {
        str1 += ")";
    }
    return str + str1;
}

/********基本检索*********/
function RetrievalBasicExpression(divclass) {
    var laststr, str1 = searchfactormore("basic_"), str = "";
    str = searchfactor(divclass);
    if (str1 =="false") {
        alert("结束时间不能大于起始时间");
        return false;
    } else if (str + str1 == "") {
        alert("请输入检索条件");
        return false;
    }else {
        if (str != "" && str1 == "") {
            laststr = str;
        } else if (str == "" && str1 != "") {
            laststr = str1;
        } else {
            laststr = str + "[*]" + str1;
        }
    }
    setCookie("MainSearch", "false");
    geturl("Articles", laststr);
}

/********检索式检索*********/
function RetrievalSearchExpression() {
    var laststr, str1 = searchfactormore("re_"), str = "";
    str = $("#searchusercontent").val().replace(/(\')/g, "‘").replace(/(\')/g, "’").replace(/(\")/g, "“").replace(/(\")/g, "”").replace(/(\[)/g, "0x005b").replace(/(\])/g, "0x005d").replace(/( AND )/g, "[*]").replace(/( OR )/g, "[+]").replace(/( NOT )/g, "[-]").replace(/( \* )/g, "[*]").replace(/( \+ )/g, "[+]").replace(/( \- )/g, "[-]").replace(/(\;|\,|\<|\>)/g, "");
    //if (str != "") {
    //    str = str.replace(/(\*|\+|\-)/g, "[$1]");
    //}
    if (str1 =="false") {
        alert("结束时间不能大于起始时间");
        return false;
    }else if (str + str1 == "") {
        alert("请输入检索条件");
        return false;
    } else {
        if (str != "" && str1 == "") {
            laststr = str;
        } else if (str == "" && str1 != "") {
            laststr = str1;
        } else {
            laststr = str + "[*]" + str1;
        }
    }
    setCookie("MainSearch", "false");
    geturl("Articles", laststr);
}

/********对象检索*********/
function objectsearchfactor(divclass) {
    var str = searchfactor(divclass), type = $("#" + divclass).children("div.filter").children('input:radio[name="radObjectType"]:checked').val();
   if (str == "") {
        alert("请输入检索条件");
    } else {
       geturl(type, str);
    }
}

//获得跳转链接
function geturl(type, str,rf,index) {
    var url = "", key = "";
    var path = window.location.pathname.split('.')[0];
    path = path.indexOf('\/') > -1 ? path.replace('\/', '') : path;
    path = path.replace(/(\/)/g, '_');
    path = (path == "" ? "index" : path);
    if (str) {
        str = encodeURIComponent(str);
        if (!type) {
            key = "?from=" + path + "&key=" + str;
        }
        else { key = "?from=" + path + "&key=" + str; }
    } else {
        key = "?from=" + path;
    }
    //if (cf) {
    //    cf = encodeURIComponent(cf);
    //    if (key.indexOf("?") != -1) {
    //        key += "&cf=" + cf;
    //    } else {
    //        key += "?cf=" + cf;
    //    }
    //}
    if (rf) {
        rf = encodeURIComponent(rf);
        if (key.indexOf("?") != -1) {
            key += "&rf=" + rf;
        } else {
            key += "?rf=" + rf;
        }
    }
    if (index) {
        if (key.indexOf("?") != -1) {
            key += "&uf=" + index;
        } else {
            key += "?uf=" + index;
        }
    }
    if (key.length > 2000) {
        alert("检索表达式超长");
        return false;
    }
    switch (type) {
        case "Writer":
            url = "/writer/writersearch.aspx";
        break; //人物
        case "Organ":
            url = "/organ/organsearch.aspx";
        break; //机构
        case "Subject":
            url = "/subject/subjectsearch.aspx";
        break; //主题
        case "Journal":
        url = "/journal/journalsearch.aspx";
        break; //期刊
        case "Fund":
            url = "/fund/fundsearch.aspx";
        break; //资助
        case "Domain":
            url = "/domain/domainsearch.aspx";
        break; //学科
        case "Area":
            url = "/area/areasearch.aspx";
        break; //地区
        case "Articles":
            url = "/zk/search.aspx";
            break; //文献
        default:
            url = "/zk/search.aspx";
        break;
    }
    //alert(url + key);
    location.href = url + key;
}

//显示与隐藏操作
function onidclose(cname) {
    $("#" + cname).hide();
    $(".layer-bg").hide();
}
function onidshow(cname) {
    $("#" + cname).show();
    $(".layer-bg").show();
}
function isshowclose(cname1,cname2) {
    $("#" + cname1).show();
    $("#" + cname2).hide();
}

//URL参数获取
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = decodeURIComponent(window.location.search.substr(1)).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

//回车检索
function search_enterKeydown(event) {
    var e = $.event.fix(event);
    if (e.keyCode === 13) {
        search();
    }
}

/**为隐藏选择类型栏赋值及为文本框添加水印**/
function GetWaterMark(sType) {
    var exsma = "";
    if ($("#hidSearchKeysHidden").val() == "") {
        //switch (sType) {
        //    case "journal":
        //        exsma = "输入名称、主题等描述条件，都可以找到期刊出版物和学术会议目标";
        //        break;
        //    case "subject":
        //        exsma = "输入名称、学科领域等描述条件，都可以找到研究主题";
        //        break;
        //    case "writer":
        //        exsma = "输入姓名、主题、机构等描述条件，都可以找到人物";
        //        break;
        //    case "organ":
        //        exsma = "输入名称、主题等描述条件，都可以找到研究机构";
        //        break;
        //    case "fund":
        //        exsma = "输入名称、主题、机构等描述条件，都可以找到基金项目";
        //        break;
        //    case "domain":
        //        exsma = "输入学科描述条件，搜索学科";
        //        break;
        //    case "area":
        //        exsma = "输入地区描述条件，搜索地区";
        //        break;
        //    case "articles":
        //        exsma = "在\"全部文献\"搜索专业资源，提供3亿专业资源的搜索及分析筛选";
        //        break;
        //    default:
        //        exsma = "搜索5000余万篇期刊文章，挖掘作者、机构、主题、资助等海量知识对象";
        //        break;
        //}
        exsma = "搜索5000余万篇期刊文章，挖掘作者、机构、主题、资助等海量知识对象";
    }
    $("#txtMainSearchType").addClass("watermark");
    $("#txtMainSearchType").css("color", "#999999");
    $("#txtMainSearchType").val(exsma);
}

/**获取参数和ID跳转*/
function GotoUrl(url) {
    var request = g_getUrlParms();
    var key = request["key"];
    var rf = request["rf"];
    if (rf || key) {
        if (rf) {
            if (key) {
                rf += "[*]" + key;
            }
        } else {
            rf = key;
        }
        rf = rf.replace(/(\[\*\]|\[\+\]|\[\-\])?FL=\w/g, "");
        var fl = rf.substring(0, 3);
        if (fl == "[*]" || fl == "[+]" || fl == "[-]") {
            rf = rf.substring(3, rf.length);
        }
        url += "&rf=" + encodeURIComponent(rf);
    }
    location.href = g_addQueryString(/page=\d*/i, "page=1",url); 
}

/**获取参数和ID跳转（针对期刊搜索页面只获取key转换为rf，本身的rf不再叠加） **/
function JournalGotoUrl(url) {
    var request = g_getUrlParms();
    var key = request["key"];
    if (key) {
        key = key.replace(/(\[\*\]|\[\+\]|\[\-\])?FL=\w/g, "");
        var fl = key.substring(0, 3);
        if (fl == "[*]" || fl == "[+]" || fl == "[-]") {
            key = key.substring(3, key.length);
        }
        url += "&rf=" + encodeURIComponent(key);
    }
    location.href = g_addQueryString(/page=\d*/i, "page=1", url);
}

//设置cookie
function setCookie(name,value) {
    if (getCookie(name)!= value) {
        $.cookie(name, value, { path: '/' });
    }
}
//读取cookies
function getCookie(name) {
    var cookieStr = $.cookie(name);
    if (cookieStr != null) {
        return cookieStr;
    }
    return "";
}

//期刊范围处理
function JournalRange(divId) {
    $("#" + divId + " input:checkbox:eq(0)").click(function () {
        if ($(this).is(":checked")) {
            $("#" + divId + " input:checkbox:gt(0)").removeProp("checked");
        }
    });
    $("#" + divId + " input:checkbox:gt(0)").click(function () {
        if ($(this).is(":checked")) {
            $("#" + divId + " input:checkbox:eq(0)").removeProp("checked");
        }
    });
}

var classWindow = null;
function SelectClass(inputId) {
    if (classWindow == null) {
        classWindow = window.open("/classhandle/class.aspx?ID=" + inputId, null, "resizable=yes,width=800,height=450,top=100", false);
        classWindow.focus();
    }
    else {
        classWindow = window.open("/classhandle/class.aspx?ID=" + inputId, null, "resizable=yes,width=800,height=450,top=100", true);
        classWindow.focus();
    }
}