<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<!-- BOX ICONS -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
		integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<!-- NAVBAR -->
	<%-- <jsp:include page="../layout/navbar.jsp"></jsp:include> --%>
	<jsp:include page="../layout/nav_student.jsp"></jsp:include>
	<!-- CONTENT -->
	<br><br>
	<div class="wrapper">
		<div class="container" align="center">
			<h3><i class='bx bxs-universal-access'></i>&nbsp;活動總覽</h3>
			<br>
			<div class="input-group" style="width:80%">
  				<input type="text" id="name" class="form-control" placeholder="請輸入您欲查詢的活動名稱" 
  					   aria-label="Recipient's username with two button addons" aria-describedby="button-addon4">
  				<div class="input-group-append" id="button-addon4">
    				<button id="btn01" class="btn btn-outline-info" type="button">查詢</button>
   					<button id="btn02" class="btn btn-outline-secondary" type="button">清除查詢</button>
  				</div>
			</div>
		</div>
		<br><br>	
		<div class="container" style="display:flex;justify-content:center;flex-wrap: wrap;">
			<div id="dataArea" style="flex-direction:column;width:87%">
				<c:forEach var="activity" items="${list}">
					<div class="card" style="width: 18rem; float: left; padding: 15px 20px; margin: 5px 10px 15px 20px">
						<img src="${contextRoot}/downloadImage/${activity.id}"
							class="card-img-top"
							style="object-fit: cover; width: 246px; height: 163px" alt="...">

						<ul class="list-group list-group-flush">
							<li class="list-group-item">${activity.name}</li>
							<li class="list-group-item">${activity.place}</li>
							<li class="list-group-item">${activity.date}</li>
						</ul>

						<div class="card-body">
							<a href="${contextRoot}/getact?id=${activity.id}" class="card-link">查看詳情</a>
							<a class="card-link clickMe" data-id="${activity.id}">我要報名</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
<br>
<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>	
<!-- CDN -->
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
		
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js"
        integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" crossorigin="anonymous"></script>
        
	<!-- SCRIPT -->
	<script type="text/javascript">
	btn01.onclick = function() {
		let xhr = new XMLHttpRequest();
		var name = document.getElementById("name").value;
		var queryString = "name=" + name
		xhr.open('GET', "<c:url value='/activity/search' />"+ "?"
				+ queryString, true);
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
		var name = document.getElementById("name").value="";
		
		var queryString = "name=" + name
		xhr.open('GET', "<c:url value='/activity/search' />"+ "?"
				+ queryString, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = displayData01(xhr.responseText);
			}
		}
	}
	function displayData01(data){
		document.querySelector("#dataArea").innerHTML = '&nbsp;';
		var htmlSeg = "";
		var activities = JSON.parse(data);
			for (var x = 0; x < activities.length; x++){
				var activity = activities[x];
				htmlSeg +="<div class='card' style='width: 18rem; float: left; padding: 15px 20px; margin: 5px 10px 15px 20px'>"
				htmlSeg +="<img src='${contextRoot}/downloadImage/"+activity.id+"' class='card-img-top' style='object-fit: cover; width: 246px; height: 163px' alt='...'>"
	
				htmlSeg +="<ul class='list-group list-group-flush'>"
				htmlSeg +="<li class='list-group-item'>"+activity.name+"</li>"
				htmlSeg +="<li class='list-group-item'>"+activity.place+"</li>"
				htmlSeg +="<li class='list-group-item'>"+activity.date+"</li>"
				htmlSeg +="</ul>"
	
				htmlSeg +="<div class='card-body'>"
				htmlSeg +="<a href='${contextRoot}/getact?id=+"+activity.id+"' class='card-link'>查看詳情</a> <a href='${contextRoot}/join/"+activity.id+"' class='card-link'>我要報名</a>"
				htmlSeg	+="</div> </div>"
		}
		return htmlSeg;
	}


	$(document).on("click",".clickMe",function(){
		var joinActId = $(this).data("id");
		// console.log(joinActId);
		plusOne(joinActId);
	});

	function plusOne(joinActId) {
		Swal.fire({
			title:'報名成功',
			icon:'success',
			showConfirmButton: false,
			showCancelButton: false
		})
					
		setTimeout(function() {
		 	window.location.href = "/CSMS/join/"+joinActId;
		 }, 1500);			
	}	
	
	
	</script>
</body>
</html>