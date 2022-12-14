<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>Welcome</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	/* box-shadow:0px 0px 10px #ff9933 inset; */
	/* filter: drop-shadow(0px 0px 10px #ff9933); */
	color: black;
}

.announcementDiv {
	border: 2px solid slateblue;
	size: 100px;
	width: 800px;
	height: 550px;
	top: 250px;
	right: 150px;
}

button {
	border: none;
	background: none;
	outline: none;
	color: #666666;
}

.wrapper {
	width: 100%;
	margin: auto;
}

.content {
	width: 100%;
	overflow: auto;
}

.article {
	width: 70%;
	border: 1px solid blue;
	float: right;
	margin-right: 50px;
}

.aside {
	width: 10%;
	border: 1px solid red;
	float: left;
	margin-left: 50px;
}
</style>

</head>

<body>

	<!-- Student Navbar -->
	<jsp:include page="../layout/nav_student.jsp"></jsp:include>
	<br>
	<br>
	<div class="wrapper">
		<div class="content">
			<div class="aside" style="border: 5px solid red;">
				<div class="absCheckIcon " id="absCheckIcon">
					<!-- 出席 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#absentMID">
						<!-- <img src="${contextRoot}/image/absCheck.png" title="出席" alt=""
							 class="hoverLight"> -->
						<!-- <i style="font-size: 90px;" class='bx bx-checkbox-checked hoverLight' style='color:#6b6868'  ></i> -->
						<i style="font-size: 90px;" class='bx bx-calendar-check hoverLight' style='color:#6b6868'></i>
					</button>
				</div>

				<div class="lessonIcon " id="lessonIcon">
					<!-- 課程 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#courseMID">
						<!-- <img src="${contextRoot}/image/lesson.png" title="課程"
							style="border: 1px solid red;"> -->
						<i style="font-size: 90px;" class='bx bx-book hoverLight' title="課程" style='color:#6b6868' ></i>
					</button>
				</div>
				<div class="activeIcon " id="activeIcon">
					<!-- 活動 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#activityMID">
						<!-- <img src="${contextRoot}/image/active.png" title="活動" alt=""
							style="border: 1px solid red;"> -->
						<i style="font-size: 90px;" class='bx bx-universal-access hoverLight' style='color:#6b6868'></i>
					</button>
				</div>
				<div class="scoreIcon " id="scoreIcon">
					<!-- 分數 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#scoreMID">
						<!-- <img src="${contextRoot}/image/score.png" title="分數" alt=""
							style="border: 1px solid red;"> -->
							<i style="font-size: 90px;" class='bx bx-bar-chart bx-rotate-90 hoverLight' style='color:#6b6868'></i>
					</button>
				</div>

				<div class="scoreIcon " id="contactBookIcon">
					<!-- 分數 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#contactBookMID">
						<!-- <img src="${contextRoot}/image/contactbook.png" title="聯絡簿" alt=""
							style="border: 1px solid red;"> -->
						<i style="font-size: 90px;" class='bx bx-book-reader hoverLight' style='color:#6b6868'></i>
					</button>
				</div>

			</div>
			<div class="article ">
				<div class="announcementDiv">
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active" data-interval="3000" data-pause="hover">
								<img src="${contextRoot}/image/activityPhoto/01.jpg" class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<div style="background-color:rgb(255,153,51,0.7)">
	    								<!-- <h5>泳渡日月潭</h5>
										<p>讚讚讚讚讚</p> -->
									</div>
								</div>
							</div>
							<div class="carousel-item" data-interval="3000" data-pause="hover">
								<img src="${contextRoot}/image/activityPhoto/02.jpg" class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<div style="background-color:rgb(255,153,51,0.7)">
	    								<!-- <h5>大家一起來散步</h5>
										<p>喔耶喔耶喔耶</p> -->
									</div>
								</div>
							</div>
							<div class="carousel-item" data-interval="3000" data-pause="hover">
								<img src="${contextRoot}/image/activityPhoto/03.jpg" class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<div style="background-color:rgb(255,153,51,0.7)">
	    								<!-- <h5>益智模型</h5>
										<p>啦啦啦啦啦啦啦~~</p> -->
									</div>
								</div>
							</div>
							<div class="carousel-item" data-interval="3000">
								<img src="${contextRoot}/image/activityPhoto/04.jpg" class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<div style="background-color:rgb(255,153,51,0.7)">
	    								<!-- <h5>參觀博物館</h5>
										<p>有位偷看鏡頭~~齁~~</p> -->
									</div>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>

				<!-- Button trigger modal -->
				<button type="button" class="" data-toggle="modal"
					data-target="#exampleModalCenter"></button>


				<!-- Modal for Absent -->
				<div class="modal fade" id="absentMID" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-lg"
						role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>${student.name}</p>
								<table calss="table">
									<thead>
										<tr>
											<th>日期</th>
											<th>課程</th>
											<th>出席狀況</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="personalAbsent" items="${personalAbsent}">
											<tr>
												<td><fmt:formatDate pattern="yyyy-MM-dd"
														value="${personalAbsent.dayz}" /></td>
												<td>${personalAbsent.classList.course.courseSubject}</td>
												<td><c:choose>
														<c:when test="${personalAbsent.arrviedOrNot == 0}">缺席</c:when>
														<c:when test="${personalAbsent.arrviedOrNot == 1}">出席</c:when>
														<c:when test="${personalAbsent.arrviedOrNot == 2}">請假</c:when>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>


							</div>
						</div>
					</div>

				</div>
				<!-- end of modal -->


			</div>
			<!-- end of modal -->


			<!-- Modal for Course -->
			<div class="modal fade" id="courseMID" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>courseMID test</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>

				</div>
				<!-- end of modal -->

			</div>
			<!-- end of modal -->

			<!-- Modal for Activity -->
			<div class="modal fade" id="activityMID" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>activityMID test</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end of modal -->

			<!-- Modal for Score -->
			<div class="modal fade" id="scoreMID" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg"
					role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h5 class="modal-title" id="exampleModalCenterTitle">成績</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">


								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<!-- 								<p>scoreMID test</p> -->

							<c:forEach var="post" items="${scoreforStudent}">
								<table>
									<tr>
										<td>名字:${post.student.name}</td> &nbsp&nbsp&nbsp&nbsp
										<td>科目:${post.classlist.classCode}</td>&nbsp&nbsp&nbsp&nbsp
										<td>第${post.frequency}次考試</td>&nbsp&nbsp&nbsp&nbsp
										<td>${post.score}分</td>
									</tr>
								</table>
							</c:forEach>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
			<!-- end of modal -->

			<!-- Modal for ContactBook -->
			<div class="modal fade" id="contactBookMID" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">標題</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>contactBookMID test</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>

			</div>
			<!-- end of modal -->


		</div>
		<!-- end of modal -->


	</div>

	<!-- footer -->
	<jsp:include page="../footer/footer.jsp"></jsp:include>

	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
	
	</script>

</body>

</html>

