<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src='fullcalendar/locales-all.js'></script>
<script src='fullcalendar/moment.js'></script>
<title>Insert title here</title>
<!--box icons-->

<style type="text/css">
table {
	border-collapse: collapse;
	width: 770px;
	/*自動斷行*/
	word-wrap: break-word;
	table-layout: fixed;
}

.box {
	width: 650px;
	height: 650px border:1px solid gray;
	box-shadow: 5px 10px 7px gray;
	padding: 20px;
}

.hidden {
	display: none
}

.fc .fc-toolbar-title {
	color: brown;
	font-size: 1.75em;
}
</style>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div align="center">
		<h2>公告管理</h2>
		<br>
		<div class="container" align="center">
			<span id="button"><i class='bx bxs-calendar'
				onclick='myFunction1()' style="font-size: 30px"></i></span>
			<div id="a"></div>
			<br> <br>

			<table border="1">
				<tr style="background-color: #B5FFFF">
					<th>標題
					<th>最後更新時間
					<th>公告對象
					<th>是否上架
					<th>更新內容
					 <c:forEach var="post" items="${list}">
							<tr>
								<td>${post.topic}
								<td>${post.update_at}
								<c:choose>
										<c:when test="${post.userType == 1}">
											<td align="center">校方
										</c:when>
										<c:when test="${post.userType ==2}">
											<td align="center">所有人
										</c:when>
									</c:choose>
								<c:choose>
										<c:when test="${post.isDelete == 0}">
											<td align="center">是
										</c:when>
										<c:when test="${post.isDelete ==1}">
											<td align="center">否
										</c:when>
									</c:choose>
								<td align="center"><a
									href="${contextRoot}/post/updatepage/${post.id}"><i
										class='bx bxs-edit-alt' style="font-size: 30px; color: gray"></i></a>
						</c:forEach>
			</table>
			<br> <br>
		</div>
	</div>
</body>
</html>