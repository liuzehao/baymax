/**
 * Created by Demon on 2015/5/18.
 */
var AutoAnswerPage = function () {
    var color = [
        "color1",
        "color2",
        "color3",
        "color4",
        "color5",
        "color6",
        "color7",
        "color8",
        "color9",
        "color10"
    ];

    var cont = $('#chats');
    var list = $('.chats', cont);
    var form = $('.chat-form', cont);
    var input = $('input', form);
    var btn = $('.btn', form);
    var container = $("#answerExperts");

    var count = 0;

    function getAnswerContent(answer) {
        var tpl = "";
        var time = new Date();
        var time_str = time.toLocaleDateString();
        tpl += '<li class="in">';
        tpl += '<img class="avatar" alt="" src="' + basePath + '/assets/index/images/shulan2.png"/>';
        tpl += '<div class="message">';
        tpl += '<span class="arrow"></span>';
        tpl += '<a href="#list'+ count +'" class="name">树小懒</a>&nbsp;';
        tpl += '<span class="datetime">—— ' + time_str + '</span>';
        tpl += '<span class="body">';
        tpl += answer;
        tpl += '</span>';
        tpl += '</div>';
        tpl += '</li>';
        var newLi = $(tpl);
        $(".chats li.in .message .name",newLi).fancybox({
            'centerOnScroll': true
        });
        list.append(newLi);
        $('.scroller', cont).slimScroll({
            scrollTo: list.height()
        });
    }

    function getAnswerFileDiv(files) {
        var wrap = $('<div class="col-md-12 expertsWrap" id="list'+ count +'">');
        var str = "";
        if (files == null || files.length == 0) {
            str += '<div class="note note-danger text-center">';
            str += '<h4 class="block">知识库暂无这个知识点</h4></div>';
            wrap.append(str);
            wrap.appendTo(container);
            count++;
            return;
        }
        var tpl = "";
        var time = new Date();
        var time_str = time.toLocaleDateString();
        tpl += '<li class="in">';
        tpl += '<img class="avatar" alt="" src="' + basePath + '/assets/index/images/shulan2.png"/>';
        tpl += '<div class="message">';
        tpl += '<span class="arrow"></span>';
        tpl += '<a href="#list'+ count +'" class="name" style="color:red">树小懒推荐知识</a>&nbsp;';
        tpl += '<span class="datetime">—— ' + time_str + '</span>';
        tpl += '<span class="body" style="position:relative;">';
        for (var i = 0, l = files.length; i < l&&i<3; i++) {
            //str += '<div class="note note-success col-md-12">';
            //str += '<div class="col-md-2">';
            //str += '<img src="'+ basePath + files[i].fileImgUrl +'" alt="文件缩略图"></div>';
           // str += '<div class="col-md-10">';
           // str += '<a href="javascript:;" class="expertName" onclick="toExpertDetail('+ files[i]["id"] +')">'+ files[i]["title"] +' <sub>—'+ files[i]["title"] +'</sub></a>';

           // str += '</div></div></div>';

            tpl += '<img style="width: 200px;height:150;" src=/bits/findLittleImg?filename='+files[i].fileImgUrl+' alt="文件缩略图"><br>';
            tpl += '<a target="_blank" href="/bits/literature/getLiteratureDetail?id='+files[i]["id"]+'" class="expertName">'+ files[i]["title"] +'</a></br>';
            //tpl +='<div style="width: 300px;display:inline;">'+files[i].abs+'</div></div>';

        }
        tpl += '</span>';
        tpl += '</div>';
        tpl += '</li>';
        var newLi = $(tpl);
        $(".chats li.in .message .name",newLi).fancybox({
            'centerOnScroll': true
        });
        list.append(newLi);
        $('.scroller', cont).slimScroll({
            scrollTo: list.height()
        });
    }

    function getFile() {
        $.ajax({
            url:  basePath+"iterature/search?key="+input.val()+"&direction=autoAnswer" ,    //basePath + "autoAnswer/getAnswer",
            type: "get",
            dataType: "json",
            success: function (e) {
                //setTimeout("alert('x')", 2000);
                getAnswerFileDiv(e);
            }
        })
    }
    function getTheme(themeList){
        if (themeList.length == 0) return "暂无";
        var str = "";
        for (var i = 0,j = themeList.length; i < j; i++){
            str += '<a class="theme color'+ (i%color.length + 1) +'" href="javascript:;" onclick="toThemeExperts('+ themeList[i].id +')">' + themeList[i]["themeName"] + '</a>';
        }
        return str;
    }

    function isValidQuestion(val) {
        return val == null || "" == val.trim();
    }

    function getAnswer() {
        $.ajax({
            url:  "http://www.tuling123.com/openapi/api?key=9c26687c25d4fa106907cdb41d9ed8c9&info="+ input.val()+"&userid=12345678",                          //basePath + "autoAnswer/getAnswer",
            type: "post",
            data: {question: input.val()},
            dataType: "json",
            success: function (e) {
                getAnswerContent(e.text);
                //getAnswerExpertDiv(solution.experts);
            }
        })
    }
    return {
        init: function () {
            $("#clear").on("click",function(){
                $("#chats .chats > li:gt(0)").remove();
                $("#answerExperts").empty();
                toast.success("清除成功!");
            });
        },
        getAnswer:function (){
            getAnswer();
        },
        getFile:function (){
            getFile();
        }
    }
}();
