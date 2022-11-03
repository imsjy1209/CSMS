<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<title>Welcome</title>
				<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
				<!-- BOX ICONS -->
				<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
					integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
					crossorigin="anonymous" referrerpolicy="no-referrer" />
				<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
				<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
				<style>
					* {
						margin: 0px;
						padding: 0px;
					}
					:root{
						--bg:#222;
						/* --bg:white; */
					}
					.wrapper{
						background-color: var(--bg);
					}
					.announcementDiv {
						justify-content: center;
						width: 100%;
						/* border: 2px solid slateblue;	 */
					}
					
					.aside {
						/* border: 1px solid red;  */
						margin-left: 50px;
						margin-top: 5px;
						position: relative;
						
					}
					.btnli {
						border: none;
						background-color: transparent;
					}
					/* start with icon css */
					.menu ul{
						position: relative;
						display: flex;
						gap: 50px;
						justify-content: center;
						margin-top: 20px;
					}
					
					.menu ul li{
						position: relative;
						list-style: none;
						width: 80px;
						height: 80px;
						display: flex;
						justify-content: center;
						align-items: center;
						cursor: pointer;
						transition: 0.5s;
						top: 50%;
					}
					.menu ul li:hover{
						z-index: 10000;
						transform: scale(0.75);
					}	
					.menu ul li::before{
						content: '';
						position:absolute;
						inset: 30px;
						box-shadow: 0 0 0 10px var(--clr),
						0 0 0 15px var(--bg),
						0 0 0 22px var(--clr);
						transition: 0.5s;
					}
					.menu ul li:hover:before{
						inset: 0px;
					}

					.menu ul li::after{
						content: '';
						position:absolute;
						inset: 0;
						background: var(--bg);
						transform: rotate(45deg);
					}
					.menu ul li a {
						position: relative;
						text-decoration: none ;
						color: var(--clr);
						z-index: 10;
						font-size: 2em;
						transition: 0.5s;
					}
					
					.menu ul li:hover a{
						font-size: 3em;
						filter: drop-shadow(0 0 20px var(--clr))
								drop-shadow(0 0 40px var(--clr))
								drop-shadow(0 0 60px var(--clr));			
					}
				</style>

			</head>

			<body>
				<!-- Student Navbar -->
				<jsp:include page="../layout/nav_student.jsp"></jsp:include>
				<!-- Modal選單區 -->
				<div class="wrapper">
							<div class="announcementDiv"><!-- 輪播區 -->
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
									<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
									</ol>
									<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${contextRoot}/image/activityPhoto/01.jpg" class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="${contextRoot}/image/activityPhoto/02.jpg" class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="${contextRoot}/image/activityPhoto/03.jpg" class="d-block w-100" alt="...">
									</div>
									<div class="carousel-item">
										<img src="${contextRoot}/image/activityPhoto/04.jpg" class="d-block w-100" alt="...">
									</div>
									</div>
									<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
									</a>
									<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
									</a>
								</div>
							</div><!-- end of class=announcementDiv -->
							<div class="aside"><!--  按鈕icon-->
								<div class="menu">
									<ul>
										<li style="-i: 0.1s;--clr:#1877f2;">
											<a class="absCheckIcon btnli" data-toggle="modal" data-target="#absentMID">
												<i class='bx bx-calendar-check hoverLight'> </i>
											</a>
										</li>
										<li style="-i: 0.2s;--clr:#ff0000;">
											<a class="lessonIcon btnli" data-toggle="modal" data-target="#courseMID">
												<i class='bx bx-book hoverLight' title="課程"></i>
											</a>
										</li>
										<li style="-i: 0.3s;--clr:#f69930;">
											<a class="contactBookIcon btnli" data-toggle="modal" data-target="#classMID">
												<i class='bx bx-barcode'></i>
											</a>
										</li>
										<li style="-i: 0.4s;--clr:#1da1f2;">
											<a class="activeIcon btnli" data-toggle="modal" data-target="#activityMID">
												<i class='bx bx-universal-access hoverLight'></i>
											</a>
										</li>
										<li style="-i: 0.5s;--clr:#25d366;">
											<a class="scoreIcon btnli" data-toggle="modal" data-target="#scoreMID">
												<i class='bx bx-bar-chart hoverLight'></i>
											</a>
										</li>
										<li style="-i: 0.6s;--clr:#c32aa3;">
											<a class="contactBookIcon btnli" data-toggle="modal" data-target="#contactBookMID">
												<i class='bx bx-book-reader hoverLight'></i>
											</a>
										</li>
									</ul>
								</div>
							</div><!-- end of modal -->
						<!--  -->
						<!-- Modal內容區 -->
						<!-- Modal for Absent -->
						<div class="modal fade" id="absentMID" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-check-square'></i>出缺勤紀錄</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered" style="text-align: center">
										<thead>
											<tr>
												<th class="table-info" scope="col">學生姓名</th>
												<th class="table-info" scope="col">日期</th>
												<th class="table-info" scope="col">課程代號</th>
												<th class="table-info" scope="col">科目名稱</th>
												<th class="table-info" scope="col">出席狀況</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="personalAbsent" items="${personalAbsent}">
												<tr>
													<td>${personalAbsent.student.name}</td>
													<td>
														<fmt:formatDate pattern="yyyy-MM-dd"
															value="${personalAbsent.dayz}" />
													</td>
													<td>${personalAbsent.classList.classCode}</td>
													<td>${personalAbsent.classList.course.courseSubject}</td>
													<td>
														<c:choose>
															<c:when test="${personalAbsent.arrviedOrNot == 0}">
																缺席
															</c:when>
															<c:when test="${personalAbsent.arrviedOrNot == 1}">
																出席
															</c:when>
															<c:when test="${personalAbsent.arrviedOrNot == 2}">
																請假
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for absent -->
					
					
					<!-- Modal for Course -->
					<div class="modal fade" id="courseMID" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-book'></i>&nbsp;購買紀錄</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
									<table class="table table-bordered" style="text-align: center">
										<thead>
											<tr>
												<th class="table-info" scope="col">學生姓名</th>
												<th class="table-info" scope="col">商品資訊</th>
												<th class="table-info" scope="col">商品價格</th>
												<th class="table-info" scope="col">付款方式</th>
												<th class="table-info" scope="col">付款時間</th>
