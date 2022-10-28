<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			<br>
			<h2>建立公告</h2>
			<br>
			<form action="add" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">公告標題:</label> <input type="text"
						class="form-control" name="topic" style="width: 20%">
				</div>
				<p>
					國一班導<select id="school"></select>
				</p>
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
	<script type="text/javascript">
		window.onload = function() {
			var selectElement = document.getElementById('school'); // 取出select標籤
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/message/getteacher' />", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				var name = JSON.parse(xhr.responseText);
				if (xhr.readyState == 4 && xhr.status == 200) {
					for (var i = 0; i < name.length; i++) {
						console.log(name[i]);
						var option = new Option(name[i], name[i]);
						selectElement.options[selectElement.options.length] = option;
					}
				}
			}
		}
	</script>
</body>
</html>