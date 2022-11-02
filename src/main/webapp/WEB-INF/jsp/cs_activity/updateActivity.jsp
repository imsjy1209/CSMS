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
color:black;

}
</style>

<div class="container">
	<h3 class='main-title'>
		<i style='font-size: 36px;' class='bx bxs-edit-location'></i>更改活動
	</h3>

<form action="${pageContext.request.contextPath}/updateActivityWithCkeditor.controller" method="post">
	<p style="display: none"><input class="aId" name="id" value="${activity.id}" /></p>
	<p style="display: none"><input name="added" value="${activity.added}" /></p>
<table border="1">

<tr>
<td align='center' valign="middle"><img src="${pageContext.request.contextPath}/downloadImage/${id}"
		class="img-fluid img"
		style="display: block; width: 300px; height: auto;"
		alt="...">
</td>
		
		
<td>
<table>

<tr>
<td><label class="my-1 mr-2" for="exampleInputEmail1">活動名稱:</label>
    <input type="text" class="form-control" name="name" value="${activity.name}" /></td>
</tr>

<tr>
<td><label class="my-1 mr-2" for="exampleInputEmail1">活動地點:</label>
					<input type="text" class="form-control" name="place" value="${activity.place}" /></td>
</tr>

<tr>
<td><label class="my-1 mr-2" for="exampleInputEmail1">活動日期:</label>
					<input type="text" class="form-control" name="date" type="text" id="datepicker" value="${activity.date}" /></td>
</tr>

</table>
</td>

</tr>

<tr>
<td colspan="2">
	<div style="display:flex; justify-content:center;">
	<a style="margin:10px;" href="${pageContext.request.contextPath}/updatePicPageController/${id}" class="btn btn-primary card-link">修改照片</a>
	<button style="margin:10px; width:100px" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong"><i style="font-size:36px" class='bx bx bxs-show'></i></button>
	<span style="display:none;" class="removedVal">${activity.removed}</span>
<i style="margin:10px" class='btn btn-primary onOrOff on1'>上架中<i style="font-size: 25px" class='bx bxs-chevron-up-circle'></i></i>
<i style="margin:10px" class='btn btn-danger onOrOff on2'>下架中<i style="font-size: 25px" class='bx bxs-chevron-up-circle bx-rotate-180' ></i></i>
	</div>
</td>
</tr>

<tr>
<td colspan="2"><textarea name=contentForUpdate>${activity.content}</textarea></td>
</tr>

<tr>
<td align='center' valign="middle" colspan="2"><input type="submit" class="btn btn-primary" value="更新"/></td>
</tr>

</table>
</form>



	<!-- 		<div align="center" style="width: 500px; height: 200px; margin: 0 auto;"> -->
<!-- <div align="center"> -->
<!-- <div class="container"> -->

<%-- 	<form action="${pageContext.request.contextPath}/updateActivityWithCkeditor.controller" method="post"> --%>
<%-- 		<p style="display: none"><input name="id" value="${activity.id}" /></p> --%>
<%-- 		<p style="display: none"><input name="added" value="${activity.added}" /></p> --%>
		

		
<!-- 		<ul class="list-group list-group-flush"  style="width:300px;"> -->
<!-- 			<li class="list-group-item"><a -->
<%-- 				href="${pageContext.request.contextPath}/updatePicPageController/${id}" --%>
<!-- 				class="btn btn-primary card-link">修改照片</a> -->
<!-- 				<i class='btn btn-primary onOrOff'>上架中<i style="font-size: 25px" class='bx bxs-chevron-up-circle'></i></i> -->
<!-- 				<i class='btn btn-danger onOrOff notWork'>下架中<i style="font-size: 25px" class='bx bxs-chevron-up-circle bx-rotate-180' ></i></i> -->
<!-- 			</li> -->

<!-- 			<li class="list-group-item"><div align="left" -->
<!-- 					style="float: left;">活動名稱: </div> <input name="name" -->
<%-- 				value="${activity.name}" /></li> --%>
<!-- 			<li class="list-group-item"><div align="left" -->
<!-- 					style="float: left;">活動地點: </div> <input name="place" -->
<%-- 				value="${activity.place}" /></li> --%>
<!-- 			<li class="list-group-item"><div align="left" -->
<!-- 					style="float: left;">活動日期: </div> <input name="date" type="text" -->
<%-- 				id="datepicker" value="${activity.date}" /></li> --%>
<!-- 			<li class="list-group-item"><div align="left" -->
<!-- 					style="float: left;">參加名單: </div> -->
<!-- 				<button type="button" class="btn btn-primary" data-toggle="modal" -->
<!-- 					data-target="#exampleModalLong"><i class='bx bx bxs-show'></i></button></li> -->
<!-- 		</ul> 		 -->
<!-- 	</div>	 -->
			
<!-- 		<ul> 				 -->
<!-- 			<li class="list-group-item"><div align="left" -->
<%-- 					style="float: left;">詳細內容: </div> <textarea name=contentForUpdate>${activity.content}</textarea></li> --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${removed == 1}"> --%>
<!-- 					<li class="list-group-item"><div align="left" -->
<!-- 							style="float: left;">上架活動: </div> <a -->
<%-- 						href="${contextRoot}/already/${id}"><i class='bx bxs-hand-up' --%>
<!-- 							style="font-size: 25px"></i></a></li> -->
<!-- 					<li class="list-group-item"> -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${removed == 0}"> --%>
<!-- 					<li class="list-group-item"><div align="left" -->
<!-- 							style="float: left;">下架活動:</div> <a -->
<%-- 						href="${contextRoot}/removed/${id}"><i --%>
<!-- 							class='bx bxs-hand-down' style="font-size: 25px"></i></a></li> -->
<!-- 					<li class="list-group-item"> -->
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>
<!-- 		</ul> -->
<!-- 		<div align="center"> -->
<!-- 		<input type="submit" value="更新"/> -->
<!-- 		</div> -->
<!-- 	</form> -->

<!-- </div> -->


<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">參加名單</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:forEach var="student" items="${activity.students}">
						<div class="card"
							style="width: 10em; float: left; padding: 15px 20px; margin: 5px 10px 15px 20px">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">${student.name}</li>
							</ul>
						</div>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>					
				</div>
			</div>
		</div>
	</div>
<!-- 	</div> -->


<!-- ================for Side Bar==================	 -->
</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
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
		console.log("gogogogogo")
		var onOrOff = $('.removedVal').text();
			if(onOrOff==0){
				$('.on2').addClass('notWork')
			}
			else{
				$('.on1').addClass('notWork')
			}
			
		})
		
		
		
		$(document).on('click','.onOrOff',function(){
			var onOrOff = $('.removedVal').text();
			if(onOrOff=='0' && $(this).text()=='下架中'){
				$('.removedVal').text('1')
				$('.on1').attr('class','btn btn-primary onOrOff on1 notWork')
				$('.on2').attr('class','btn btn-danger onOrOff on2')
				
				var id=$('.aId').val();
				console.log(id)
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/removed/" + id + "' />", true);
				xhr.send();
				
			}
			else if(onOrOff=='1' && $(this).text()=='上架中'){
				$('.removedVal').text('0')
				$('.on1').attr('class','btn btn-primary onOrOff on1')
				$('.on2').attr('class','btn btn-danger onOrOff on2 notWork')
				
				var id=$('.aId').val();
				console.log(id)
		
				
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/already/" + id + "' />", true);
				xhr.send();
				
			}
			else{
				console.log('nothing happened')
			}
			
			
		})
		
		
		
</script>

</html>