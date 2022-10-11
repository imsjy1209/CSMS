<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
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
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
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
		<div class="shop-content">
				<!--box-->
			<c:forEach var="course" items="${courseList}">
				<div class="product-box">
					<img src="${pageContext.request.contextPath}/AllOnCoursePic/${course.id}" alt="this is a picture" class="product-img">
			
<h2 class="product-title">
${course.courseGrade}${course.courseClass}年級${course.courseSubject}(${course.courseCategory})
</h2>
<span class="course-id" hidden="hidden">${course.id}</span>	
  <p class="course-info">上課期間:<fmt:formatDate pattern="yyyy-MM-dd" value="${course.startDate}"/>
  ~<fmt:formatDate pattern="yyyy-MM-dd" value="${course.endDate}"/></p>
                <p class="course-info">
                    <button>一</button><button>二</button><button>三</button><button>四</button><button>五</button><button>六</button><button>日</button>
                </p>
					<span class="price">$${course.coursePrice}</span>
					<i class='bx bx-shopping-bag add-cart'></i>
						<input size="3" id="courseTeachTime" value="${course.courseTeachTime}" type="text"></input>
				</div>
			</c:forEach>

		</div>

	</section>
	
	  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	<!--Link TO JS-->
	<script src="${contextRoot}/js/main.js"></script>
	<script type="text/javascript"
		src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$("button").click(function(event){
	var info = $(this).text();
	if(info=="小學"|| info=="國中"|| info=="高中"){
		document.location.href="${contextRoot}/findAllCourseByGrade.page?grade="+ info;
	}
	else if(info=="國文"|| info=="英文"|| info=="數學"){
		document.location.href="${contextRoot}/findAllCourseBySubject.page?subject="+ info;
	}
	else if(info=="日常"|| info=="衝刺"){
		document.location.href="${contextRoot}/findAllCourseByCategory.page?category="+ info;
	}
	else{
		document.location.href="${contextRoot}/AllOnCourse.page";
	}
	
	
})

$(".btn-buy").click(function(event){
	console.log("777777")
	
})

</script>
</body>
</html>