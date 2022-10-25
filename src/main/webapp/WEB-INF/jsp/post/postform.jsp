<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<div class="container">
		<div align="center">
		<br><h2>建立公告</h2><br>
			<form action="add" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">公告標題:</label> <input type="text"
						class="form-control" name="topic" style="width:20%">
				</div>
				<select name="userType">
				<option value="1">校方
				<option value="2">所有人
				</select>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">詳細內容:</label>
					<textarea class="form-control" name="article"></textarea>
				</div>
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