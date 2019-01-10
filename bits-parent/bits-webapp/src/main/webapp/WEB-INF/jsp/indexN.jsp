<%--
  Created by IntelliJ IDEA.
  User: hao pc
  Date: 2016/5/4
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<c:url value="/assets/index/css/bootstrap.css"/>" rel="stylesheet"/>
<!-- Custom Theme files -->
<link href="<c:url value="/assets/index/css/style.css"/>" rel="stylesheet"/>

<!-- js -->
<script src="<c:url value="/assets/index/js/jquery-1.11.1.min.js"/>" type="text/javascript"></script>

<!-- //js -->
<!-- animation-effect -->
<link href="<c:url value="/assets/index/css/animate.min.css"/>" rel="stylesheet"/>
<script src="<c:url value="/assets/index/js/wow.min.js"/>" type="text/javascript"></script>
<script>
  new WOW().init();
</script>
<!-- //animation-effect -->
<!-- Custom Theme files -->
<!--webfont-->
<link href='http://fonts.useso.com/css?family=Vollkorn:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<link href="<c:url value="/assets/index/css/search-form.css"/>" rel="stylesheet"/>
<!-- start-smoth-scrolling -->
<script src="<c:url value="/assets/index/js/move-top.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/index/js/easing.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script

<link href="./assetsallP/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script src="./assetsallP/frontend/layout/scripts/back-to-top1.js" type="text/javascript"></script>

<script type="text/javascript">
  jQuery(document).ready(function($) {
    $(".scroll").click(function(event){
      event.preventDefault();
      $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
    });
  });

  function logout() {
    location.href = basePath + "logout";
  }

  function toHome() {
    location.href = basePath;
  }
  function selfCenter(){
    location.href = basePath + "userCenter/handleUpload";
  }
  function toLogin(){
    location.href = basePath + "login";
  }
  function toSearch(){
      location.href = basePath + "literature/search";
  }
  function toTheme(){
      location.href = basePath + "theme/getThemeList";
  }
  function toAnswer(){
      location.href = basePath + "autoAnswer/getPage";
  }
</script>
<!-- start-smoth-scrolling -->

<head>
    <title>树懒知识库</title>
</head>
<!--desk-->



<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="title" content="Desk.com | Customer Service and Helpdesk Ticket Software">
<LINK href="https://www.desk.com/" rel="canonical"> <LINK href="https://www.desk.com/"
                                                          rel="shortlink">
<META name="description" content="Desk.com is an online customer service software and support ticket help desk application for small business and fast-growing companies. Get a free trial today!">
<META content="Desk.com" property="og:site_name">
<META content="website" property="og:type">
<META content="Desk.com | Customer Service and Helpdesk Ticket Software"
      property="og:title">
<META name="keywords" content="desk.com, customer service, customer support software">
<META http-equiv="content-language" content="EN">
<META content="https://www.desk.com/" property="og:url">
<META content="Desk.com is an online customer service software and support ticket help desk application for small business and fast-growing companies. Get a free trial today!"
      property="og:description">
<META name="GENERATOR" content="MSHTML 11.00.9600.18321">
<META name="MobileOptimized" content="width">
<META name="HandheldFriendly" content="true">
<META name="viewport" content="width=device-width, initial-scale=1.0"> <LINK
        href="/core/misc/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon">
<LINK href="/node/1" rel="canonical"> <LINK href="/node/1" rel="shortlink">
<LINK href="/node/1/delete" rel="delete-form"> <LINK href="/node/1/edit" rel="edit-form">
<LINK href="/node/1/revisions" rel="version-history"> <LINK href="/node/1" rel="revision">

<META name="google-site-verification" content="hPI4faJVBnFgzJlIgSQxBx_xw5DU2htxiOVrJTPValM">
<TITLE>Desk.com | Customer Service and Helpdesk Ticket Software</TITLE>
<LINK href="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/css_3EPI5IRtWP4kp8FQ_RmqBvr0VUrraW8RCokWez4SkGA.css" rel="stylesheet" media="all">
<LINK href="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/css_llsA1mr0wKYHbUoqUaf4Zd-OBpsxOJhOVelvTByHJZs.css" rel="stylesheet" media="all">
<LINK href="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/font-awesome.min.css"
      rel="stylesheet">	 <!--[if lte IE 8]>
