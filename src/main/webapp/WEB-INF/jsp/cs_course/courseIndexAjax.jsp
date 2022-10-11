<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index</title>

<!--Link to Css-->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!--box icons-->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
	
</head>
<body>

	<header>
		<div class="nav container">
			<a href="#" class="logo">CramSchool</a> <i class='bx bx-shopping-bag'
				id="cart-icon"></i>
			<!--Cart-->
			<div class="cart">
				<h2 class="cart-title">Your Cart</h2>
				<!--Content-->

				<div class="cart-content"></div>


				<!--Total-->
				<div class="total">
					<div class="total-title">Total</div>
					<div class="total-price">$0</div>

				</div>
				<!--Buy Button-->
				<button type="button" class="btn-buy">Buy Now</button>
				<!--Cart close-->
				<i class='bx bx-x' id="close-cart"></i>
			</div>
		</div>

	</header>
	<section class="shop container">
		<h2 class="section-title">Course Products</h2>
		<div class="shop-category-select">

			<!--********************************分類按鈕********************************-->
			<div class="select-group">
				<div class="btn-toolbar" role="toolbar"
					aria-label="Toolbar with button groups">
					<div class="btn-group mr-2" role="group" aria-label="First group">
						<button type="button" class="btn btn-primary" id="grade">小學</button>
						<button type="button" class="btn btn-primary" id="grade">國中</button>
						<button type="button" class="btn btn-primary" id="grade">高中</button>

					</div>
					<div class="btn-group mr-2" role="group" aria-label="Second group">
						<button type="button" class="btn btn-primary" id="subject">國文</button>
						<button type="button" class="btn btn-primary" id="subject">英文</button>
						<button type="button" class="btn btn-primary" id="subject">數學</button>
					</div>
					<div class="btn-group mr-2" role="group" aria-label="Third group">
						<button type="button" class="btn btn-primary" id="category">日常</button>
						<button type="button" class="btn btn-primary" id="category">衝刺</button>
					</div>

					<div class="btn-group" role="group" aria-label="Forth group">
						<button type="button" class="btn btn-primary" id="all">全部</button>
					</div>
				</div>
			</div>


		</div>
		<div class="shop-content" id="shop-content-ajax">
			<!--box-->
		
			
		</div>

	</section>

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

<!--####################################################################### -->				
			<!--Link TO JS-->
	<script src="js/main.js"></script>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
<script type="text/javascript">


$(function(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/AllOnCourseAjax.page' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "";

			var courseList = JSON.parse(xhr.responseText);
			for(var i=0; i < courseList.length; i++){
				content += 
				"<div class='product-box'>" +	
				"<img alt='img' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" +
				
				"<h2 class='product-title'>" +
				courseList[i].courseGrade+
    	        courseList[i].courseClass + "年級" +
    	       	courseList[i].courseSubject +
    	       	courseList[i].courseCategory + 
    	       	"</h2>" +
    	       	
    	       	"<span class='course-id' hidden='hidden'>"+ courseList[i].id + "</span>" +
    	       	
    	       	"<p class='course-info'>上課期間:" + courseList[i].startDate + "~" +
    	       	courseList[i].endDate + "</p>" +
    	       	
    	        "<p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p>" +
    	       	"<span class='price'>$" + courseList[i].coursePrice + "</span>" +
    	       	
    	       	"<i class='bx bx-shopping-bag add-cart'></i>" +
    	       	"<input size='3' class='courseTeachTime' id='courseTeachTime' value='" + courseList[i].courseTeachTime + "' type='hidden'></input>" +
    	       	"</div>"
    	       	
    	       
			}
			var info = document.getElementById("shop-content-ajax");
			info.innerHTML = content;
			console.log("loading finished")
			
			
			var ctt = $('.courseTeachTime');
// 			console.log(ctt.eq(0).val());
			var cttlength = ctt.length;
			//第幾個courseTeachTime
			for(var j=0; j < cttlength; j++){
				var cttValue = ctt.eq(j).val();
				
				//第j個courseTeachTime的第z個星期是否有上課
				for(var z=0;z<7;z++){
				var onOrOff = cttValue.substr(z,1);
					if(onOrOff==1){
						ctt.eq(j).siblings('.course-info').find('button').eq(z).addClass('active');
					}
				}
			}
			
		}
	}
})

$("button").click(function(){
// 	console.log($(this).text());
	var keyword = $(this).text()
	var xhr = new XMLHttpRequest();
	
	if(keyword=="小學"||keyword=="國中"||keyword=="高中"){
		xhr.open("GET", "<c:url value='/findAllCourseByGradeAjax.page?grade=" + keyword + "'/>", true);
	}
	else if(keyword=="國文"||keyword=="英文"||keyword=="數學"){
		xhr.open("GET", "<c:url value='/findAllCourseBySubjectAjax.page?subject=" + keyword + "'/>", true);
	}
	else if(keyword=="日常"||keyword=="衝刺"){
		xhr.open("GET", "<c:url value='/findAllCourseByCategoryAjax.page?category=" + keyword + "'/>", true);
	}
	else{
	xhr.open("GET", "<c:url value='/AllOnCourseAjax.page' />", true);
	}
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "";

			var courseList = JSON.parse(xhr.responseText);
			for(var i=0; i < courseList.length; i++){
				content += 
				"<div class='product-box'>" +	
				"<img alt='img' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" +
				
				"<h2 class='product-title'>" +
				courseList[i].courseGrade+
    	        courseList[i].courseClass + "年級" +
    	       	courseList[i].courseSubject +
    	       	courseList[i].courseCategory + 
    	       	"</h2>" +
    	       	
    	       	"<span class='course-id' hidden='hidden'>"+ courseList[i].id + "</span>" +
    	       	
    	       	"<p class='course-info'>上課期間:" + courseList[i].startDate + "~" +
    	       	courseList[i].endDate + "</p>" +
    	       	
    	        "<p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p>" +
    	       	"<span class='price'>$" + courseList[i].coursePrice + "</span>" +
    	       	
    	       	"<i class='bx bx-shopping-bag add-cart'></i>" +
    	       	"<input size='3' class='courseTeachTime' id='courseTeachTime' value='" + courseList[i].courseTeachTime + "'type='hidden'></input>" +
    	       	"</div>"
			}
			var info = document.getElementById("shop-content-ajax");
			info.innerHTML = content;
			console.log("loading finished")
			
			var ctt = $('.courseTeachTime');
// 			console.log(ctt.eq(0).val());
			var cttlength = ctt.length;
			//第幾個courseTeachTime
			for(var j=0; j < cttlength; j++){
				var cttValue = ctt.eq(j).val();
				
				//第j個courseTeachTime的第z個星期是否有上課
				for(var z=0;z<7;z++){
				var onOrOff = cttValue.substr(z,1);
					if(onOrOff==1){
						ctt.eq(j).siblings('.course-info').find('button').eq(z).addClass('active');
					}
				}
			}
			
		}
	}
	
})



</script>

</body>	



</html>