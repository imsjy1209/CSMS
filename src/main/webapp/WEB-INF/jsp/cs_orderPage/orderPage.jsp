<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!--Link to Css-->
<link rel="stylesheet" href="${contextRoot}/css/style.css">



	<!--box icons-->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<style>

 .table-content{ 
 position:relative; 
 text-align:center;
 } 

.total-div{
	display:flex;
	justify-content: space-between;
	background:white;
    position: absolute; 
    bottom: 20px;
    width: 1115px;
}

.test{
text-decoration:line-through;

}


.leftGroup{
}

.rightGroup{
}


</style>	

<title>Insert title here</title>
</head>


<body>
<header>
<div class="nav container">
			<a href="${pageContext.request.contextPath}/users/gotohomepage" class="logo">CramSchool</a>
			<h3><i class='bx bxs-user' >${student.name}</i></h3>
			<div><i style='font-size:48px;' class='bx bx-dollar-circle bx-spin' ></i></div>
			
		</div>
		
			
</header>
<br><br><br><br><br><br>

<div class="container">
<span class="stuId" style='display:none;'>${student.id}</span>
<table class="table table-hover table-content">
  <thead>
    <tr>
      <th scope="col">確認購買</th>
      <th scope="col">訂單明細號碼#</th>
      <th scope="col">結帳狀態</th>
      <th scope="col">訂購人</th>
      <th scope="col">商品名稱</th>
      <th scope="col">商品價錢</th>
      <th scope="col">開課日期</th>
      <th scope="col">結業日期</th>
      <th scope="col">移除</th>
    </tr>
  </thead>
  <tbody>

    
   <c:forEach var="item" items="${orderDetailList}">
   <tr class='remove'>
    <th class='checkBoxTh' style='vertical-align:middle'><input class='check-buy-box' type='checkbox'/></th>
    <th class='orderIdTh' style='vertical-align:middle'><span class=''>${item.id}</span></th>
   	<td style='color:red;vertical-align:middle'><span class=''><span class='courseInfoId' style='display:none ;'>${item.course.id}</span>未結帳</span></td>
   	<td style='vertical-align:middle'><span class=''>${item.student.name}</span></td>
   	<td style='vertical-align:middle'><span class=''>[${item.course.courseSubject}]-${item.course.courseGrade}${item.course.courseClass}年級</span></td>
   	<td style='vertical-align:middle' class='course-price'><span class=''>${item.course.coursePrice}</span></td>
   	<td style='vertical-align:middle'><span class=''>${item.course.startDate}</span></td>
   	<td style='vertical-align:middle'><span class=''>${item.course.endDate}</span></td>
   	<td style='vertical-align:middle'><i class='bx bx-trash bx-tada' style='color:#cb1616;'></i></td>
   	</tr>
   </c:forEach>

  </tbody>
</table>


	<div class="total-div">
	
	<div class="leftGroup">
	
		<table class="table">
				<tr>
		<td><button id="selectAll" class="btn btn-danger">全選</button></td>
		<td><button id="cancelAll" class="btn btn-warning">取消全選</button></td>
			</tr>
			</table>
	</div>
	
	<div class="rightGroup">	
<!-- 		<p class="ppp">Total:</p> -->
<!-- 		<p class="total-money ppp">0</p> -->
<!-- 		<button id="goToPay" class="btn btn-primary">去買單</button> -->
<!-- 		<button id="backToPrevPage" class="btn btn-primary">回上一頁</button> -->

			<table class="table">
				<tr>
				<td style="vertical-align:middle;">Total:</td>
				<td class="total-money" style="vertical-align:middle;">0</td>
				<td><button id="goToPay" class="btn btn-primary">去買單</button></td>
				<td><a href="${pageContext.request.contextPath}/courseAllOnPageAjax.page" id="backToPrevPage" class="btn btn-primary">回上一頁</a></td>
				</tr>
			</table>
	</div>
	
	</div>
</div>



</body>

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
		
<script>