<script src="/sites/default/files/js/js_VtafjXmRvoUgAzqzYTA3Wrjkx9wcWhjP0G4ZnnqRamA.js"></script>
<![endif]-->

<SCRIPT src="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/bsh2tmy.js"></SCRIPT>

<SCRIPT>try{Typekit.load({ async: true });}catch(e){}</SCRIPT>

<SCRIPT src="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/jquery-1.11.2.min.js" type="text/javascript"></SCRIPT>

<SCRIPT src="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/109614729.js"></SCRIPT>
<SCRIPT src="./Desk_com%20%20Customer%20Service%20and%20Helpdesk%20Ticket%20Software_files/js_pIhK3K24SDzlAcuP6HJBUlRitvWDPeF9M55UjdKSNHs.js"></SCRIPT>
<style>
  .a{
    background:url("<c:url value="/images/a.png"/>") no-repeat center center;


  }

</style>
<link href="<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"/> " rel="stylesheet">
<!--desk end-->
<body style="height:100%;">
<!-- banner -->
<!--<div data-vide-bg="mp4: <c:url value="/assets/index/video/city.mp4"/>" data-vide-options="loop: true, muted: false, position: 0% 0%">
  <div class="center-container">
    <div class="">
      <div class="navigation">
        <div class="navigation-left animated wow slideInLeft" data-wow-delay="700ms">
        </div>
        <div class="navigation-right">
          <span class="menu"><img src="<c:url value="/assets/index/images/menu.png"/>" alt=" " /></span>
          <nav class="link-effect-4" id="link-effect-4">
            <ul class="nav1 nav nav-wil" style="padding-left: 400px;">
              <li class="active"><a data-hover="主页" href="index.html">主页</a></li>
              <li><a data-hover="全库搜索" onclick="toSearch()" class="scroll" style="cursor:pointer;">全库搜索</a></li>
              <li><a data-hover="主题分类" onclick="toTheme()" class="scroll" style="cursor:pointer;">主题分类</a></li>
              <li ><a data-hover="知识应用" data-toggle="dropdown" class="scroll" style="cursor:pointer;">知识应用<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">图形化知识网络</a></li>
                  <li><a href="#" onclick="toAnswer()">树小懒问答</a></li>
                </ul>
              </li>
              <li><a data-hover="使用手册" href="#mail" class="scroll" style="cursor:pointer;">使用手册</a></li>

              <li>
                <c:if test="${User.username == null}">
                  <button class="button gray " id="login-btn" onclick="toLogin()" style=" margin: 0px 0px 0px 70px;">
                    登陆
                  </button>
                </c:if>
                <c:if test="${User.username != null}">
                  <button class="button green " onclick="logout()" id="logout" style="margin-left: 50px;" >注销</button>
                  <button class="button orange " id="user-center" onclick="selfCenter('${User.userId}')">${User.username}</button>
                </c:if>
              </li>
                <li><input  type="search"  style="margin-left: 50px;" ></li>
            </ul>
          </nav>
          <script type="text/javascript">
              $(function(){
              $("input[type='search']").bind('keypress',function(event){
                  if(event.keyCode == "13")
                  {

                    location.href = basePath + "search?key="+$("input[type='search']").val()+"&direction=all";
                  }
              });
              });
          </script>
        </div>
        <div class="clearfix"></div>
      </div> <!-- script-for-menu -->
      <!--  <script>
            $( "span.menu" ).click(function() {
                $( "ul.nav1" ).slideToggle( 300, function() {
                    // Animation complete.
                });
            });
        </script>
        <!-- /script-for-menu -->
     <!-- <div class="logo animated wow zoomIn" data-wow-delay="900ms">
        <h1><a href="index.html">树懒知识库<span>带你翱翔</span></a></h1>
      </div>
      <div class="start animated wow bounce" data-wow-delay="700ms">
        <a href="#sousuo" class="hvr-bounce-to-bottom scroll">马上开始</a>
      </div>
    </div>
  </div>
</div>
-->


