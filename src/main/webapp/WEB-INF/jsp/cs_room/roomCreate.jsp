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

<title>RoomData Create</title>
</head>
<body>

	<form action="roomDataCreate.controller" method="POST"
		class="row g-3 form1" enctype="multipart/form-data">
		<h3>RoomData Create</h3>
		<div class="col-12">
			<label for="inputRoomName" class="form-label">RoomName</label> <input
				type="text" name="roomName" class="form-control" id="inputRoomName"
				placeholder="EX:A01">
		</div>

		<div class=" col-12">
			<label for="inputRoomSize" class="form-label">RoomSize</label> <input
				type="text" name="roomSize" class="form-control" id="inputRoomSize"
				placeholder="EX:20(人)">
		</div>



		<div class="input-group mb-13">
			<label class="input-group-text" for="imgInp">Upload</label>
			<input type="file" name="roomPic" class="form-control" id="imgInp" accept="image/gif, image/jpeg, image/png">
		</div>
		<div class="col-md-6">
			Picture Preview <img id="preview_imgInp" src="#" />
		</div>

		<div class="col-12">
			<button type="submit" class="btn btn-primary">Create</button>
			<a type="button" class="btn btn-dark" href="${contextRoot}/findAllRoom.controller">Go To All Room Data</a>
			<a type="button" class="btn btn-warning" href="${contextRoot}/homepage.controller">Go To HomePage</a>
			${msg.ok}
		</div>
	</form>


</body>
</html>

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
