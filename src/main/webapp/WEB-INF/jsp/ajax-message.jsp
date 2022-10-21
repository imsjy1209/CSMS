<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src='fullcalendar/locales-all.js'></script>
<script src='fullcalendar/moment.js'></script>
<style>
.box {
	width: 650px;
	height: 650px border:1px solid gray;
	box-shadow: 5px 10px 7px gray;
	padding: 20px;
}

.fc .fc-toolbar-title {
	color: brown;
	font-size: 1.75em;
}
</style>
<title>Ajax Page</title>
</head>
<body>
	<jsp:include page="layout/navbar.jsp" />
	
	<div class="container" align="center">
	<i class='bx bx-chevrons-down'></i>
		<div id="calendar" class="box"></div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			//$('#submitBtn').click(function() {
			//var inputText = document.getElementById('myMessage').value;
			//var dtoObject = {"text":inputText};  // js 物件
			//var dtoJsonString = JSON.stringify(dtoObject);  // 將 js 物件轉換為 JSON 字串
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				locale : 'zh-tw',
				navLinks : true,
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				events : function(fetchInfo, successCallback, failureCallback) {
					$.ajax({
						url : 'http://localhost:8081/my-app/getAllajax',
						contentType : 'application/json ; charset=UTF-8', // 送過去的格式(預設)
						dataType : 'json', // 傳回來的格式
						method : 'get',
						success : function(result) {
							var events = [];
							for (var i = 0; i < result.length; i++)
								events.push({
									title : result[i].name,
									start : result[i].date
								})
							console.log(events);
							successCallback(events);
						},
						error : function(err) {
							console.log(err)
						}
					})
				}

			});
			calendar.render();

		})
	</script>






</body>
</html>