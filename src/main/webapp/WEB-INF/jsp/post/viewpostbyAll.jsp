<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<!-- 舊NAVBAR -->
<%-- <jsp:include page="../layout/navbar.jsp"></jsp:include> --%>
<!-- 依group_id呈現navBar -->
<div class="navGroups">
	<c:choose>
		<c:when test="${users.groups.id == 3}">
			<!-- TEACHER NAVBAR -->
			<jsp:include page="../layout/nav_teacher.jsp" />
		</c:when>
		<c:when test="${users.groups.id == 4}">
			<!-- STUDENT NAVBAR -->
			<jsp:include page="../layout/nav_student.jsp" />	
		</c:when>
		<c:when test="${users.groups.id == 5}">
			<!-- PARENT NAVBAR -->
			<jsp:include page="../layout/nav_parent.jsp" />	
		</c:when>
	</c:choose>
</div>

<br><br>
<div class="wrapper">
	<div class="container" align="">
	<h3><i style="font-size:36px;" class="bx bxs-calendar-event"></i>&nbsp;公告</h3>
		<br>
		<br>
		<span class="hidGroupsId" hidden>${users.groups.id}</span>
		<div class="container">
			<table id="pList" class="table table-bordered" style="text-align:center">
	  			<thead id="pList-title">
	    			<tr>
	    				<th class="table-info" scope="col">功能</th>
					    <th class="table-info" scope="col">編號</th>
					    <th class="table-info" scope="col">標題</th>
					    <th class="table-info" scope="col">最後更新時間</th>
				    </tr>
				</thead>
				<tbody>
				<c:forEach var="post" items="${list}">
					<tr>
						<td>
							<a href="${contextRoot}/post/detail/${post.id}" type="button" class="btn btn-outline-success btn-sm">
								<i class="bx bx bxs-show"></i>&nbsp;查看
							</a>
						</td>
						<td>${post.id}</td>
					    <td>${post.topic}</td>
					    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.update_at}" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>	

<script>
// console.log($(".hidGroupsId").text());

</script>
</body>
</html>