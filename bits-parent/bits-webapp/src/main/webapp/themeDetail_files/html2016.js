var _gaq = [];
var userAgent = navigator.userAgent.toLowerCase();
// if(userAgent == null || userAgent == ''){
// //
// }else{
//     if(userAgent.indexOf("android") != -1 || userAgent.indexOf("ios") != -1 || userAgent.indexOf("iphone") != -1 || userAgent.indexOf("ipad") != -1 || userAgent.indexOf("windows phone") != -1 ){

//   	}else{
//   	  //google 统计start
//   	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
//   		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
//   		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
//   		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

//   		  ga('create', 'UA-64962204-1', 'auto');
//   		  ga('send', 'pageview');
//         //google 统计end
//    }
// }

//tag推荐弹窗
(function(){
var protocol = location.protocol.substr(0, 4) === 'http' ? '' : 'http:';
$.getScript(protocol + '//csdnimg.cn/public/common/tag-suggest-pop/js/main.js?'+(new Date()/120000|0));

})();

!(function(){
  var currUser={
      userName:"",
      userNick:'<a class="set-nick" href="https://passport.csdn.net/account/profile">设置昵称<span class="write-icon"></span></a>',
      userInfo:"",
      desc : '<a class="fill-dec" href="//my.csdn.net" target="_blank">编辑自我介绍，让更多人了解你<span class="write-icon"></span></a>',
      avatar:"//c.csdnimg.cn/public/common/toolbar/images/100x100.jpg"
    };
  var prodLogo = "none";
  var $oScriptTag =$("#toolbar-tpl-scriptId");
  var skin =$oScriptTag.attr("skin")=="black"?" csdn-toolbar-skin-black ":"";
  var ifcollection =$oScriptTag.attr("ifcollection")=="collect_show"?" collection_show ":"";
  var fixed = $oScriptTag.attr("fixed")=="top"?" navbar-fixed-top ":"";
  var prodIndex= $oScriptTag.attr("domain")?$oScriptTag.attr("domain"):window.location.protocol+"//"+window.location.host;
      prodIndex+='?ref=toolbar_logo';
  var getCookie =function (objName){//获取指定名称的cookie的值
      var arrStr = document.cookie.split("; ");
      for(var i = 0;i < arrStr.length;i ++){
      var temp = arrStr[i].split("=");
      if(temp[0] == objName) return decodeURI(temp[1]);
      }
  }
  var setCookie = function (name,value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();// + ";domain=.csdn.net;path=/";
  }
  var HTMLEncode =function(str) {
      var s = "";
      if(str.length == 0) return "";
      s = str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\'/g, "&#39;").replace(/\"/g, "&quot;");
      return s;
    }
  var AUtoAvatar = function(AU){
    if(!AU||!currUser.userName){
      return false;
    }
    var _AUPath = AU.split("").join("/");
    var userName = currUser.userName&&currUser.userName.toLowerCase();
    return "http://avatar.csdn.net/"+_AUPath+"/2_"+userName+".jpg";
  }
  var hasLogin = false;
  var loginMark ="unlogin";
  function checkLogin(callback) {
          currUser.userNick = getCookie("UserNick") ||currUser.userNick;
          currUser.userName = getCookie("UserName") || currUser.userName;
          currUser.userInfo = getCookie("UserInfo") || currUser.userInfo;
          currUser.avatar = AUtoAvatar(getCookie("AU")) || currUser.avatar;
          currUser.desc = getCookie("UD") || currUser.desc;
          if(getCookie("UD")){
            currUser.desc = HTMLEncode(decodeURIComponent(currUser.desc).replace(/\+/g," "));
          }
          callback(currUser);
    }
  checkLogin(function(currUser){
    if(currUser.userName&&currUser.userInfo){
        hasLogin = true;
    }
    loginMark = hasLogin?"":"unlogin";
  })

  /*
  * init pord logo
  */
  var prodJSON = {
      "blog" : "blog-icon",
      "download" : "down-icon",
      "bbs" : "bbs-icon",
      "my" :"space-icon",
      "code" : "code-icon",
      "share" : "share-icon",
      "tag" : "tag-icon",
      "dashboard":"dashboard-icon",
      "news" : "news-icon",
      "tag" : "tag-icon",
      "ask" : "ask-icon",
      "notify" : "notify-icon"
  }
  if(prodJSON[$oScriptTag.attr("prod")]){
    prodLogo=prodJSON[$oScriptTag.attr("prod")]||$oScriptTag.attr("prod");
  }

  // $( 'head' ).append( '<link rel="stylesheet" href="//csdnimg.cn/public/common/toolbar/css/font-awesome.min.css">' );
  // 注册url，https://passport.csdn.net/account/register?ref=toolbar
  // add 2016 stylesheet
// function addStyle(stylePath) {
//     var container = document.getElementsByTagName("head")[0];
//     var addStyle = document.createElement("link");
//     addStyle.rel = "stylesheet";
//     addStyle.type = "text/css";
//     addStyle.media = "screen";
//     addStyle.href = stylePath;
//     container.appendChild(addStyle);
// }
// addStyle('../css/toolbar-iconfont.css');
  var tpl ='\<div class="csdn-toolbar'+skin+fixed+ifcollection+'">\
        <div class="container center-block ">\
          <ul class="pull-left btns">\
            <li class="logo">\
              <a href="http://www.csdn.net?ref=toolbar" title="CSDN首页" target="_blank" class="iconlogo">\
                <i class="icon toolbar-iconfont">&#xe600;</i><span class="pull-left">CSDN.NET</span><i class="icon toolbar-iconfont arr-down">&#xe60e;</i>\
              </a>\
              <div class="icon-all on-logo-icon">\
                <div class="wrap">\
                  <dl class="project-menu">\
                    <dd><a href="https://code.csdn.net/" target="_blank">CODE</a></dd>\
                    <dd><a href="http://edu.csdn.net/" target="_blank">学院</a></dd>\
                    <dd><a href="http://download.csdn.net/" target="_blank">下载</a></dd>\
                    <dd><a href="http://geek.csdn.net/" target="_blank">极客头条</a></dd>\
                    <dd><a href="http://bbs.csdn.net/" target="_blank">论坛</a></dd>\
                    <dd><a href="http://ask.csdn.net/" target="_blank">问答</a></dd>\
                    <dd><a href="http://lib.csdn.net/">知识库</a></dd>\
                    <dd><a href="http://blog.csdn.net/" target="_blank">博客</a></dd>\
                    <dd><a href="http://mall.csdn.net/" target="_blank">商城</a></dd>\
                  </dl>\
                </div>\
              </div>\
            </li>\
          </ul>\
          <div class="pull-right login-wrap '+loginMark+'">\
            <ul class="btns">\
              <li class="loginlink"><a href="https://passport.csdn.net/account/login?ref=toolbar" target="_top">登录&nbsp;</a>|<a  target="_top" href="http://passport.csdn.net/account/mobileregister?ref=toolbar&action=mobileRegister">&nbsp;注册</a></li>\
              <li class="search">\
                <div class="iconbox"><i class="icon toolbar-iconfont">&#xe603;</i></div>\
                <div class="icon-all on-search-icon">\
                  <div class="wrap">\
                    <div class="curr-icon-wrap">\
                      <div class="curr-icon"></div>\
                    </div>\
                    <form action="http://so.csdn.net/search" method="get" target="_blank">\
                      <input type="hidden" value="toolbar" name="ref" accesskey="2">\
                      <div class="border">\
                        <input placeholder="搜索" type="text" value="" name="q" accesskey="2"><span class="icon-enter-sm"><i class="icon toolbar-iconfont">&#xe60d;</i></span>\
                      </div>\
                    </form>\
                  </div>\
                </div>\
              </li>\
              <li class="favor">\
                <div class="iconbox"><i class="icon toolbar-iconfont">&#xe60f;</i></div>\
                <div class="icon-all on-favor-icon">\
                  <div class="wrap">\
                    <div class="curr-icon-wrap">\
                      <div class="curr-icon"></div>\
                    </div>\
                    <div style="display:none;" class="favor-success"><span class="msg">收藏成功</span>\
                      <div class="btns"><span class="btn btn-primary ok">确定</span></div>\
                    </div>\
                    <div style="display:none;" class="favor-failed"><span class="icon-danger-lg"></span><span class="msg">收藏失败，请重新收藏</span>\
                      <div class="btns"><span class="btn btn-primary ok">确定</span></div>\
                    </div>\
                    <form role="form" class="form-horizontal favor-form">\
                      <div class="form-group">\
                        <div class="clearfix">\
                          <label for="input-title" class="col-sm-2 control-label">标题</label>\
                          <div class="col-sm-10">\
                            <input id="inputTitle" type="text" placeholder="" class="title form-control">\
                          </div>\
                        </div>\
                        <div class="alert alert-danger"><strong></strong>标题不能为空</div>\
                      </div>\
                      <div class="form-group">\
                        <label for="input-url" class="col-sm-2 control-label">网址</label>\
                        <div class="col-sm-10">\
                          <input id="input-url" type="text" placeholder="" class="url form-control">\
                        </div>\
                      </div>\
                      <div class="form-group">\
                        <label for="input-tag" class="col-sm-2 tag control-label">标签</label>\
                        <div class="col-sm-10">\
                          <input id="input-tag" type="text" class="form-control tag">\
                        </div>\
                      </div>\
                      <div class="form-group">\
                        <label for="input-description" class="description col-sm-2 control-label">摘要</label>\
                        <div class="col-sm-10">\
                          <textarea id="input-description" class="form-control description"></textarea>\
                        </div>\
                      </div>\
                      <div class="form-group">\
                        <div class="col-sm-offset-2 col-sm-10 ft">\
                          <div class="col-sm-4 pull-left">\
                            <div class="checkbox">\
                              <label>\
                                <input type="checkbox" name="share" checked="checked" class="share">公开\
                              </label>\
                            </div>\
                          </div>\
                          <div class="col-sm-8 pull-right favor-btns">\
                            <button type="button" class="cancel btn btn-default">取消</button>\
                            <button type="submit" class="submit btn btn-primary">收藏</button>\
                          </div>\
                        </div>\
                      </div>\
                    </form>\
                  </div>\
                </div>\
              </li>\
              <li class="notify">\
                <div style="display:none" class="number"></div>\
                <div style="display:none" class="icon-hasnotes-sm"></div>\
                <div class="iconbox"><i class="icon toolbar-iconfont">&#xe602;</i></div>\
                <div id="header_notice_num"></div>\
                <div class="icon-all on-notify-icon">\
                  <div class="wrap">\
                    <div class="curr-icon-wrap">\
                      <div class="curr-icon"></div>\
                    </div>\
                    <div id="note1" class="csdn_note">\
                      <div class="box"></div>\
                    </div>\
                  </div>\
                </div>\
              </li>\
              <li class="ugc">\
                <div class="iconbox"><i class="icon toolbar-iconfont">&#xe601;</i></div>\
                <div class="icon-all on-ugc-icon">\
                  <div class="wrap clearfix">\
                    <div class="curr-icon-wrap">\
                      <div class="curr-icon"></div>\
                    </div>\
                    <dl>\
                      <dt><a href="http://geek.csdn.net/news/expert?ref=toolbar" target="_blank" class="p-news clearfix" style="display:none;"><em class="icon-all"></em><span>分享资讯</span></a></dt>\
                      <dt style="border: none;"><a href="http://u.download.csdn.net/upload?ref=toolbar" target="_blank" class="p-doc clearfix"><i class="icon toolbar-iconfont">&#xe605;</i><span>传PPT/文档</span></a></dt>\
                      <dt><a href="http://bbs.csdn.net/topics/new?ref=toolbar" target="_blank" class="p-ask clearfix"><i class="icon toolbar-iconfont">&#xe606;</i><span>提问题</span></a></dt>\
                      <dt><a href="http://write.blog.csdn.net/postedit?ref=toolbar" target="_blank" class="p-blog clearfix"><i class="icon toolbar-iconfont">&#xe608;</i><span>写博客</span></a></dt>\
                      <dt><a href="http://u.download.csdn.net/upload?ref=toolbar" target="_blank" class="p-src clearfix"><i class="icon toolbar-iconfont">&#xe60b;</i><span>传资源</span></a></dt>\
                      <dt><a href="https://code.csdn.net/projects/new?ref=toolbar" target="_blank" class="c-obj clearfix"><i class="icon toolbar-iconfont">&#xe60a;</i><span>创建项目</span></a></dt>\
                      <dt><a href="https://code.csdn.net/snippets/new?ref=toolbar" target="_blank" class="c-code clearfix"><i class="icon toolbar-iconfont">&#xe609;</i><span>创建代码片</span></a></dt>\
                    </dl>\
                  </div>\
                </div>\
              </li>\
              <li class="profile">\
                <div class="icon-all on-profile-icon"><img src="'+currUser.avatar+'" class="curr-icon-img">\
                  <div class="wrap clearfix">\
                    <div class="curr-icon-wrap">\
                      <div class="curr-icon"></div>\
                    </div>\
                    <div class="bd">\
                      <dl class="clearfix">\
                        <dt class="pull-left img"><a target="_blank" href="http://my.csdn.net?ref=toolbar" class="avatar"><img src="'+currUser.avatar+'"></a></dt>\
                        <dd class="info" style="border: none;"><a target="_blank" href="http://my.csdn.net?ref=toolbar" class="nickname">'+currUser.userNick+'</a><span class="dec">'+currUser.desc+'</span></dd>\
                      </dl>\
                    </div>\
                    <div class="ft clearfix"><a target="_blank" href="http://my.csdn.net/my/account/changepwd?ref=toolbar" class="pull-left"><i class="icon toolbar-iconfont">&#xe607;</i>帐号设置</a><a href="https://passport.csdn.net/account/logout?ref=toolbar"  target="_top" class="pull-right" style=" height:27px; white-space:nowrap; overflow:hidden;"><i class="icon toolbar-iconfont">&#xe60c;</i><span class="out">退出</span></a></div>\
                  </div>\
                </div>\
              </li>\
              <li class="qr-code">\
                <div class="iconbox"><i class="icon toolbar-iconfont">&#xe604;</i></div>\
                <div class="icon-all on-qrcode-icon">\
                  <div class="wrap">\
                    <div class="curr-icon-wrap">\
                      <div class="curr-icon"></div>\
                    </div>\
                    <img src="http://c.csdnimg.cn/public/common/toolbar/images/qr_code.gif" alt="" width="78" height="93">\
                  </div>\
                </div>\
              </li>\
            </ul>\
          </div>\
        </div>\
    </div>';
  $(document.body).prepend($(tpl));
  $("#chasnew123").hide();
  //var newTag = true;
  //if (newTag) {
  //  var hasNew = getCookie("csdn_has_new_product");
  //  if (hasNew == "2")
  //    $("#chasnew123").hide();
  //  else {
  //    $("#cappsarea123").one("mouseover", function () {
  //      setCookie("csdn_has_new_product", "2");
  //      $("#chasnew123").hide();
  //    });
  //  }
  //}
})();
