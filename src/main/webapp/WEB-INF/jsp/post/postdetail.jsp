<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<!-- 舊NAVBAR -->
<%-- <jsp:include page="../layout/navbar.jsp"></jsp:include> --%>
<!-- 依group_id呈現navBar -->
<div class="navGroups">
	<c:choose>
		<c:when test="${users.groups.id == 3}">
			<!-- TEACHER NAVBAR -->
			<jsp:include page="../layout/nav_teacher.jsp" />
		</c:when>
		<c:when test="${users.groups.id == 4}">
			<!-- STUDENT NAVBAR -->
			<jsp:include page="../layout/nav_student.jsp" />	
		</c:when>
		<c:when test="${users.groups.id == 5}">
			<!-- PARENT NAVBAR -->
			<jsp:include page="../layout/nav_parent.jsp" />	
		</c:when>
	</c:choose>
</div>

<br><br>
<div class="wrapper">
	<div class="container">
	<br><h1 align="center">公告</h1><br>
		<div class="card">
			<div class="card-header">
				<h4>${post.topic}<br></h4>
			</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${post.article}</p>
					<footer class="blockquote-footer">${post.update_at}<cite
							title="Source Title"></cite>
					</footer>
				</blockquote>
			</div>
		</div>
	</div>
</div>
<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>	
</body>
</html>