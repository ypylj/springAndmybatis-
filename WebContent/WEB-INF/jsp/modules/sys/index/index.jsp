<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<html><head>
<meta name="decorator" content="blank" />
<style type="text/css">
#left{
background-color:black;
color:white;
text-align:center;
padding:50px;
}
#footer{
blackground:black;
color:white;
clear:both;
text-align:center;
padding:5px;
}
</style></head>
<body>

<div class="container-fluid">
			<div id="content" class="row-fluid">
				<div id="left">
				<li><a href="${ctx}/book/list" target="mainFrame">书籍列表</a></li>
				</div>
				<div id="openClose" class="close">&nbsp;</div>
				
				<!-- 右侧为主界面 -->
				<div id="right">
					<iframe id="mainFrame" name="mainFrame" src=""
						style="overflow: visible;" scrolling="yes" frameborder="no"
						width="100%" height="650"></iframe>
				</div>
			</div>
			<div id="footer" class="row-fluid">
				Copyright &copy; 2016-2018 - Powered By <a
					href="${ctx}/" target="_blank">SpringAndMyBatis</a>
			</div>
		</div>
</body>
</html>