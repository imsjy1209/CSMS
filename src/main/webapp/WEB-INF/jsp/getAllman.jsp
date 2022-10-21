<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div align="center">
			<h1>活動頁面</h1>
			<c:forEach var="activity" items="${list}">
				<div class="card"
					style="width: 18rem; float: left; padding: 15px 20px; margin: 5px 10px 15px 20px">
					<img src="${contextRoot}/downloadImage/${activity.id}"
						class="card-img-top"
						style="object-fit: cover; width: 246px; height: 163px" alt="...">

					<ul class="list-group list-group-flush">
						<li class="list-group-item">${activity.name}</li>
						<li class="list-group-item">${activity.place}</li>
						<li class="list-group-item">${activity.date}</li>
					</ul>

					<div class="card-body">
						<a href="${contextRoot}/getact?id=${activity.id}" class="card-link">查看詳情</a> <a
							href="${contextRoot}/join/${activity.id}" class="card-link">更新</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>