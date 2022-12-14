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
<jsp:include page="../layout/nav_parent.jsp"></jsp:include>
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
	.menu{
		margin: auto;
	}
	.aside {
		/* border: 1px solid red;  */
		margin-left: 50px;
		margin-top: 5px;
		position: relative;
		justify-content: center;
	}
	.btnli {
		border: none;
		background-color: transparent;
	}
	/* start with icon css */
	.menu ul{
		position: relative;
		display: flex;
		gap: 80px;
		justify-content: center;
		margin-top: 60px;
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
		box-shadow: 0 0 0 15px var(--clr),
		0 0 0 20px var(--bg),
		0 0 0 27px var(--clr);;
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
		font-size: 70px;
		filter: drop-shadow(0 0 20px var(--clr))
				drop-shadow(0 0 40px var(--clr))
				drop-shadow(0 0 60px var(--clr));			
	}
</style>
		</head>
		<body>
				<div class="wrapper">
					<div class="announcementDiv"><!-- ????????? -->
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
						<!-- Modal????????? -->	
						<!-- <div class="menuToggle">
							<i class='bx bx-list-ul' style="font-size: 90px; color:black" ></i>
						</div> -->
						<div class="menu">
							<ul>
								<li style="--i:0.1s;--clr:#1877f2;">
									<a class="absCheckIcon btnli" data-toggle="modal" data-target="#absentMID">
										<i class='bx bx-calendar-check hoverLight'> </i>
									</a>
								</li>
								<li style="--i:0.2s;--clr:#ff0000;">
									<a class="lessonIcon btnli" data-toggle="modal" data-target="#courseMID">
										<i class='bx bx-book hoverLight' title="??????"></i>
									</a>
								</li>
								<li style="--i:0.3s;--clr:#f69930;">
									<a class="scoreIcon btnli" data-toggle="modal" data-target="#scoreMID">
										<i class='bx bx-bar-chart bx-rotate-90 hoverLight'></i>
									</a>
								</li>
								<li style="--i:0.4s;--clr:#1da1f2;">
									<a class="contactBookIcon btnli" data-toggle="modal" data-target="#contactBookMID">
										<i  class='bx bx-book-reader hoverLight'></i>
									</a>
								</li>
							</ul>
						</div>
					</div><!-- end of class=aside -->
					<!-- Modal????????? -->
					<!-- Modal for Absent -->
					<div class="modal fade" id="absentMID" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">
										<b><i class='bx bx-check-square'></i>???????????????</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered" style="text-align:center">
										<thead>
											<tr>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">????????????</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="personalAbsent" items="${kidsGotoSchool}">
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
															<c:when test="${personalAbsent.arrviedOrNot == 0}">??????
															</c:when>
															<c:when test="${personalAbsent.arrviedOrNot == 1}">??????
															</c:when>
															<c:when test="${personalAbsent.arrviedOrNot == 2}">??????
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
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
										<b><i class='bx bx-book'></i>&nbsp;??????</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
							<c:forEach var="oneStu" items="${parent.student}">
								<table class="table table-bordered" style="text-align: center">
									<tr>
										<th class="table-info" scope="col">????????????</th>
									</tr>
									<tr>
										<td>${oneStu.name}</td>
									</tr>
								</table>
								
									<table class="table table-bordered" style="text-align: center">
										<thead>
											<tr>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">??????</th>
											</tr>
										</thead>
										<tbody>
												<c:forEach var="oneCsl" items="${oneStu.classStudentLists}">
												<tr>
															<td>${oneCsl.classList.course.courseSubject}</td>
															<td>${oneCsl.classList.classCode}</td>
															<td>${oneCsl.studentNo}</td>
															<td>${oneCsl.classList.school.name}</td>
															<td>${oneCsl.classList.teacher.name}</td>
															<td>${oneCsl.classList.room.roomName}</td>
															<td>${oneCsl.classList.classMember}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
							</c:forEach>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
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
										<b><i class='bx bx-poll'></i>&nbsp;?????? (??????3?????????)</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<table class="table table-bordered" style="text-align:center">
										<thead>
											<tr>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">????????????</th>
												<th class="table-info" scope="col">??????</th>
												<th class="table-info" scope="col">??????</th>
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
									<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
									<a type="button" class="btn btn-primary" href="${contextRoot}/frontscore">?????????</a>
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
										<b><i class='bx bx-book-reader'></i>&nbsp;????????? (??????3?????????)</b>
									</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
	  									<label for="exampleFormControlSelect1">???????????????</label>
	  									<select class="form-control" id="classInfoList" name="classInfoList">
	    									<option value="-1" selected="selected" hidden>?????????</option>
	  									</select>
	  								</div>
									<br>
									<div id="sthHidden"><!-- ???studentId --></div>
						  			<div>
							  			<table id="cbList" class="table table-bordered" style="text-align:center;font-size:12px;">
							  				<thead  id="cbList-title">
							    				<tr>
											    	<th class="table-info" scope="col" hidden>??????</th>
											     	<th class="table-info" scope="col">????????????</th>
											     	<th class="table-info" scope="col">????????????</th>
											    	<th class="table-info" scope="col">????????????</th>
											    	<th class="table-info" scope="col">????????????</th>
											     	<th class="table-info" scope="col">????????????</th>
											     	<th class="table-info" scope="col">??????</th>
											     	<th class="table-info" scope="col">??????</th>
										    	</tr>
											</thead>
										</table>
						  			</div>
					  			</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
									<a type="button" class="btn btn-primary" href="${contextRoot}/ContactBook/P_Index">?????????</a>
								</div>
							</div>	
						</div>
					</div>		
					<!-- end of modal -->	
				</div> <!-- end of class=article -->
