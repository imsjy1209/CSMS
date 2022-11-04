<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>


<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

<style>
.notWork{
	background-color:white;
	color: black;
}

</style>

<div class="container">
	<h3 class='main-title'>
		<i style='font-size: 36px;' class='bx bxs-universal-access'></i>更改活動
	</h3>
	<br>
<form action="${contextRoot}/updateActivityWithCkeditor.controller" method="post">

	<p style="display: none"><input class="aId" name="id" value="${activity.id}" /></p>
	<p style="display: none"><input name="added" value="${activity.added}" /></p>
	
	<table style="width:70%">
		<tbody>
			<tr>
				<td class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputEmail1">活動封面：</label>
					<div>
						<img src="${contextRoot}/downloadImage/${id}" class="img-fluid img" 
							 style="width:300px;height:auto;margin:auto;position:relative;">
						<a href="${contextRoot}/updatePicPageController/${id}">
							<i class='bx bxs-edit-alt' 
							   style="font-size:20px;background-color:rgb(73,73,73,0.5);color:white;position:absolute;bottom:1px;left:294px;"></i>
						</a>
					</div>
				</td>
			<tr>
		</tbody>
		<tbody>
			<tr>
				<td>
					<div class="form-group row" style="padding-left:13px;">
						<div class="col-sm-3">
							<label class="my-1 mr-2" for="exampleInputEmail1">活動名稱：</label>
							<input type="text" class="form-control" name="name" value="${activity.name}" size="50" maxlength="50" required/>
						</div>
						<div class="col-sm-3">
							<label class="my-1 mr-2" for="exampleInputEmail1">活動地點：</label>
							<input type="text" class="form-control" name="place" value="${activity.place}" size="50" maxlength="50" required/>	
						</div>
						<div class="col-sm-3">				
							<label class="my-1 mr-2" for="exampleInputEmail1">活動日期：</label>
							<input type="text" class="form-control" name="date" type="text" id="datepicker" value="${activity.date}" size="50" maxlength="50" required/>					
						</div>
						<div class="col-sm-3">				
							<label class="my-1 mr-2" for="exampleInputEmail1">功能：</label>
							<span style="display:none;" class="removedVal">${activity.removed}</span>

							<div class="btn-group" role="group" aria-label="Basic example">
		  						<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModalLong">名單</button>
		  						<button type="button" class="btn btn-info onOrOff on1">上架</button>
		  						<button type="button" class="btn btn-danger onOrOff on2">下架</button>
							</div>				
						</div>
					</div>
				</td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<td colspan="2"><textarea name=contentForUpdate>${activity.content}</textarea></td>
			</tr>
			<tr>
				<td align='center' valign="middle" colspan="2">
					<br>
					<input type="submit" class="btn btn-primary" value="更新"/>
				</td>
			</tr>
		</tbody>
	</table>
</form>

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">參加名單</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<c:forEach var="student" items="${activity.students}">
					<div class="card" style="width: 10em; float: left; padding: 15px 20px; margin: 5px 10px 15px 20px">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">${student.name}</li>
						</ul>
					</div>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>					
			</div>
		</div>
	</div>
</div>
</div>
<!-- ================for Side Bar==================	 -->
</div>
</body>

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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			appendText : "(西元年-月-日)",
			altField : "#datepicker",
			altFormat : "yy-mm-dd",
			dateFormat : "yy-mm-dd"
		});
	});

	CKEDITOR.replace('contentForUpdate');
	CKEDITOR.config.width = 800;
	CKEDITOR.config.height = 300;

	//=======================版面動作=======================
	$(document).ready(function() {
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').toggleClass('active');
		});
	});
	//=======================參加人數=======================
	$('.showModalEye').click(function() {
		var articleHtml = $('#dataArea').html();
		//	 	console.log(articleHtml)
		$('.modal-body').html(articleHtml)

		//var updateTimeText = $(this).parent().siblings('.updateTimeTd').text();
		//$('.modal-footer').html(updateTimeText)

		//var topicText = $(this).parent().siblings('.topicTd').text();
		//$('.modal-title').html(topicText)

	})
	
	//============上下架========================
		window.onload =(function(){
			// console.log("gogogogogo")
			var onOrOff = $('.removedVal').text();
			console.log(onOrOff);
			if(onOrOff==0){ // 上架
				$('.on2').addClass('notWork');
			}
			else{ // 下架
				$('.on1').addClass('notWork');
			}
				
		});
		
		
		
		$(document).on('click','.onOrOff',function(){
			var onOrOff = $('.removedVal').text();
			if(onOrOff=='0' && $(this).text()=='下架'){
				$('.removedVal').text('1');
				$('.on1').attr('class','btn btn-info onOrOff on1 notWork');
				$('.on2').attr('class','btn btn-danger onOrOff on2');
				
				var id=$('.aId').val();
				console.log(id);
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/removed/" + id + "' />", true);
				xhr.send();
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已下架'
				})
				//===End of 更改成功alert======
				
			}
			else if(onOrOff=='1' && $(this).text()=='上架'){
				$('.removedVal').text('0');
				$('.on1').attr('class','btn btn-info onOrOff on1');
				$('.on2').attr('class','btn btn-danger onOrOff on2 notWork');
				
				var id=$('.aId').val();
				console.log(id)
		
				
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/already/" + id + "' />", true);
				xhr.send();
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已上架'
				})
				//===End of 更改成功alert======
				
			}
			else{
				console.log('nothing happened');
			}
			
			
		})
		
		
		
</script>

</html>