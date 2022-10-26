<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src='fullcalendar/locales-all.js'></script>
<script src='fullcalendar/moment.js'></script>
<title>Insert title here</title>
<!--box icons-->

<style type="text/css">
table {
	border-collapse: collapse;
	width: 770px;
	/*自動斷行*/
	word-wrap: break-word;
	table-layout: fixed;
}

.box {
	width: 650px;
	height: 650px ;
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
}
</style>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div align="center">
		<div class="container" align="center">

			<button id='btn01'>校方</button>
			<button id='btn02'>講師</button>
			<button id='btn03'>學生</button>
			<button id='btn04'>家長</button>
			
			<br> <br>
			<div style="clear: both;" id='dataArea'>&nbsp;</div>
		</div>
	</div>
	<script>
	btn01.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllSchoolAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = displayData01(xhr.responseText);
			}
		}
	}
	btn02.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllTeacherAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = displayData02(xhr.responseText);
			}
		}
	}
	btn03.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllStudentAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = displayData03(xhr.responseText);
			}
		}
	}
	btn04.onclick = function() {
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/findAllParentAjax.controller' />" , true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = displayData04(xhr.responseText);
			}
		}
	}
	function displayData01(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table border='1' <tr><th>名字</th><th>職位</th><th>聘用日期</th><th>在職情況</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.title + "</td>";
				htmlSeg += "<td>" + obj.hiredate + "</td>";
				htmlSeg += "<td>" + obj.status + "</td>";
				htmlSeg += "</tr>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}
	function displayData02(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table border='1' <tr><th>名字</th><th>職位</th><th>專長</th><th>聘用日期</th><th>在職情況</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.title + "</td>";
				htmlSeg += "<td>" + obj.expertise + "</td>";
				htmlSeg += "<td>" + obj.hiredate + "</td>";
				htmlSeg += "<td>" + obj.status + "</td>";
				htmlSeg += "</tr>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}
	function displayData03(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table border='1' <tr><th>名字</th><th>性別</th><th>教育階段</th><th>就讀學校</th><th>年級</th><th>父母</th><th>關係</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.gender + "</td>";
				htmlSeg += "<td>" + obj.schoolType + "</td>";
				htmlSeg += "<td>" + obj.schoolName + "</td>";
				htmlSeg += "<td>" + obj.grade + "</td>";
				htmlSeg += "<td>" + obj.parent.name + "</td>";
				htmlSeg += "<td>" + obj.relationship + "</td>";
				htmlSeg += "</tr>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}
	function displayData04(data) {
		var parents = JSON.parse(data);
		var htmlSeg = "<table border='1' <tr><th>名字</th><th>性別</th><th>電話</th><th>信箱</th></tr>"
		if (parents.length > 0) {
			for (var x = 0; x < parents.length; x++) {
				var obj = parents[x];
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.gender + "</td>";
				htmlSeg += "<td>" + obj.tel + "</td>";
				htmlSeg += "<td>" + obj.email + "</td>";
				htmlSeg += "</tr>";
			}
		} else {
			htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}
	</script>
</body>
</html>