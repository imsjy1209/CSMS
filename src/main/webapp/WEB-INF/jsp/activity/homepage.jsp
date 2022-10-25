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
屬於 : ${users.groups.groupsName}<br>
導師名子 : ${school.name}<br>
講師名子 : ${teacher.name}<br>
學生名子 : ${student.name}<br>
家長名子 : ${parent.name}<br>
	<a href="${pageContext.request.contextPath}/activitymain.controller">建立活動</a>
	<a href="${pageContext.request.contextPath}/getAll">查詢所有活動</a>
</body>
</html>