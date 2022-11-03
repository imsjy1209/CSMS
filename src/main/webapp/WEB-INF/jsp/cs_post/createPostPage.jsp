<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>

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
	<br>
	<div class="container">
		<div>
		<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-message-square-edit' ></i>新增公告</h3>
		<br>
		<form action="${pageContext.request.contextPath}/postCreate" method="post">
			<div class="form-group row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="exampleInputEmail1">公告標題：</label> 
						<input type="text" class="form-control" name="topic" size="100" maxlength="30" required/>
					</div>
				</div>
			
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputEmail1">公告對象：</label>
					<select class="cg custom-select my-1 mr-sm-2" name="userType">
						<option value="1" selected>校方</option>
						<option value="2">所有人</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">詳細內容：</label>
				<textarea class="form-control" name="article"></textarea>
			</div>
			<div style="margin-left:32%">		
				<button type="submit" class="btn btn-success">確認送出</button>
			</div>
		</form>
	</div>
</div>

	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 【Sweet Alert】 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js" 
	integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" 
	crossorigin="anonymous"></script>
<script>


CKEDITOR.replace('article');
CKEDITOR.config.width = 800;
CKEDITOR.config.height = 300;

$('.showModalEye').click(function(){
	var articleHtml = $(this).parent().siblings('.articleTd').html();
// 	console.log(articleHtml)
	$('.modal-body').html(articleHtml)
	
	var updateTimeText = $(this).parent().siblings('.updateTimeTd').text();
	$('.modal-footer').html(updateTimeText)
	
	var topicText = $(this).parent().siblings('.topicTd').text();
	$('.modal-title').html(topicText)
	
})

//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });


</script>


</html>