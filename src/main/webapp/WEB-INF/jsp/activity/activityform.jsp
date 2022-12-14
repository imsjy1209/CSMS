<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<!-- BOX ICONS -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
		integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			appendText : "(西元年-月-日)",
			altField : "#datepicker",
			altFormat : "yy-mm-dd",
			dateFormat : "yy-mm-dd"
		});
	});
</script>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<div class="container">
		<div align="center">
		<br><h2>建立活動</h2><br>
			<form action="addActivityByCkeditor" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">活動名稱：</label> <input type="text"
						class="form-control" name="name" style="width:20%">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">地點：</label> <input type="text"
						class="form-control" name="place" style="width:20%">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">日期：</label> <input type="text"
						class="form-control" name="date" id="datepicker" style="width:20%">
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">詳細內容：</label>
					<textarea class="form-control" name="content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script>
		CKEDITOR.replace('content');
		CKEDITOR.config.width = 800;
		CKEDITOR.config.height = 300;
	</script>

</body>
</html>