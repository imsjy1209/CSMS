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
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-message-square-edit' ></i>編輯活動</h3>
			<form action="${contextRoot}/updatePostFin" method="post">
			<p style="display: none"><input name="id" value="${post.id}"/></p>
			
<div class="form-group row">

			<div class="col-sm-3">
				<div class="form-group">
					<label class="my-1 mr-2" for="exampleInputEmail1">公告標題:</label>
					<input type="text" class="form-control" name="topic" style="width:70%" value="${post.topic}">
				</div>
			</div>
			
		
			<div class="col-sm-3">
				<label class="my-1 mr-2" for="exampleInputEmail1">公告對象:</label>
				<select class="cg custom-select my-1 mr-sm-2" name="userType">
				<c:choose>
					<c:when test="${post.userType == 1}">
							<option value="1" selected>校方
							<option value="2">所有人					
					</c:when>
					<c:when test="${post.userType ==2}">
							<option value="1">校方
							<option value="2" selected>所有人
					</c:when>
				</c:choose>
				</select>
		   </div>	
		   
		   <div class="col-sm-3">
		   <c:choose>
					<c:when test="${post.isDelete == 1}">
					<br/>
					<a href="${contextRoot}/postChangeToOn/${id}" class='btn btn-primary'>上架<i style="font-size: 25px" class='bx bxs-chevron-up-circle'></i></a>
<%-- 					<li class="list-group-item"><div align="left" style="float: left;">上架活動:</div><a href="${contextRoot}/post/already/${id}"><i style="font-size: 25px" class='bx bxs-chevron-up-circle'></i></a></li> --%>
					</c:when>
					
					<c:when test="${post.isDelete == 0}">
					<br/>
					<a href="${contextRoot}/postChangeToOff/${id}" class='btn btn-danger'>下架<i style="font-size: 25px" class='bx bxs-chevron-up-circle bx-rotate-180' ></i></a>
<%-- 					<li class="list-group-item"><div align="left" style="float: left;">下架活動:</div><a href="${contextRoot}/post/removed/${id}"><i style="font-size: 25px" class='bx bxs-chevron-up-circle bx-rotate-180' ></i></a></li> --%>
					</c:when>
				</c:choose>
		   </div>
</div>	
				<div class="form-group">
					<label for="exampleFormControlTextarea1">詳細內容:</label>
					<textarea class="form-control" name="article">${post.article}</textarea>
				</div>
				
				
				<button type="submit" class="btn btn-primary">Submit</button>
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