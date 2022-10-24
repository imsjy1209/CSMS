<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
		      altField : "#datepicker",
		      altFormat : "yy-mm-dd",
		      dateFormat : "yy-mm-dd"
		    });
	});
</script>
</head>
<body>

	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<div class="container">
		<div align="center" style="width: 500px; height: 200px; margin: 0 auto;">
				
			<img src="${pageContext.request.contextPath}/downloadImage/${id}"
				class="img-fluid img"
				style="display: block; width: 100%; height: auto; position: relative; top: 50px"
				alt="...">
			
			<form action="${pageContext.request.contextPath}/updateCkeditor" method="post">

			<p style="display: none"><input name="id" value="${activity.id}"/></p>
			<p style="display: none"><input name="added" value="${activity.added}"/></p>
				<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="${pageContext.request.contextPath}/updatepic/${id}" class="card-link">修改照片</a></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">活動名稱:</div><input name="name" value="${activity.name}"/></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">活動地點:</div><input name="place" value="${activity.place}"/></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">活動日期:</div><input name="date" type="text" id="datepicker" value="${activity.date}"/></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">詳細內容:</div><textarea name="content">${activity.content}</textarea></li>
					<c:choose>
					<c:when test="${removed == 1}">
					<li class="list-group-item"><div align="left"
							style="float: left;">上架活動:</div><a href="${contextRoot}/already/${id}"><i class='bx bxs-hand-up' style="font-size: 25px"></i></a></li>
					<li class="list-group-item">
					</c:when>
					<c:when test="${removed == 0}">
					<li class="list-group-item"><div align="left"
							style="float: left;">下架活動:</div><a href="${contextRoot}/removed/${id}"><i class='bx bxs-hand-down' style="font-size: 25px"></i></a></li>
					<li class="list-group-item">
					</c:when>
					</c:choose>
				</ul>
				<input type="submit" value="更新">
			</form>
		</div>
	</div>
	<script>
		CKEDITOR.replace('content');
		CKEDITOR.config.width = 300;
		CKEDITOR.config.height =200;
	</script>
</body>
</html>