<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script> --%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
	<!--box icons-->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<title>Welcome</title>
<style>
        /*
    DEMO STYLE
*/

        @import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";

        body {
            font-family: 'Poppins', sans-serif;
            background: #fafafa;
        }

        p {
            font-family: 'Poppins', sans-serif;
            font-size: 1.1em;
            font-weight: 300;
            line-height: 1.7em;
            color: #999;
        }

        a,
        a:hover,
        a:focus {
            color: inherit;
            text-decoration: none;
            transition: all 0.3s;
            
        }

        .navbar {
            padding: 15px 10px;
            background: #fff;
            border: none;
            border-radius: 0;
            margin-bottom: 40px;
            box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
        }

        .navbar-btn {
            box-shadow: none;
            outline: none !important;
            border: none;
        }

        .line {
            width: 100%;
            height: 1px;
            border-bottom: 1px dashed #ddd;
            margin: 40px 0;
        }
        /*On/Off Course Button Style*/ 
        .con.active{
			background-color:green;
 			cursor: default; 
		}

		.coff.active{
 			background-color:red;
 			cursor: default; 
		}
		
		 .con{
			cursor: pointer;
		}

		.coff{
		cursor: pointer;
		}
		
		  /*On/Off OrderDetail Button Style*/ 
        .oDon.active{
			background-color:green;
 			cursor: default; 
		}

		.oDoff.active{
 			background-color:red;
 			cursor: default; 
		}
		
		 .oDon{
			cursor: pointer;
		}

		.oDoff{
		cursor: pointer;
		}
		
		.class-studentList:hover{
		background-color:yellow;
		}
		
		.orderWait.active{
	background-color:orange;
}
.orderNoP.active{
	background-color:red;
}
.orderFin.active{
	background-color:green;
}

.bxs-edit{
	cursor: pointer;
	    transition: 0.5s;
}
.bxs-edit:hover{
     color:orange;
}

.bxs-trash:hover{
     color:red;
}
.oDoffText{
color:azure;
background-color:red;
}
.oDonText{
color:azure;
background-color:green;
}
.orderWaitText{
color:azure;
background-color:orange;
}
.orderNoPText{
color:azure;
background-color:red;
}
.orderFinText{
color:azure;
background-color:green;
}

.modal-body p{
color:black;
/* font-weight: 800; */
}
		
        /* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
        }
        
/* ========?????????????????????????????????========= */
        #sidebar {
            min-width: 250px;
            max-width: 250px;
            background: #5984d4;
            color: #fff;
            transition: all 0.3s;
        }

        #sidebar.active {
            margin-left: -250px;
        }

/* ===========?????????Mark?????????============= */
        #sidebar .sidebar-header {
            padding: 20px;
            background: #5984d4;
            text-align: center;
        }

        #sidebar ul.components {
            padding: 20px 0;
            /* border-bottom: 1px solid #47748b; */
        }

        #sidebar ul p {
            color: #fff;
            padding: 10px;
        }

        #sidebar ul li a {
            padding: 10px;
            font-size: 1.1em;
            display: block;
        }

        #sidebar ul li a:hover {
            color: #2e446e;
            background: #F6AE2D;
        }

        #sidebar ul li.active>a,
        a[aria-expanded="true"] {
            color: #fff;
            background: #5984d4;
        }

        a[data-toggle="collapse"] {
            position: relative;
        }

        .dropdown-toggle::after {
            display: block;
            position: absolute;
            top: 50%;
            right: 20px;
            transform: translateY(-50%);
        }