<HEADER role="banner">
  <DIV class="navbar navbar-default navbar-desk navbar-desk-desktop navbar-fixed-top navbar-no-hero "
       data-phase="one">
    <DIV class="container" id="primary-nav">
      <DIV class="navbar-header"><A class="navbar-brand" href="http://www.desk.com/">
        <OBJECT id="brand" data="/themes/bolt/assets/img/logo-desk.svg" type="image/svg+xml"><IMG
                width="200" height="82" id="brand" alt="Desk.com" src="./images/slothnew1.png">
        </OBJECT>											 </A>				 </DIV><NAV class="navbar-collapse collapse"
                                                                                              role="navigation">
      <UL class="nav navbar-nav">
        <LI class="link-product link--has-beacon  dropdown "><A href="#">
          <SPAN class="link-title">
            首页
        </SPAN>

        </A>
        </LI>
        <LI class="link-pricing ">
          <A href="#" onclick="toTheme()">
            <SPAN class="link-title">
  								主题分类
            </SPAN>
          </A>
        </LI>
          <LI class="link-pricing ">
              <A href="#"  onclick="toAnswer()">
                   <SPAN class="link-title">
              自动问答
                       </SPAN>
              </A>
          </LI>
        <LI class="link-pricing ">
          <A href="#"  onclick="toSearch()">
            <SPAN class="link-title">
              全局检索
            </SPAN>
          </A>
        </LI>
        <LI class="link-help">
          <A href="http://support.desk.com/">
            <SPAN class="link-title">
  									帮助
            </SPAN>
          </A>
        </LI>

        <c:if test="${User.username == null}">
          <LI class="link-login">

            <A href="#"    onclick="toLogin()" >
                        <SPAN class="link-title">
  									Login
                        </SPAN>
            </A>
          </LI>
        </c:if>
        <c:if test="${User.username != null}">
          <LI class="link-login">
            <A href="#"  style="color:#7B72E9"  onclick="selfCenter('${User.userId}')">
                            <SPAN class="fa fa-user">

                            </SPAN>
                            <SPAN class="link-title">
                                ${User.username}
                            </SPAN>
            </A>
          </LI>
        </c:if>
        <c:if test="${User.username != null}">
          <LI class="link-login">

            <A href="#"  onclick="logout()"   style="color:#FF4351" >
                        <SPAN class="link-title">
                           注销

                        </SPAN>
            </A>
          </LI>
        </c:if>

      </UL>
    </NAV>
    </DIV>
  </DIV>
  </DIV>
  </DIV>
  <DIV class="jumbotron jumbotron-homepage jumbotron--homepage__v2 woodgrain ">

    <DIV class="container">
      <H1 class="jumbotron__heading" style="margin-top: 25px; margin-bottom: 25px;">
        Sloth 知识库
        <BR>that makes
        study happy.
      </H1>

      <P>
        <A class="btn btn-lg btn-success btn-round btn-no-border btn-uppercase" href="http://help.desk.com/register/home">
          马上开始
        </A>
      </P>
    </DIV>
    <DIV class="ipad-with-video hidden-xs " >
      <A class="video--wrapper fresco" href="https://www.youtube.com/embed/TzIhH_V2mEU?rel=0" data-toggle="lightbox" data-fresco-options="rel: 0" data-width="100%">
        <SPAN class="ipad-with-video__video-link">
          <SPAN class="ipad-with-video--text">
						Watch overview video
          </SPAN>
        </SPAN>
        <VIDEO width="598" height="290" autoplay="autoplay" loop="true" controls="false" poster="themes/bolt/assets/img/jumbotron/home/desk-overview-video-thumb.png">
          <SOURCE src="https://webassets.desk.com/assets/videos/desk-overview-loop.mp4" type="video/mp4">Sorry, this video is not supported.
        </VIDEO>
      </A>
    </DIV>
  </DIV>
