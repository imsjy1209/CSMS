<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>


	<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-registered'></i>新增註冊</h3>
	<div class="row g-3 form1">
		<div class="col-md-4">
			<span>選擇對象:</span>
			<select id="type">
				<option value="2">導師</option>
				<option value="3">講師</option>
				<option value="4">學生</option>
				<option value="5">家長</option>
			</select>
			<button id='btn01' class="btn btn-info">Send</button>
		</div>
	</div>
	
		<div style="clear: both;" id='dataArea'>&nbsp;</div>
			
			
	</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
window.onload = function() {
	btn01.onclick = function() {
		var type = document.getElementById("type").value;
		//console.log(type);
		var htmlSeg = ""
			if (type == "2") {
				console.log(type);
				console.log("ON");
				
				htmlSeg +=
				'<form action=${pageContext.request.contextPath}/register/addschool2 method="get" class="row g-3 form1" enctype="multipart/form-data">'+
					'<div class="col-md-4">'+
						'<label for="account" class="form-label">帳號</label>'+
						'<input type="text" name="account" class="form-control" id="account">'+
					'</div>'+
					'<div class="col-md-4">'+
						'<label for="password" class="form-label">密碼</label>'+
			            '<input type="password" name="password" class="form-control" id="password">'+
					'</div>'+
					'<div class="col-md-4">'+
						'<label for="name" class="form-label">名字</label>'+
			            '<input type="text" name="name" class="form-control" id="name">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="title" class="form-label">職位</label>'+
						 '<input type="text" name="title" class="form-control" id="title">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="hiredate" class="form-label">聘用日期</label>'+
						 '<input type="text" name="hiredate" id="datepicker" class="form-control" id="hiredate">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="resigndate" class="form-label">離職</label>'+ 
						'<input type="text" name="resigndate" id="datepicker2" class="form-control" id="resigndate">'+
					'</div>'+
					'<div class="col-12">'+
					'</br>'+
						'<button type="submit" class="btn btn-primary">註冊</button>'+
					'</div>'+
				'</form>';
				
			}if (type == "3") {
				htmlSeg +=
				'<form action=${pageContext.request.contextPath}/register/addteacher2 method="get" class="row g-3 form1" enctype="multipart/form-data">'+
				'<div class="col-md-4">'+
					'<label for="account" class="form-label">帳號</label>'+
					'<input type="text" name="account" class="form-control" id="account">'+
				'</div>'+
				'<div class="col-md-4">'+
					'<label for="password" class="form-label">密碼</label>'+
		            '<input type="password" name="password" class="form-control" id="password">'+
				'</div>'+
				'<div class="col-md-4">'+
					'<label for="name" class="form-label">名字</label>'+
		            '<input type="text" name="name" class="form-control" id="name">'+
				'</div>'+
		        '<div class="col-md-4">'+
					'<label for="title" class="form-label">職位</label>'+
					 '<input type="text" name="title" class="form-control" id="title">'+
				'</div>'+
		        '<div class="col-md-4">'+
					'<label for="hiredate" class="form-label">聘用日期</label>'+
					 '<input type="text" name="hiredate" id="datepicker" class="form-control" id="hiredate">'+
				'</div>'+
		        '<div class="col-md-4">'+
					'<label for="resigndate" class="form-label">離職</label>'+ 
					'<input type="text" name="resigndate" id="datepicker2" class="form-control" id="resigndate">'+
				'</div>'+
		        '<div class="col-md-4">'+
					'<label for="expertise" class="form-label">專長</label>'+ 
					'<input type="text" name="expertise" class="form-control" id="expertise">'+
				'</div>'+
				'<div class="col-12">'+
				'</br>'+
					'<button type="submit" class="btn btn-primary">註冊</button>'+
					
				'</div>'+
				'</form>'+
				'<button type="submit" class="btn btn-dark oneKey">OneKey</button>';
			
			}if (type == "4") {
				
				htmlSeg +=
					'<form action=${pageContext.request.contextPath}/register/addteacher2 method="get" class="row g-3 form1" enctype="multipart/form-data">'+
					'<div class="col-md-4">'+
						'<label for="account" class="form-label">帳號</label>'+
						'<input type="text" name="account" class="form-control" id="account">'+
					'</div>'+
					'<div class="col-md-4">'+
						'<label for="password" class="form-label">密碼</label>'+
			            '<input type="password" name="password" class="form-control" id="password">'+
					'</div>'+
					'<div class="col-md-4">'+
						'<label for="name" class="form-label">名字</label>'+
			            '<input type="text" name="name" class="form-control" id="name">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="gender" class="form-label">性別</label>'+
						 '<input type="text" name="gender" class="form-control" id="gender">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="schoolType" class="form-label">教育階段</label>'+
						 '<input type="text" name="schoolType" class="form-control" id="schoolType">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="schoolName" class="form-label">就讀學校</label>'+ 
						'<input type="text" name="schoolName" class="form-control" id="schoolName">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="grade" class="form-label">年級</label>'+ 
						'<input type="text" name="grade" class="form-control" id="grade">'+
					'</div>'+
			        '<div class="col-md-4">'+
						'<label for="parentname" class="form-label">(選填)父母名字</label>'+ 
						'<input type="text" name="parentname" class="form-control" id="parentname">'+
					'</div>'+
		        	'<div class="col-md-4">'+
						'<label for="relationship" class="form-label">(選填)關係</label>'+ 
						'<input type="text" name="relationship" class="form-control" id="relationship">'+
					'</div>'+
					'<div class="col-12">'+
					'</br>'+
						'<button type="submit" class="btn btn-primary">註冊</button>'+
					'</div>'+
				'</form>';
				
				}if (type == "5") {
					
					htmlSeg +=
						'<form action=${pageContext.request.contextPath}/register/addParent2 method="get" class="row g-3 form1" enctype="multipart/form-data">'+
						'<div class="col-md-4">'+
							'<label for="account" class="form-label">帳號</label>'+
							'<input type="text" name="account" class="form-control" id="account">'+
						'</div>'+
						'<div class="col-md-4">'+
							'<label for="password" class="form-label">密碼</label>'+
				            '<input type="password" name="password" class="form-control" id="password">'+
						'</div>'+
						'<div class="col-md-4">'+
							'<label for="name" class="form-label">名字</label>'+
				            '<input type="text" name="name" class="form-control" id="name">'+
						'</div>'+
				        '<div class="col-md-4">'+
							'<label for="gender" class="form-label">性別</label>'+
							 '<input type="text" name="gender" class="form-control" id="gender">'+
						'</div>'+
				        '<div class="col-md-4">'+
							'<label for="tel" class="form-label">電話</label>'+
							 '<input type="text" name="tel" class="form-control" id="tel">'+
						'</div>'+
				        '<div class="col-md-4">'+
							'<label for="email" class="form-label">信箱</label>'+ 
							'<input type="text" name="email" class="form-control" id="email">'+
						'</div>'+
						'<div class="col-12">'+
						'</br>'+
							'<button type="submit" class="btn btn-primary">註冊</button>'+
						'</div>'+
					'</form>';
					
					}
		dataArea.innerHTML = htmlSeg;
		$(function() {
			$("#datepicker").datepicker({
// 				appendText : "(西元年-月-日)",
				altField : "#datepicker",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		});
		$(function() {
			$("#datepicker2").datepicker({
// 				appendText : "(西元年-月-日)",
				altField : "#datepicker2",
				altFormat : "yy-mm-dd",
				dateFormat : "yy-mm-dd"
			});
		});
	}
}

//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
    
	  $(document).on('click','.oneKey',function(){
				console.log('gogogogogoggo')
	    		console.log($('input'))
	    		$('input').eq(0).val('BA099')
	    		$('input').eq(1).val('abc12345')
	    		$('input').eq(2).val('MAX')
	    		$('input').eq(3).val('實習教師')
	    		$('input').eq(4).val('2022-11-06')
	    		$('input').eq(5).val('2023-11-06')
	    		$('input').eq(6).val('大學英文')
	  })

</script>


</html>