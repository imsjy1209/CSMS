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
</body>
</html>