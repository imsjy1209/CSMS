<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Welcome</title>
<style>
.topbtn {
	text-align: center;
	width:500px;
margin: auto;
}
.container{
	width:1500px;

	margin: auto;
}
</style>
</head>
<body>
	<div class="topbtn">
		<a href="${contextRoot}/roomCreate.page" type="button" class="btn btn-primary ">Go To CreateFormPage</a>
		<a type="button" class="btn btn-warning" href="${contextRoot}/homepage.controller">Go To HomePage</a>
	</div>
	<div class="container">
		<h3>All ClassRecord Data</h3>
		<table class="table table-striped mt-5 ">
			<thead>
				<tr>
					<td>多選</td>
					<td>id</td>
					<td>課程代碼</td>
					<td>導師名稱</td>
					<td>開始時間</td>
					<td>結束時間</td>
					<td>Function</td>
					<td>Function</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${classRecordList}" var="item">
					<tr>
						<td><input type="checkbox"/></td>
						<td>${item.id}</td>
						<td>${item.classList.classCode}</td>
						<td>${item.teacher.name}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.startTime}"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.endTime}"/></td>
						<td class=" test1">
						<a type="button" href="${contextRoot}/roomData/edit?id=${item.id}"
						   class="btn btn-warning">Edit</a></td>
						<td class=" test2">
						<a onclick="return confirm('確定刪除嗎?')" type="button" href="${contextRoot}/roomData/delete?id=${item.id}"
						   class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

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


</body>
<script>
	$(".test1")
			.on(
					"click",
					function() {
						let roomSize = $(this).prev().prev().children("input")
								.val()
						let roomName = $(this).prev().prev().prev().children(
								"input").val()
						let id = $(this).prev().prev().prev().prev().text();
						console.log(id);
						console.log(roomName);
						console.log(roomSize);

						//document.location.href = "${contextRoot}/updateRoomData.controller/"
								//+ id + "/" + roomName + "/" + roomSize;

					});

	//=======================刪除資料=======================
		
		  $('input[type="checkbox"]').click(function () {
            console.log('checkbox', $(this));
            // $(this).closest('tr').css('background', 'lightblue')

            // $('input:checked').closest('tr').css('background', 'lightblue');

            // $('input:not(:checked)').closest('tr').css('background', 'none');

            let bgColor = 'none';
            if ($(this).prop('checked')) {
                bgColor = 'lightblue';
            }

            $(this).closest('tr').css('background', bgColor)

        })
	
</script>
</html>