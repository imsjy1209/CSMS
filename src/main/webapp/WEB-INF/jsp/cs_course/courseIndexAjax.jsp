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
			<a href="#" class="logo">CramSchool</a>
			<div><i class='bx bx-cart' style='font-size:48px;' id="cart-icon"></i><span class="badge badge-primary badge-pill">2</span></div>
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

			<!--********************************分類按鈕********************************-->
<!-- 			<div class="select-group"> -->
<!-- 				<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups"> -->
<!-- 					<div class="btn-group mr-2" role="group" aria-label="First group"> -->

<!-- 						<button type="button" class="btn btn-primary" id="grade">小學</button> -->
<!-- 						<button type="button" class="btn btn-primary" id="grade">國中</button> -->
<!-- 						<button type="button" class="btn btn-primary" id="grade">高中</button> -->

<!-- 					</div> -->
<!-- 					<div class="btn-group mr-2" role="group" aria-label="Second group"> -->
<!-- 						<button type="button" class="btn btn-primary" id="subject">國文</button> -->
<!-- 						<button type="button" class="btn btn-primary" id="subject">英文</button> -->
<!-- 						<button type="button" class="btn btn-primary" id="subject">數學</button> -->
<!-- 					</div> -->
<!-- 					<div class="btn-group mr-2" role="group" aria-label="Third group"> -->
<!-- 						<button type="button" class="btn btn-primary" id="category">日常</button> -->
<!-- 						<button type="button" class="btn btn-primary" id="category">衝刺</button> -->
<!-- 					</div> -->

<!-- 					<div class="btn-group" role="group" aria-label="Forth group"> -->
<!-- 						<button type="button" class="btn btn-primary" id="all">全部</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
			<!--********************************條件多選CheckBox********************************-->
<!-- 			  <div class="form-group row"> -->
<!--    					 <div class="col-sm-1 courseGrade"> -->
<!--       				  		<input class="form-check-input" type="checkbox" id="gridCheck1"> -->
<!--         					<label class="form-check-label" for="gridCheck1">小學</label><br> -->
<!--         					<input class="form-check-input" type="checkbox" id="gridCheck2"> -->
<!--        					 	<label class="form-check-label" for="gridCheck2">國中</label><br> -->
<!--        					 	<input class="form-check-input" type="checkbox" id="gridCheck3"> -->
<!--        					 	<label class="form-check-label" for="gridCheck3">高中</label> -->
<!--     				</div> -->
       					 
<!--        				<div class="col-sm-1 courseSubject"> -->
<!--       				  		<input class="form-check-input" type="checkbox" id="gridCheck4"> -->
<!--         					<label class="form-check-label" for="gridCheck4">國文</label><br> -->
<!--         					<input class="form-check-input" type="checkbox" id="gridCheck5"> -->
<!--        					 	<label class="form-check-label" for="gridCheck5">英文</label><br> -->
<!--        					 	<input class="form-check-input" type="checkbox" id="gridCheck6"> -->
<!--        					 	<label class="form-check-label" for="gridCheck6">高中</label> -->
<!--     				</div> -->
    				
<!--     				<div class="col-sm-1 courseCategory"> -->
<!--       				  		<input class="form-check-input" type="checkbox" id="gridCheck7"> -->
<!--         					<label class="form-check-label" for="gridCheck7">日常</label><br> -->
<!--         					<input class="form-check-input" type="checkbox" id="gridCheck8"> -->
<!--        					 	<label class="form-check-label" for="gridCheck8">衝刺</label><br> -->
<!--     				</div> -->
<!--   				</div> -->

		<!--********************************Mohu********************************-->
		  
   <form class="form-inline" action="">
   <i style='font-size:36px;' class='bx bx-search-alt bx-flashing' ></i>
    <input class="form-control mr-sm-2" type="search" value="" placeholder="Search" aria-label="Search">
    <button id="mohuBtn" class="btn btn-outline-success my-2 my-sm-0">Search</button>
  </form></br>
  
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
<!-- 	<script src="js/main.js"></script> -->


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	
<script type="text/javascript">
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


//==================條件多選設定===========================
// $('.form-check-input').click(function(){
	
// 	$('.courseGrade').children('input').each(function(){
// 		$(this).removeAttr('disabled')
// 	})
// 	$('.courseSubject').children('input').each(function(){
// 		$(this).removeAttr('disabled')
// 	})
// 	$('.courseCategory').children('input').each(function(){
// 		$(this).removeAttr('disabled')
// 	})
	
// 	var cGchecked= $('.courseGrade').find('.form-check-input:checked')
// 	var cSchecked= $('.courseSubject').find('.form-check-input:checked')
// 	var cCchecked= $('.courseCategory').find('.form-check-input:checked')
// // 	console.log(cGchecked.length)
	
