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
	font-size: 15px; 
}

.nav-item {
	margin-left: 25px;
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
	  	<a class="navbar-brand" href="${contextRoot}/users/gotohomepage" >
	  		<img src="${contextRoot}/image/navbarLogo.png" alt="" class="csmslogo" title="回首頁" />
	  	</a>
  	</div>
 	 <!-- 功能選單 -->
  	<div class="navbar-nav-scroll" id="navbarNav" style="width:100%;">
  	   
	    <ul class="navbar-nav bd-navbar-nav navbar-light flex-row navbar-left" style="width:70%;float:left;">
	      
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	課程相關
	        </a>
	        <div class="dropdown-menu">
	          	<a class="dropdown-item lia" href="${contextRoot}/frontParentscore">查看班級</a>
	          	<a class="dropdown-item lia" href="${contextRoot}/ContactBook/T_Index">查看/新增聯絡簿</a>
	        </div>
	      </li>
  
	      <!-- <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	訊息相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item lia" href="${contextRoot}/message/getallByParent">查看訊息</a>
	        </div>
	      </li> -->
	      <li class="nav-item dropdown font-weight-bold btn-2">
	        <a class="nav-link active dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
	        	公告相關
	        </a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item lia" href="${contextRoot}/post/viewbyall">查看公告</a>
	        </div>
	      </li>
	      
	    </ul>
	    <!-- 靠右 -->
		<ul class="nav navbar-nav navbar-right ">
		    <li class="nav-item active btn-2 leftBtn">
		    	<a class="leftBtn" href="#" style="color:white;text-decoration: none;">
	        		<i class='bx bxs-user-circle' style="font-size:15px;line-height:40px"></i><span><b>&nbsp;會員資料</b></span>
	        	</a>
	      	</li>
	      	<li class="nav-item active btn-2 leftBtn">
	      		<a class="leftBtn" href="${contextRoot}/signout" style="color:white;text-decoration:none;">
	      			<i class='bx bx-log-out bx-rotate-180' style="font-size:15px;line-height:40px;"></i><b>&nbsp;登出</b>
	      		</a>
	      	</li>
      	</ul>
	</div>

</nav>



<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.js"></script>

</body>
</html>