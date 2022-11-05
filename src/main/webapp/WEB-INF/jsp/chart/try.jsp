<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"
	integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div align='center'>
			<h3>財務圖表</h3>
			<hr>
			<button id='btn01'>練習1: 全部資料</button>
			<button id='btn02'>查詢單學期損益</button>
			<select id="myYear">
			</select> <select id="semester">
				<option value="上學期">上學期</option>
				<option value="下學期">下學期</option>
			</select>
			<button id='btn02a'>練習2A: 回應為單一物件(請求參數)</button>
			<button id='btn03'>損益折現圖</button>
			<select id="first"></select> <select id="second"></select>
			<hr>
			<div align="center">
				<div id="chartReport3">
					<div style="float: left; margin: 0 0 0 200px" id="chartReport"
						style="width: 300px; height: 300px">
						<canvas id="myChart"></canvas>
					</div>
					<div style="float: left; margin: 0 0 0 100px" id="chartReport2"
						style="width: 300px; height: 300px">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
				<div style="clear: both;" id='dataArea'>&nbsp;</div>
			</div>
			<div id="full"></div>
			<hr>

			<!-- <a href="<c:url value='/'  />" ">回前頁</a> -->
		</div>
	</div>
	<script>
		window.onload = function() {
			var selectElement = document.getElementById('myYear'); // 取出select標籤
			var first = document.getElementById('first'); // 取出書籍資料的div標籤
			var second = document.getElementById('second'); // 取出書籍資料的div標籤
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/expense/getAllyear' />", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				var year = JSON.parse(xhr.responseText);
				if (xhr.readyState == 4 && xhr.status == 200) {
					for (var i = 0; i < year.length; i++) {
						var option = new Option(year[i], year[i]);
						var option1 = new Option(year[i], year[i]);
						var option2 = new Option(year[i], year[i]);
						selectElement.options[selectElement.options.length] = option;
						first.options[first.options.length] = option1;
						second.options[second.options.length] = option2;
					}
				}
			}

			btn01.onclick = function() {
				let xhr = new XMLHttpRequest();
				xhr.open('GET', "<c:url value='/expense/all' />", true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						dataArea.innerHTML = displayData01(xhr.responseText);
						console.log(xhr.responseText);
					}
					displayGraph(xhr.responseText);
				}
			}
			btn02.onclick = function() {
				let xhr = new XMLHttpRequest();
				var year = document.getElementById("myYear").value;
				var semester = document.getElementById("semester").value;
				var queryString = "year=" + year + "&semester=" + semester;
				console.log(queryString);
				xhr.open('GET', "<c:url value='/expense/selectdate' />" + "?"
						+ queryString, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
						dataArea.innerHTML = displayData02(xhr.responseText);
					}
					displayGraph(xhr.responseText);
					//displayGraph2(xhr.responseText);

				}
			}
			btn02a.onclick = function() {
				let xhr = new XMLHttpRequest();
				xhr.open('GET', "<c:url value='/getAllajax' />", true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
						dataArea.innerHTML = displayData03(xhr.responseText);
					}
				}
			}
			btn03.onclick = function() {
				let xhr = new XMLHttpRequest();
				var first = document.getElementById("first").value;
				var second = document.getElementById("second").value;
				var queryString = "first=" + first + "&second=" + second;
				console.log(queryString);
				xhr.open('GET', "<c:url value='/expense/getyear' />" + "?"
						+ queryString, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
					}
					displayGraph02(xhr.responseText);
				}
			}
		}

		function displayData01(data) {
			var expense = JSON.parse(data);
			var htmlSeg = "<table border='1' <tr><th>收入</th><th>總花費</th><th>行銷</th><th>人事</th><th>其它</th></tr>"
			if (expense.length > 0) {
				for (var x = 0; x < expense.length; x++) {
					var obj = expense[x];
					htmlSeg += "<tr>";
					htmlSeg += "<td>" + obj.income + "</td>";
					htmlSeg += "<td>" + obj.totalcost + "</td>";
					htmlSeg += "<td>" + obj.markting + "</td>";
					htmlSeg += "<td>" + obj.personnel + "</td>";
					htmlSeg += "<td>" + obj.other + "</td>";
					htmlSeg += "</tr>";
				}
			} else {
				htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
			}
			htmlSeg += "</table>";
			return htmlSeg;
		}
		function displayData02(data) {

			var htmlSeg = "<table border='1' <tr><th>收入</th><th>總花費</th><th>行銷</th><th>人事</th><th>其它</th></tr>"
			if (data.length > 0) {
				var obj = JSON.parse(data);
				htmlSeg += "<tr>";
				htmlSeg += "<td>" + obj.income + "</td>";
				htmlSeg += "<td>" + obj.totalcost + "</td>";
				htmlSeg += "<td>" + obj.markting + "</td>";
				htmlSeg += "<td>" + obj.personnel + "</td>";
				htmlSeg += "<td>" + obj.other + "</td>";
				htmlSeg += "</tr>";

			} else {
				htmlSeg += "<tr><td colspan='5' align='center' >查無資料</td></tr>";
			}
			htmlSeg += "</table>";
			return htmlSeg;
		}
		function displayData03(data) {
			var expense = JSON.parse(data);

			document.querySelector("#full").innerHTML = '<div id="calendar"></div>';
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
				events : [ {
					title : '爬山',
					start : '2022-10-21',
				} ]
			});
			calendar.render();
		}

		function displayGraph(data) {
			document.querySelector("#chartReport3").innerHTML = "<div style='float: left; margin: 0 0 0 200px' id='chartReport' style='width: 300px; height: 300px'></div><div style='float: left; margin: 0 0 0 100px' id='chartReport2'style='width: 300px; height: 300px'></div>"
			document.querySelector("#chartReport").innerHTML = '<canvas id="myChart"></canvas>';
			var expense = JSON.parse(data);
			var obj = expense;
			var ctx = document.getElementById("myChart").getContext('2d');
			var myChart = new Chart(ctx, {
				type : "bar",
				data : {
					labels : [ "收入", "總花費", "行銷", "人事", "其它" ],
					datasets : [ {
						label : '# of Votes',
						data : [ obj.income, obj.totalcost, obj.markting,
								obj.personnel, obj.other ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					//indexAxis:'y',
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
			document.querySelector("#chartReport2").innerHTML = '<canvas id="myChart2"></canvas>';
			var expense = JSON.parse(data);
			var obj = expense;
			var ctx = document.getElementById("myChart2").getContext('2d');
			var myChart = new Chart(ctx, {
				type : 'pie',
				data : {
					labels : [ "收入", "總花費", "行銷", "人事", "其它" ],
					datasets : [ {
						label : '# of Votes',
						data : [ obj.income, obj.totalcost, obj.markting,
								obj.personnel, obj.other ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255,99,132,1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
		}
		function displayGraph02(data) {
			document.querySelector("#chartReport3").innerHTML = '<canvas id="myChart"></canvas>';
			var expense = JSON.parse(data);
			var all_x_labels = [];
			var income = [];
			var totalcost = [];
			var markting = [];
			var personnel = [];
			for (let i = 0; i < expense.length; i++) {
				var str = expense[i].year
				all_x_labels[i] = str.concat(expense[i].semester);
				income[i] = expense[i].income;
				totalcost[i] = expense[i].totalcost;
				markting[i] = expense[i].markting;
				personnel[i] = expense[i].personnel;
			}
			var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
				type : 'line',
				data : {
					labels : all_x_labels,
					datasets : [ {
						label : '總費用',
						data : totalcost,
						fill : false,
						borderColor : 'rgb(161, 117, 6)',
					}, {
						label : '行銷費用',
						data : markting,
						fill : false,
						borderColor : 'rgba(255,99,132,1)',
					}, {
						label : '人事費用',
						data : personnel,
						fill : false,
						borderColor : 'rgb(75, 81, 192)',
					}, {
						label : '總收入',
						data : income,
						
						backgroundColor : 'rgb(69, 187, 214,0.5)',
						type:'bar'
					}]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
		}
		$("#myChart").click( 
			    function(evt){
			        var activePoints = myNewChart.getSegmentsAtEvent(evt);           
			        var url = "http://example.com/?label=" + activePoints[0].label + "&value=" + activePoints[0].value;
                    alert(url);
			    }
			);  
	</script>

</body>
</html>