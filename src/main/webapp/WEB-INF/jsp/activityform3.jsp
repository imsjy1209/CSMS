<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Members</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
		      appendText : "(西元年-月-日)",
		      altField : "#datepicker",
		      altFormat : "yy/mm/dd",
		      dateFormat : "yy/mm/dd"
		    });
	});
</script>
</head>
<body>
	<jsp:include page="layout/navbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<h3>Form</h3>
	<form:form action="addActivity" method="post" modelAttribute="activity">
		<table>
			<tr>
				<td><form:label path="name">活動名稱:</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="place">地點:</form:label></td>
				<td><form:input path="place" /></td>
			</tr>

			<tr>
				<td><form:label path="date">日期:</form:label></td>
				<td><form:input path="date" type="text" id="datepicker" /></td>
			</tr>
			<tr>
				<td><form:label path="content">詳細內容:</form:label></td>
				<td><form:textarea path="content" name="editor1" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:button value="send">Send</form:button></td>
			</tr>
		</table>
	</form:form>
	<script>
		CKEDITOR.replace('editor1');
		CKEDITOR.config.width = 800;
		CKEDITOR.config.height =300;
	</script>
</body>
</html>