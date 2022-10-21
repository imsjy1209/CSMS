<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members</title>
</head>
<body>
	<h3>Form</h3>
	<form:form action="../update" method="get" modelAttribute="activity">
		<table>
			<tr>
				<td><form:label path="id">id</form:label></td>
				<td><form:input path="id"/></td>
			</tr>
			<tr>
				<td><form:label path="place">Place</form:label></td>
				<td><form:input path="place" /></td>
			</tr>
			<tr>
				<td><form:label path="name">name</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td colspan="2"><form:button value="send">Send</form:button></td>
			</tr>
		</table>


	</form:form>
</body>
</html>