/* =============???????????????????????????============= */
        ul ul a {
            font-size: 0.9em !important;
            padding-left: 30px !important;
            background: #2e446e;
        }

        ul.CTAs {
            padding: 20px;
        }

        ul.CTAs a {
            text-align: center;
            font-size: 0.9em !important;
            display: block;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        a.download {
            background: #fff;
            color: #5984d4;
        }
        
        a.article,
        a.article:hover {
            background: #fff !important;
            color: #2e446e !important;
        }
        .csmslogo{
            width: 60%;
        }
        /* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

        #content {
            width: 100%;
            padding: 20px;
            min-height: 100vh;
            transition: all 0.3s;
        }

        /* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

        @media (max-width: 768px) {
            #sidebar {
                margin-left: -250px;
            }

            #sidebar.active {
                margin-left: 0;
            }

            #sidebarCollapse span {
                display: none;
            }
        }
    </style>
</head>

<body>
<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <img src="${contextRoot}/image/CSMS1.png" class="csmslogo" alt="">
                <h5>Back-End System</h5>
            </div>

            <ul class="list-unstyled components">
<!--                 <p>Function List</p> -->
<!--                 <li class="active"> -->
<!--                     <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a> -->
<!--                     <ul class="collapse list-unstyled" id="homeSubmenu"> -->
<!--                         <li> -->
<!--                             <a href="#">Home 1</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#">Home 2</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#">Home 3</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </li> -->
                <li>
                    <a href="#">About</a>
                </li>
                
                <li>
                    <a href="#registerInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bxs-user-account' style='color:#ffffff'> ????????????</i></a>
                     <ul class="collapse list-unstyled" id="registerInfo">
                        <li>
                            <a id="register-Btn" href="${contextRoot}/createRegister.page">Register(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#accessInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bx-shield-minus' style='color:#ffffff' > ????????????</i></a>
                     <ul class="collapse list-unstyled" id="accessInfo">
                        <li>
                            <a id="right-Btn" href="${contextRoot}/courseAllPageBackAjax.page">AccessManager(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bxl-shopify' style='color:#ffffff' > ???????????????</i></a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                         <li>
                            <a id="courseCreate-Btn" href="${contextRoot}/courseAllPageBackAjax.page">CourseCreate(????????????)</a>
                        </li>
                        
                        <li>
                            <a id="course-Btn" href="${contextRoot}/courseAllPageBackAjax.page">Course(??????)</a>
                        </li>
                        <li>
                            <a id="orderList-Btn" href="${contextRoot}/courseAllPageBackAjax.page">OrderList(??????)</a>
                        </li>
                         <li>
                            <a id="orderDetail-Btn"  href="${contextRoot}/courseAllPageBackAjax.page">OrderDetail(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#studentInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bxs-school' style='color:#ffffff' > ??????????????????</i></a>
                     <ul class="collapse list-unstyled" id="studentInfo">
                        <li>
                            <a id="classList-Btn" href="${contextRoot}/courseAllPageBackAjax.page">ClassList(??????)</a>
                        </li>
                        <li>
                            <a id="classStudentList-Btn" href="${contextRoot}/courseAllPageBackAjax.page">ClassStudentList(????????????)</a>
                        </li>
                       <li>
                            <a id="room-Btn" href="${contextRoot}/courseAllPageBackAjax.page">Room(??????)</a>
                        </li>
                        <li>
                            <a id="classRecord-Btn" href="${contextRoot}/courseAllPageBackAjax.page">ClassRecord(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#absentInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bx-calendar' style='color:#ffffff' > ???????????????</i></a>
                     <ul class="collapse list-unstyled" id="absentInfo">
                        <li>
                            <a id="absent-Btn" href="${contextRoot}/courseAllPageBackAjax.page">AdviseAbsent(???????????????)</a>
                        </li>
                        <li>
                            <a id="absent-Btn" href="${contextRoot}/courseAllPageBackAjax.page">CreateAbsent(???????????????)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#contactBookInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bx-book-content' style='color:#ffffff' > ???????????????</i></a>
                     <ul class="collapse list-unstyled" id="contactBookInfo">
                        <li>
                            <a id="PostList-Btn" href="${contextRoot}/ContactBook/Ad_Index">ContackBook(Admin)</a>
                        </li>
<!--                         <li> -->
<%--                             <a id="PostList-Btn" href="${contextRoot}/ContactBook/Sc_Index">ContackBook(??????)</a> --%>
<!--                         </li> -->
                    </ul>
                </li>
                
                
                <li>
                    <a href="#postInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bx-notepad' style='color:#ffffff' > ????????????</i></a>
                     <ul class="collapse list-unstyled" id="postInfo">
                         <li>
                            <a id="PostList-Btn" href="${contextRoot}/createPost.controller">????????????</a>
                        </li> 
                        <li>
                            <a id="PostList-Btn" href="${contextRoot}/showAllPost.controller">PostList(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#expenseInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bx-money-withdraw' style='color:#ffffff' > ????????????</i></a>
                     <ul class="collapse list-unstyled" id="expenseInfo">
                        <li>
                            <a id="expense-Btn" href="${contextRoot}/expenseHome.page">FinancialChart(????????????)</a>
                        </li>
                        <li>
                            <a id="expense-Btn" href="${contextRoot}/expenseQueryAndCreate.page">CostRecord(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#activityInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bxs-tree-alt' style='color:#ffffff' > ????????????</i></a>
                     <ul class="collapse list-unstyled" id="activityInfo">
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/createActivity.controller">CreateActivity(????????????)</a>
                        </li>
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/findAllActivity.controller">ShowAllActivity(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#scoreInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class='bx bx-math' style='color:#ffffff' > ????????????</i></a>
                     <ul class="collapse list-unstyled" id="scoreInfo">
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/scoreAdd">CreateScore(????????????)</a>
                        </li>
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/score">ShowAllScore(????????????)</a>
                        </li>
                    </ul>
                </li>
                
                <!-- <li>
                    <a href="#">Contact</a>
                </li> -->
            </ul>

<!--             <ul class="list-unstyled CTAs"> -->
<!--                 <li> -->
<!--                     <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a> -->
<!--                 </li> -->
<!--             </ul> -->

        </nav>

        <!-- Page Content  -->
        <div id="content">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <!-- ???????????? -->
                    <button type="button" id="sidebarCollapse" class="btn btn-info" style="background-color:#5984d4 ;">
                        <i class='bx bx-code'></i>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                 <a href="${contextRoot}/signout"><i class='bx bx-log-out bx-rotate-180' style="font-size:15px;line-height:40px;"></i><b>&nbsp;??????</b></a>
                            </li>
<!--                             <li class="nav-item"> -->
<!--                                 <a class="nav-link" href="#">Page</a> -->
<!--                             </li> -->
<!--                             <li class="nav-item"> -->
<!--                                 <a class="nav-link" href="#">Page</a> -->
<!--                             </li> -->
<!--                             <li class="nav-item"> -->
<!--                                 <a class="nav-link" href="#">Page</a> -->
<!--                             </li> -->
                        </ul>
                    </div>
                </div>
            </nav>