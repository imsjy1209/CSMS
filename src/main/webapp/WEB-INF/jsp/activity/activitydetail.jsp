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
		<div align="center" style="width: 50%; height: 200px; margin: 0 auto;">

			<img src="${pageContext.request.contextPath}/downloadImage/${act.id}"
				class="img-fluid img"
				style="display: block; width: 100%; height: auto; position: relative; top: 50px"
				alt="...">
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><div align="left"
						style="float: left;">活動名稱:</div><br>${act.name}</li>
				<li class="list-group-item"><div align="left"
						style="float: left;">活動地點:</div><br>${act.place}</li>
				<li class="list-group-item"><div align="left"
						style="float: left;">活動日期:</div><br>${act.date}</li>
				<li class="list-group-item"><div align="left"
						style="float: left;">詳細內容:</div><br>${act.content}</li>
				<li class="list-group-item">
				<a href="${contextRoot}/join/${activity.id}" class="card-link">我要報名</a></li>
			</ul>
		</div>
	</div>
</body>
</html>