<!-- footer -->
<jsp:include page="../footer/footer.jsp"></jsp:include>


<!-- CDN -->
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
		
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
		
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
		
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
		
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js"
    integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" crossorigin="anonymous"></script>
        
<script type="text/javascript">
//console.log($(".btn-outline-success"));
// ========================== ???????????????Ajax ==========================
/* ??????????????????????????????????????????????????? */
window.onload = function() {
	console.log('${kidsGotoSchool}'); 
	var xhr1 = new XMLHttpRequest();
    xhr1.open("GET", "<c:url value='/allParentClassList.json'/>", true);
    xhr1.send();
    xhr1.onreadystatechange = function(){
    	if (xhr1.readyState == 4 && xhr1.status == 200) {
    		var clsInfoList = JSON.parse(xhr1.responseText);
    		// console.log(clsInfoList);
	        if (clsInfoList.length > 0){
		        for (let i = 0; i < clsInfoList.length; i++) {
		        	// (1) ??????????????????
		        	var clslistId = clsInfoList[i].classListId;
		        	var clscode = clsInfoList[i].classCode;
		        	var category = clsInfoList[i].courseCategory;
		        	var subject = clsInfoList[i].courseSubject;
		        	var grade = clsInfoList[i].courseGrade;
		        	var level = clsInfoList[i].courseClass;
		        	var studentId = clsInfoList[i].studentId;
		        	var itemStr = '???'+clscode+'???&nbsp&nbsp&nbsp'+category+'???&nbsp&nbsp-&nbsp&nbsp'+subject+'&nbsp&nbsp-&nbsp&nbsp'+grade+level+'??????';
		        	var optObj = '<option value=\"'+clslistId+'\">'+itemStr+'</option>';
		        	$('#classInfoList').append(optObj);
		        	
		        	// (2) ????????????clslistId???studentId
		        	// <span id="cli(???clslistId)" hidden>(???studentId)</span>
		        	 var hidSpanObj = '<span class="" id="cli'+clslistId+'" data-id="'+studentId+'" hidden>'+clslistId+'</span>';
		        	$('#sthHidden').append(hidSpanObj);
	        	}
	        } else {
	        	var optObj = '<option value=\"-2\" disabled>????????????</option>';
	        	$('#classInfoList').append(optObj);
	        }
      	}
    }
} 

/* ??????change?????? */	
$("#classInfoList").change(function(){
	
	// ????????????option???value?????????(classListId=?)??????????????????data-id?????????(studentId=?)
	var selectedClassListId = $(this).prop("value"); 
	// console.log("selectedClassListId = "+ selectedClassListId);
	
	var idname = "#cli"+selectedClassListId;
	// console.log(idname);

	var selectedStudentId = $(idname).attr("data-id");
	// console.log("selectedStudentId = "+ selectedStudentId);
	
	$(idname).addClass("selectedSpan");
	
	showContactBookDetail(selectedClassListId,selectedStudentId);
	
});


/* ??????click?????? */
$(document).on('click', '.bx-tada', function(){
	
	console.log($(this));
	
	var selectedClassListId = $(".selectedSpan").text(); 
	console.log("selectedClassListId = "+ selectedClassListId);
	
	var selectedStudentId = $(".selectedSpan").attr("data-id");
	console.log("selectedStudentId = "+ selectedStudentId);
	
	var thisCbsId = $(this).closest("td").prev().prev().prev().prev().prev().prev().prev().text();
	console.log("thisCbsId = " + thisCbsId);
	
	// ???click??????icon??????????????????
	updateThisParentSign(thisCbsId);
	
	// ??????????????????????????? (??????????????????????????????????????????????????????????????????json????????????????????????)
	// (1) ????????????????????????
	var textInfo = $(this).parent().siblings('.signInfo');	
	textInfo.css('color','black');
	textInfo.text('?????????');
	
	// (2) ??????icon
	$(this).remove();
	
	// (3) ??????????????????
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'top-end',
	    showConfirmButton: false,
	    timer: 2000
	})

	Toast.fire({
		icon: 'success',
		title: '????????????'
	})
		
})

//---------------------- ?????? ----------------------
// ???????????????cbsId??????????????????update ContactBookSign
function updateThisParentSign(thisCbsId){
	var xhr3 = new XMLHttpRequest();
	xhr3.open("GET","<c:url value='/ContactBook/P_Update?cbsId="+thisCbsId+"'/>",true); 
	xhr3.send();
}

// ??????????????????????????????(classListId)??????????????????????????????
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
	  	  	
  			$('#cbList tbody tr td').remove(); // ???????????????????????????????????????????????????(??????????????????))
  			
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
						cb_content +='<td>?????????</td>';
						cb_content +='<td></td>';
					} else if (map.cbspDto[i].parentSign == 0) {
						cb_content +='<td class="signInfo" style="color:red">?????????</td>';
						cb_content +="<td><i class='bx bx-pen bx-tada' style='font-size:28px'></i></td>";
					} else {
						cb_content +='<td>error</td>';
					}
		  	    	
		  	    	cb_content +='</tr>';
	  	  		} // end of for loop 
		    } else {
		    	// console.log(cbList.length);
		    	cb_content +='<tr><td colspan="7">????????????</td></tr>';
		    }
  			cb_content +='</tbody>';	
  			$('#cbList').append(cb_content);	
  		}
  	}	
}
//=====================homepage????????????=======================
	// let menuToggle = document.querySelector('.menuToggle');
	// 			menuToggle.onclick = function () {
	// 				menuToggle.classList.toggle('active');
	// 			}
</script>

</body>

</html>