</HEADER>
<script>window.jQuery || document.write('<script src="<c:url value="/assets/index/js/jquery-1.11.1.min.js"/>"><\/script>')</script>
<script src="<c:url value="/assets/index/js/jquery.vide.min.js"/>" type="text/javascript"></script>
<!-- //banner -->
<!--智能搜索-->
<div class="about-bottom animated wow bounceInDown animated" style="visibility: visible; min-height:100px; animation-name: bounceInDown;background:url(images/searchlong.png) no-repeat 0px 0px;"></div>
<div id="sousuo" data-wow-delay="810ms" class="about-bottom animated wow bounceInDown animated" style="visibility: visible; animation-delay: 810ms; animation-name: bounceInDown;background:url(images/searchbg.png) repeat-y 0px 0px;">
    <form onsubmit="submitFn(this, event);">
      <div class="search-wrapper">
          <ul hidden="hidden" id="tabs">
              <li><a flag="1" href="#" style="margin-bottom: 20px;">全库搜索</a></li>
              <li><a flag="2"  href="#" >文档搜索</a></li>
              <li><a flag="3"  href="#">图片搜索</a></li>
              <li><a flag="4"  href="#" >视频搜索</a></li>
              <li><a flag="5"  href="#">音频搜索</a></li>
            <li><a flag="6" href="#">全网搜索</a></li>
          </ul>
      <div class="input-holder" >
        <input type="text" class="search-input" placeholder="搜一搜" />
        <button id="searchButton" class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
      </div>
      <span class="close" onclick="searchToggle(this, event);" style=" margin-top: 50px;" hidden="hidden" id="flag"></span>
      <div class="result-container">
      </div>
    </div>
  </form>

</div>
<script type="text/javascript">
    function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');

    if(!container.hasClass('active')){
      container.addClass('active');
       $("#tabs").toggle(500);
        $("#flag").toggle();
      evt.preventDefault();
    }
    else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
      container.removeClass('active');
      // clear input
        $("#tabs").toggle(500);
        $("#flag").toggle();
      container.find('.search-input').val('');
      // clear and hide result container when we press close
      container.find('.result-container').fadeOut(100, function(){$(this).empty();});
    }
  }

  function submitFn(obj, evt){
    value = $(obj).find('.search-input').val().trim();

    html = "随便试试 ";
    if(!value.length){
        html += "<b>" + html+ "</b>";
        $(obj).find('.result-container').html('<span>' + _html + '</span>');
        $(obj).find('.result-container').fadeIn(100);
    }
    else{
        $("#tabs a").each(function(){
            if ($(this).attr("id") == "current") { //detection for current tab
                if($(this).attr("flag")==1){
                    location.href = basePath + "search?key="+value+"&direction=all";
                }
                if($(this).attr("flag")==2){
                    location.href = basePath + "iterature/search?key="+value+"&direction=literature";
                }
                if($(this).attr("flag")==3){
                    location.href = basePath + "picture/search?key="+value+"&direction=picture";
                }
                if($(this).attr("flag")==4){
                    location.href = basePath + "video/search?key="+value+"&direction=video";
                }
                if($(this).attr("flag")==5){
                    location.href = basePath + "audio/search?key="+value+"&direction=audio";
                }
              if($(this).attr("flag")==6){
                 location.href = basePath +"/search?key="+value+"&direction=global";
              }
            }
        });

    }



    evt.preventDefault();
  }
    <!--tabs-->
  function resetTabs(){
      $("#content > div").hide(); //Hide all content
      $("#tabs a").attr("id",""); //Reset id's
  }
  var myUrl = window.location.href; //get URL
  var myUrlTab = myUrl.substring(myUrl.indexOf("#"));
  var myUrlTabName = myUrlTab.substring(0,4);
  (function(){
      $("#content > div").hide(); // Initially hide all content
      $("#tabs li:first a").attr("id","current"); // Activate first tab
      $("#content > div:first").fadeIn(); // Show first tab content

      $("#tabs a").on("click",function(e) {
          e.preventDefault();
          if ($(this).attr("id") == "current"){ //detection for current tab
              return
          }
          else{
              resetTabs();
              $(this).attr("id","current"); // Activate this
              $($(this).attr('name')).fadeIn(); // Show content for current tab
          }
      });
      for (i = 1; i <= $("#tabs li").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content
          }
      }
  })()




