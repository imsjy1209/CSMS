<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="layout/navbar.jsp"></jsp:include>
<form action="${pageContext.request.contextPath}/addActivityPhoto" method="post" enctype="multipart/form-data">
<p style="display: none">Id:<input type="text" name="id" value="${id}"></p>
圖片:<input type="file" name="file">
<br>
<input type="submit" value="送出">
</form>
</body>
</html>