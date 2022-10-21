<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="layout/navbar.jsp"></jsp:include>
	<form:form action="addActivity" method="post" modelAttribute="list">
		<div class="container">
			<div align="center">
				<c:forEach var="student" items="${list}">
					${student.name}
				</c:forEach>
			</div>
		</div>
	</form:form>
</body>
</html>