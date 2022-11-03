<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- NAVBAR -->
<%-- <jsp:include page="../layout/navbar.jsp"></jsp:include> --%>
<jsp:include page="../layout/nav_student.jsp"></jsp:include>
<!-- CONTENT -->
<br><br>
<div class="wrapper">
	<div class="container" align="center">
		<h3><i class='bx bxs-universal-access'></i>&nbsp;我的活動內容</h3>
	</div>
	<div class="container">
		<div align="center" style="width: 50%; margin: 0 auto;">
			<span id="hidActId" hidden>${act.id}</span>
			<img src="${contextRoot}/downloadImage/${act.id}"
				class="img-fluid img"
				style="display: block; width: 100%; height: auto; position: relative; top: 50px"
				alt="...">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<div align="left" style="float: left;">活動名稱：</div>
					<br>
					${act.name}
				</li>
				<li class="list-group-item">
					<div align="left" style="float: left;">活動地點：</div>
					<br>
					${act.place}
				</li>
				<li class="list-group-item">
					<div align="left" style="float: left;">活動日期：</div>
					<br>
					${act.date}
				</li>
				<li class="list-group-item">
					<div align="left" style="float: left;">詳細內容：</div>
					<br>
					${act.content}
				</li>
				<li class="list-group-item">
					<a class="card-link" onclick="cancelConfirm()">取消報名</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<br>

<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>	

<!-- CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
		
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
		
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js"
        integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" crossorigin="anonymous"></script>
        
<!-- SCRIPT -->
<script type="text/javascript">
var actId = $("#hidActId").text();

function cancelConfirm() {
	Swal.fire({
		title: '確定要取消報名嗎？',
		text: '本次取消後，如欲重新報名，請於期限內至活動總覽報名',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '確認',
		cancelButtonText: '取消'
	}).then((result) => {
		if (result.isConfirmed) {
			Swal.fire({
				title:'取消成功',
				icon:'success',
				showConfirmButton: false,
				showCancelButton: false
			})
			
			setTimeout(function() {
				window.location.href = "/CSMS/quit/"+actId;
			}, 1500);		
	   }
	})
}	
</script>
</body>
</html>