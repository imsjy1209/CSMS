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
	width: 1000px;
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

	<!-- Navbar -->
	<jsp:include page="../layout/nav_parent.jsp"></jsp:include>
	<br><br>
	<div class="wrapper">
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
					<h4>想想要放啥咪??(因為家長沒有活動功能，所以不能有輪播活動圖)</h4>
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
								<h5 class="modal-title" id="exampleModalCenterTitle"><b><i class='bx bx-check-square'></i>出缺勤</b></h5>
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
							<h5 class="modal-title" id="exampleModalCenterTitle"><b><i class='bx bx-book'></i>&nbsp;課程</b></h5>
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

							<h5 class="modal-title" id="exampleModalCenterTitle"><b><i class='bx bx-poll'></i>&nbsp;成績 (最新3筆紀錄)</b></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">


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
							<a type="button" class="btn btn-primary" href="${contextRoot}/frontParentscore">看更多</a>
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
							<h5 class="modal-title" id="exampleModalCenterTitle"><b><i class='bx bx-book-reader'></i>&nbsp;聯絡簿 (最新3筆紀錄)</b></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
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


		</div>
		<!-- end of modal -->


	</div>

<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
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

