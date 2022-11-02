<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>Test</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
    integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>

					*{
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
						/* border: 1px solid blue; */
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
 						/*width: 90px; 
 						height: 450px; 
 						z-index: 1; */
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
						height: 110%;
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
	<!-- Teacher Navbar -->
	<jsp:include page="../layout/nav_teacher.jsp"></jsp:include>
			<br><br>
			<div class="wrapper">
				<div class="content">
					<div class="aside">	
					<!-- Modal選單區 -->	
					<div class="menuToggle">
						<i class='bx bx-list-ul' style="font-size: 90px; color:black" ></i>
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
								<button class="contactBookIcon btnli" data-toggle="modal" data-target="#contactBookMID">
									<i style="font-size: 90px;" class='bx bx-book-reader hoverLight'></i>
								</button>
							</li>
						</ul>
					</div>
				</div><!-- end of class=aside -->

				<div class="article ">
					<div class="announcementDiv">
						<!-- 公告區 -->
						<table id="pList" class="table table-bordered" style="text-align:center">
				  			<thead id="pList-title">
				    			<tr>
				    				<th class="table-info" scope="col">功能</th>
								    <th class="table-info" scope="col">編號</th>
								    <th class="table-info" scope="col">標題</th>
								    <th class="table-info" scope="col">最後更新時間</th>
							    </tr>
							</thead>
							<tbody>
							<c:forEach var="post" items="${pListAll}">
								<tr>
									<td>
										<a href="${contextRoot}/post/detail/${post.id}" type="button" class="btn btn-outline-success btn-sm">
											<i class="bx bx bxs-show"></i>&nbsp;查看
										</a>
									</td>
									<td>${post.id}</td>
								    <td>${post.topic}</td>
								    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.update_at}" /></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div> <!-- end of class=announcementDiv -->
					<!-- Modal內容區 -->
					<!-- Modal for Absent -->
					<div class="modal fade" id="absentMID" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
														<fmt:formatDate pattern="yyyy-MM-dd" value="${personalAbsent.dayz}" />
													</td>
													<td>
														${personalAbsent.classList.classCode}
													</td>
													<td>${personalAbsent.classList.course.courseSubject}</td>
													<td>
														<c:choose>
															<c:when test="${personalAbsent.arrviedOrNot == 0}">缺席
															</c:when>
															<c:when test="${personalAbsent.arrviedOrNot == 1}">出席
															</c:when>
															<c:when test="${personalAbsent.arrviedOrNot == 2}">請假
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for absent -->
					<!-- Modal for ContactBook -->
					<div class="modal fade" id="contactBookMID" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
									<div class="form-group">
	  									<label for="exampleFormControlSelect1">選擇課程：</label>
	  									<select class="form-control" id="classInfoList" name="classInfoList">
	    									<option value="-1" selected="selected" hidden>請選擇</option>
	  									</select>
	  								</div>
									<br>
									<div id="sthHidden"><!-- 放studentId --></div>
						  			<div>
							  			<table id="cbList" class="table table-bordered" style="text-align:center;font-size:12px;">
							  				<thead  id="cbList-title">
							    				<tr>
											    	<th class="table-info" scope="col" hidden>編號</th>
											     	<th class="table-info" scope="col">建立日期</th>
											     	<th class="table-info" scope="col">學生姓名</th>
											    	<th class="table-info" scope="col">課程內容</th>
											    	<th class="table-info" scope="col">回家作業</th>
											     	<th class="table-info" scope="col">考試通知</th>
											     	<th class="table-info" scope="col">狀態</th>
											     	<th class="table-info" scope="col">簽章</th>
										    	</tr>
											</thead>
										</table>
						  			</div>
					  			</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
									<a type="button" class="btn btn-primary" href="${contextRoot}/ContactBook/P_Index">看更多</a>
								</div>
							</div>	
						</div>
					</div>		
					<!-- end of modal -->	
				</div> <!-- end of class=article -->
			</div> <!-- end of class=content -->
		</div> <!-- end of class=wrapper -->

<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

//=====================homepage功能按鍵=======================
	let menuToggle = document.querySelector('.menuToggle');
			menuToggle.onclick = function () {
				menuToggle.classList.toggle('active');
			}
</script>

</body>

</html>

