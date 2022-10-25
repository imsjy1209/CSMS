<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div align="center">
			<h1>活動頁面</h1>
			${users.groups}
			<br> 搜尋活動 : <input type="text" id="name">
			<button id="btn01">查詢</button>
			<button id="btn02">清除查詢</button>
			<br>
			<br>
			<div id="dataArea">
				<c:forEach var="activity" items="${list}">
					<div class="card"
						style="width: 18rem; float: left; padding: 15px 20px; margin: 5px 10px 15px 20px">
						<img src="${contextRoot}/downloadImage/${activity.id}"
							class="card-img-top"
							style="object-fit: cover; width: 246px; height: 163px" alt="...">

						<ul class="list-group list-group-flush">
							<li class="list-group-item">${activity.name}</li>
							<li class="list-group-item">${activity.place}</li>
							<li class="list-group-item">${activity.date}</li>
						</ul>

						<div class="card-body">
							<a href="${contextRoot}/getact?id=${activity.id}"
								class="card-link">查看詳情</a> <a
								href="${contextRoot}/join/${activity.id}" class="card-link">我要報名</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
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
	</script>
</body>
</html>