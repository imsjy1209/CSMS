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
	background-color: cornflowerblue;
	box-shadow: 0px 3px 3px -2px rgba(0, 0, 0, 0.7);
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
li:hover {
	border-bottom: 2px solid yellow;
}

.navbar-right {
	float:right;
	width:20%;
}

.navbar-right>li{
	color:white;
	vertical-align：middle;
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
	    
	      <li class="nav-item dropdown font-weight-bold">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	          出缺勤相關
	        </a>
	        <div class="dropdown-menu">
	        	<a class="dropdown-item" href="#">出缺勤紀錄查詢</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	課程相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="#">報名課程查詢</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	活動相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="${contextRoot}/getAll">活動總覽</a>
	          <a class="dropdown-item" href="${contextRoot}/getmyact">我的活動紀錄</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	公告相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="${contextRoot}/post/viewbyall">查看公告</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown font-weight-bold">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	電子聯絡簿
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="${contextRoot}/post/viewbyall">查看聯絡簿</a>
	        </div>
	      </li>
	      
	    </ul>
	    <!-- 靠右 -->
		<ul class="nav navbar-nav navbar-right">
		    <li class="nav-item active">
	        	 <i class='bx bxs-user-circle' style="font-size:25px;line-height:40px"></i><span><b>&nbsp;會員資料</b></span>
	      	</li>
	      	<li class="nav-item active">
	      		<i class='bx bx-log-out bx-rotate-180' style="font-size:25px;line-height:40px"></i><b>&nbsp;登出</b>
	      	</li>
      	</ul>
	</div>

</nav>



<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.js"></script>

</body>
</html>