<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<div class="container">
		<div align="center">
		<br><h2>建立活動</h2><br>
			<form action="${contextRoot}/post/update" method="post">
			<p style="display: none"><input name="id" value="${post.id}"/></p>
			
				<div class="form-group">
					<label for="exampleInputEmail1">公告標題:</label> <input type="text"
						class="form-control" name="topic" style="width:20%" value="${post.topic}">
				</div>
				<select name="userType">
				<c:choose>
					<c:when test="${post.userType == 1}">
							<option value="1" selected>校方
							<option value="2">所有人					
					</c:when>
					<c:when test="${post.userType ==2}">
							<option value="1">校方
							<option value="2" selected>所有人
					</c:when>
				</c:choose>
				</select>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">詳細內容:</label>
					<textarea class="form-control" name="article">${post.article}</textarea>
				</div>
				<c:choose>
					<c:when test="${post.isDelete == 1}">
					<li class="list-group-item"><div align="left"
							style="float: left;">上架活動:</div><a href="${contextRoot}/post/already/${id}"><i class='bx bxs-hand-up' style="font-size: 25px"></i></a></li>
					<li class="list-group-item">
					</c:when>
					<c:when test="${post.isDelete == 0}">
					<li class="list-group-item"><div align="left"
							style="float: left;">下架活動:</div><a href="${contextRoot}/post/removed/${id}"><i class='bx bxs-hand-down' style="font-size: 25px"></i></a></li>
					<li class="list-group-item">
					</c:when>
					</c:choose>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script>
		CKEDITOR.replace('article');
		CKEDITOR.config.width = 800;
		CKEDITOR.config.height = 300;
	</script>

</body>
</html>