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
	
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" -->
<!-- 	crossorigin="anonymous"> -->

<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous">	
	
</head>
<body>

	<header>
	


		<div class="nav container">
			<a href="#" class="logo">CramSchool</a>
			<div><i class='bx bx-cart' style='font-size:48px;' id="cart-icon"></i><span class="badge badge-primary badge-pill">0</span></div>
<!-- 			<i class='bx bx-shopping-bag' id="cart-icon"></i> -->
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

		<!--********************************Mohu********************************-->
		  
   <div class="form-inline">
   <i style='font-size:36px;' class='bx bx-search-alt bx-flashing' ></i>
    <input class="form-control mr-sm-2" type="search" value="" placeholder="Search" aria-label="Search">
    <button id="mohuBtn" class="btn btn-outline-success my-2 my-sm-0">Search</button>
  </div></br>
  
		<!--********************************條件複選********************************-->
		
 <div class="form-group row">
  <div class="col-sm-3 courseGrade">
<label class="my-1 mr-2" for="inlineFormCustomSelectPref">學級</label>
  <select class="cg custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
    <option selected>Grade Choose...</option>
    <option value="cgEle">小學</option>
    <option value="cgJun">國中</option>
    <option value="cgSen">高中</option>
  </select>
  </div>
  
    <div class="col-sm-3 courseGrade">
  <label class="my-1 mr-2" for="inlineFormCustomSelectPref">科目</label>
  <select class="cs custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
    <option selected value="csDefault">Subject Choose...</option>
    <option value="csCH">國文</option>
    <option value="csEN">英文</option>
    <option value="csMA">數學</option>
  </select>
  </div>
  
      <div class="col-sm-3 courseGrade">
  <label class="my-1 mr-2" for="inlineFormCustomSelectPref">類別</label>
  <select class="cc custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
    <option selected>Category Choose...</option>
    <option value="ccNor">日常</option>
    <option value="ccRush">衝刺</option>
  </select>
  </div>

  
  	<div class="col-sm-3" >
  	 <label class="my-1 mr-2" for="inlineFormCustomSelectPref">&nbsp</label></br>
		<button type="button" class="searchAllBtn btn btn-primary" id="all">查詢全部</button>
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
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
 integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
  crossorigin="anonymous"></script>
  
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
 integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
  crossorigin="anonymous"></script>
	

<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!-- 		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!-- 		crossorigin="anonymous"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
<!-- 		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
<!-- 		crossorigin="anonymous"></script> -->
		
<!-- 	<script -->
<!-- 		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
<!-- 		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
<!-- 		crossorigin="anonymous"></script> -->
		
		

<!--####################################################################### -->				
			<!--Link TO JS-->
<!-- 	<script src="js/main.js"></script> -->


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
<script type="text/javascript">


