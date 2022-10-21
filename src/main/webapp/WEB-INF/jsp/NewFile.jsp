<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src='fullcalendar/locales-all.js'></script>
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
</head>
<body>
	<jsp:include page="layout/navbar.jsp"></jsp:include>




	<div class="container" align="center">
		<div id="calendar" class="box"></div>
	</div>
	<script type="text/javascript">
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
			events:[
				{
					start:'2022-10-10',
					title:'爬山'
				}
			]
			
		});
		calendar.render();
	</script>
</body>
</html>