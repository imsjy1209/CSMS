<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
<!-- NAVBAR -->
<%-- <jsp:include page="../layout/navbar.jsp"></jsp:include> --%>
<jsp:include page="../layout/nav_student.jsp"></jsp:include>
	
<!-- CONTENT -->
<br><br>
<div class="wrapper">
	<div class="container" align="center">
		<h3><i class='bx bxs-universal-access'></i>&nbsp;我的活動紀錄</h3>
	<br>
	<span>${joinMsg}</span>
		<c:forEach var="activity" items="${activities}">
			<div class="card mb-3" style="max-width: 540px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="${contextRoot}/downloadImage/${activity.id}" alt="..."
							style="object-fit: cover; width: 100%; height: 100%">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">${activity.name}</h5>
							<p class="card-text">${activity.place}<br>${activity.date}</p>
							<p class="card-text">
								<small class="text-muted"><a
									href="${contextRoot}/getmyact/getact?id=${activity.id}"
									class="card-link">查看詳情</a></small>
							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<br>
<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>	
</body>
</html>