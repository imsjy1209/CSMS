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

<script>



</script>

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

	<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-edit-location'></i>更改活動</h3>
	
<!-- 		<div align="center" style="width: 500px; height: 200px; margin: 0 auto;"> -->
				
			<img src="${pageContext.request.contextPath}/downloadImage/${id}" class="img-fluid img"
				style="display: block; width: 300px; height: auto; position: relative; top: 50px"
				alt="...">
			
			<form action="${pageContext.request.contextPath}/updateActivityWithCkeditor.controller" method="post">

			<p style="display: none"><input name="id" value="${activity.id}"/></p>
			<p style="display: none"><input name="added" value="${activity.added}"/></p>
				<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="${pageContext.request.contextPath}/updatePicPageController/${id}" class="btn btn-primary card-link">修改照片</a></li>
				
					<li class="list-group-item"><div align="left"
							style="float: left;">活動名稱:</div><input name="name" value="${activity.name}"/></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">活動地點:</div><input name="place" value="${activity.place}"/></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">活動日期:</div><input name="date" type="text" id="datepicker" value="${activity.date}"/></li>
					<li class="list-group-item"><div align="left"
							style="float: left;">詳細內容:</div><textarea name=contentForUpdate>${activity.content}</textarea></li>
					<c:choose>
					<c:when test="${removed == 1}">
					<li class="list-group-item"><div align="left"
							style="float: left;">上架活動:</div><a href="${contextRoot}/already/${id}"><i class='bx bxs-hand-up' style="font-size: 25px"></i></a></li>
					<li class="list-group-item">
					</c:when>
					<c:when test="${removed == 0}">
					<li class="list-group-item"><div align="left"
							style="float: left;">下架活動:</div><a href="${contextRoot}/removed/${id}"><i class='bx bxs-hand-down' style="font-size: 25px"></i></a></li>
					<li class="list-group-item">
					</c:when>
					</c:choose>
				</ul>
				<input type="submit" value="更新">
			</form>
		</div>
<!-- 	</div> -->
		
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
	$(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
          $('#sidebar').toggleClass('active');
      });
  });

  
  
  
  </script>

</html>