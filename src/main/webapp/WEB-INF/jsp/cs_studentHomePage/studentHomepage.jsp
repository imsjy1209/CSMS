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

/* Footer Style (start) */
html, body {
	height: 100%;
	margin: 0;
}

.wrapper { /* 每一頁都要用wrapper包起來 */
	min-height: calc(100% - 107px); /*減去navebar(77px)和footer(40)高度*/
}

.footer {
	height: 40px; /*設定footer本身高度*/
	background-color: #cbe6f5;
	font-size: 15px;
	text-align: center;
	color: gray;
}

/* Footer Style (end) */

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
	width: 700px;
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
	<jsp:include page="../layout/navDong.jsp"></jsp:include>
	<div class="wrapper">
		<div class="carouselArea">輪播區</div>
		<div class="content">
			<div class="aside" style="border: 5px solid red;">
				<div class="absCheckIcon hoverLight" id="absCheckIcon">
					<!-- 出席 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#absentMID">
						<img src="${contextRoot}/image/absCheck.png" title="出席" alt=""
							style="border: 1px solid red;">
					</button>
				</div>

				<div class="lessonIcon hoverLight" id="lessonIcon">
					<!-- 課程 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#courseMID">
						<img src="${contextRoot}/image/lesson.png" title="課程"
							style="border: 1px solid red;">
					</button>
				</div>

				<div class="activeIcon hoverLight" id="activeIcon">
					<!-- 活動 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#activityMID">
						<img src="${contextRoot}/image/active.png" title="活動" alt=""
							style="border: 1px solid red;">
					</button>
				</div>

				<div class="scoreIcon hoverLight" id="scoreIcon">
					<!-- 分數 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#scoreMID">
						<img src="${contextRoot}/image/score.png" title="分數" alt=""
							style="border: 1px solid red;">
					</button>
				</div>

				<div class="scoreIcon hoverLight" id="contactBookIcon">
					<!-- 分數 button 的 data-target 要改-->
					<button type="button" class="" data-toggle="modal"
						data-target="#contactBookMID">
						<img src="${contextRoot}/image/contactbook.png" title="聯絡簿" alt=""
							style="border: 1px solid red;">
					</button>
				</div>

			</div>
			<div class="article ">
				<div class="announcementDiv">
					<h4>modal區</h4>
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
								<table>
									<thead>
										<tr><th>日期</th><th>課程</th><th>出席狀況</th></tr>
									</thead>
									<tbody>
										<c:forEach var="personalAbsent" items="${personalAbsent}">
											<tr>
												<td><fmt:formatDate pattern="yyyy-MM-dd" value="${personalAbsent.dayz}"/></td>
												<td> ${personalAbsent.classList.course.courseSubject} </td>
												<td>
													<c:choose>
														<c:when test="${personalAbsent.arrviedOrNot == 0}">缺席</c:when>
														<c:when test="${personalAbsent.arrviedOrNot == 1}">出席</c:when>
														<c:when test="${personalAbsent.arrviedOrNot == 2}">請假</c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
								</tbody>
								</table>
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
	/* 宣告變數 */
	let slideNum = 0;
	let slideCount = $(".slides li").length;
	let lastIndex = slideCount - 1;
	
	/* 建立圖片、點點運作的方法 */
	function show() {
	    // 點點顏色
	    $(".dot li").eq(slideNum).css("background-color", "#fff").siblings().css("background-color", "transparent");
	
	    // 圖片移動
	    let slidemove = 0 - 400 * slideNum;
	    $("ul.slides").css("left", slidemove);
	}
	
	/* 點點、圖片 */
	$(".dot li").mouseenter(function () {
	    slideNum = $(this).index();
	    show();
	});
	
	/* 自動輪播(自動下一頁) */
	// JS P.102：let Interval = setInterval(function,milliseconds)
	let autoplay = setInterval(function () {
	    slideNum++;
	    if (slideNum > lastIndex) { slideNum = 0; }
	    show();
	}, 2000); // 把function放上下一頁的方法
	
	/* 輪播暫停 */
	$(".wrapper").mouseover(function () {
	    clearInterval(autoplay);
	});
	
	/* 自動輪播重啟 */
	$(".wrapper").mouseout(function () {
	    let autoplay = setInterval(function () {
	        slideNum++;
	        if (slideNum > lastIndex) { slideNum = 0; }
	        show();
	    }, 2000);
	}); // 第一次autoplay被mouseover清除，在mouseout時加回來
</script>

</body>

</html>

