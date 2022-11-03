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

	<div class="container">
		<div align="center">
		<br><h2>建立公告</h2><br>
		
			<form action="${pageContext.request.contextPath}/postCreate" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">公告標題:</label> <input type="text"
						class="form-control" name="topic" style="width:20%">
				</div>
				<select name="userType">
				<option value="1">校方
				<option value="2">所有人
				</select>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">詳細內容:</label>
					<textarea class="form-control" name="article"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>

	
	</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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