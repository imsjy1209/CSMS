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
		<div align="center">
			<br>
			<h2>修改資料</h2>
			<br>
			<form action="../student/update" method="post">
			姓名:<input type="text" name="name" value="${student.name}"><br><br>
			性別:<input type="text" name="gender" value="${student.gender}"><br><br>
			就讀階段:<input type="text" name="schoolType" value="${student.schoolType}"><br><br>
			學校:<input type="text" name="schoolName" value="${student.schoolName}"><br><br>
			年級:<input type="text" name="grade" value="${student.grade}"><br><br>
			<input type="submit" value="更新">
			</form>
		</div>
	</div>
</body>
</html>