<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container" align="">
	<h1 align="center">查看公告</h1>
		<div class="list-group">
			<c:forEach var="post" items="${list}">
				<a href="${contextRoot}/post/detail/${post.id}"
					class="list-group-item list-group-item-action">${post.topic}</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>