</script>
<!--智能搜索结束-->
<!-- about -->
<div class="about" >
  <div class="container">
    <div class="about-grids animated wow lightSpeedIn" data-wow-delay="700ms">
      <div class="col-md-6 about-grid-left">
        <div class="grid">
          <figure class="effect-moses">
            <img class="img-responsive" src="<c:url value="/assets/index/images/mac.png"/>">
            <figcaption>
              <h3>在线 <span>预览</span></h3>
              <p>不用下载，免去安装不同软件的烦恼</p>
            </figcaption>
          </figure>
        </div>
      </div>
      <div class="col-md-6 about-grid-right">
        <div class="banner-bottom-text">
          <h3>在线</h3>
          <div class="banner-bottom-text-pos banner-bottom-text-pos1">
            <h3>预览</h3>
          </div>
        </div>
        <div class="bar1 bar-con bar-con1">
          <div class="bar2" data-percent="70"></div>
        </div>
        <script>
          (function ( $ ) {
            $.fn.progress = function() {
              var percent = this.data("percent");
              this.css("width", percent+"%");
            };
          }( jQuery ));

          $(document).ready(function(){
            $(".bar1 .bar2").progress();
          });
        </script>
        <p>Office在线预览及PDF在线预览有各种各样的方法。转换为PDF？再转换为SWF？客户不让在服务器安装Office！经常死机！太消耗服务器资源！运行成本太高！
          使用成熟的ActiveX控件？浏览者需要下载安装控件，客户嫌麻烦，又存在不同的操作系统（32位、64位）、不同的浏览器而烦恼，安装不是一般的费劲！竟然还只支持IE！Mac咋办呢？
          移动设备上无法在线预览！在今天智能手机天下的时代，客户无法在手机上办公简直不可想象。.</p>
        <ul>
          <li>office在线预览</li>
          <li>在线播放视频</li>
          <li>在线欣赏音频</li>
          <li>在线预览图片</li>
        </ul>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>
<!-- //about-bottom -->
<!-- services -->
<div class="services" id="services">
  <div class="container">
    <div class="services-grids">
      <div class="col-md-6 services-grid-left animated wow bounceInLeft" data-wow-delay="500ms">
        <div class="banner-bottom-text">
          <h3>猜你</h3>
          <div class="banner-bottom-text-pos">
            <h3>喜欢</h3>
          </div>
        </div>
        <div class="bar1 bar-con bar-con1">
          <div class="bar3" data-percent="70"></div>
        </div>
        <script>
          (function ( $ ) {
            $.fn.progress = function() {
              var percent = this.data("percent");
              this.css("width", percent+"%");
            };
          }( jQuery ));

          $(document).ready(function(){
            $(".bar1 .bar3").progress();
          });
        </script>
      </div>
      <div class="col-md-6 services-grid-right">
        <div class="col-md-6 services-grid-right-grid">
          <div class="services-grid-right-grid1">
            <img class="img-responsive" src="<c:url value="/assets/index/images/fannao1.jpg"/>">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
              找来找去找不到自己想要的？
            </button>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Frequent Flyer</h4>
                  </div>
                  <div class="modal-body">
                    Quis autem vel eum iure reprehenderit qui in ea voluptate velit
                    esse quam nihil molestiae consequatur.Neque porro
                    quisquam est, qui dolorem ipsum quia dolor sit amet,
                    consectetur, adipisci velit, sed quia non numquam
                    eius modi tempora incidunt ut labore et dolore
                    magnam aliquam quaerat voluptatem. Ut enim ad minima
                    veniam, quis nostrum exercitationem ullam corporis
                    suscipit laboriosam, nisi ut aliquid ex ea commodi
                    consequatur? Quis autem vel eum iure reprehenderit
                    qui in ea voluptate velit esse quam nihil molestiae
                    consequatur, vel illum qui dolorem eum fugiat quo
                    voluptas nulla pariatur.
                  </div>
                </div>
              </div>
            </div>
            <p></p>
          </div>
        </div>
        <div class="col-md-6 services-grid-right-grid">
          <div class="services-grid-right-grid1">
            <img class="img-responsive" src="<c:url value="/assets/index/images/fannao2.jpg"/>">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
              搜索不知道怎么输关键词？
            </button>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Frequent Flyer</h4>
                  </div>
                  <div class="modal-body">
                    Quis autem vel eum iure reprehenderit qui in ea voluptate velit
                    esse quam nihil molestiae consequatur.Neque porro
                    quisquam est, qui dolorem ipsum quia dolor sit amet,
                    consectetur, adipisci velit, sed quia non numquam
                    eius modi tempora incidunt ut labore et dolore
                    magnam aliquam quaerat voluptatem. Ut enim ad minima
                    veniam, quis nostrum exercitationem ullam corporis
                    suscipit laboriosam, nisi ut aliquid ex ea commodi
                    consequatur? Quis autem vel eum iure reprehenderit
                    qui in ea voluptate velit esse quam nihil molestiae
                    consequatur, vel illum qui dolorem eum fugiat quo
                    voluptas nulla pariatur.
                  </div>
                </div>
              </div>
            </div>
            <p></p>
          </div>
        </div>
        <div class="clearfix"> </div>
      </div>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>
