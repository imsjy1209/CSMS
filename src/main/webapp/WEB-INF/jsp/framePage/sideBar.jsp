<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->

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

.teachBtn:hover{
background-color: orange;
}
.teachBtn.active:hover{
background-color: orange;
}


.teachBtn.active{
background-color: cornflowerblue;
transition: 0.2s;

}

.teachBtn{
border-radius:50%;
cursor: pointer;
transition: 0.2s;
}

/* .main-title{ */
/* text-align:center; */
/* } */

/* .bth-group{ */
/* padding-left:40%; */
/* margin-left:40%; */
/* } */

/* .OrderListBtnGroup{ */
/*      display: flex; */
/*      justify-content: center;  */
/*      align-items: center; */

/* } */

/* .OrderListBtnGroup button{ */
/*  margin: auto; */
/* } */
		
        /* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

        .wrapper {
            display: flex;
            width: 100%;
            align-items: stretch;
        }

/* ========各項功能清單的背景顏色========= */
        #sidebar {
            min-width: 250px;
            max-width: 250px;
/*             background: #7386D5; */
            background: cornflowerblue;
            color: #fff;
            transition: all 0.3s;
        }

        #sidebar.active {
            margin-left: -250px;
        }

/* ===========左上角Mark的區域============= */
        #sidebar .sidebar-header {
            padding: 20px;
/*             background: #6d7fcc; */
            background: cornflowerblue;
            text-align: center;
        }

        #sidebar ul.components {
            padding: 20px 0;
            border-bottom: 1px solid #47748b;
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
            color: #7386D5;
            background: #fff;
        }

        #sidebar ul li.active>a,
        a[aria-expanded="true"] {
            color: #fff;
/*             background: #6d7fcc; */
            background: cornflowerblue;
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

/* =============下拉功能的背景顏色============= */
        ul ul a {
            font-size: 0.9em !important;
            padding-left: 30px !important;
/*             background: #6d7fcc; */
             background: slategray;
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
            color: #7386D5;
        }

        a.article,
        a.article:hover {
            background: #6d7fcc !important;
            color: #fff !important;
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
                <h5 style='color:black;font-weight:800;'>Back-End System</h5>
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
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">商品與訂單</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a id="course-Btn" href="#">Course(商品)</a>
                        </li>
                        <li>
                            <a id="orderList-Btn" href="#">OrderList(訂單)</a>
                        </li>
                         <li>
                            <a id="orderDetail-Btn"  href="#">購買/排課狀態(訂單明細)</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#studentInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">課程資訊相關</a>
                     <ul class="collapse list-unstyled" id="studentInfo">
                        <li>
                            <a id="classList-Btn" href="#">ClassList(班級)</a>
                        </li>
                        <li>
                            <a id="classStudentList-Btn" href="#">ClassStudentList(班級學生)</a>
                        </li>
                       <li>
                            <a id="room-Btn" href="#">Room(教室)</a>
                        </li>
                        <li>
                            <a id="classRecord-Btn" href="#">ClassRecord(上課紀錄)</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#postInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">公告相關</a>
                     <ul class="collapse list-unstyled" id="postInfo">
                        <li>
                            <a id="PostList-Btn" href="${contextRoot}/showAllPost.controller">PostList(所有公告)</a>
                        </li>
                    </ul>
                </li>
                
                
                 <li>
                    <a href="#expenseInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">財務相關</a>
                     <ul class="collapse list-unstyled" id="expenseInfo">
                        <li>
                            <a id="PostList-Btn" href="${contextRoot}/expenseHome.page">FinancialChart(財務圖表)</a>
                        </li>
                        <li>
                            <a id="PostList-Btn" href="${contextRoot}/expenseQueryAndCreate.page">CostRecord(損益記錄)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#activityInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">活動相關</a>
                     <ul class="collapse list-unstyled" id="activityInfo">
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/createActivity.controller">CreateActivity(建立活動)</a>
                        </li>
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/findAllActivity.controller">ShowAllActivity(所有活動)</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                    <a href="#scoreInfo" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">成績相關</a>
                     <ul class="collapse list-unstyled" id="scoreInfo">
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/scoreAdd">CreateScore(輸入成績)</a>
                        </li>
                        <li>
                            <a id="activity-Btn" href="${contextRoot}/score">ShowAllScore(查看成績)</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                    <a href="#">Contact</a>
                </li>
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

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>



	