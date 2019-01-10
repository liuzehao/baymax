;(function () {
protocol = location.protocol.substr(0, 4) === 'http' ? '' : 'http:';
document.write("<link rel='stylesheet' type='text/css' href='" + protocol + "//csdnimg.cn/pubfooter/css/pub_footer_2014.css' />");
document.write("<div class='pub_fo'>");
document.write("<div id='pub_footerall' class='pub_footer_new'>");
document.write("<dl>");
document.write("<dt></dt>");
document.write(" <dd class='foot_sub_menu'><a href='http://www.csdn.net/company/about.html' target='_blank'> 2016 © 长春工业大学</a></dd>");
document.write("</dl>");
document.write("</div>");
document.write("</div>");
document.write('<script id="noticeScript" type="text/javascript"  btnId="header_notice_num" wrapId="note1" count="5" subcount="5" src="' + protocol + '//csdnimg.cn/rabbit/notev2/js/notify.js?9d86d94"></script>');

var head = document.getElementsByTagName('head')[0]
	, s, ss = [
		protocol + '//csdnimg.cn/pubfooter/js/tracking.js?v=' + Math.random()
		, protocol + '//csdnimg.cn/rabbit/tracking-ad/main.js?75eacd6'
	]
	;

for(var i = 0; i < ss.length; i ++){
	s = document.createElement('script')
	s.type = 'text/javascript';
	s.charset = 'utf-8';
	s.src = ss[i];
	head.insertBefore(s, null);
}
}());