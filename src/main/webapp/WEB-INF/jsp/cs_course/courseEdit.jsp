<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>CourseData Create</title>
</head>
<body>

	<form action="${pageContext.request.contextPath}/updateCourseData2.controller" method="POST"
		class="row g-3 form1" enctype="multipart/form-data">
		<h3>CourseData Create</h3>
		<input type=hidden name="id" value="${courseForUpdate.id}"/>
		<div class="col-md-4">
			<label for="courseYear" class="form-label">課程年度</label> <input
				type="text" name="courseYear" class="form-control" id="courseYear"
				value="${courseForUpdate.courseYear}">
		</div>

		<div class="col-md-4">
			<label for="courseSemester" class="form-label">課程學期</label>
            <input
				type="text" name="courseSemester" class="form-control" id="courseSemester"
				value="${courseForUpdate.courseSemester}">
            <!-- <select name="courseSemester" id="">
                <option value="上">上</option>
                <option value="下">下</option>
            </select> -->
           
		</div>
		
		<div class="col-md-4">
			<label for="courseCategory" class="form-label">課程類別</label>
            <input
            type="text" name="courseCategory" class="form-control" id="courseCategory"
            value="${courseForUpdate.courseCategory}">
            <!-- <select name="courseCategory" id="">
                <option value="日常">日常</option>
                <option value="衝刺">衝刺</option>
            </select> -->
		</div>
		
        <div class="col-md-4">
			<label for="courseSubject" class="form-label">課程科目</label> <input
				type="text" name="courseSubject" class="form-control" id="courseSubject"
				 value="${courseForUpdate.courseSubject}">
		</div>
		
        <div class="col-md-4">
			<label for="courseGrade" class="form-label">適合學級</label> <input
				type="text" name="courseGrade" class="form-control" id="courseGrade"
				 value="${courseForUpdate.courseGrade}">
		</div>
		
        <div class="col-md-4">
			<label for="courseClass" class="form-label">適合年級</label> <input
				type="text" name="courseClass" class="form-control" id="courseClass"
				 value="${courseForUpdate.courseClass}">
		</div>
		
        <div class="col-md-4">
			<label for="coursePrice" class="form-label">課程售價</label> <input
				type="text" name="coursePrice" class="form-control" id="coursePrice"
				 value="${courseForUpdate.coursePrice}">
		</div>
		
        <div class="col-md-8">
			<label for="courseTeachTime" class="form-label">授課星期</label> <input
				type="text" name="courseTeachTime" class="form-control" id="courseTeachTime"
				 value="${courseForUpdate.courseTeachTime}">
		</div>
		
		<div class="col-md-2">
			<label for="courseMember" class="form-label">上限人數</label> <input
				type="text" name="courseMember" class="form-control" id="courseMember"
				 value="${courseForUpdate.courseMember}">
		</div>
		
        <div class="col-md-5">
			<label for="startDate" class="form-label">開課日期</label> <input
				type="text" name="startDate" class="form-control" id="startDate"
				value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${courseForUpdate.startDate}"/>">
		</div>
		
        <div class="col-md-5">
			<label for="endDate" class="form-label">結課日期</label> <input
				type="text" name="endDate" class="form-control" id="endDate"
				value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${courseForUpdate.endDate}"/>">
		</div>
		
        <div class="col-md-4">
			<label for="courseOnOff" class="form-label">上架(0/1)</label>
            <input
				type="text" name="courseOnOff" class="form-control" id="courseOnOff"
				 value="${courseForUpdate.courseOnOff}">
            <!-- <select name="courseCategory" id="">
                <option value="1">上架</option>
                <option value="0">下架</option>
            </select> -->
		</div>



		<div class="input-group mb-13">
			<label class="input-group-text" for="imgInp">Upload</label> <input
				type="file" name="coursePic" class="form-control" id="imgInp"
				accept="image/gif, image/jpeg, image/png">
		</div>
		<div class="col-md-6">
			Picture Preview <img width="200px" id="preview_imgInp" src="data:image/jpeg;base64,${courseForUpdate.coursePic}" />
		</div>

		<div class="col-12">
			<button type="submit" class="btn btn-primary">Update</button>
			<a type="button" class="btn btn-dark" href="${contextRoot}/courseAllPageBackAjax.page">Back To All Course Data</a>
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
