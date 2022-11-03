<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- 【Sweet Alert】 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js" integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" crossorigin="anonymous"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>

<%-- <jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include> --%>


<c:choose>
  <c:when test="${users.groups.id == 2}">
   <!-- SCHOOL NAVBAR -->
<jsp:include page="../framePage/sideBarForNotAjaxForQueen.jsp"></jsp:include>
  </c:when>
  
  <c:when test="${users.groups.id == 1}">
   <!-- ALL NAVBAR -->
<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>
  </c:when>
 </c:choose>

<style>
.notWork{
background-color:white;
color:black;

}
</style>

	<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-message-square-edit' ></i>公告編輯</h3>
	<br>
	<form action="${contextRoot}/updatePostFin" method="post">
		<p style="display: none">
			<input name="id" value="${post.id}"/>
		</p>
			
	<div class="form-group row">

			<div class="col-sm-3">
				<div class="form-group">
					<label class="my-1 mr-2" for="exampleInputEmail1">公告標題：</label>
					<input type="text" class="form-control" name="topic"  value="${post.topic}" size="100" maxlength="30" required/>
				</div>
			</div>
			<div class="col-sm-3">
				<label class="my-1 mr-2" for="exampleInputEmail1">公告對象：</label>
				<select class="cg custom-select my-1 mr-sm-2" name="userType">
				<c:choose>
					<c:when test="${post.userType == 1}">
						<option value="1" selected>校方</option>
						<option value="2">所有人</option>			
					</c:when>
					<c:when test="${post.userType ==2}">
						<option value="1">校方</option>
						<option value="2" selected>所有人</option>
					</c:when>
				</c:choose>
				</select>
		   </div>	
		   
		   <div class="col-sm-3" style="margin-top:5px">
		   <c:choose>
					<c:when test="${post.isDelete == 1}">
					<br/>
						<span class='idForUpdate' style='display:none;'>${id}</span>
						<i class='btn btn-primary onOrOff notWork'>上架中&nbsp;<i style="font-size: 25px" class='bx bxs-chevron-up-circle'></i></i>
						<i class='btn btn-danger onOrOff'>下架中&nbsp;<i style="font-size: 25px" class='bx bxs-chevron-up-circle bx-rotate-180' ></i></i>
					</c:when>
					
					<c:when test="${post.isDelete == 0}">
					<br/>
					<span class='idForUpdate' style='display:none;'>${id}</span>
					<i class='btn btn-primary onOrOff'>上架中<i style="font-size: 25px" class='bx bxs-chevron-up-circle'></i></i>
					<i class='btn btn-danger onOrOff notWork'>下架中<i style="font-size: 25px" class='bx bxs-chevron-up-circle bx-rotate-180' ></i></i>
					
					</c:when>
				</c:choose>
		   </div>
		   
	</div><!-- end of class="form-group row" -->
				
	<div class="form-group">
		<label for="exampleFormControlTextarea1">詳細內容：</label>
		<textarea class="form-control" name="article">${post.article}</textarea>
		
	</div>
	<div style="margin-left:32%">		
		<button type="submit" class="btn btn-success">確認更改</button>
	</div>	
</form>
			
<!-- ===============for container=============== -->
	</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>

$('.onOrOff').click(function(){
	if($(this).attr('class')=='btn btn-danger onOrOff notWork'){
	$(this).removeClass('notWork')
	$(this).prev().addClass('notWork')
	var id = $(this).siblings('span').text();
	console.log(id)
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/postChangeToOff?id=" +id+ "' />", true);
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
	else{
		$(this).removeClass('notWork')	
		$(this).next().addClass('notWork')	
		var id = $(this).siblings('span').text();
	console.log(id)
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/postChangeToOn?id=" +id+ "' />", true);
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
	
})	


//=======================版面動作=======================
	
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});

		CKEDITOR.replace('article');
		CKEDITOR.config.width = 800;
		CKEDITOR.config.height = 300;
</script>


</html>