<!-- //services -->
<!-- services-bottom -->
<div class="services-bottom">
  <div class="container">
    <div class="services-bottom-grids animated wow bounceInUp" data-wow-delay="500ms">
      <img class="img-responsive" src="<c:url value="/assets/index/images/tushuguan.png"/>">
      <div class="services-bottom-grid">
        <div class="services-bottom-grid-left">
          <h4>，猜你喜欢
            给你想要的</h4>
          <h3>想你所想<i>为您私人推荐</i></h3>
          <ul>
            <li>独特算法</li><br>
            <li>根据您的搜索历史</li>
            <li>根据您的浏览历史</li>
            <li>智能匹配与您相似用户</li>
          </ul>
        </div>
        <div class="services-bottom-grid-right animated wow zoomInUp" data-wow-delay="800ms">
          <img class="img-responsive" src="<c:url value="/assets/index/images/1.png"/>">
        </div>
        <div class="clearfix"> </div>
      </div>
    </div>
  </div>
</div>
<!-- //services-bottom -->
<!--智能客服-->
<div class="banner-bottom">
  <div class="container">
    <div data-wow-delay="700ms" class="col-md-6 banner-bottom-left animated wow bounceInLeft animated" style="visibility: visible; animation-delay: 700ms; animation-name: bounceInLeft;">
      <div class="banner-bottom-text">
        <h2>24hours</h2>
        <div class="banner-bottom-text-pos">
          <h3>在线问答</h3>
        </div>
      </div>
      <div class="bar1 bar-con">
        <div data-percent="70" class="bar" style="width: 70%;"></div>
      </div>
      <script>
        (function ( $ ) {
          $.fn.progress = function() {
            var percent = this.data("percent");
            this.css("width", percent+"%");
          };
        }( jQuery ));

        $(document).ready(function(){
          $(".bar1 .bar").progress();
        });
      </script>
      <p>不会用系统？问树小懒啊；不知道怎么搜索？问树小懒啊；学习学的无聊了，让树小懒给亲讲个冷笑话o(^▽^)o</p>
      <div data-wow-delay="700ms" class="start animated wow bounce animated" style="visibility: visible; animation-delay: 700ms; animation-name: bounce;">
        <a class="hvr-bounce-to-bottom scroll" href="#about">去找树小懒</a>
      </div>
    </div>
    <div data-wow-delay="700ms" class="col-md-6 banner-bottom-right animated wow bounceInRight animated" style="visibility: visible; animation-delay: 700ms; animation-name: bounceInRight;">
      <div class="banner-bottom-right-left">
        <div class="banner-bottom-right-left1">
          <div class="box">
            <div class="cover top-left">
              <h3 class="title">教你使用系统</h3>
              <p class="intro">如果你对系统有任何疑问，树小懒为你耐心解答</p>
            </div>
          </div>
        </div>
      </div>
      <div class="banner-bottom-right-left">
        <div class="banner-bottom-right-left1">
          <div class="box box1">
            <div class="cover top-left">
              <h3 class="title">智能解答</h3>
              <p class="intro">聊天过程中向树小懒提出任何问题，树小懒将向你解答并推荐文件</p>
            </div>
          </div>
        </div>
        <div class="banner-bottom-right-left1">
          <div class="box box2">
            <div class="cover top-left">
              <h3 class="title">生活小帮手</h3>
              <p class="intro">树小懒接通云服务接口，可以给你讲笑话，查询当地天气</p>
            </div>
          </div>
        </div>
      </div>
      <div class="clearfix"> </div>
    </div>
    <div class="clearfix"> </div>
  </div>