// 	if(cGchecked.length==3){
// 		$('.courseSubject').children('input').each(function(){
// 			$(this).attr('disabled','disabled')
// 		})
// 		$('.courseCategory').children('input').each(function(){
// 			$(this).attr('disabled','disabled')
// 		})
// // 		console.log($('.courseSubject').children('input'))
// // 		console.log('gggggg')
// 	}
	
// 	else if(cSchecked.length==3){
// 		$('.courseGrade').children('input').each(function(){
// 			$(this).attr('disabled','disabled')
// 		})
// 		$('.courseCategory').children('input').each(function(){
// 			$(this).attr('disabled','disabled')
// 		})
// 	}
	
// 	else if(cCchecked.length==2){
// 		$('.courseGrade').children('input').each(function(){
// 			$(this).attr('disabled','disabled')
// 		})
// 		$('.courseSubject').children('input').each(function(){
// 			$(this).attr('disabled','disabled')
// 		})
// 	}
// 	var csCH,csEN,csMA,cgEle,cgJun,cgSen,ccNor,ccRush = "";
	
// // 	console.log($('.form-check-input:checked'))
// 	$('.form-check-input:checked').each(function(){
// 		var checkedKeyWord = $(this).next().text()
// // 		console.log(checkedKeyWord)
		
// 		if(checkedKeyWord=="國文"){
// 			csCH="國文";
// 			console.log(csCH);
// 		}
// 		else if(checkedKeyWord=="英文"){
// 			csEN="英文";
// 			console.log(csEN);
// 		}
// 		else if(checkedKeyWord=="數學"){
// 			csMA="數學";
// 			console.log(csMA);
// 		}
// 		else if(checkedKeyWord=="小學"){
// 			cgEle="小學";
// 			console.log(cgEle);
// 		}
// 		else if(checkedKeyWord=="國中"){
// 			cgJun="國中";
// 			console.log(cgJun);
// 		}
// 		else if(checkedKeyWord=="高中"){
// 			cgSen="高中";
// 			console.log(cgSen);
// 		}
// 		else if(checkedKeyWord=="日常"){
// 			ccNor="日常";
// 			console.log(ccNor);
// 		}
// 		else if(checkedKeyWord=="衝刺"){
// 			ccRush="衝刺";
// 			console.log(ccRush);
// 		}
// // 		var xhr = new XMLHttpRequest();
// // 		xhr.open("GET", "<c:url value='/findAllCourseByCheckedBoxAjax.controller?csCH=" + csCH +"&csEN=" + csEN +"&csMA=" + csMA + "&cgEle=" + cgEle + "&cgJun=" + cgJun + "&cgSen="+cgSen+"&ccNor=" +ccNor+"&ccRush="+ccRush+"' />", true);
// // 		xhr.send();
// // 		var courseList = JSON.parse(xhr.responseText);
// // 		console.log(courseList);
// 	})
	
// })



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


//Open Cart
$(document).on('click','#cart-icon',function(){ 
	$(".cart").addClass("active");
	})

// Close Cart
$(document).on('click','#close-cart',function(){ 
	$(".cart").removeClass("active");
	})


$(".shop-content").on('click','.add-cart',function(){
	var title = $(this).siblings("h2").text();
	var course_id = $(this).siblings(".course-id").text();
	var price = $(this).siblings(".price").text();
	var productImg = $(this).siblings(".product-img").attr("src");
	
	addProductToCart(title,course_id, price, productImg);
    updatetotal();
})


//結帳動作
$(document).on('click','.btn-buy',function(){
//	buyButtonClicked();

    alert('Your Order is placed')
//     console.log();
    
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
	        alert('You have already add this Product to cart');
	        return;
	    }
	}
   var cartBoxContent ="<div class='cart-box'><img src=" + productImg + " class='cart-img'>" +
"<div class='detail-box'><span hidden='hidden'>" + course_id + "</span><div class='cart-product-title'>" + title + "</div>" +
    "<div class='cart-price'>" + price + "</div>" +
    "</div><i class='bx bxs-trash-alt cart-remove'></i></div>";
$(".cart-content").append(cartBoxContent);

//Remove Items From Cart
$(".cart-remove").click(function(){
	$(this).closest(".cart-box").remove();
	 updatetotal();
})
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

$(".searchAllBtn").click(function(){
// 	console.log($(this).text());
	var keyword = $(this).text()
	var xhr = new XMLHttpRequest();
	
// 	if(keyword=="小學"||keyword=="國中"||keyword=="高中"){
// 		xhr.open("GET", "<c:url value='/findAllCourseByGradeAjax.page?grade=" + keyword + "'/>", true);
// 	}
// 	else if(keyword=="國文"||keyword=="英文"||keyword=="數學"){
// 		xhr.open("GET", "<c:url value='/findAllCourseBySubjectAjax.page?subject=" + keyword + "'/>", true);
// 	}
// 	else if(keyword=="日常"||keyword=="衝刺"){
// 		xhr.open("GET", "<c:url value='/findAllCourseByCategoryAjax.page?category=" + keyword + "'/>", true);
// 	}
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