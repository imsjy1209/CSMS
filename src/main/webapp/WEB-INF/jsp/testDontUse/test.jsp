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
				<jsp:include page="../layout/nav_student.jsp"></jsp:include>
				<style>
					* {
						margin: 0px;
						padding: 0px;
						box-sizing:border-box;
					}
					:root{
						--bg:#222;
					}
					body{
						background: var(--bg);
					}
					ul{
						position: relative;
						display: flex;
						gap: 50px;
					}
					
					ul li{
						position: relative;
						list-style: none;
						width: 80px;
						height: 80px;
						display: flex;
						justify-content: center;
						align-items: center;
						cursor: pointer;
						transition: 0.5s;
					}
					ul li:hover{
						z-index: 10000;
						transform: scale(0.75);
					}	
					ul li::before{
						content: '';
						position:absolute;
						inset: 30px;
						box-shadow: 0 0 0 10px var(--clr),
						0 0 0 15px var(--bg),
						0 0 0 22px var(--clr);
						transition: 0.5s;
					}
					ul li:hover:before{
						inset: 0px;
					}

					ul li::after{
						content: '';
						position:absolute;
						inset: 0;
						background: var(--bg);
						transform: rotate(45deg);
					}
					ul li a {
						position: relative;
						text-decoration: none ;
						color: var(--clr);
						z-index: 10;
						font-size: 2em;
						transition: 0.5s;
					}
					
					ul li:hover a{
						font-size: 3em;
						filter: drop-shadow(0 0 20px var(--clr))
								drop-shadow(0 0 40px var(--clr))
								drop-shadow(0 0 60px var(--clr));			
					}
				</style>

			</head>

			<body>
				<!-- Student Navbar -->
				
				<!-- Modal選單區 -->
				<div class="wrapper">
					<div class="aside"><!--  按鈕icon-->
						<p class="menuToggle">
							<i class='bx bx-list-ul' style="font-size: 90px; color: black"></i>
						</p>
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
									<a class="contactBookIcon btnli" data-toggle="modal" data-target="#contactBookMID">
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
				</div>
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