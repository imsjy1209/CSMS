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
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-building-house'></i>建立活動</h3>
	
			<form action="${pageContext.request.contextPath}/createActivityWithCkeditor.controller" method="post">
	<div class="form-group row">
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputEmail1">活動名稱:</label>
					<input type="text" class="form-control" name="name" style='width:70%'>
				</div>
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputPassword1">地點:</label>
					<input type="text" class="form-control" name="place" style='width:70%'>
				</div>
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputPassword1">日期:</label>
					<input type="text" class="form-control" name="date" id="datepicker" style='width:70%'>
				</div>
	</div>	
				<div class="form-group">
					<label for="exampleFormControlTextarea1">詳細內容:</label>
					<textarea class="form-control" name="contentDetail"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		
    </div>
	
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

CKEDITOR.replace('contentDetail');
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