//========查詢全部的按鈕=====================
$(".searchAllBtn").click(function(){
	var keyword = $(this).text()
	var xhr = new XMLHttpRequest();
	
	if(keyword=="查詢全部"){
		$('.cg').get(0).selectedIndex=0
		$('.cs').get(0).selectedIndex=0
		$('.cc').get(0).selectedIndex=0
		cs="";
		cg="";
		cc="";
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
    	    	"<p style='font-size:16px' class='course-member'>尚餘人數:" + courseList[i].courseMember + "</p>" +
    	        "<p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p>" +
    	       	"<span class='price'>$" + courseList[i].coursePrice + "</span>" +
    	       	
    	       	"<i class='bx bx-shopping-bag add-cart'></i>" +
    	       	"<input size='3' class='courseTeachTime' id='courseTeachTime' value='" + courseList[i].courseTeachTime + "'type='hidden'></input>" +
    	       	"</div>"
			}
			var info = document.getElementById("shop-content-ajax");
			info.innerHTML = content;
			console.log("loading finished")
			
			
			//確認購物車中有那些商品，讓當前商品頁面的購買按鈕亮燈
				$('.cart-content').children('.cart-box').each(function(){
					var cartId = $(this).children('.detail-box').find('span').text();
// 					console.log(cartId)
					$('.shop-content').children('.product-box').each(function(){
						var shopId = $(this).children('.course-id').text();
						if(cartId==shopId){
							$(this).children('.add-cart').addClass('active');
						}
					})
				})
				
			//確認購物車中有那些商品，讓當前商品頁面的剩餘數量-1
			$('.cart-box').each(function(){
				//抓當前購物車商品的id
				var courseIdInCart = $(this).find('.detail-box').find('span').text();
				
				$('.product-box').each(function(){
					var courseIdInPage = $(this).find('.course-id').text();
					if(courseIdInCart==courseIdInPage){
						var courseIdInPageMember = $(this).find('.course-member').text();
						var memberStr = courseIdInPageMember.substr(5);
						console.log(memberStr)
						var newMemStr = Number(memberStr)-1
						$(this).find('.course-member').text("尚餘人數:"+newMemStr)
					}
				})
			})
			
			
			
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

//==========MohuBtn===================================
	$('#mohuBtn').click(function(){
		var mohu = $(this).prev().val()
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findAllCourseByMoHuAjax.controller?mohu=" + mohu + "' />", true);
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
	    	    	"<p style='font-size:16px' class='course-member'>尚餘人數:" + courseList[i].courseMember + "</p>" +
	    	        "<p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p>" +
	    	       	"<span class='price'>$" + courseList[i].coursePrice + "</span>" +
	    	       	
	    	       	"<i class='bx bx-shopping-bag add-cart'></i>" +
	    	       	"<input size='3' class='courseTeachTime' id='courseTeachTime' value='" + courseList[i].courseTeachTime + "' type='hidden'></input>" +
	    	       	"</div>"
	    	       	
	    	       
				}
				var info = document.getElementById("shop-content-ajax");
				info.innerHTML = content;
				console.log("loading finished")
				
				//確認購物車中有那些商品，讓當前商品頁面的購買按鈕亮燈
				$('.cart-content').children('.cart-box').each(function(){
					var cartId = $(this).children('.detail-box').find('span').text();
					console.log(cartId)
					$('.shop-content').children('.product-box').each(function(){
						var shopId = $(this).children('.course-id').text();
						if(cartId==shopId){
							$(this).children('.add-cart').addClass('active');
						}
					})
				})
				
				//確認購物車中有那些商品，讓當前商品頁面的剩餘數量-1
				$('.cart-box').each(function(){
				//抓當前購物車商品的id
				var courseIdInCart = $(this).find('.detail-box').find('span').text();
				
				$('.product-box').each(function(){
					var courseIdInPage = $(this).find('.course-id').text();
					if(courseIdInCart==courseIdInPage){
						var courseIdInPageMember = $(this).find('.course-member').text();
						var memberStr = courseIdInPageMember.substr(5);
						console.log(memberStr)
						var newMemStr = Number(memberStr)-1
						$(this).find('.course-member').text("尚餘人數:"+newMemStr)
					}
				})
			})
				
				
				var ctt = $('.courseTeachTime');
//	 			console.log(ctt.eq(0).val());
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

//===========條件式多選，分主科/學級/類型=======================
	
	var cg = "";
	var cs = "";
	var cc = "";
	$('select').change(function(){
		var keyword = $(this).find('option:selected').text()
// 		console.log(keyword)
		if(keyword == "小學" || keyword == "國中" || keyword == "高中"){
			cg=keyword;
			console.log(cg);
		}
		else if(keyword == "國文" || keyword == "英文" || keyword == "數學"){
			cs=keyword;
			console.log(cs);
		}
		else if(keyword == "日常" || keyword == "衝刺"){
			cc=keyword;
			console.log(cc);
		}
		else if(keyword=="Grade Choose..."){
			cg="";
		}
		else if(keyword=="Subject Choose..."){
			cs="";
		}
		else if(keyword=="Category Choose..."){
			cc="";
		}
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findAllCourseByKeyWordAjax.controller?cg=" + cg +"&cs=" + cs +"&cc=" + cc + "' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "";

				var courseList = JSON.parse(xhr.responseText);
				for(var i=0; i < courseList.length; i++){
					content += 
					"<div class='product-box'>" +	
					"<img alt='img' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' height='650' class='product-img'>" +
					
					"<h2 class='product-title'>" +
					courseList[i].courseGrade+
	    	        courseList[i].courseClass + "年級" +
	    	       	courseList[i].courseSubject +
	    	       	courseList[i].courseCategory + 
	    	       	"</h2>" +
	    	       	
	    	       	"<span class='course-id' hidden='hidden'>"+ courseList[i].id + "</span>" +
	    	       	
	    	       	"<p class='course-info'>上課期間:" + courseList[i].startDate + "~" +
	    	       	courseList[i].endDate + "</p>" +
	    	    	"<p style='font-size:16px' class='course-member'>尚餘人數:" + courseList[i].courseMember + "</p>" +
	    	        "<p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p>" +
	    	       	"<span class='price'>$" + courseList[i].coursePrice + "</span>" +
	    	       	
	    	       	"<i class='bx bx-shopping-bag add-cart'></i>" +
	    	       	"<input size='3' class='courseTeachTime' id='courseTeachTime' value='" + courseList[i].courseTeachTime + "' type='hidden'></input>" +
	    	       	"</div>"
	    	       	
	    	       
				}
				var info = document.getElementById("shop-content-ajax");
				info.innerHTML = content;
				console.log("loading finished")
				
				//確認購物車中有那些商品，讓當前商品頁面的購買按鈕亮燈
					$('.cart-content').children('.cart-box').each(function(){
					var cartId = $(this).children('.detail-box').find('span').text();
					console.log(cartId)
					$('.shop-content').children('.product-box').each(function(){
						var shopId = $(this).children('.course-id').text();
						if(cartId==shopId){
							$(this).children('.add-cart').addClass('active');
						}
					})
				})
				
				//確認購物車中有那些商品，讓當前商品頁面的剩餘數量-1
				$('.cart-box').each(function(){
				//抓當前購物車商品的id
				var courseIdInCart = $(this).find('.detail-box').find('span').text();
				
				$('.product-box').each(function(){
					var courseIdInPage = $(this).find('.course-id').text();
					if(courseIdInCart==courseIdInPage){
						var courseIdInPageMember = $(this).find('.course-member').text();
						var memberStr = courseIdInPageMember.substr(5);
						console.log(memberStr)
						var newMemStr = Number(memberStr)-1
						$(this).find('.course-member').text("尚餘人數:"+newMemStr)
					}
				})
			})
				
				
				var ctt = $('.courseTeachTime');
//	 			console.log(ctt.eq(0).val());
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
				"<img alt='img' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img' data-toggle='modal' data-target='#exampleModal'>" +
				
				"<h2 class='product-title'>" +
				courseList[i].courseGrade+
    	        courseList[i].courseClass + "年級" +
    	       	courseList[i].courseSubject +
    	       	courseList[i].courseCategory + 
    	       	"</h2>" +
    	       	
    	       	"<span class='course-id' hidden='hidden'>"+ courseList[i].id + "</span>" +
    	       	
    	       	"<p class='course-info'>上課期間:" + courseList[i].startDate + "~" +
    	       	courseList[i].endDate + "</p>" +
    	       	"<p style='font-size:16px' class='course-member'>尚餘人數:" + courseList[i].courseMember + "</p>" +
    	        "<p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p>" +
    	       	"<span class='price'>$" + courseList[i].coursePrice + "</span>" +
    	       	
    	       	"<i class='bx bx-shopping-bag add-cart'></i>" +
    	       	"<input size='3' class='courseTeachTime' id='courseTeachTime' value='" + courseList[i].courseTeachTime + "' type='hidden'></input>" +
    	       	"</div>"
    	       	
    	       
			}
			var info = document.getElementById("shop-content-ajax");
			info.innerHTML = content;
			console.log("loading finished")
			
			//確認購物車中有那些商品，讓當前商品頁面的購買按鈕亮燈
					$('.cart-content').children('.cart-box').each(function(){
					var cartId = $(this).children('.detail-box').find('span').text();
					console.log(cartId)
					$('.shop-content').children('.product-box').each(function(){
						var shopId = $(this).children('.course-id').text();
						if(cartId==shopId){
							$(this).children('.add-cart').addClass('active');
						}
					})
				})
				
			//確認購物車中有那些商品，讓當前商品頁面的剩餘數量-1
				$('.cart-box').each(function(){
				//抓當前購物車商品的id
				var courseIdInCart = $(this).find('.detail-box').find('span').text();
				
				$('.product-box').each(function(){
					var courseIdInPage = $(this).find('.course-id').text();
					if(courseIdInCart==courseIdInPage){
						var courseIdInPageMember = $(this).find('.course-member').text();
						var memberStr = courseIdInPageMember.substr(5);
						console.log(memberStr)
						var newMemStr = Number(memberStr)-1
						$(this).find('.course-member').text("尚餘人數:"+newMemStr)
					}
				})
			})
			
			
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


//===========照片點擊後放大===========
// $(document).on('click','img',function(){
// 	$(this).height(800);
// 	$(this).width(700);
// 	console.log("gottttttt uuuuuuuuuu")
// })

//Open Cart
$(document).on('click','#cart-icon',function(){ 
	$(".cart").addClass("active");
	})

// Close Cart
$(document).on('click','#close-cart',function(){ 
	$(".cart").removeClass("active");
	})


//==========點擊加入購物車圖示==========
$(".shop-content").on('click','.add-cart',function(){
	var title = $(this).siblings("h2").text();
	var course_id = $(this).siblings(".course-id").text();
	var price = $(this).siblings(".price").text();
	var productImg = $(this).siblings(".product-img").attr("src");
	
	$(this).addClass('active');
	var thisCourseMem = $(this).siblings('.course-member').text();
	var keyVal = thisCourseMem.substr(5);
	var newKeyVal = Number(keyVal)-1;
	$(this).siblings('.course-member').text("尚餘人數:" + newKeyVal);
	
	addProductToCart(title,course_id, price, productImg);
    updatetotal();
})

//===============Remove Items From Cart===============
$(document).on('click','.cart-remove',function(){
	console.log("gogogogogogogo")
	var courseIdForRemove = $(this).siblings(".detail-box").find('span').text()
	$(this).closest(".cart-box").remove();
	
	//========更新購物車顯示裡面的商品數量=============
	var cartNum = $('.cart-content').children('.cart-box').length;
	$('.badge-pill').text(cartNum)
	
	//更新商品庫存數量
	var courseUpdateNumId = $(this).siblings('.detail-box').find('span').text();
	console.log('===============')
	console.log(courseUpdateNumId)
	console.log('===============')
	$('.shop-content').children('.product-box').each(function(){
		var targetId = $(this).children('.course-id').text();
		if(courseUpdateNumId==targetId){
			var targetIdMem = $(this).children('.course-member').text();
			var targetIdMemNum = targetIdMem.substr(5);
			$(this).children('.course-member').text("尚餘人數:"+ (Number(targetIdMemNum)+1))
			return false;
		}
		
	})

   //=============移除購物車圖示的背景色===========
    var targetId="";
    $('.product-box').each(function(){
    	targetId = $(this).children('.course-id').text()
    	
    	if(targetId==courseIdForRemove){
    		$(this).children('.add-cart').removeClass('active')
    		
    	}
    })

	
	updatetotal();
    
})
//================End OF RemoveItems From Cart===============


//結帳動作
$(document).on('click','.btn-buy',function(){
//	buyButtonClicked();

    alert('轉移到結帳頁面')
    
    var father = $(this).siblings('.cart-content').children();
    for(var i=0;i<father.length;i++){
	var courseId = father.eq(i).find('.detail-box').find('span').text();
	var studentId=2;
	
	 console.log(courseId);
	 console.log(studentId);
	 
  	 var xhr = new XMLHttpRequest();
	 xhr.open("GET", "<c:url value='/orderDetailCreateAjax.controller?courseId=" + courseId + "&studentId=" + studentId + "' />", true);
	 xhr.send();
	 
	 var cartContent = document.getElementsByClassName('cart-content')[0]
	 cartContent.removeChild(cartContent.firstChild);
	
}
    updatetotal();
  	document.location.href = "${contextRoot}/findOrderDetailListByIdAndOrderListValueIsNullAjax.controller?id="+ studentId;

})


function addProductToCart(title,course_id, price, productImg) {

	for (var i = 0; i < $(".cart-product-title").length; i++) {
	    if ($(".cart-product-title")[i].innerText == title) {
	        alert('購物車中已有此商品');
	        return;
	    }
	}
	alert('已成功新增了一項課程到購物車')
	var cartTotal = "";
	var cartCount = $('.badge-pill').text();
	cartTotal = Number(cartCount)+1
	$('.badge-pill').text(cartTotal);
	
	var cartBoxContent ="<div class='cart-box'><img src=" + productImg + " class='cart-img'>" +
"<div class='detail-box'><span hidden='hidden'>" + course_id + "</span><div class='cart-product-title'>" + title + "</div>" +
    "<div class='cart-price'>" + price + "</div>" +
    "</div><i class='bx bxs-trash-alt cart-remove'></i></div>";
$(".cart-content").append(cartBoxContent);



// //===============Remove Items From Cart===============
// $(".cart-remove").click(function(){
// 	var courseIdForRemove = $(this).siblings(".detail-box").find('span').text()
// 	$(this).closest(".cart-box").remove();
	
// 	//========更新購物車顯示裡面的商品數量=============
// 	var cartNum = $('.cart-content').children('.cart-box').length;
// 	$('.badge-pill').text(cartNum)
	
// 	//更新商品庫存數量
// 	var courseUpdateNumId = $(this).siblings('.detail-box').find('span').text();
// 	console.log('===============')
// 	console.log(courseUpdateNumId)
// 	console.log('===============')
// 	$('.shop-content').children('.product-box').each(function(){
// 		var targetId = $(this).children('.course-id').text();
// 		if(courseUpdateNumId==targetId){
// 			var targetIdMem = $(this).children('.course-member').text();
// 			var targetIdMemNum = targetIdMem.substr(5);
// // 			console.log($(this).children('.course-member').text())
// 			$(this).children('.course-member').text("尚餘人數:"+ (Number(targetIdMemNum)+1))
// // 			console.log((Number(targetIdMemNum)+1))
// 			console.log(targetIdMem)
// 			console.log(targetIdMemNum)
// 			return false;
// 		}
		
// 	})
	
	
// // 	var keyVal = thisCourseMem.substr(5);
// // 	console.log(keyVal)
// // 	var newKeyVal = Number(keyVal)-1;
// // 	console.log(newKeyVal)
// // 	$(this).siblings('.course-member').text("尚餘人數" + newKeyVal);

//    //=============移除購物車圖示的背景色===========
//     var targetId="";
//     $('.product-box').each(function(){
//     	targetId = $(this).children('.course-id').text()
    	
//     	if(targetId==courseIdForRemove){
// //     		console.log("got uuuuuuuuuuuuuuu")
//     		$(this).children('.add-cart').removeClass('active')
    		
//     	}
//     })

	
// 	updatetotal();
    
// })
//================End OF RemoveItems From Cart===============

}

//Update Total
function updatetotal() {
    var cartContent = document.getElementsByClassName('cart-content')[0];
    var cartBoxes = cartContent.getElementsByClassName('cart-box');
    var total = 0;
    
    for (var i = 0; i < cartBoxes.length; i++) {
        var cartBox = cartBoxes[i];
        var priceElement = cartBox.getElementsByClassName('cart-price')[0];
        var price = parseFloat(priceElement.innerText.replace("$", ""));
           total = total + price;
    }
    //If price Contain some Cents Value
    total = Math.round(total * 100) / 100
    document.getElementsByClassName('total-price')[0].innerText = "$" + total;

}

</script>

</body>	



</html>