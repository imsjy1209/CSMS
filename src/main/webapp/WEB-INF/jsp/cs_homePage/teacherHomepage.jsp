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
	* {
		margin: 0px;
		padding: 0px;
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

	.menuToggle {
		width: 10%;
		border-radius: 70px;
		cursor: pointer;
		display: flex;
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
		top: 0px;
	}

	.menuToggle.active~.menu {
		z-index: 1;
		/* transform: translateX(50px);	 */
		transition-delay: 0s, 0.5s, 0.5s;
	}

	.menu::before {
		content: '';
		/* position: absolute; */
		background: red;
		left: calc(25% -8px);
		bottom: 4px;
		transform: rotate(45deg);
		border-radius: 2px;
		transition: 0.5s;
	}

	.menuToggle.active~.menu::before {
		transition-delay: 0.5s;
		/* bottom: -6px */
	}

	.menu ul {
		display: flex;
		position: relative;
		justify-content: center;
		align-items: center;
		gap: 40px;
		padding: left 0;
	}

	.menu ul li {
		list-style: none;
		cursor: pointer;
		opacity: 0;
		visibility: hidden;
		transition: 0.25s;
		transition-delay: calc(0s + var(- -i));
		background-color: none;
	}

	.menuToggle.active~.menu ul li {
		opacity: 1;
		visibility: visible;
		transform: translateX(700px);
		transition-delay: calc(0.75s + var(- -i));
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
	<!-- Teacher Navbar -->
	<jsp:include page="../layout/nav_teacher.jsp"></jsp:include>
				<div class="article ">
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
					<div class="aside">	
					<!-- Modal選單區 -->	
					<div class="menuToggle">
						<i class='bx bx-list-ul' style="font-size: 90px; color:black" ></i>
					</div>
					<div class="menu">
						<ul>
							<li style="--i:0.1s;">
								<button class="lessonIcon btnli" data-toggle="modal" data-target="#courseMID">
									<i style="font-size: 90px;" class='bx bx-book hoverLight' title="課程"></i>
								</button>
							</li>
							<li style="--i:0.2s;">
								<button class="contactBookIcon btnli" data-toggle="modal" data-target="#contactBookMID">
									<i style="font-size: 90px;" class='bx bx-book-reader hoverLight'></i>
								</button>
							</li>
						</ul>
					</div>
				</div><!-- end of class=aside -->
					<!-- Modal內容區 -->
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
					</div><!-- end of modal -->	
				</div> <!-- end of class=article -->
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

