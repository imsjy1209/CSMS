<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div align="center">
			<h1>活動頁面</h1>
			<br> 搜尋活動 : <input type="text" id="name">
			<button id="btn01">查詢</button>
			<button id="btn02">清除查詢</button>
			<br>
			<br>
			<div id="dataArea">
			<table border="1">
				<tr style="background-color: #B5FFFF">
					<th>家長名稱
					<th>標題
					<th>類型
					<th>查看詳情
					<th>是否已讀 <c:forEach var="message" items="${list}">
							<tr>
								<td>${message.parent.name}
								<td>${message.titleOfMsg}
								<td>${message.typeOfMsg}
								<td align="center"><a
									href="${contextRoot}/message/viewmessage?id=${message.id}"><i
										class='bx bxs-edit-alt' style="font-size: 30px; color: gray"></i></a>
									<c:choose>
										<c:when test="${message.readOrNot == 0}">
											<td align="center">X
										</c:when>
										<c:when test="${message.readOrNot ==1}">
											<td align="center">O
										</c:when>
									</c:choose>
						</c:forEach>
			</table>
			</div>
		</div>
	</div>
</body>
</html>