</div>
<!--客服结束-->
<!--teem-->
<div class="team">
  <div class="container">
    <div data-wow-delay="500ms" class="col-md-4 team-grid animated wow fadeInDown animated" style="visibility: visible; animation-delay: 500ms; animation-name: fadeInDown;">
      <div class="team-grid1">
        <img class="img-responsive"  style="height: 300px;"src="<c:url value="/assets/index/images/liu.png"/>">
        <div class="team-grid1-pos">
          <ul class="social-nav model-8 social-icons">
            <li><a class="facebook" href="#"><i></i></a></li>
            <li><a class="twitter" href="#"><i> </i></a></li>
            <li><a class="g" href="#"><i></i></a></li>
          </ul>
        </div>
      </div>
      <p></p>
      <h3>刘泽豪</h3>
    </div>
    <div data-wow-delay="700ms" class="col-md-4 team-grid animated wow fadeInDown animated" style="visibility: visible; animation-delay: 700ms; animation-name: fadeInDown;">
      <div class="team-grid1">
        <img class="img-responsive"  style="height:300px; "src="<c:url value="/assets/index/images/sun.jpg"/>">
        <div class="team-grid1-pos">
          <ul class="social-nav model-8 social-icons">
            <li><a class="facebook" href="#"><i></i></a></li>
            <li><a class="twitter" href="#"><i> </i></a></li>
            <li><a class="g" href="#"><i></i></a></li>
          </ul>
        </div>
      </div>
      <p></p>
      <h3>孙境棋</h3>
    </div>
    <div data-wow-delay="800ms" class="col-md-4 team-grid animated wow fadeInDown animated" style="visibility: visible; animation-delay: 800ms; animation-name: fadeInDown;">
      <div class="team-grid1">
        <img class="img-responsive" style="height:300px;" src="<c:url value="/assets/index/images/tang.png"/>">
        <div class="team-grid1-pos">
          <ul class="social-nav model-8 social-icons">
            <li><a class="facebook" href="#"><i></i></a></li>
            <li><a class="twitter" href="#"><i> </i></a></li>
            <li><a class="g" href="#"><i></i></a></li>
          </ul>
        </div>
      </div>
      <p></p>
      <h3>唐东凯</h3>
    </div>

    <div class="clearfix"></div>
  </div>
</div>
<!--teem结束-->
<!-- footer -->
<div class="footer animated wow bounceInDown" data-wow-delay="600ms">
  <div class="container">
    <div class="footer-grids">
      <div class="col-md-3 footer-grid footer-grid1">
        <h3>Navigation</h3>
        <ul class="footer-nav">
          <li><a href="index.html">Home</a></li>
          <li><a href="#about" class="scroll">About</a></li>
          <li><a href="#services" class="scroll">Services</a></li>
          <li><a href="#gallery" class="scroll">Photo Gallery</a></li>
          <li><a href="#mail" class="scroll">Mail Us</a></li>
        </ul>
      </div>
      <div class="col-md-3 footer-grid footer-grid1">
        <h3>Welcome</h3>
        <p>欢迎来到</p>
      </div>
      <div class="col-md-3 footer-grid footer-grid1">
        <img class="img-responsive" src="<c:url value="/assets/index/images/ccutlogo.png"/>">
      </div>
      <div class="col-md-3 footer-grid">

      </div>
      <div class="clearfix"> </div>
      <div class="footer-grid2-pos animated wow bounceIn" data-wow-delay="800ms">
        <img class="img-responsive" src="<c:url value="/assets/index/images/2.png"/>">
      </div>
    </div>
  </div>
</div>
<!-- //footer -->
<script src="<c:url value="/assets/index/js/bootstrap.min.js"/>" type="text/javascript"></script>
<!-- here stars scrolling icon -->
<script type="text/javascript">
  $(document).ready(function() {
    /*
     var defaults = {
     containerID: 'toTop', // fading element id
     containerHoverID: 'toTopHover', // fading element hover id
     scrollSpeed: 1200,
     easingType: 'linear'
     };
     */

    $().UItoTop({ easingType: 'easeOutQuart' });

  });
</script>
<!-- //here ends scrolling icon -->
</body>
</html>
