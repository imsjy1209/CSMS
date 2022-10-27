<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<title>Test</title>
			<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
			<style>
				.scoreIcon {
					
					top: 500px;
					left: 120px;
				}

				.lessonIcon {
					
					top: 375px;
					left: 120px;
				}

				.absCheckIcon {
					

					top: 250px;
					left: 120px;
				}

				.activeIcon {
					
					top: 625px;
					left: 120px;
				}

				.hoverLight:hover {
					filter: drop-shadow(0px 0px 10px #000000);
				}

				.announcementDiv {
					border: 2px solid slateblue;
					size: 100px;
					width: 1000px;
					height: 300px;
					
					top: 250px;
					right: 150px;
				}

				button {
					border: none;
					background: none;
					outline: none;

					color: #666666;
				}

				.content{
					width:100%;
					overflow: auto;
				}
				.article {
					width: 70%;
					border: 1px solid blue;
					float:right;
				}

				.aside{
					width: 28%;
					border: 1px solid red;
					float:left;
				}
			</style>
		</head>

		<body>
			
			<jsp:include page="../layout/navDong.jsp"></jsp:include>
			<div class=""><p>輪播區</p> </div>
	<div class="content">
		<div class="aside" style="border: 5px solid red;">
			<div class="absCheckIcon hoverLight" id="absCheckIcon">
				<!-- 出席 button 的 data-target 要改-->
				<button type="button" class="" data-toggle="modal" data-target="#absentMID">
					<img src="${contextRoot}/image/absCheck.png" title="出席" alt="" style="border: 1px solid red;">
				</button>
			</div>

			<div class="lessonIcon hoverLight" id="lessonIcon">
				<!-- 課程 button 的 data-target 要改-->
				<button type="button" class="" data-toggle="modal" data-target="#courseMID">
					<img src="${contextRoot}/image/lesson.png" title="課程" style="border: 1px solid red;">
				</button>
			</div>

			<div class="activeIcon hoverLight" id="activeIcon">
				<!-- 活動 button 的 data-target 要改-->
				<button type="button" class="" data-toggle="modal" data-target="#activityMID">
					<img src="${contextRoot}/image/active.png" title="活動" alt="" style="border: 1px solid red;">
				</button>
			</div>

			<div class="scoreIcon hoverLight" id="scoreIcon">
				<!-- 分數 button 的 data-target 要改-->
				<button type="button" class="" data-toggle="modal" data-target="#scoreMID">
					<img src="${contextRoot}/image/score.png" title="分數" alt="" style="border: 1px solid red;">
				</button>
			</div>

			<div class="scoreIcon hoverLight" id="contactBookMID">
				<!-- 分數 button 的 data-target 要改-->
				<button type="button" class="" data-toggle="modal" data-target="#scoreMID">
					<img src="${contextRoot}/image/contactbook.png" title="聯絡簿" alt="" style="border: 1px solid red;">
				</button>
			</div>

		</div>		
			<div class="article ">
				<div class="announcementDiv">
					<h1>左邊目前只有第三個按鈕有接modal</h1>

				</div>

				<!-- Button trigger modal -->
				<button type="button" class="" data-toggle="modal" data-target="#exampleModalCenter">

				</button>

				<!-- Modal for Absent -->
				<div class="modal fade" id="absentMID" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>absentMID test</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div><!-- end of modal -->
				
				<!-- Modal for Course -->
				<div class="modal fade" id="courseMID" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>courseMID test</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div><!-- end of modal -->
				
				<!-- Modal for Activity -->
				<div class="modal fade" id="activityMID" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>activityMID test</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div><!-- end of modal -->
				
				<!-- Modal for Score -->
				<div class="modal fade" id="scoreMID" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>scoreMID test</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div><!-- end of modal -->
				
				<!-- Modal for ContactBook -->
				<div class="modal fade" id="contactBookMID" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>contactBookMID test</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div><!-- end of modal -->
				
			</div>
		</div>	
	</div>
			<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
			<script>

			</script>
		</body>

		</html>