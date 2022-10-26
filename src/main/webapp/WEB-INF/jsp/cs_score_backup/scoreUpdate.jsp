<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

<style>
.form1 {
	width: 500px;
	margin: auto;
}
</style>

<title>score Edit</title>
</head>
<body>

	<form action="${contextRoot}/scoreDataUpdateAAA" method="POST"
		class="row g-3 form1" enctype="multipart/form-data">
		<h3>scoreData Edit</h3>
		<input type="hidden" name="scoreId" class="form-control" id="scoreId"
				value="${score1.id}">
		<div class="col-12">
			<label for="inputScore" class="form-label">請輸入成績</label>
			<input type="text" name="score" class="form-control" id="inputScore"
				value="${score1.score}">
		</div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary" >Update</button>
			<a type="button" class="btn btn-dark" href="${contextRoot}/scoreaList.controller">Go To All score Data</a>
			${msg.ok}
		</div>
	</form>


<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script>	
	$("#imgInp").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview_imgInp").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</body>
</html>