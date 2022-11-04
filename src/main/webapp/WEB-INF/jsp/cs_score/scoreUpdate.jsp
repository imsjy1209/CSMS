<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<style>
.topbtn {
	text-align: center;
	width: 500px;
	margin: auto;
}

.container {
	width: 1500px;
	margin: auto;
}

.input{border:0;
  background-color:#003C9D;
  color:#fff;
  border-radius:10px;
  cursor:pointer;}

.input:hover{
  color:#003C9D;
  background-color:#fff;
  border:2px #003C9D solid;
}
</style>

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

	<div class="container">
		<h3 class='main-title'><i style='font-size:36px;' class='bx bx-search-alt-2'></i>班級成績編輯</h3>
           
		<br>
	<form action="${contextRoot}/scoreDataUpdateAAA" method="POST"
		class="row g-3 form1" enctype="multipart/form-data">
		
		<input type="hidden" name="scoreId" class="form-control" id="scoreId"
				value="${score1.id}">
		<div class="col-12">
			<label for="inputScore" class="form-label">請輸入成績</label>
			<input type="text" name="score" class="form-control" id="inputScore"
				value="${score1.score}">
		</div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary" >Update</button>
			<a type="button" class="btn btn-dark" href="${contextRoot}/scoreaList.controller">Go To All score Data</a>
			${msg.ok}
		</div>
	</form>
</div>

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script>	
	$("#imgInp").change(function() {
		readURL(this);
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
</script>
</body>
</html>