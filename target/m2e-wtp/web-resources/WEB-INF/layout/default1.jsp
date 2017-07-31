<%@ page contentType="text/html;charset=UTF-8"%>
<html>  
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<head>  
<sitemesh:write property='head'>
<%@include file="/WEB-INF/include/head.jsp" %>	
</sitemesh:write>  
<style type='text/css'>  
.mainBody {    
    padding: 10px;    
    border: 1px solid #555555;    
}   
.conbgbtm {  
    width:100%;  
    min-height:400px;  
    height:auto;  
    overflow:hidden;  
    zoom:1;  
}  
</style>  

	<title><sitemesh:title/> - Powered By SSM</title>
	<%@include file="/WEB-INF/include/head.jsp" %>		
	<!-- Baidu tongji analytics --><script>var _hmt=_hmt||[];(function(){var hm=document.createElement("script");hm.src="//hm.baidu.com/hm.js?82116c626a8d504a5c0675073362ef6f";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm,s);})();</script>
	<sitemesh:head/>


</head>  
<body>  
    <!--头部  -->  
    <div align="center">  
        <h1 >
            <sitemesh:title/>   
        </h1>    
    </div>  
    <hr>     
     
    <!--主体内容  -->  
    <div class="conbgbtm">  
        <sitemesh:body/>  
    </div>  
    <hr>  
      
    <!--底部  -->         
    <div align="center">  
        <span>Copyright © 2017-2018 yangp_39 版权所有</span>  
    </div>  
      
</body>  
</html>  