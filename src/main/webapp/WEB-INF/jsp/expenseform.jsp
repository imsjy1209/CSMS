<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>財務表單</title>
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
	<h3>損益紀錄</h3>
	<form:form action="addExpense" method="post" modelAttribute="expense">
		<table>
			<tr>
				<td><form:label path="year">年份:</form:label></td>
				<td><form:select path="year" id="myYear" /></td>
			</tr>
			<tr>
				<td><form:label path="semester">學期:</form:label></td>
				<td><form:select path="semester">
					<form:option value="上學期">上學期</form:option>
					<form:option value="下學期">下學期</form:option>
					</form:select></td>
			</tr>

			<tr>
				<td><form:label path="income">總收入:</form:label></td>
				<td><form:input path="income" /></td>
			</tr>
			<tr>
				<td><form:label path="totalcost">總花費:</form:label></td>
				<td><form:input path="totalcost" /></td>
			</tr>
			<tr>
				<td><form:label path="markting">行銷費用:</form:label></td>
				<td><form:input path="markting" /></td>
			</tr>
			<tr>
				<td><form:label path="personnel">人事費用:</form:label></td>
				<td><form:input path="personnel" /></td>
			</tr>
			<tr>
				<td><form:label path="other">其他費用:</form:label></td>
				<td><form:input path="other" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:button value="send">Send</form:button></td>
			</tr>
		</table>


	</form:form>
	<script>
		var myDate = new Date();
		var startYear = myDate.getFullYear() - 5;//起始年份 
		var endYear = myDate.getFullYear() + 5;//结束年份 
		var obj = document.getElementById('myYear')
		for (var i = startYear; i <= endYear; i++) {
			obj.options.add(new Option(i, i));
		}
		obj.options[obj.options.length - 6].selected = 1;
	</script>
</body>
</html>