<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

<!-- =================for chart.js======================= -->
<link href='fullcalendar/main.css' rel='stylesheet' />
<script src='fullcalendar/main.js'></script>
<script src='fullcalendar/locales-all.js'></script>
<script src='fullcalendar/moment.js'></script>
<!-- =================for char.js======================= -->
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
	height: 650px border:1px solid gray;
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

	
	<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bx-sun' ></i>活動管理</h3>
	
		<div class="container" align="center">
			<span id="button"><i class='bx bxs-calendar' onclick='myFunction1()' style="font-size: 30px">Show on Calendar</i></span>
			<div id="a"></div>

			<table class="table table-striped mt-5">
				<tr style="background-color: #B5FFFF">
					<th>名稱
					<th>地點
					<th>日期
					<th>更新內容
					<th>是否上架 <c:forEach var="activity" items="${list}">
							<tr>
								<td>${activity.name}
								<td>${activity.place}
								<td>${activity.date}
								<td><a
									href="${contextRoot}/updateActivityPage/${activity.id}"><i class='bx bxs-edit-alt' style="font-size: 30px; color: gray"></i></a>
									<c:choose>
										<c:when test="${activity.removed == 1}">
											<td>X
										</c:when>
										<c:when test="${activity.removed ==0}">
											<td >O
										</c:when>
									</c:choose>
						</c:forEach>
			</table>
		</div>
		</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>

function myFunction() {
	$('#calendar').attr('style','display:none;');
// 	document.getElementById('calendar').className = "hidden";
	document.querySelector("#button").innerHTML = "<i class='bx bxs-calendar' onclick='myFunction1()' style='font-size: 30px'>Show on Calendar</i>";
}
function myFunction1() {
	document.querySelector("#button").innerHTML = "<i class='bx bxs-calendar' onclick='myFunction()' style='font-size: 30px'>Close Calendar</i>";
	document.querySelector("#a").innerHTML = '<div id="calendar" class="box">';
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
				url : 'http://localhost:8081/CSMS/getAllajax',
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
}


//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });


</script>


</html>