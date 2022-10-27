<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>Test</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
	.scoreIcon{
		position:absolute;
		top: 500px;
		left: 120px;
	}
	.lessonIcon{
		position:absolute;
		top: 375px;
		left: 120px;
	}
	.absCheckIcon{
		position:absolute;
		top: 250px;
		left: 120px;
	}
	.activeIcon{
		position:absolute;
		top: 625px;
		left: 120px;
	}
	.hoverLight:hover{
		filter: drop-shadow(0px 0px 10px #000000);
	}
	.announcementDiv{
		border: 2px solid slateblue;
		size: 100px;
		width:1000px;
		height: 300px;
		position: absolute;
		top: 250px;
		right: 150px;
	}
	button{
    border: none;
    background: none;
    outline: none;
    
    color: #666666;
	}
</style>
</head>
<body>
    <jsp:include page="../layout/navDong.jsp"></jsp:include>

	<div class="absCheckIcon hoverLight" id ="absCheckIcon">
		<!-- 出席 button 的 data-target 要改-->
		<button type="button" class="" data-toggle="modal" data-target="#">
			<img src="${contextRoot}/image/absCheck.png" title="出席" alt="" style="border: 1px solid red;">
		</button>
	</div>
	<div class="lessonIcon hoverLight" id="lessonIcon">
		<!-- 課程 button 的 data-target 要改-->
		<button type="button" class="" data-toggle="modal" data-target="#">
			<img src="${contextRoot}/image/lesson.png" title="課程" style="border: 1px solid red;">
		</button>
	</div>
	<div class="activeIcon hoverLight" id="activeIcon">
		<!-- 活動 button 的 data-target 要改-->
		<button type="button" class="" data-toggle="modal" data-target="#">
			<img src="${contextRoot}/image/active.png" title="活動" alt="" style="border: 1px solid red;">
		</button>
	</div>
	<div class="scoreIcon hoverLight" id="scoreIcon">
		<!-- 分數 button 的 data-target 要改-->
		<button type="button" class="" data-toggle="modal" data-target="#exampleModalCenter">
			<img src="${contextRoot}/image/score.png" title="分數" alt="" style="border: 1px solid red;">
		</button>
	</div>

	<div class="announcementDiv">
		<h1>左邊目前只有第三個按鈕有接modal</h1>

	</div>

	<!-- Button trigger modal -->
<button type="button" class="" data-toggle="modal" data-target="#exampleModalCenter">
	
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  <p>test</p>
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  <button type="button" class="btn btn-primary">Save changes</button>
		</div>
	  </div>
	</div>
  </div><!-- end of modal -->

	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		
	</script>
</body>
</html>