<%--
  Created by IntelliJ IDEA.
  User: gao2
  Date: 15-4-5
  Time: 上午10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="fullscreen-container revolution-slider" style="height: 100% !important;">
        <div class="fullwidthbanner">
            <ul id="revolutionul">
                <!-- THE NEW SLIDE -->
                <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="3000"
                    data-thumb="">
                    <!-- THE MAIN IMAGE IN THE FIRST SLIDE -->
                    <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/bg9.jpg"/>" alt="">

                    <div class="caption lft slide_title_white slide_item_left"
                         data-x="30"
                         data-y="90"
                         data-speed="400"
                         data-start="1500"
                         data-easing="easeOutExpo">
                        欢迎来到<br><span class="slide_title_white_bold">树懒知识库系统</span>
                    </div>
                    <div class="caption lft slide_subtitle_white slide_item_left"
                         data-x="185"
                         data-y="245"
                         data-speed="400"
                         data-start="2000"
                         data-easing="easeOutExpo">
                        为您打造专属知识库
                    </div>

                    <div class="caption lfb"
                         data-x="640"
                         data-y="30"
                         data-speed="700"
                         data-start="1000"
                         data-easing="easeOutExpo">
                        <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/robot_index.png"/>" alt="Image 1">
                    </div>
                </li>
                <!-- THE SECOND SLIDE -->
                <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="3000"
                    data-thumb="">
                    <!-- THE MAIN IMAGE IN THE FIRST SLIDE -->
                    <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/bg1.jpg"/>" alt="">

                    <div class="caption lft slide_title slide_item_left"
                         data-x="30"
                         data-y="105"
                         data-speed="400"
                         data-start="1500"
                         data-easing="easeOutExpo">
                       想寻找某一领域的知识？
                    </div>
                    <div class="caption lft slide_subtitle slide_item_left"
                         data-x="30"
                         data-y="180"
                         data-speed="400"
                         data-start="2000"
                         data-easing="easeOutExpo">
                        树懒为您量身打造
                    </div>
                    <div class="caption lft slide_desc slide_item_left"
                         data-x="30"
                         data-y="220"
                         data-speed="400"
                         data-start="2500"
                         data-easing="easeOutExpo">
                       <p>登录本系统后能够获取您所需要的知识信息,</p>
                       <p>为您呈现相应主题知识网络。</p>
                    </div>
                    <div class="caption lfb"
                         data-x="640"
                         data-y="40"
                         data-speed="700"
                         data-start="1500"
                         data-easing="easeOutExpo">
                        <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/index_second.png"/>" alt="Image 1">
                    </div>
                </li>
                <!-- THE THIRD SLIDE -->
                <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="3000"
                    data-thumb="">
                    <!-- THE MAIN IMAGE IN THE FIRST SLIDE -->
                    <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/bg4.jpg"/> " alt="">

                    <div class="caption lft slide_title"
                         data-x="30"
                         data-y="105"
                         data-speed="400"
                         data-start="1500"
                         data-easing="easeOutExpo">
                        奔跑的树懒
                    </div>
                    <div class="caption lft slide_subtitle"
                         data-x="30"
                         data-y="180"
                         data-speed="400"
                         data-start="2000"
                         data-easing="easeOutExpo">
                        在高速信息时代
                    </div>
                    <div class="caption lft slide_desc"
                         data-x="30"
                         data-y="225"
                         data-speed="400"
                         data-start="2500"
                         data-easing="easeOutExpo">
                        信息就是财富<br> 让树懒帮您懒懒的洞悉一切
                    </div>
                    <div class="caption lfb"
                         data-x="640"
                         data-y="20"
                         data-speed="700"
                         data-start="1500"
                         data-easing="easeOutBack">
                        <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/index_third.png"/> "
                             alt="Image 2">
                    </div>
                </li>
                <!-- THE FORTH SLIDE -->
                <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="3000"
                    data-thumb="">
                    <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/bg3.jpg"/> " alt="">

                    <div class="caption lfr slide_title"
                         data-x="470"
                         data-y="100"
                         data-speed="600"
                         data-start="1000"
                         data-easing="easeOutExpo">
                        24小时在线为您解答
                    </div>
                    <div class="caption lfr slide_subtitle"
                         data-x="470"
                         data-y="170"
                         data-speed="400"
                         data-start="1500"
                         data-easing="easeOutExpo">
                        树懒智能客服为您服务
                    </div>
                    <div class="caption lfr slide_desc"
                         data-x="470"
                         data-y="220"
                         data-speed="400"
                         data-start="2000"
                         data-easing="easeOutExpo">
                        还在为寻常搜索工具上搜索到的巨量超链接而头疼吗<br>树懒知识系统来帮助你
                    </div>
                    <a class="caption lfr btn yellow slide_btn" href="javascript:;"
                       data-x="470"
                       data-y="280"
                       data-speed="400"
                       data-start="2500"
                       data-easing="easeOutExpo">
                        资料信息杂乱无章
                    </a>
                </li>
                <!-- THE FIFTH SLIDE -->
                <li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="3000"
                    data-thumb="">
                    <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/bg2.jpg"/> " alt="">

                    <div class="caption lfl slide_title slide_item_left"
                         data-x="30"
                         data-y="125"
                         data-speed="400"
                         data-start="1500"
                         data-easing="easeOutExpo">
                        从前知识在 &amp; 图书馆
                    </div>
                    <div class="caption lfl slide_subtitle slide_item_left"
                         data-x="30"
                         data-y="200"
                         data-speed="400"
                         data-start="2000"
                         data-easing="easeOutExpo">
                        信息化时代知识在 &amp; 树懒知识库
                    </div>
                    <div class="caption lfl slide_desc slide_item_left"
                         data-x="30"
                         data-y="245"
                         data-speed="400"
                         data-start="2500"
                         data-easing="easeOutExpo">
                        找知识，找解决方案，就来树懒知识库<br> 化资料为知识
                    </div>
                    <div class="caption lfb"
                         data-x="670"
                         data-y="20"
                         data-speed="700"
                         data-start="1500"
                         data-easing="easeOutBack">
                        <img src="<c:url value="/assets/frontend/pages/img/revolutionslider/index_fifth.png"/> "
                             alt="Image 1">
                    </div>
                </li>
            </ul>
            <div class="tp-bannertimer tp-bottom"></div>
        </div>
    </div>
<!-- END SLIDER -->
