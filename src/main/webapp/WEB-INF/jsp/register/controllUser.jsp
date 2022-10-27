<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='fullcalendar/main.css' rel='stylesheet' />

<title>Insert title here</title> -->
<!--box icons-->

<!-- <style type="text/css">
table {
	border-collapse: collapse;
	width: 770px;
	自動斷行
	word-wrap: break-word;
	table-layout: fixed;
}

.box {
	width: 650px;
	height: 650px;
	 border:1px solid gray;
	box-shadow: 5px 10px 7px gray;
	padding: 20px;
}

.hidden {
	display: none
}

.fc .fc-toolbar-title {
	color: brown;
	font-size: 1.75em;
} -->
<!-- </style>
</head>
<body> -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>
	<!-- <jsp:include page="../layout/navbar.jsp"></jsp:include> -->
	
	<div align="center">
		<div class="container" align="center">
				<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
				  <a class="nav-item nav-link active navSch" id="navSchool" data-toggle="tab" href="#nav-school" role="tab" aria-controls="nav-school" aria-selected="true">校方</a>
				  <a class="nav-item nav-link navTea" id="navTeacher" data-toggle="tab" href="#nav-teacher" role="tab" aria-controls="nav-teacher" aria-selected="false">教師</a>
				  <a class="nav-item nav-link navStu" id="navStudent" data-toggle="tab" href="#nav-student" role="tab" aria-controls="nav-student" aria-selected="false">學生</a>
				  <a class="nav-item nav-link navPar" id="navParents" data-toggle="tab" href="#nav-parents" role="tab" aria-controls="nav-parents" aria-selected="false">家長</a>
				</div>

			<div class="tab-content" >
				<div class="tab-pane fade show active" id="dataArea" role="tabpanel" aria-labelledby="nav-school-tab">
					  
				</div>
			</div>
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
	<script>

	navSchool.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllSchoolAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				// console.log(xhr.responseText);
				dataArea.innerHTML = displayData01(xhr.responseText);
			}
		}
	}
	navTeacher.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllTeacherAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				// console.log(xhr.responseText);
				dataArea.innerHTML = displayData02(xhr.responseText);
			}
		}
	}
	navStudent.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllStudentAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				// console.log(xhr.responseText);
				dataArea.innerHTML = displayData03(xhr.responseText);
			}
		}
	}

	navParents.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllParentAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				// console.log(xhr.responseText);
				dataArea.innerHTML = displayData04(xhr.responseText);
			}
		}
	}
	function displayData01(data) {
		var school = JSON.parse(data);
		var htmlSeg = "<table class='table table-hover'><thead> <tr><th scope='col'>名字</th><th scope='col'>職位</th><th scope='col'>聘用日期</th><th scope='col'>在職情況</th><th scope='col'>登入權限</th></tr></thead>"
		if (school.length > 0) {
			for (var x = 0; x < school.length; x++) {
				var obj = school[x];
				let userID=obj.users.id
				let permissionValue=obj.users.accRight
				let permissionText;
				if (permissionValue==0){
						permissionText="Disable";
					}else{
						permissionText="Enable";
					}
					
				htmlSeg += "<tbody id='sLbody'>"
				htmlSeg += "<tr>"
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.title + "</td>";
				htmlSeg += "<td>" + obj.hiredate + "</td>";
				htmlSeg += "<td>" + obj.status + "</td>";
				htmlSeg +="<td class='userID' hidden>"+userID+"</td>";
				htmlSeg += "<td> <select class='prop' id='prop' name='prop'> <option value='"+permissionValue+"' selected='selected' hidden>"+permissionText +"</option>"
				htmlSeg += "<option value='0' >Disable</option> <option value='1' >Enable</option> </td>"
				htmlSeg += "</tr></tbody>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}

	function displayData02(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table class='table table-hover' <tr><th>名字</th><th>職位</th><th>專長</th><th>聘用日期</th><th>在職情況</th><th>登入權限</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				let userID=obj.users.id
				let permissionValue=obj.users.accRight
				let permissionText;
				if (permissionValue==0){
						permissionText="Disable";
					}else{
						permissionText="Enable";
					}
				htmlSeg += "<tbody id='sLbody'>"
				htmlSeg += "<tr>"
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.title + "</td>";
				htmlSeg += "<td>" + obj.expertise + "</td>";
				htmlSeg += "<td>" + obj.hiredate + "</td>";
				htmlSeg += "<td>" + obj.status + "</td>";
				htmlSeg +="<td class='userID' hidden>"+userID+"</td>";
				htmlSeg += "<td> <select class='prop' id='prop' name='prop'> <option value='"+permissionValue+"' selected='selected' hidden>"+permissionText +"</option>"
				htmlSeg += "<option value='0' >Disable</option> <option value='1' >Enable</option> </td>"
				htmlSeg += "</tr></tbody>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}

	function displayData03(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table class='table table-hover'> <tr><th>名字</th><th>性別</th><th>教育階段</th><th>就讀學校</th><th>年級</th><th>父母</th><th>關係</th><th>登入權限</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				let userID=obj.users.id
				let permissionValue=obj.users.accRight
				let permissionText;
				if (permissionValue==0){
						permissionText="Disable";
					}else{
						permissionText="Enable";
					}
				htmlSeg += "<tbody id='sLbody'>"
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.gender + "</td>";
				htmlSeg += "<td>" + obj.schoolType + "</td>";
				htmlSeg += "<td>" + obj.schoolName + "</td>";
				htmlSeg += "<td>" + obj.grade + "</td>";
				htmlSeg += "<td>" + obj.parent.name + "</td>";
				htmlSeg += "<td>" + obj.relationship + "</td>";
				htmlSeg +="<td class='userID' hidden>"+userID+"</td>";
				htmlSeg += "<td> <select class='prop' id='prop' name='prop'> <option value='"+permissionValue+"' selected='selected' hidden>"+permissionText +"</option>"
				htmlSeg += "<option value='0' >Disable</option> <option value='1' >Enable</option> </td>"
				htmlSeg += "</tr></tbody>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}

	function displayData04(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table class='table table-hover'><tr><th>名字</th><th>性別</th><th>電話</th><th>信箱</th><th>登入權限</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				let userID=obj.users.id
				let permissionValue=obj.users.accRight
				let permissionText;
				if (permissionValue==0){
						permissionText="Disable";
					}else{
						permissionText="Enable";
					}
				htmlSeg += "<tbody id='sLbody'>"
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.gender + "</td>";
				htmlSeg += "<td>" + obj.tel + "</td>";
				htmlSeg += "<td>" + obj.email + "</td>";
				htmlSeg +="<td class='userID' hidden>"+userID+"</td>";
				htmlSeg += "<td> <select class='prop' id='prop' name='prop'> <option value='"+permissionValue+"' selected='selected' hidden>"+permissionText +"</option>"
				htmlSeg += "<option value='0' >Disable</option> <option value='1' >Enable</option> </td>"
				htmlSeg += "</tr></tbody>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}
	$(document).on('change','.prop',function () {
      let userId=$(this).parent().siblings('.userID ').text();
      let permission=$(this).val();
      let xhr3 = new XMLHttpRequest();
      // get the information from select value
      xhr3.open("GET","<c:url value='/updateUsersPermisson'/>"+"?userId="+userId+"&permission="+permission,true); 
      xhr3.send();
	})
	//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
	
	</script>
</body>
</html>