<!-- 												<th class="table-info" scope="col">購買狀態</th> -->
												<th class="table-info" scope="col">排課狀態</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="aOrderDetail" items="${oneOrderDetailList}">
												<tr>
													<td>${aOrderDetail.student.name}</td>
													<td>${aOrderDetail.course.courseCategory}-${aOrderDetail.course.courseSubject}-${aOrderDetail.course.courseGrade}${aOrderDetail.course.courseClass}年級</td>
													<td>${aOrderDetail.course.coursePrice}</td>
													<td>${aOrderDetail.orderList.payment}</td>
													<td>${aOrderDetail.orderList.orderDate}</td>
<!-- 													<td>已購買</td> -->
													<td>
														<c:choose>
															<c:when test="${aOrderDetail.arrangeClassList == 0}">
																尚未排課
															</c:when>
															<c:when test="${aOrderDetail.arrangeClassList == 1}">
																已排課
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for course-->
					
					<!-- Modal for ClassInfo -->
					<div class="modal fade" id="classMID" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-book'></i>&nbsp;班級資訊</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
									<table class="table table-bordered" style="text-align: center">
										<thead>
											<tr>
												<th class="table-info" scope="col">學生姓名</th>
												<th class="table-info" scope="col">科目</th>
												<th class="table-info" scope="col">班級代碼</th>
												<th class="table-info" scope="col">班導</th>
												<th class="table-info" scope="col">教師</th>
												<th class="table-info" scope="col">教室</th>
												<th class="table-info" scope="col">人數</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="aCSL" items="${oneCSL}">
												<tr>
													<td>${aCSL.student.name}</td>
													<td>${aCSL.classList.course.courseSubject}</td>
													<td>${aCSL.classList.classCode}</td>
													<td>${aCSL.classList.school.name}</td>
													<td>${aCSL.classList.teacher.name}</td>
													<td>${aCSL.classList.room.roomName}</td>
													<td>${aCSL.classList.classMember}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for ClassInfo-->
					
					
					
					
					<!-- Modal for Activity -->
					<div class="modal fade" id="activityMID" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-universal-access'></i>&nbsp;我的活動</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<c:forEach var="activity" items="${activities}">
										<div class="card mb-3" style="max-width: 540px;">
											<div class="row no-gutters">
												<div class="col-md-4">
													<img src="${contextRoot}/downloadImage/${activity.id}"
														alt="..."
														style="object-fit: cover; width: 100%; height: 100%">
												</div>
												<div class="col-md-8">
													<div class="card-body">
														<h5 class="card-title">${activity.name}</h5>
														<p class="card-text">
															${activity.place}<br>${activity.date}</p>
														<p class="card-text">
															<small class="text-muted"><a
																	href="${contextRoot}/getmyact/getact?id=${activity.id}"
																	class="card-link">查看詳情</a></small>
														</p>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for activity-->

					<!-- Modal for Score -->
					<div class="modal fade" id="scoreMID" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-poll'></i>&nbsp;成績 (最新3筆紀錄)</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered" style="text-align: center">
										<thead>
											<tr>
												<th class="table-info" scope="col">學生名字</th>
												<th class="table-info" scope="col">課程代號</th>
												<th class="table-info" scope="col">科目名稱</th>
												<th class="table-info" scope="col">次數</th>
												<th class="table-info" scope="col">分數</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="post" items="${scoreforStudent}">
												<tr>
													<td>${post.student.name}</td>
													<td>${post.classlist.classCode}</td>
													<td>${post.classlist.course.courseSubject}</td>
													<td>${post.frequency}</td>
													<td>${post.score}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
									<a type="button" class="btn btn-primary"
										href="${contextRoot}/frontscore">看更多</a>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for score -->
					<!-- Modal for ContactBook -->
					<div class="modal fade" id="contactBookMID" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-book-reader'></i>&nbsp;聯絡簿 (最新3筆紀錄)</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered" style="text-align: center">
										<thead>
											<tr>
												<th class="table-info" scope="col">建立日期</th>
												<th class="table-info" scope="col">課程代號</th>
												<th class="table-info" scope="col">科目名稱</th>
												<th class="table-info" scope="col">課程內容</th>
												<th class="table-info" scope="col">回家作業</th>
												<th class="table-info" scope="col">考試通知</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="top3cbList" items="${top3cbList}">
												<c:choose>
													<c:when test="${top3cbList == null}">
														<tr>
															<td colspan="6">查無結果</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<td>
																<fmt:formatDate pattern="yyyy-MM-dd"
																	value="${top3cbList.create_at}" />
															</td>
															<td>${top3cbList.classList.classCode}</td>
															<td>${top3cbList.classList.course.courseSubject}
															</td>
															<c:choose>
																<c:when
																	test="${top3cbList.courseContent == null}">
																	<td></td>
																</c:when>
																<c:otherwise>
																	<td>${top3cbList.courseContent}</td>
																</c:otherwise>
															</c:choose>

															<c:choose>
																<c:when test="${top3cbList.homework == null}">
																	<td></td>
																</c:when>
																<c:otherwise>
																	<td>${top3cbList.homework}</td>
																</c:otherwise>
															</c:choose>

															<c:choose>
																<c:when test="${top3cbList.quizNotice == null}">
																	<td></td>
																</c:when>
																<c:otherwise>
																	<td>${top3cbList.quizNotice}</td>
																</c:otherwise>
															</c:choose>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">關閉</button>
									<a type="button" class="btn btn-primary"
										href="${contextRoot}/ContactBook/St_Index">看更多</a>
								</div>
							</div>
						</div>
					</div>
				</div><!-- end of class=wrapper -->
				<!-- footer -->
				<jsp:include page="../footer/footer.jsp"></jsp:include>
				<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
				<script>
					let menuToggle = document.querySelector('.menuToggle');
					menuToggle.onclick = function () {
						menuToggle.classList.toggle('active');
					}
				</script>
			</body>

			</html>