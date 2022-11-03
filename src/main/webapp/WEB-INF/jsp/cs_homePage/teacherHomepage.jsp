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
<!-- Teacher Navbar -->
<jsp:include page="../layout/nav_teacher.jsp"></jsp:include>
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
				<div class="wrapper">
					<div class="announcementDiv"><!-- 輪播區 -->
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="${contextRoot}/image/activityPhoto/01.png" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="${contextRoot}/image/activityPhoto/02.png" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="${contextRoot}/image/activityPhoto/03.png" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="${contextRoot}/image/activityPhoto/04.png" class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="${contextRoot}/image/activityPhoto/05.png" class="d-block w-100" alt="...">
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
					<!-- <div class="menuToggle">
						<i class='bx bx-list-ul' style="font-size: 90px; color:black" ></i>
					</div> -->
					<div class="menu">
						<ul>
							<li style="--i:0.1s;--clr:#1877f2;">
								<a class="lessonIcon btnli" data-toggle="modal" data-target="#courseMID">
									<i style="font-size: 90px;" class='bx bx-book hoverLight' title="課程"></i>
								</a>
							</li>
							<li style="--i:0.2s;--clr:#ff0000;">
								<a class="contactBookIcon btnli" data-toggle="modal" data-target="#contactBookMID">
									<i style="font-size: 90px;" class='bx bx-book-reader hoverLight'></i>
								</a>
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

