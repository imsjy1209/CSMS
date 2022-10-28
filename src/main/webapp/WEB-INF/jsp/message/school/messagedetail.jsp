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
					<footer class="blockquote-footer">${message.parent.name}<cite
							title="Source Title"></cite>
					</footer>
				</blockquote>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/message/addMessageBySchool" method="post">
		<div style="display:none">
		<input type="text" name="titleOfMsg" value="${message.titleOfMsg}(回復)">
		<input type="text" name="typeOfMsg" value="導師回復">
		<input type="text" name="parentid" value="${message.parent.id}">
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