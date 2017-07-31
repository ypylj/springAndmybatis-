<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="default" name="decorator">
<title>登录页面</title>
</head>
<body>
	<form:form id="inputForm" modelAttribute="user"
		action="${ctx}/sys/login" method="post" class="form-horizontal">
     <table>
         <tr>
         	<td><label>登录名: </label></td>
             <td><input type="text" id="loginName" name="loginName" ></td>
         </tr>
         <tr>
         	<td><label>密码: </label></td>
             <td><input type="password" id="password" name="password"></td>
         </tr>
         <tr>
             <td><input id="submit" type="submit" value="登录"></td>
         </tr>
     </table>
</form:form>

</body>
</html>