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


/* .scoreIcon { */
/* 	top: 500px; */
/* 	left: 120px; */
/* } */

/* .lessonIcon { */
/* 	top: 375px; */
/* 	left: 120px; */
/* } */

/* .absCheckIcon { */
/* 	top: 250px; */
/* 	left: 120px; */
/* } */

/* .activeIcon { */
/* 	top: 625px; */
/* 	left: 120px; */
/* } */

/* .hoverLight:hover { */
/* 	filter: drop-shadow(0px 0px 10px #000000); */
/* } */

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

/*  					.menu ul {  */
/*  						position: relative; */
/* 						display: flex;  */
/*  						justify-content: center;  */
/*  						align-items: center;  */
/*  						height: 80px;  */
/*  						gap: 40px;  */
/*  						padding: left 0;  */
/*  					}  */

/* 					.menu ul li { */
/* 						list-style: none; */
/* 						cursor: pointer; */
/* 						opacity: 0; */
/* 						visibility: hidden; */
/* 						transform: translateX(5px); */
/* 						transition: 0.25s; */
/* 						transition-delay: calc(0s+var(--i)); */
/* 						background-color: none; */
/* 					} */

/* 					.menuToggle.active~.menu ul li { */
/* 						opacity: 1; */
/* 						visibility: visible; */
/* 						transform: translateY(10px); */
/* 						transition-delay: calc(0.75s+var(--i)); */
/* 						height: 100%; */
/* 					} */

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
			<!-- Parent Navbar -->
			<jsp:include page="../layout/nav_parent.jsp"></jsp:include>
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
							<li style="--i:0.4s;">
								<button class="scoreIcon btnli" data-toggle="modal" data-target="#scoreMID">
									<i style="font-size: 90px;" class='bx bx-bar-chart bx-rotate-90 hoverLight'></i>
								</button>
							</li>
							<li style="--i:0.5s;">
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
							<c:forEach var="post" items="${pListforAll}">
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
					<!-- Modal for Course -->
					<div class="modal fade" id="courseMID" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-book'></i>&nbsp;課程</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<p>courseMID test</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for course-->
					<!-- Modal for Score -->
					<div class="modal fade" id="scoreMID" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-poll'></i>&nbsp;成績 (最新3筆紀錄)</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered" style="text-align:center">
										<thead>
											<tr>
												<th class="table-info" scope="col">學生名字</th>
												<th class="table-info" scope="col">課程代號</th>
												<th class="table-info" scope="col">科目名稱</th>
												<th class="table-info" scope="col">次數</th>
												<th class="table-info" scope="col">分數</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="post" items="${scoreforParent}">
											<tr>
												<td>${post.student.name}</td>
												<td>${post.classlist.classCode}</td>
												<td>${post.classlist.course.courseSubject}</td>
												<td>${post.frequency}</td>
												<td>${post.score}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
									<a type="button" class="btn btn-primary" href="${contextRoot}/frontscore">看更多</a>
								</div>
							</div>
						</div>
					</div>
					<!-- end of modal for score -->
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
<script type="text/javascript">
//console.log($(".btn-outline-success"));
// ========================== 家長聯絡簿Ajax ==========================
/* 視窗載入事件：帶入【家長】課程選單 */
window.onload = function() { 
	var xhr1 = new XMLHttpRequest();
    xhr1.open("GET", "<c:url value='/allParentClassList.json'/>", true);
    xhr1.send();
    xhr1.onreadystatechange = function(){
    	if (xhr1.readyState == 4 && xhr1.status == 200) {
    		var clsInfoList = JSON.parse(xhr1.responseText);
    		// console.log(clsInfoList);
	        if (clsInfoList.length > 0){
		        for (let i = 0; i < clsInfoList.length; i++) {
		        	// (1) 列出課程選單
		        	var clslistId = clsInfoList[i].classListId;
		        	var clscode = clsInfoList[i].classCode;
		        	var category = clsInfoList[i].courseCategory;
		        	var subject = clsInfoList[i].courseSubject;
		        	var grade = clsInfoList[i].courseGrade;
		        	var level = clsInfoList[i].courseClass;
		        	var studentId = clsInfoList[i].studentId;
		        	var itemStr = '【'+clscode+'】&nbsp&nbsp&nbsp'+category+'班&nbsp&nbsp-&nbsp&nbsp'+subject+'&nbsp&nbsp-&nbsp&nbsp'+grade+level+'年級';
		        	var optObj = '<option value=\"'+clslistId+'\">'+itemStr+'</option>';
		        	$('#classInfoList').append(optObj);
		        	
		        	// (2) 埋隱藏的clslistId、studentId
		        	// <span id="cli(放clslistId)" hidden>(放studentId)</span>
		        	 var hidSpanObj = '<span class="" id="cli'+clslistId+'" data-id="'+studentId+'" hidden>'+clslistId+'</span>';
		        	$('#sthHidden').append(hidSpanObj);
	        	}
	        } else {
	        	var optObj = '<option value=\"-2\" disabled>查無結果</option>';
	        	$('#classInfoList').append(optObj);
	        }
      	}
    }
} 

