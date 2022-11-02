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

					.announcementDiv {
						border: 2px solid slateblue;
						size: 100px;
						width: 800px;
						height: 550px;
						top: 250px;
						right: 150px;
					}

					/* button {
       border: none;
       background: none;
       outline: none;
       color: #666666;
     } */
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
						/* border: 1px solid red;  */
						float: left;
						margin-left: 50px;
					}

					.btnli {
						border: none;
						background-color: white;
					}

					.menuToggle {
						position: relative;
						/* width: 70px;
      height: 70px;
      background-color: #699cfa; */
						border-radius: 70px;
						cursor: pointer;
						display: flex;
						justify-content: center;
						align-items: center;
					}

					.menuToggle::before {
						content: '';
						position: absolute;
						font-weight: 200;
						color: #ff9933;
						transition: 1.5s;
						text-align: center;
					}

					.menu {
						position: absolute;
						width: 30px;
						height: 30px;
						border-radius: 70px;
						z-index: 1;
						transition: transform 0.5s, width 0.5s, height 0.5s;
						transition-delay: 1s, 0.5s, 0.5s;
						transition-timing-function: cubic-bezier(0.075, 0.82, 0.165, 1);
					}

					.menuToggle.active~.menu {
						width: 90px;
						height: 450px;
						z-index: 1;
						transform: translateX(50px);
						transition-delay: 0s, 0.5s, 0.5s;

					}

					.menu::before {
						content: '';
						position: absolute;
						background: red;
						left: calc(25%-8px);
						bottom: 4px;
						transform: rotate(45deg);
						border-radius: 2px;
						transition: 0.5s;
					}

					.menuToggle.active~.menu::before {
						transition-delay: 0.5s;
						bottom: -6px
					}

					.menu ul {
						position: relative;
						justify-content: center;
						align-items: center;
						height: 80px;
						gap: 40px;
						padding: left 0;
					}

					.menu ul li {
						list-style: none;
						cursor: pointer;
						opacity: 0;
						visibility: hidden;
						transform: translateX(5px);
						transition: 0.25s;
						transition-delay: calc(0s+var(--i));
						background-color: none;
					}

					.menuToggle.active~.menu ul li {
						opacity: 1;
						visibility: visible;
						transform: translateY(10px);
						transition-delay: calc(0.75s+var(--i));
						height: 100%;
					}

					.menu ul li button {
						font-size: 2px;
						text-decoration: none;
						background-color: none;
					}

					.menu ul li:hover button {
						color: #ff9933;
					}
				</style>

			</head>

			<body>
				<!-- Student Navbar -->
				<jsp:include page="../layout/nav_student.jsp"></jsp:include>
				<br><br>
				<div class="wrapper">
					<div class="content">
						<div class="aside">
							<!-- Modal選單區 -->
							<div class="menuToggle">
								<i class='bx bx-list-ul' style="font-size: 90px; color:black"></i>
							</div>
							<div class="menu">
								<ul>
									<li style="--i:0.1s;">
										<button class="absCheckIcon btnli" data-toggle="modal" data-target="#absentMID">
											<i style="font-size: 90px;" class='bx bx-calendar-check hoverLight'> </i>
										</button>
									</li>
									<li style="--i:0.2s;">
										<button class="lessonIcon btnli" data-toggle="modal" data-target="#courseMID">
											<i style="font-size: 90px;" class='bx bx-book hoverLight' title="課程"></i>
										</button>
									</li>
									<li style="--i:0.3s;">
										<button class="activeIcon btnli" data-toggle="modal" data-target="#activityMID">
											<i style="font-size: 90px;" class='bx bx-universal-access hoverLight'></i>
										</button>
									</li>
									<li style="--i:0.4s;">
										<button class="scoreIcon btnli" data-toggle="modal" data-target="#scoreMID">
											<i style="font-size: 90px;"
												class='bx bx-bar-chart bx-rotate-90 hoverLight'></i>
										</button>
									</li>
									<li style="--i:0.5s;">
										<button class="contactBookIcon btnli" data-toggle="modal"
											data-target="#contactBookMID">
											<i style="font-size: 90px;" class='bx bx-book-reader hoverLight'></i>
										</button>
									</li>
								</ul>
							</div>

						</div><!-- end of class=aside -->

						<div class="article ">
							<!-- 輪播區 -->
							<div class="announcementDiv">
								<!-- 輪播bar -->
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
									<ol class="carousel-indicators">
										<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active">
										</li>
										<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
										<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
									</ol>
									<div class="carousel-inner">
										<!-- 輪播照片 -->
										<!-- 第1張 -->
										<div class="carousel-item active" data-interval="3000" data-pause="hover">
											<img src="${contextRoot}/image/activityPhoto/01.PNG" class="d-block w-100"
												alt="...">
											<div class="carousel-caption d-none d-md-block">
												<div style="background-color:rgb(255,153,51,0.7)">
													<h5>泳渡日月潭</h5>
													<p>讚讚讚讚讚</p>
												</div>
											</div>
										</div>
										<!-- 第2張 -->
										<div class="carousel-item" data-interval="3000" data-pause="hover">
											<img src="${contextRoot}/image/activityPhoto/02.PNG" class="d-block w-100"
												alt="...">
											<div class="carousel-caption d-none d-md-block">
												<div style="background-color:rgb(255,153,51,0.7)">
													<h5>大家一起來散步</h5>
													<p>喔耶喔耶喔耶</p>
												</div>
											</div>
										</div>
										<!-- 第3張 -->
										<div class="carousel-item" data-interval="3000" data-pause="hover">
											<img src="${contextRoot}/image/activityPhoto/03.PNG" class="d-block w-100"
												alt="...">
											<div class="carousel-caption d-none d-md-block">
												<div style="background-color:rgb(255,153,51,0.7)">
													<h5>益智模型</h5>
													<p>啦啦啦啦啦啦啦~~</p>
												</div>
											</div>
										</div>
										<!-- 第4張 -->
										<div class="carousel-item" data-interval="3000">
											<img src="${contextRoot}/image/activityPhoto/04.PNG" class="d-block w-100"
												alt="...">
											<div class="carousel-caption d-none d-md-block">
												<div style="background-color:rgb(255,153,51,0.7)">
													<h5>參觀博物館</h5>
													<p>有位偷看鏡頭~~齁~~</p>
												</div>
											</div>
										</div>
										<!-- 輪播上下頁 -->
										<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
											data-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
												class="sr-only">Previous</span>
										</a>
										<a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
											data-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
							</div> <!-- end of class=announcementDiv -->
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
											<table class="table table-bordered" style="text-align:center">
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
															<td>
																${personalAbsent.student.name}
															</td>
															<td>
																<fmt:formatDate pattern="yyyy-MM-dd"
																	value="${personalAbsent.dayz}" />
															</td>
															<td>
																${personalAbsent.classList.classCode}
															</td>
															<td>${personalAbsent.classList.course.courseSubject}</td>
															<td>