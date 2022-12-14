<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

<title>Document</title>
</head>
<body>
	<div style="width: 240px; height: 240px">
		<canvas id="layanan"></canvas>
	</div>
	<div style="width: 240px; height: 240px">
		<canvas id="layanan_subbagian"></canvas>
	</div>
	<script type="text/javascript">
		$(function() {
			var ctx = document.getElementById("layanan").getContext('2d');
			var data = {
				datasets : [ {
					data : [ 10, 20, 30 ],
					backgroundColor : [ '#3c8dbc', '#f56954', '#f39c12', ],
				} ],
				labels : [ 'Request', 'Layanan', 'Problem' ]
			};
			var myDoughnutChart = new Chart(ctx, {
				type : 'doughnut',
				data : data,
				options : {
					maintainAspectRatio : false,
					legend : {
						position : 'bottom',
						labels : {
							boxWidth : 12
						}
					}
				}
			});

			var ctx_2 = document.getElementById("layanan_subbagian")
					.getContext('2d');
			var data_2 = {
				datasets : [ {
					data : [ 10, 20, 30 ],
					backgroundColor : [ '#3c8dbc', '#f56954', '#f39c12', ],
				} ],
				labels : [ 'Request', 'Layanan', 'Problem' ]
			};
			var myDoughnutChart_2 = new Chart(ctx_2, {
				type : 'doughnut',
				data : data_2,
				options : {
					maintainAspectRatio : false,
					legend : {
						position : 'bottom',
						labels : {
							boxWidth : 12
						}
					}
				}
			});
		});
	</script>
</body>
</html>