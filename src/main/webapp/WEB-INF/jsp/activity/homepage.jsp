<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<a href="${pageContext.request.contextPath}/activitymain.controller">建立活動</a>
	<a href="${pageContext.request.contextPath}/getAll">查詢所有活動</a>
</body>
</html>