$('#goToPay').click(function(){
	var amount = $('.total-money').text();
	console.log(amount);
	if(amount==0){
		window.alert('請勾選要購買的課程')
	}
	else{
		
//===========處理再次確定要購買的課程(Revise confirmOrder from 0 to 2)============
	var studentId= $('.stuId').text();
	var payment="credit_card"
	
	var ODIdList = [];
	$('input:checked').each(function(){
		var oDId= $(this).parent().next().children().text();
		var courseInfoId = $(this).parent().next().next().find('.courseInfoId').text();
		var eachODId = {"orderDetailId":oDId,"studentInfoId":studentId,"courseInfoId":courseInfoId};
		ODIdList.push(eachODId);
	})
	var payment ="credit_card";
	var ODIdListJsonString = JSON.stringify(ODIdList);
	console.log(ODIdListJsonString);
//============處理再次確定後不購買的課程(Revise confirmOrder from 0 to 1)=====================

var ODIdListNoPurchase = [];
	$('input:not(:checked)').each(function(){
		var oDIdNoPurchase= $(this).parent().next().children().text();
		var courseInfoIdNoPurchase = $(this).parent().next().next().find('.courseInfoId').text();
		var eachODIdNoPurchase = {"orderDetailId":oDIdNoPurchase,"studentInfoId":studentId,"courseInfoId":courseInfoIdNoPurchase};
		ODIdListNoPurchase.push(eachODIdNoPurchase);
	})
	
	var ODIdListNoPurchaseJsonString = JSON.stringify(ODIdListNoPurchase);
	console.log(ODIdListNoPurchaseJsonString);

//開始使用Ajax傳送資料
	//處理不購買的
	$.ajax({
		url:'http://localhost:8081/CSMS/updateOrderDetailData.controller',
		contentType:'application/json;charset=UTF-8',
		dataType:null,
		method:'post',
		data:ODIdListNoPurchaseJsonString,
		success:function(result){
			console.log(result)
			console.log("okokok")
	
		},
		error:function(err){
			console.log(err)
			console.log("ngngngng")
		}
		
	})

	//處理確定購買的
	$.ajax({
		url:'http://localhost:8081/CSMS/updateOrderListAndOrderDetailData.controller?amount='+amount+'&payment='+payment+'&studentId='+studentId,
		contentType:'application/json;charset=UTF-8',
		dataType:null,
		method:'post',
		data:ODIdListJsonString,
		success:function(result){
			console.log(result)
			console.log("okokok")
		
		},
		error:function(err){
			console.log(err)
			console.log("ngngngng")
		}
		
	})
	
	}
	
	window.location.href='${contextRoot}/changeToEcpayPage.controller?amount='+amount;
	
	
})


//==========再次選擇要購買的項目===============
$(document).on('click','input:checkbox',function(){
// 	if($(this).prop('checked')==true){
// 		console.log('ggggggggggg')
// 		 $(this).prop('checked', false);
// 	}
// 	else{
// 		$(this).prop('checked', true);
// 	}
	let total=0;
	$(':checked').each(function(){
	total += Number($(this).parent().siblings('.course-price').text())				
	})
	$('.total-money').text(total)
})


//===========一次全選===========
	
$(document).on('click','#selectAll',function(){
	$('input:checkbox').each(function() {
	    $(this).prop('checked', true);
	    let bgColor = 'lightblue';
		$(this).closest('tr').css('background', bgColor)
	})
	let total=0;
	$(':checked').each(function(){
	total += Number($(this).parent().siblings('.course-price').text())				
	})
	$('.total-money').text(total)
	
})

//=========取消全選=========
$(document).on('click','#cancelAll',function(){
	
	$('input:checkbox').each(function (){  
	    $(this).prop('checked',false);
	    let bgColor = 'none';
		$(this).closest('tr').css('background', bgColor)
	});
	
	let total=0;
	$(':checked').each(function(){
	total += Number($(this).parent().siblings('.course-price').text())				
	})
	$('.total-money').text(total)
	
})


//=======checkbox被選擇後變色===========
	$(document).on('click','input[type="checkbox"]',function(){
		let bgColor = 'none';
		if ($(this).prop('checked')) {
			bgColor = 'lightblue';
		}
		$(this).closest('tr').css('background', bgColor)
	})

			
//=====點擊移除商品按鈕========	
	$(document).on('click','.bx-trash',function(){
		
		var orderIdForUpdateOnOrOff = $(this).parent().siblings('.orderIdTh').children().text();
		console.log(orderIdForUpdateOnOrOff)
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/updateOrderDetailDataOnlyOne.controller?orderId=" + orderIdForUpdateOnOrOff  + "' />", true);
		xhr.send();
		
		var wairForRemove = $(this).parent().parent().find('span')
		wairForRemove.each(function(){
		$(this).addClass('test')	
		})
		$(this).parent().siblings('.checkBoxTh').html("<span>已移除</span>")
		$(this).parent().html("<button class='recover btn btn-warning'>還原</button>")
	})

//=====點擊還原商品按鈕========
$(document).on('click','.recover',function(){
	var orderIdForUpdateOnOrOff = $(this).parent().siblings('.orderIdTh').children().text();
	console.log(orderIdForUpdateOnOrOff)
	
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/updateOrderDetailDataOnlyOne2.controller?orderId=" + orderIdForUpdateOnOrOff  + "' />", true);
		xhr.send();
	
	var wairForRecover = $(this).parent().parent().find('span')
	wairForRecover.each(function(){
		$(this).removeClass('test')
	})
	$(this).parent().siblings('.checkBoxTh').html("<input class='check-buy-box' type='checkbox'/>")
	$(this).parent().html("<i class='bx bx-trash bx-tada' style='color:#cb1616;'></i>")
	
})
</script>

</html>