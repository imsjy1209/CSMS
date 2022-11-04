<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

	<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-camera-plus'></i>上傳活動封面</h3>
	<br>
	<form action="${pageContext.request.contextPath}/createActivityPhoto.controller" method="post" enctype="multipart/form-data">
		<p style="display: none">Id:<input type="text" name="id" value="${id}"></p>
			圖片：<input id='imgInp' type="file" name="file">
		<br>
		<br>
		預覽：
		<div class="col-md-6">
			 
			<img width="0px" id="preview_imgInp" src="#" alt="請放入照片" />
		</div>
		
		<br><input type="submit" class="btn btn-info" value="送出">
	</form>
		
    </div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>

$("#imgInp").change(function() {
	readURL(this);
	$('#preview_imgInp').attr('width','500px')
});

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#preview_imgInp").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}



//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });


</script>


</html>