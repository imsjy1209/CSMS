<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>  
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>
<style>

/* navbar header */
#navbar {
	background-color: #496CAD;
	
}

/* Logo */
#navbar-brand {
	width:70px;
}

.csmslogo {
	width: 100%;
}

/* 單一選單 */
li{
	height: 200%;
	font-size: 18px; 
}

.nav-item {
	margin-left: 50px;
}

/* hover加文字底線 */
/* li:hover {
	border-bottom: 2px solid yellow;
} */

.navbar-right {
	float:right;
	width:20%;
}


.navbar-right>li{
	color:white;
	/* vertical-align：middle; 這個好像會跳錯誤 */
}		    	    

.btn-2 {
	 letter-spacing: 0;
}
 .btn-2:hover, .btn-2:active {
	 letter-spacing: 0px;
}
 .btn-2:after, .btn-2:before {
	 backface-visibility: hidden;
	 border: 1px solid rgba(255, 255, 255, 0);
	 bottom: 0px;
	 content: " ";
	 display: block;
	 margin: 0 auto;
	 position: relative;
	 transition: all 280ms ease-in-out;
	 width: 0;
}
 .btn-2:hover:after, .btn-2:hover:before {
	 backface-visibility: hidden;
	 border-color: #ff9933;
	 transition: width 350ms ease-in-out;
	 width: 70%;
}
 .btn-2:hover:before {
	 bottom: auto;
	 top: 0;
	 width: 70%;
}
 

</style>
</head>
<body>

<nav id="navbar" class="navbar sticky-top navbar-expand navbar-dark flex-column flex-md-row bd-navbar">
	<!-- Logo -->
	<div id="navbar-brand">
	  	<a class="navbar-brand" href="${contextRoot}/homepage.controller" >
	  		<img src="${contextRoot}/image/navbarLogo.png" alt="" class="csmslogo" title="回首頁" />
	  	</a>
  	</div>
 	 <!-- 功能選單 -->
  	<div class="navbar-nav-scroll" id="navbarNav" style="width:100%;">
  	   
	    <ul class="navbar-nav bd-navbar-nav navbar-light flex-row navbar-left" style="width:70%;float:left;">
	    
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	          出缺勤相關
	        </a>
	        <div class="dropdown-menu">
	        	<a class="dropdown-item lia" href="#">出缺勤紀錄查詢</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	課程相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="#">報名課程查詢</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	活動相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item lia" href="${contextRoot}/getAll">活動總覽</a>
	          <a class="dropdown-item lia" href="${contextRoot}/getmyact">我的活動紀錄</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	公告相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item lia" href="${contextRoot}/post/viewbyall">查看公告</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	電子聯絡簿
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item lia" href="${contextRoot}/post/viewbyall">查看聯絡簿</a>
	        </div>
	      </li>
	      
	    </ul>
	    <!-- 靠右 -->
		<ul class="nav navbar-nav navbar-right ">
		    <li class="nav-item active">
	        	 <i class='bx bxs-user-circle' style="font-size:25px;line-height:40px"></i><span><b>&nbsp;會員資料</b></span>
	      	</li>
	      	<li class="nav-item active">
	      		<i class='bx bx-log-out bx-rotate-180' style="font-size:25px;line-height:40px"></i><b>&nbsp;登出</b>
	      	</li>
      	</ul>
		  <nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- Container wrapper -->
			<div class="container-fluid">
			  <!-- Toggle button -->
			  <button
				class="navbar-toggler"
				type="button"
				data-mdb-toggle="collapse"
				data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent"
				aria-expanded="false"
				aria-label="Toggle navigation"
			  >
				<i class="fas fa-bars"></i>
			  </button>
		  
			  <!-- Collapsible wrapper -->
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<a class="navbar-brand mt-2 mt-lg-0" href="#">
				  <img
					src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
					height="15"
					alt="MDB Logo"
					loading="lazy"
				  />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				  <li class="nav-item">
					<a class="nav-link" href="#">Dashboard</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">Team</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link" href="#">Projects</a>
				  </li>
				</ul>
				<!-- Left links -->
			  </div>
			  <!-- Collapsible wrapper -->
		  
			  <!-- Right elements -->
			  <div class="d-flex align-items-center">
				<!-- Icon -->
				<a class="text-reset me-3" href="#">
				  <i class="fas fa-shopping-cart"></i>
				</a>
		  
				<!-- Notifications -->
				<div class="dropdown">
				  <a
					class="text-reset me-3 dropdown-toggle hidden-arrow"
					href="#"
					id="navbarDropdownMenuLink"
					role="button"
					data-mdb-toggle="dropdown"
					aria-expanded="false"
				  >
					<i class="fas fa-bell"></i>
					<span class="badge rounded-pill badge-notification bg-danger">1</span>
				  </a>
				  <ul
					class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuLink"
				  >
					<li>
					  <a class="dropdown-item" href="#">Some news</a>
					</li>
					<li>
					  <a class="dropdown-item" href="#">Another news</a>
					</li>
					<li>
					  <a class="dropdown-item" href="#">Something else here</a>
					</li>
				  </ul>
				</div>
				<!-- Avatar -->
				<div class="dropdown">
				  <a
					class="dropdown-toggle d-flex align-items-center hidden-arrow"
					href="#"
					id="navbarDropdownMenuAvatar"
					role="button"
					data-mdb-toggle="dropdown"
					aria-expanded="false"
				  >
					<img
					  src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
					  class="rounded-circle"
					  height="25"
					  alt="Black and White Portrait of a Man"
					  loading="lazy"
					/>
				  </a>
				  <ul
					class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuAvatar"
				  >
					<li>
					  <a class="dropdown-item" href="#">My profile</a>
					</li>
					<li>
					  <a class="dropdown-item" href="#">Settings</a>
					</li>
					<li>
					  <a class="dropdown-item" href="#">Logout</a>
					</li>
				  </ul>
				</div>
			  </div>
			  <!-- Right elements -->
	</div>

</nav>



<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.js"></script>

</body>
</html>