<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html style="overflow-x: auto; overflow-y: auto;">
<head>
<title><sitemesh:title /> - Powered By SSM</title>
<%@include file="/WEB-INF/include/head.jsp"%>
<!-- Baidu tongji analytics -->
<link href="/static/bootstrap-3.3.7/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
<sitemesh:head />
</head>
<body>
	<%-- <div id="body" >
		<div>
			<ul class="nav nav-tabs">
				<li class="active"><a href="#">菜单1</a></li>
				<li><a href="#">菜单2</a></li>
				<li><a href="#">菜单3</a></li>
			</ul>
		</div>
		<sitemesh:body />
	</div>
 --%>
<sitemesh:body/>


	<div id="footer" align="center">
		<span>Copyright © 2017-2018 yangp_39 版权所有</span>
	</div>

	<script type="text/javascript">//<!-- 无框架时，左上角显示菜单图标按钮。
		/* if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			$("body").prepend("<i id=\"btnMenu\" class=\"icon-th-list\" style=\"cursor:pointer;float:right;margin:10px;\"></i><div id=\"menuContent\"></div>");
			$("#btnMenu").click(function(){
				top.$.jBox('get:${ctx}/sys/menu/treeselect;JSESSIONID=<shiro:principal property="sessionid"/>', {title:'选择菜单', buttons:{'关闭':true}, width:300, height: 350, top:10});
				//if ($("#menuContent").html()==""){$.get("${ctx}/sys/menu/treeselect", function(data){$("#menuContent").html(data);});}else{$("#menuContent").toggle(100);}
			});
		} */
		
	</script>
</body>
</html>