/* 選單change事件 */	
$("#classInfoList").change(function(){
	
	// 抓選到的option的value屬性值(classListId=?)、隱藏欄位的data-id屬性值(studentId=?)
	var selectedClassListId = $(this).prop("value"); 
	// console.log("selectedClassListId = "+ selectedClassListId);
	
	var idname = "#cli"+selectedClassListId;
	// console.log(idname);

	var selectedStudentId = $(idname).attr("data-id");
	// console.log("selectedStudentId = "+ selectedStudentId);
	
	$(idname).addClass("selectedSpan");
	
	showContactBookDetail(selectedClassListId,selectedStudentId);
	
});


/* 簽名click事件 */
$(document).on('click', '.bx-tada', function(){
	
	console.log($(this));
	
	var selectedClassListId = $(".selectedSpan").text(); 
	console.log("selectedClassListId = "+ selectedClassListId);
	
	var selectedStudentId = $(".selectedSpan").attr("data-id");
	console.log("selectedStudentId = "+ selectedStudentId);
	
	var thisCbsId = $(this).closest("td").prev().prev().prev().prev().prev().prev().prev().text();
	console.log("thisCbsId = " + thisCbsId);
	
	// 依click到的icon，執行方法二
	updateThisParentSign(thisCbsId);
	
	// 修改為已簽名的樣式 (處理原因：更新資料後不會畫面無法重新載入表格json來呈現修改後結果)
	// (1) 更改狀態為已簽名
	var textInfo = $(this).parent().siblings('.signInfo');	
	textInfo.css('color','black');
	textInfo.text('已簽名');
	
	// (2) 移除icon
	$(this).remove();
		
})

//---------------------- 方法 ----------------------
// 方法二：依cbsId，來執行單筆update ContactBookSign
function updateThisParentSign(thisCbsId){
	var xhr3 = new XMLHttpRequest();
	xhr3.open("GET","<c:url value='/ContactBook/P_Update?cbsId="+thisCbsId+"'/>",true); 
	xhr3.send();
}

// 方法一：依選到的項目(classListId)帶出對應的聯絡簿清單
function showContactBookDetail(selectedClassListId,selectedStudentId){
	// console.log(selectedClassListId)
	// console.log(selectedStudentId)	
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET","<c:url value='/parentContactBookList.json'/>"+"?classListId="+selectedClassListId+"&studentId="+selectedStudentId,true); 
	xhr2.send();    
	xhr2.onreadystatechange = function(){
  		
  		if(xhr2.readyState == 4 && xhr2.status == 200){
  			
  			var map = JSON.parse(xhr2.responseText);
  			// console.log(map);
	  	  	
  			$('#cbList tbody tr td').remove(); // 清除還在畫面上的聯絡簿篩選結果清單(避免表格疊加))
  			
	  	  	cb_content ='<tbody id="cbList-data">';
	  	  	if (map.cblpDto.length > 0){
		  	  	for (i = 0 ; i < 3 ; i++){
					if(!map.cbspDto[i]){ // undefined => false
						break;
					}
		  	  		console.log(map.cbspDto[i]);

		  	    	cb_content +='<tr>';
		  	    	cb_content +='<td hidden>' + map.cbspDto[i].cbsId + '</td>';
		  	    	cb_content +='<td>' + map.cblpDto[i].create_at + '</td>';
		  	    	cb_content +='<td>' + map.cblpDto[i].studentName + '</td>'; 
		  	    	
		  	    	// cb_content +='<td>' + map.cblpDto[i].courseContent + '</td>';
		  	    	if (map.cblpDto[i].courseContent != null){
		  	    		cb_content +='<td style="width:150px">' + map.cblpDto[i].courseContent + '</td>';
		  	    	} else {
		  	    		cb_content +='<td style="width:150px"></td>';
		  	    	}
		  	    	
		  	    	// cb_content +='<td>' + map.cblpDto[i].homework + '</td>'; 
		  	    	if (map.cblpDto[i].homework != null){
		  	    		cb_content +='<td style="width:150px">' + map.cblpDto[i].homework + '</td>';
		  	    	} else {
		  	    		cb_content +='<td style="width:150px"></td>';
		  	    	}
		  	    	
		  	    	// cb_content +='<td>' + map.cblpDto[i].quizNotice + '</td>';
		  	    	if (map.cblpDto[i].quizNotice != null ){
		  	    		cb_content +='<td style="width:150px">' + map.cblpDto[i].quizNotice + '</td>';
		  	    	} else {
		  	    		cb_content +='<td style="width:150px"></td>';
		  	    	}
		  	    	
			  	    // cb_content +='<td>' + map.cbspDto[i].parentSign + '</td>';
					if (map.cbspDto[i].parentSign == 1){
						cb_content +='<td>已簽名</td>';
						cb_content +='<td></td>';
					} else if (map.cbspDto[i].parentSign == 0) {
						cb_content +='<td class="signInfo" style="color:red">未簽名</td>';
						cb_content +="<td><i class='bx bx-pen bx-tada' style='font-size:28px'></i></td>";
					} else {
						cb_content +='<td>error</td>';
					}
		  	    	
		  	    	cb_content +='</tr>';
	  	  		} // end of for loop 
		    } else {
		    	// console.log(cbList.length);
		    	cb_content +='<tr><td colspan="7">查無結果</td></tr>';
		    }
  			cb_content +='</tbody>';	
  			$('#cbList').append(cb_content);	
  		}
  	}	
}

</script>

</body>

</html>

