<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let dataArea = null;
	window.onload = function() {
		let btn = document.getElementById("btn");
		dataArea = document.getElementById("dataArea");
		btn.onclick = function() {
			let xhr = new XMLHttpRequest();
			xhr.open('GET', "<c:url value='/expense/1' />", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					dataArea.innerHTML = displayAjaxData(xhr.responseText);
					console.log(xhr.responseText);
				}
			}
		}
	}

	function displayAjaxData(responseText) {
		var expense = JSON.parse(data);
		var htmlSeg = "<table border='1' <tr><th>活動名</th><th>活動地點</th><th>活動時間</th><th>參加人</th></tr>"
		if (expense.length > 0) {
			for (var x = 0; x < expense.length; x++) {
				var obj = expense[x];
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.name + "</td>";
				htmlSeg += "<td>" + obj.place + "</td>";
				htmlSeg += "<td>" + obj.date + "</td>";
				htmlSeg += "<td>" + obj.studnets + "</td>";
				htmlSeg += "</tr>";
			}
		} else {
			htmlSeg += "<tr><td colspan='4' align='center' >查無資料</td></tr>";
		}
		htmlSeg += "</table>";
		return htmlSeg;
	}
</script>
</head>
<body>
	<jsp:include page="layout/navbar.jsp"></jsp:include>

	<div align='center'>
		<h2>Ajax 練習01</h2>
		<h3>送回單一字串</h3>
		<hr>
		<p>
			<button id='btn'>Click Me</button>
		<hr>
		<div id='dataArea'></div>

	</div>


</body>
</html>