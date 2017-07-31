<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="decorator" content="default" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍列表</title>
</head>
<body>
	<form:form name="${ctx}" modelAttribute="book">
		<div class="conbgbtm" align="center">

			<table border="1">
				<tr>
					<th>bookId</th>
					<th>name</th>
					<th>number</th>
				</tr>
				<c:forEach var="book" items="${list}">
					<tr>
						<td>${book.bookId}</td>

						<td>${book.name}</td>
						<td>${book.number}</td>
					</tr>
				</c:forEach>


			</table>
		</div>

	</form:form>

</body>
</html>