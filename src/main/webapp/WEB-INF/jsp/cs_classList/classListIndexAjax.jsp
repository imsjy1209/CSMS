<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>

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
<!-- 	<a id="showdata" href="#" type="button" class="btn btn-primary ">show data</a> -->
		<a href="${contextRoot}/roomCreate.page" type="button" class="btn btn-primary ">Go To CreateFormPage</a>
		<a type="button" class="btn btn-warning" href="${contextRoot}/homepage.controller">Go To HomePage</a>
	</div>
	<div class="container">
		<h3>All ClassList Data</h3>
		<table class="table table-striped mt-5 ">
			<thead id="thead-title">
				<tr>
					<td>多選</td>
					<td>id</td>
					<td>課程代碼</td>
					<td>班導</td>
					<td>行政</td>
					<td>教室</td>
					<td>分類</td>
					<td>課程</td>
					<td>人數</td>
					<td>起始</td>
					<td>結業</td>
					<td>Function</td>
					<td>Function</td>
				</tr>
			</thead>
			<tbody id="content-data">
			
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
		
<!--####################################################################### -->
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>


</body>
<script type="text/javascript">
window.onload = function() {
	console.log("gogogo")
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllClassListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "";

			var classListList = JSON.parse(xhr.responseText);
			for(var i=0; i < classListList.length; i++){
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
				"<td>" + classListList[i].id + "</td>" +
				"<td>" + classListList[i].classCode + "</td>" +
				"<td>" + classListList[i].teacher.name + "</td>" +
				"<td>" + classListList[i].school.name + "</td>" +
				"<td>" + classListList[i].room.roomName + "</td>" +
    	       	"<td>" + classListList[i].course.courseCategory + "</td>" +
    	       	"<td>" + classListList[i].course.courseSubject +
    	       			 classListList[i].course.courseGrade +
    	       			 classListList[i].course.courseClass + "年級</td>" +
    	       	"<td>" + classListList[i].course.courseMember + "</td>" +
    	       	"<td>" + classListList[i].course.startDate + "</td>" +
    	       	"<td>" + classListList[i].course.endDate + "</td>" +
    	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
				"<td class=' test2'><a onclick='return confirm('確定刪除嗎?')' type='button' class='btn btn-danger'>Delete</a></td>"+
		               		"</tr>";
			}
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
		
}


	 
//=======================暫時不用=======================
	$(".test1").on("click",function() {
	let roomSize = $(this).prev().prev().children("input").val()
	let roomName = $(this).prev().prev().prev().children("input").val()
	let id = $(this).prev().prev().prev().prev().text();
	console.log(id);
	console.log(roomName);
	console.log(roomSize);
	//document.location.href = "${contextRoot}/updateRoomData.controller/"
	//+ id + "/" + roomName + "/" + roomSize;
});


		

	
</script>
</html>