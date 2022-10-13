<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<style>
.total-div{
	float:right;
/* 	background-color:yellow; */
	font-size: large;
	
}



</style>	
<title>Insert title here</title>
</head>
<body>

<div class="container">
<table class="table table-hover">
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
    </tr>
  </thead>
  <tbody>

    
   <c:forEach var="item" items="${orderDetailList}">
   <tr>
    <th><input class='check-buy-box' type='checkbox'/></th>
    <th>${item.id}</th>
   	<td style='color:red;'>未結帳</td>
   	<td>${item.student.name}</td>
   	<td>${item.course.courseSubject}${item.course.courseGrade}${item.course.courseClass}年級</td>
   	<td class='course-price'>${item.course.coursePrice}</td>
   	<td>${item.course.startDate}</td>
   	<td>${item.course.endDate}</td>
   	</tr>
   </c:forEach>


  </tbody>
</table>



<div class="total-div">

<button id="selectAll" class="btn btn-danger">全選</button>
<button id="cancelAll" class="btn btn-warning">取消全選</button>
<button id="goToPay" class="btn btn-primary">結帳gogo</button>
<button id="backToPrevPage" class="btn btn-primary">回上一頁</button>
<div>
<table>
<tr>
<td>Total:</td><td class="total-money">0</td>
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
	var studentId=1;
	var payment="credit_card"
// 	document.location.href = "${contextRoot}/insertOrderList.controller?amount="+ amount + "&studentId="+studentId + "&payment="+payment;
	
// 	console.log($(':checked'))
	
	var ODIdList = [];
	$(':checked').each(function(){
		var orderDetailId= $(this).parent().next().text();
// 		console.log(orderDetailId);
		var eachODId = {"orderDetailId":orderDetailId};
// 		var eachODId = orderDetailId;
		ODIdList.push(eachODId);
	})
	
	var 
// 	console.log(ODIdList);
	var ODIdListJsonString = JSON.stringify(ODIdList);
	console.log(ODIdListJsonString);
	
	
//開始使用Ajax傳送資料	
	
	
	
	}
})


//再次選擇要購買的項目
$('.check-buy-box').change(function(){
	let total=0;
	$(':checked').each(function(){
	total += Number($(this).parent().siblings('.course-price').text())				
	})
	$('.total-money').text(total)
	
})

//一次全選
$('#selectAll').click(function(){
	
	$('input:checkbox').each(function() {
	    $(this).attr('checked', true);
	})
	let total=0;
	$(':checked').each(function(){
	total += Number($(this).parent().siblings('.course-price').text())				
	})
	$('.total-money').text(total)
	
})

//取消全選
$('#cancelAll').click(function(){
	
	$('input:checkbox').each(function () {  
	    $(this).attr('checked',false);
	});
	let total=0;
	$(':checked').each(function(){
	total += Number($(this).parent().siblings('.course-price').text())				
	})
	$('.total-money').text(total)
	
})



		$('input[type="checkbox"]').click(function() {
// 				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})















</script>

</html>