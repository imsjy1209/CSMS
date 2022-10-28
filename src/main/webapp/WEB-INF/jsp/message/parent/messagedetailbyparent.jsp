<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../layout/navbar.jsp"></jsp:include>
	<div class="container">
	<br><h1 align="center">留言</h1><br>
		<div class="card">
			<div class="card-header">
				<h4>${message.titleOfMsg}<br></h4>
			</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<p>${message.whatToSay}</p>
					<footer class="blockquote-footer">${message.school.name}<cite
							title="Source Title"></cite>
					</footer>
				</blockquote>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/message/addMessageByParent" method="post">
		<div style="display:none">
		<input type="text" name="topic" value="${message.titleOfMsg}">
		<input type="text" name="type" value="家長回復">
		<input type="text" name="school" value="${message.school.name}">
		</div>
		<br><h4>回復 :</h4><br>
		<textarea class="form-control" name="article"></textarea>
		<input type="submit" value="回復">
		</form>
	</div>
</body>
<script>
		CKEDITOR.replace('article');
		CKEDITOR.config.width = 800;
		CKEDITOR.config.height = 300;
	</script>
</html>