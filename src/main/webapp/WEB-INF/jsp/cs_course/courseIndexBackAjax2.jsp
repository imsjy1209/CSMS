<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<jsp:include page="../framePage/sideBar.jsp"></jsp:include>

<div class="modal fade bd-example-modal-xl" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="bd-example-modal-xl modal-dialog modal-dialog-centered" role="document">
    <div class="bd-example-modal-xl modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Course Edit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        </button>
      </div>
      <div class="modal-body">
        
        
        <form action="${pageContext.request.contextPath}/updateCourseData2.controller" method="POST"
		class="row g-3 form1" enctype="multipart/form-data">
		<input type=hidden name="id" value="${courseForUpdate.id}"/>
		<div class="col-md-4">
			<label for="courseYear" class="form-label">課程年度</label> <input
				type="text" name="courseYear" class="form-control formYear" id="courseYear"
				value="${courseForUpdate.courseYear}">
		</div>

		<div class="col-md-4">
			<label for="courseSemester" class="form-label">課程學期</label>
            <input
				type="text" name="courseSemester" class="form-control formSem" id="courseSemester"
				value="${courseForUpdate.courseSemester}">
            <!-- <select name="courseSemester" id="">
                <option value="上">上</option>
                <option value="下">下</option>
            </select> -->
           
		</div>
		
		<div class="col-md-4">
			<label for="courseCategory" class="form-label">課程類別</label>
            <input
            type="text" name="courseCategory" class="form-control formCat" id="courseCategory"
            value="${courseForUpdate.courseCategory}">
		</div>
		
        <div class="col-md-4">
			<label for="courseSubject" class="form-label">課程科目</label> <input
				type="text" name="courseSubject" class="form-control formSub" id="courseSubject"
				 value="${courseForUpdate.courseSubject}">
		</div>
		
        <div class="col-md-4">
			<label for="courseGrade" class="form-label">適合學級</label> <input
				type="text" name="courseGrade" class="form-control formGra" id="courseGrade"
				 value="${courseForUpdate.courseGrade}">
		</div>
		
        <div class="col-md-4">
			<label for="courseClass" class="form-label">適合年級</label> <input
				type="text" name="courseClass" class="form-control formCla" id="courseClass"
				 value="${courseForUpdate.courseClass}">
		</div>
		
        <div class="col-md-4">
			<label for="coursePrice" class="form-label">課程售價</label> <input
				type="text" name="coursePrice" class="form-control formPri" id="coursePrice"
				 value="${courseForUpdate.coursePrice}">
		</div>
		
        <div class="col-md-8">
			<label for="courseTeachTime" class="form-label">授課星期</label> <input
				type="text" name="courseTeachTime" class="form-control formTT" id="courseTeachTime"
				 value="${courseForUpdate.courseTeachTime}">
		</div>
		
		<div class="col-md-2">
			<label for="courseMember" class="form-label">上限人數</label> <input
				type="text" name="courseMember" class="form-control formMem" id="courseMember"
				 value="${courseForUpdate.courseMember}">
		</div>
		
        <div class="col-md-5">
			<label for="startDate" class="form-label">開課日期</label> <input
				type="text" name="startDate" class="form-control formSD" id="startDate"
				value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${courseForUpdate.startDate}"/>">
		</div>
		
        <div class="col-md-5">
			<label for="endDate" class="form-label">結課日期</label> <input
				type="text" name="endDate" class="form-control formED" id="endDate"
				value="<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${courseForUpdate.endDate}"/>">
		</div>
		
        <div class="col-md-4">
			<label for="courseOnOff" class="form-label">上架(0/1)</label>
            <input
				type="text" name="courseOnOff" class="form-control formOnOff" id="courseOnOff"
				 value="${courseForUpdate.courseOnOff}">
            <!-- <select name="courseCategory" id="">
                <option value="1">上架</option>
                <option value="0">下架</option>
            </select> -->
		</div>



		<div class="input-group mb-13">
			<label class="input-group-text" for="imgInp">Upload</label> <input
				type="file" name="coursePic" class="form-control" id="imgInp"
				accept="image/gif, image/jpeg, image/png">
		</div>
		<div class="col-md-6">
			Picture Preview <img width="200px" id="preview_imgInp" src="data:image/jpeg;base64,${courseForUpdate.coursePic}" />
		</div>

		<div class="col-12">
			<button type="submit" class="btn btn-primary">Update</button>
			<a type="button" class="btn btn-dark" href="${contextRoot}/courseAllPageBackAjax.page">Back To All Course Data</a>
			${msg.ok}
		</div>
	</form>
        
        
        
        
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>



			<h3 class='main-title'>Main Info</h3>
<!--             <div class="row"> -->
			<div id="forSelect">
			
			</div>
            <div class="bigDiv">
 				<div class="col-xs-6">
           			<table id="table" class="table table-striped mt-5 ">
			
					<thead id="thead-title">
				
					</thead>

					<tbody id="content-data">
			
					</tbody>
			
			
		</table>
</div>

<!--  <div class="subDiv col-xs-6"  style='display: none'> -->
<!--  <table id="table2" class="table table-striped mt-5 "> -->
<!--  <thead id="thead-title2"> -->
<!--  </thead> -->

<!--  <tbody id="content-data2"> -->
			
<!-- </tbody> -->
<!--  </table> -->
<!--  </div> -->
 
 
   </div>         
       </div>
    </nav>

</body>    

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
		
<!-- 	<script src="https://code.jquery.com/jquery-3.6.0.min.js" -->
<!-- 		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" -->
<!-- 		crossorigin="anonymous"></script> -->



<script type="text/javascript">


//======================Course=======================
	$('#course-Btn').click(function(){
		
		$('.classListSelDiv').remove();
		
		$('.main-title').text('Course')
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/AllCourseBackAjax.page' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				var content0 = "";
				content0 += 
				"<tr>" +
// 				"<td>編輯</td>"+
// 				"<td>id</td>"+
				"<td>年度</td>"+
				"<td>學期</td>"+
				"<td>分類</td>"+
				"<td>學級</td>"+
				"<td>年級</td>"+
				"<td>科目</td>"+
				"<td>價錢</td>"+
				"<td>授課時間</td>"+
				"<td>人數</td>"+
				"<td>起始</td>"+
				"<td>結業</td>"+
				"<td>上/下架</td>"+
				"<td>圖片</td>"+
				"<td>編輯</td>"+
// 				"<td>Function</td>"+
				"</tr>"; 
				
				var content = "";
				var courseList = JSON.parse(xhr.responseText);
				console.log(courseList);
				for(var i=0; i < courseList.length; i++){
					content += 
					"<tr>" +
// 						"<td><i style='font-size:36px;' class='bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +	
						"<td id='course-id' hidden='hidden'>" + courseList[i].id + "</td>" +
						"<td class='courseYearInfo'>" + courseList[i].courseYear + "</td>" +
						"<td class='courseSemInfo'> " + courseList[i].courseSemester + "</td>" +
						"<td class='courseCategoryInfo'>" + courseList[i].courseCategory + "</td>" +
						"<td class='courseGradeInfo'>" + courseList[i].courseGrade + "</td>" +
						"<td class='courseClassInfo'>" + courseList[i].courseClass + "年級</td>" +
						"<td class='courseSubjectInfo'>" + courseList[i].courseSubject + "</td>" +
	    	       		"<td class='coursePriceInfo'>" + courseList[i].coursePrice + "</td>" +
	    	       		"<td class='courseTeachTimeInfo'>" + courseList[i].courseTeachTime + "</td>" +
	    	       		"<td class='courseMemberInfo'>" + courseList[i].courseMember + "</td>" +
	    	       		"<td class='startDateInfo'>" + courseList[i].startDate + "</td>" +
	    	       		"<td class='endDateInfo'>" + courseList[i].endDate + "</td>" +
	    	       		"<td><button class='con'>ON</button><button class='coff'>OFF</button></td>" +
	    	       		"<td>" + "<img alt='img' width='50px' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" + "</td>" +
// 	    	       		"<td><a href='${contextRoot}/updateCourseData1.controller?id=" + courseList[i].id + "' style='font-size:36px;' class='courseEditBtn bx bxs-edit bx-tada bx-rotate-90' ></a></td>" +
	    	       		"<td><a style='font-size:36px;' class='courseEditBtn bx bxs-edit bx-tada bx-rotate-90' ></a></td>" +
// 	    	       		"<td class='test1'><a href='${contextRoot}/updateCourseData1.controller?id=" + courseList[i].id + "' type='button' class='btn btn-warning'>Edit</a></td>" +
// 						"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
						"<td class='onOrOff-td'>"+ "<input class='onOrOff' type='hidden' value='" + courseList[i].courseOnOff + "'/>" + "</td>" +
			        "</tr>";
				}
				var info0 = document.getElementById("thead-title");
				info0.innerHTML = content0;
				
				var info = document.getElementById("content-data");
				info.innerHTML = content;
		
				//=========上下架的燈控=========
				var onlist = $(".con");
				var offlist = $(".coff")
				var conlist = $(".onOrOff")
				for(var i=0;i<conlist.length;i++){
					if(conlist.eq(i).val()==1){
						onlist.eq(i).addClass('active');
					}
					else{
						offlist.eq(i).addClass('active');
					}
					
				}
				//=========上下架的變更=========
				$(".con").click(function(){
				var onOrOffVal = $(this).parent().siblings('.onOrOff-td').children().val();
				var nowId = $(this).parent().siblings("#course-id").text();
				if(onOrOffVal==0){
					console.log("change value to 1")
					$(this).addClass('active');
					$(this).next().removeClass('active');
					$(this).parent().siblings('.onOrOff-td').children().val(1);
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateCourseDataOnOrOff.controller?id=" + nowId + "&onOrOff=1' />", true);
					xhr.send();
				}
				
				})
				$(".coff").click(function(){
				var onOrOffVal =$(this).parent().siblings('.onOrOff-td').children().val();
				var nowId = $(this).parent().siblings("#course-id").text();
				if(onOrOffVal==1){
					console.log("change value to 0")
					$(this).addClass('active');
					$(this).prev().removeClass('active');
					$(this).parent().siblings('.onOrOff-td').children().val(0);
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateCourseDataOnOrOff.controller?id=" + nowId + "&onOrOff=0' />", true);
					xhr.send();
				}
				})
				
// 				//編輯功能
// 				$('.bxs-edit').click(function(){
// // 					console.log($(this).parent().siblings('.courseInfo'))
					
// 					$(this).parent().siblings('.courseInfo').each(function(){
// 						var thisVal = $(this).text();
// 						var courseInfoEdit ="<input class='courseEdit' type='text' size='2' value='"+thisVal+ "'>";
// 						$(this).html(courseInfoEdit)
// 					})
					
// 					$('.courseEdit').change(function(){
// 						var len = $('.courseEdit').length;
// 						var v1 = "";
// 						console.log(v1)
						
// 						var j = 'param';
// 						var i = 0;
// 						for(i = 0; i < len; i++) {
// 							v1=	$(".courseEdit:eq(" + i + ")").val()
// 						 eval('var ' + j + i + '= ' + v1 + ';');
// 						}
// 						console.log("param0 = " + param0);
// // 						console.log("param1 = " + param1);
						

// 					})
// // 					var cy =$(this).parent().siblings('.courseYear').text();
// // 					var cc =$(this).parent().siblings('.courseCategory').text();
// // 					var cs =$(this).parent().siblings('.courseSubject').text();
// // 					var cg =$(this).parent().siblings('.courseGrade').text();
// // 					var ccl =$(this).parent().siblings('.courseClass').text();
// // 					var cp =$(this).parent().siblings('.coursePrice').text();
// // 					var ct =$(this).parent().siblings('.courseTeachTime').text();
// // 					var cm =$(this).parent().siblings('.courseMember').text();
// // 					var sd =$(this).parent().siblings('.startDate').text();
// // 					var ed =$(this).parent().siblings('.endDate').text();
// // 					var cof =$(this).parent().siblings('.courseOnOff').text();
					
// // 					contentEdit1 = "<input class='stuNoEdit' type='text' size='3' value='"+cy+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+cc+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+cs+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+cg+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+ccl+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+cp+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+ct+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+cm+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+sd+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+ed+ "'>"
// // 					contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+cof+ "'>"
// 				})
				
				
				//=========多選變色功能=========
				$('input[type="checkbox"]').click(function() {
					console.log('checkbox', $(this));
					let bgColor = 'none';
					if ($(this).prop('checked')) {
						bgColor = 'lightblue';
					}
					$(this).closest('tr').css('background', bgColor)
			})
		}
	}
		
})


//========================ClassList==================
	
	$('#classList-Btn').click(function(){
		findAllClassListGo()
	})
	function findAllClassListGo(){
		$('.main-title').text('ClassList')
		
//======Create ClassCode Select====================	
	var contentSel="";		
		contentSel += "<div class='classListSelDiv form-group row'>" +
						"<div class='col-sm-2 courseGrade'>" +
							"<label class='my-1 mr-2' for='inlineFormCustomSelectPref'>班級代碼</label>"+
  								"<select class='classCodeSel custom-select my-1 mr-sm-2' id='inlineFormCustomSelectPref'>"+

  								"</select>" +
						"</div>";
	$('#forSelect').html(contentSel);
//======End Of Create ClassCode Select==============	
	
	
	var xhr = new XMLHttpRequest();
	var xhrRoom = new XMLHttpRequest();
	xhrRoom.open("GET", "<c:url value='/findAllRoomAjax.controller' />", true);
	xhrRoom.send();
	
	xhr.open("GET", "<c:url value='/findAllClassListAjax.controller' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
// 			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>班導</td>"+
			"<td>行政</td>"+
			"<td>教室</td>"+
			"<td>分類</td>"+
			"<td>課程</td>"+
			"<td>人數</td>"+
			"<td>起始</td>"+
			"<td>結業</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var classListList = JSON.parse(xhr.responseText);
			console.log(classListList);
			
			var roomList = JSON.parse(xhrRoom.responseText);
// 			console.log(roomList);
			
			var contentClassCodeOpt = "<option selected value='0'>ClassCode Choose...</option>";
			var content = "";
			for(var i=0; i < classListList.length; i++){
				
			contentClassCodeOpt +=
				"<option value='"+Number(i+1)+"'>" + classListList[i].classCode + "</option>";
				
				content += 
// 				"<tr><td><input type='checkbox'/></td>" +	
				"<td class='classListId'>" + classListList[i].id + "</td>" +
				"<td><a class='class-studentList' href='####'>" + classListList[i].classCode + "</a></td>" +
				"<td>" + classListList[i].teacher.name + "</td>" +
				"<td>" + classListList[i].school.name + "</td>" +
				"<td>" + 
				"<select class='roomDataSelect'>"+
					"<option value='" +classListList[i].room.id+"'>"+classListList[i].room.roomName+"</option>"
				for(var j=0;j<roomList.length;j++){
	content += 	"<option value='"+ roomList[j].id +"'>"+roomList[j].roomName+"</option>";
					
				}
	content +=  "</select>"+
	
				"</td>" +
    	       	"<td>" + classListList[i].course.courseCategory + "班"+"</td>" +
    	       	"<td>" + classListList[i].course.courseSubject+"-" +
    	       			 classListList[i].course.courseGrade +
    	       			 classListList[i].course.courseClass + "年級</td>" +
    	       	"<td class='classMember'>" + classListList[i].classMember + "</td>" +
    	       	"<td>" + classListList[i].course.startDate + "</td>" +
    	       	"<td>" + classListList[i].course.endDate + "</td>" +
    	       	"<td class='test1'><i style='font-size:36px;' class='classList-edit-btn bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('.classCodeSel').html(contentClassCodeOpt);
			
			//=====編輯按鈕功能=============
			$('.classList-edit-btn').click(function(){
				var classM = $(this).parent().siblings('.classMember')
				var clMem = classM.text();
				console.log(classM)
				
				contentEdit = "<input class='clMemEdit' type='text' size='1' value='"+ clMem + "'>";
				classM.html(contentEdit)
				
				$('.clMemEdit').change(function(){
					var clMemVal = $(this).val();
					var clId = $(this).parent().siblings('.classListId').text();
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateClssListMemberDataAjax.controller?clMemVal=" + clMemVal +"&clId=" + clId + "' />", true);
					xhr.send();
					
					var cslNewMem = $(this).parent();
					$(this).remove();
					cslNewMem.text(clMemVal);
					
				})
				
			})
			
			$('.roomDataSelect').change(function(){
				var roomId = $(this).find('option:selected').val();
// 				console.log(roomId);
				var classListId = $(this).parent().siblings('.classListId').text();
				console.log(classListId)
// 				console.log($(this))
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClssListRoomDataAjax.controller?classListId=" + classListId + "&roomId=" + roomId +"' />", true);
				xhr.send();
				
				console.log('change Success')
				
			})
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	}
	
//========================ClassRecord==================
	
	$('#classRecord-Btn').click(function(){
		$('.classListSelDiv').remove();
		$('.main-title').text('ClassRecord')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllClassRecordAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>班導</td>"+
			"<td>教室</td>"+
			"<td>開始時間</td>"+
			"<td>結束時間</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var classRecordList = JSON.parse(xhr.responseText);
// 			console.log(classRecordList);
			for(var i=0; i < classRecordList.length; i++){
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
				"<td>" + classRecordList[i].id + "</td>" +
				"<td>" + classRecordList[i].classList.classCode + "</td>" +
				"<td>" + classRecordList[i].teacher.name + "</td>" +
				"<td>" + classRecordList[i].room.roomName + "</td>" +
    	       	"<td>" + classRecordList[i].startTime + "</td>" +
    	       	"<td>" + classRecordList[i].endTime + "</td>" +
    	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})
	

	
//========================OrderList2==================
	
	$('#orderList-Btn').click(function(){
		$('.classListSelDiv').remove();
		$('.main-title').text('OrderList')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllOrderListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<th></th>"+
			"<th>訂單ID</th>"+
			"<th>訂購學生</th>"+
			"<th>總金額</th>"+
			"<th>付款方式</th>"+
			"<th>結帳時間</th>"+
// 			"<th>Function</th>"+
			"<th>Function</th>"+
			"</tr>";
			
			var content = "";
			var orderListList = JSON.parse(xhr.responseText);
			
			for(var i=0; i < orderListList.length; i++){
				content += 
				"<tr data-toggle='collapse' data-target='#demo" +i+"' class='accordion-toggle'>" +	
				"<td><button class='btn btn-default btn-xs'><i class='bx bx-happy-heart-eyes'></i></span></button></td>"+
				"<td class='ol-id'>" + orderListList[i].id + "</td>" +
				"<td>" + orderListList[i].student.name + "</td>" +
				"<td>" + orderListList[i].amount + "</td>" +
				"<td>" + orderListList[i].payment + "</td>" +
    	       	"<td>" + orderListList[i].orderDate + "</td>";
//     	       	"<td>" + orderListList[i].orderDetails[student.name] + "</td>"+
    	       	
      content +=
//     	  		"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='ol-del-btn btn btn-danger'>Delete</a></td>"+
           		"</tr>";
           		
     
	       	content +=  "<tr>" +
	       				"<td colspan='12' class='hiddenRow'>" +
	       				"<div class='accordian-body collapse' id='demo"+i+"'>" +
	       				"<table class='table table-bordered'>" +
	       				"<thead class='thead-dark'>" +
	       				
	       				"<tr class='info'>" +
	       				"<th></th>" +
	       				"<th>明細ID</th>" +
	       				"<th>訂購人</th>" +
	       				"<th>學級</th>" +
	       				"<th>科目</th>" +
	       				"<th>年級</th>" +
	       				"<th>金額</th>" +
	       				"<th>購買狀態</th>" +
	       				"<th>排課狀態</th>" +
// 	       				"<th>function</th>" +
// 	       				"<th>function</th>" +
	       				
	       				"</tr></thead>"+
	       				"<tbody>";
	       				
	      for(var j=0; j < orderListList[i].orderDetails.length; j++){	
	    	  content +=
	       				"<tr data-toggle='collapse' class='accordion-toggle'>"+
	       				"<td></td>" +
	       				"<td class='oDId-id'>" + orderListList[i].orderDetails[j].id + "</td>" +
	       				"<td class='student-id' style='display:none;'>" + orderListList[i].orderDetails[j].student.id + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].student.name + "</td>" +
	       				"<td class='course-id' style='display:none;'>" + orderListList[i].orderDetails[j].course.id + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseGrade + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseSubject+ "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseClass + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.coursePrice + "</td>" +
	       				"<td><span class='orderWaitText'>未結帳</span><span class='orderNoPText'>未購買</span><span class='orderFinText'>已購買</span><span class='order-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].confirmOrder +"</span></td>" +
// 	       				"<td><button class='orderWait'>未結帳</button><button class='orderNoP'>未購買</button><button class='orderFin'>已購買</button><span class='order-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].confirmOrder +"</span></td>" +
	    				"<td><span class='oDonText'>已排課</span><span class='oDoffText'>未排課</span><span class='arrange-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].arrangeClassList +"</span></td>" +
// 	    				"<td><button class='oDon'>已排課</button><button class='oDoff'>未排課</button><span class='arrange-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].arrangeClassList +"</span></td>" +
// 	       			  	"<td class='test1'><a type='button' class='btn btn-primary'>Edit</a></td>" +
// 	      	       		"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-primary'>Delete</a></td>"+
	       				"</tr>";
	       	}	
	      content +="</tbody></table></div></td></tr>"
	      
	      
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			
// 			//將是否已排課轉換成按鈕
// 			$('.arrange-info').each(function(){
// 				var arrangeInfo = $(this).text();
// 				if(arrangeInfo==1){
// 					$(this).prev().prev().addClass('active')
// 				}else{
// 					$(this).prev().addClass('active')
// 				}
				
// 			})
			
			//判斷Text要顯示已排課or Not
			$('.arrange-info').each(function(){
				var arrangeInfo = $(this).text();
				if(arrangeInfo==1){
					$(this).prev().attr('hidden','hidden')
				}else{
					$(this).prev().prev().attr('hidden','hidden')
				}
				
			})
			
// 			//將購買狀態轉換成按鈕
// 			$('.order-info').each(function(){
// 				var orderInfo = $(this).text();
// 				console.log(orderInfo)
// 				if(orderInfo==0){
// 					$(this).prev().prev().prev().addClass('active')
// 				}
// 				else if(orderInfo==1){
// 					$(this).prev().prev().addClass('active')
// 				}
// 				else{
// 					$(this).prev().addClass('active')
// 				}
// 			})
			
			//判斷Text要顯示哪種購買狀態
			$('.order-info').each(function(){
				var orderInfo = $(this).text();
				console.log(orderInfo)
				if(orderInfo==0){
// 					$(this).prev().prev().prev().attr('hidden','hidden')
					$(this).prev().prev().attr('hidden','hidden')
					$(this).prev().attr('hidden','hidden')
				}
				else if(orderInfo==1){
					$(this).prev().prev().prev().attr('hidden','hidden')
// 					$(this).prev().prev().addClass('active')
					$(this).prev().attr('hidden','hidden')
				}
				else{
					$(this).prev().prev().prev().attr('hidden','hidden')
					$(this).prev().prev().attr('hidden','hidden')
// 					$(this).prev().attr('active')
				}
			})
			
			
			
		//針對已購買課程的OrderDetail，透過CourseId找到對應的ClassListId並新增到ClassStudentList中
// 		$('.oDon').click(function(){
		
// 		if($(this).next().next().text()==0){
// 			$(this).addClass('active');
// 			$(this).next().removeClass('active');
// 		var studentId = $(this).parent().siblings('.student-id').text();
// 		var courseId = $(this).parent().siblings('.course-id').text();
// 		var orderId = $(this).parent().siblings('.oDId-id').text();
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET", "<c:url value='/findClassStudentListByCourseIdAndClassListIdAjax.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
// 		xhr.send();
// 		}else{
// 			console.log('nothing happened');
// 		}
// 	})
	
	
		//將已排課改成未排課
// 		$('.oDoff').click(function(){
// 		if($(this).next().text()==1){
// 			$(this).addClass('active');
// 			$(this).prev().removeClass('active');
// 		var studentId = $(this).parent().siblings('.student-id').text();
// 		var courseId = $(this).parent().siblings('.course-id').text();
// 		var orderId = $(this).parent().siblings('.oDId-id').text();
		
// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET", "<c:url value='/findClassStudentListByClassListIdAndStudentId.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
// 		xhr.send();
		
// 		}else{
// 			console.log('nothing happened')
// 			}
// 	})
			
			
			//刪除orderList
			$('.ol-del-btn').click(function(){
				if(window.confirm('確定刪除嗎?')){
					var orderListId = $(this).parent().siblings('.ol-id').text();
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/deleteOrderListByIdAjax.controller?orderListId="+orderListId+"' />", true);
					xhr.send();
					$(this).parent().remove();
					}
					else{
						console.log('nothing happened')
					}
			})
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})		
	
//========================OrderDetail==================
	
	$('#orderDetail-Btn').click(function(){
		$('.classListSelDiv').remove();
		$('.main-title').text('OrderDetail')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllOrderDetail.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<th></th>"+
// 			"<th>多選</th>"+
// 			"<th>OD_id</th>"+
// 			"<th>學生id</th>"+
			"<th>所屬學校</th>"+
			"<th>學生名稱</th>"+
			"<th>性別</th>"+
// 			"<th>方案id</th>"+
			"<th>方案資訊</th>"+
			"<th>購買狀態</th>"+
			"<th>排課狀態</th>"+
// 			"<th>Function</th>"+
// 			"<th>Function</th>"+
			"</tr>";
			
			var content = "";
			var orderDetailList = JSON.parse(xhr.responseText);
			
			console.log(orderDetailList);
			
			for(var i=0; i < orderDetailList.length; i++){
				content += 
// 				"<tr><td><input type='checkbox'/></td>" +	
				"<td></td>" +	
				"<td class='oDId-id' style='display:none;'>" + orderDetailList[i].id + "</td>" +
				"<td class='student-id' style='display:none;'>" + orderDetailList[i].student.id + "</td>" +
				"<td>" + orderDetailList[i].student.schoolName + "</td>" +
				"<td>" + orderDetailList[i].student.name + "</td>" +
				"<td>" + orderDetailList[i].student.gender + "</td>" +
				"<td class='course-id' style='display:none;'>" + orderDetailList[i].course.id + "</td>" +
				"<td>"+ orderDetailList[i].course.courseCategory +"班-"+ orderDetailList[i].course.courseGrade +orderDetailList[i].course.courseClass +"年級-"+ orderDetailList[i].course.courseSubject + "</td>" +
				"<td>"+ orderDetailList[i].course.coursePrice + "</td>" +
				"<td><button class='orderWait'>未結帳</button><button class='orderNoP'>未購買</button><button class='orderFin'>已購買</button><span class='order-info' hidden='hidden'>"+ orderDetailList[i].confirmOrder +"</span></td>" +
				"<td><button class='oDon'>已排課</button><button class='oDoff'>未排課</button><span class='arrange-info' hidden='hidden'>"+ orderDetailList[i].arrangeClassList +"</span></td>" +
//     	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class='oD-delete-td'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			//將是否已排課轉換成按鈕
			$('.arrange-info').each(function(){
				var arrangeInfo = $(this).text();
				if(arrangeInfo==1){
					$(this).prev().prev().addClass('active')
				}else{
					$(this).prev().addClass('active')
				}
				
			})
			
			//將購買狀態轉換成按鈕
			$('.order-info').each(function(){
				var orderInfo = $(this).text();
				console.log(orderInfo)
				if(orderInfo==0){
					$(this).prev().prev().prev().addClass('active')
				}
				else if(orderInfo==1){
					$(this).prev().prev().addClass('active')
				}
				else{
					$(this).prev().addClass('active')
				}
			})
			
	//針對已購買課程的OrderDetail，透過CourseId找到對應的ClassListId並新增到ClassStudentList中
	$('.oDon').click(function(){
		
		if($(this).next().next().text()==0){
		$(this).addClass('active');
		$(this).next().removeClass('active');
		var studentId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).parent().siblings('.course-id').text();
		var orderId = $(this).parent().siblings('.oDId-id').text();
		
		$(this).siblings('.arrange-info').text(1);
// 		$(this).next().text(1)
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findClassStudentListByCourseIdAndClassListIdAjax.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
		xhr.send();
		}else{
			console.log('nothing happened');
		}
				
	})
	
	$('.oDoff').click(function(){
		if($(this).next().text()==1){
			$(this).addClass('active');
			$(this).prev().removeClass('active');
		var studentId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).parent().siblings('.course-id').text();
		var orderId = $(this).parent().siblings('.oDId-id').text();
		
		$(this).siblings('.arrange-info').text(0);
// 		$(this).next().text(0)
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findClassStudentListByClassListIdAndStudentId.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
		xhr.send();
		
		}else{
			console.log('nothing happened')
			}
		
	})
			
			//刪除按鈕的功能
			$('.oD-delete-td').click(function(){
			var oDidDel = $(this).siblings('.oDId-id').text();
			console.log(oDidDel);
			if(window.confirm('確定刪除嗎?')){
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/deleteOrderDetailByIdAjax.controller?id=" + oDidDel + "' />", true);
				xhr.send();
				$(this).parent().remove();
				
		 	} 
		 	else{
		 		console.log("nothing happened")
		 	}
			})
			
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})		
	
//========================ClassStudentList==================
	
	$('#classStudentList-Btn').click(function(){
		$('.classListSelDiv').remove();
		$('.main-title').text('ClassStudentList')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllClassStudentListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
// 			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>學生名稱</td>"+
			"<td>座號</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var cslList = JSON.parse(xhr.responseText);
			
			console.log(cslList);
			
			for(var i=0; i < cslList.length; i++){
				content += 
				"<tr>"+
// 				"<td><i style='font-size:36px;' class='bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +	
				"<td class='cslId-td'>" + cslList[i].id + "</td>" +
				"<td>" + cslList[i].classList.classCode + "</td>" +
				"<td>" + cslList[i].student.name + "</td>" +
				"<td class='cslStudentNo'>" + cslList[i].studentNo + "</td>" +
//     	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
				"<td><i style='font-size:36px;' class='bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +	
    	       	"<td class='cslDel-td'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('.cslDel-td').click(function(){
				if(window.confirm('確定刪除嗎?')){
				var cslId = $(this).siblings('.cslId-td').text();
				console.log(cslId);
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/deleteClassStudentListByEntityAjax.controller?cslId=" + cslId +"' />", true);
				xhr.send();
				$(this).parent().remove();
				}
				else{
					console.log('nothing happened')
				}
			})
			
			//========座號修改=================
			$('.bxs-edit').click(function(){
				console.log($(this));
				var oriStuNo = $(this).parent().siblings('.cslStudentNo').text();
				contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+oriStuNo+ "'>";
				$(this).parent().siblings('.cslStudentNo').html(contentEdit);
				
				$('.stuNoEdit').blur(function(){
					var newStuNo = $(this).val();
					var cslId= $(this).parent().siblings('.cslId-td').text();
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateClassStudentListByIdAjax.controller?cslId=" + cslId +"&newStuNo=" + newStuNo + "' />", true);
					xhr.send();
					
					var cslStudentNoTd = $(this).parent();
					$(this).remove();
					cslStudentNoTd.text(newStuNo);
					
				})
				
			})
		}
	}
	})	

//========================Room==================
	
	$('#room-Btn').click(function(){
		$('.classListSelDiv').remove();
		$('.main-title').text('Room')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllRoomAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
// 			"<th>多選</th>"+
			"<th></th>"+
			"<th>id</th>"+
			"<th>教室名稱</th>"+
			"<th>教室容納人數</th>"+
			"<th>教室照片</th>"+
			"<th>Function</th>"+
			"<th>Function</th>"+
			"</tr>";
			
			var content = "";
			var roomList = JSON.parse(xhr.responseText);
			console.log(roomList);
			for(var i=0; i < roomList.length; i++){
				content += 
				"<tr>"+
// 				"<td><input type='checkbox'/></td>" +	
				"<td></td>"+
				"<td>" + roomList[i].id + "</td>" +
				"<td>" + roomList[i].roomName + "</td>" +
				"<td>" + roomList[i].roomSize + "</td>" +
    	    	"<td>" + "<img alt='img' width='100px' src='${contextRoot}/AllRoomPic/" + roomList[i].id +"' class='room-img'>" + "</td>" +
    	       	"<td class='test1'><a href='${contextRoot}/roomData/edit?id=" + roomList[i].id + "' type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})
	
	
	
//=======================版面動作=======================
	
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
//====================ClassList ClassCode Sel===============
	
	
	$(document).on('change','.classCodeSel',function(){
		console.log("7777")
		var classListId = $(this).val();
		
		if(classListId==0){
			findAllClassListGo()
		}
		
		var xhrClassList = new XMLHttpRequest();
		xhrClassList.open("GET", "<c:url value='/findClassListByIdAjax.controller?classListId="+ classListId +"' />", true);
		xhrClassList.send();


		xhrClassList.onreadystatechange = function() {
		if (xhrClassList.readyState == 4 && xhrClassList.status == 200) {
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td></td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>班導</td>"+
			"<td>行政</td>"+
			"<td>教室</td>"+
			"<td>分類</td>"+
			"<td>課程</td>"+
			"<td>人數</td>"+
			"<td>起始</td>"+
			"<td>結業</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var oneClassList = JSON.parse(xhrClassList.responseText);
			console.log(oneClassList);
			var content = "";
// 			for(var i=0; i < oneClassList.length; i++){
			content += 
// 				"<tr><td><input type='checkbox'/></td>" +	
// 				"<td>" + 
// 				"<select class='roomDataSelect'>"+
// 					"<option value='" +oneClassList.room.id+"'>"+oneClassList.room.roomName+"</option>"
// 				for(var j=0;j<roomList.length;j++){
// 	content += 	"<option value='"+ roomList[j].id +"'>"+roomList[j].roomName+"</option>";
// 				}
// 	content +=  "</select>"+
	
// 				"</td>" +
				"<tr data-toggle='collapse' data-target='#demo' class='accordion-toggle'>" +	
				"<td><button class='btn btn-default btn-xs'><i class='bx bx-happy-heart-eyes'></i></span></button></td>"+
    	       	"<td>" + oneClassList.id + "</td>" +
    	       	"<td>" + oneClassList.classCode+ "</td>" +
    	    	"<td>" + oneClassList.teacher.name+ "</td>" +
    	    	"<td>" + oneClassList.school.name+ "</td>" +
    	    	"<td>" + oneClassList.room.roomName+ "</td>" +
    	    	"<td class='course-id' style='display:none'>" + oneClassList.course.id +"</td>" +
    	    	"<td>" + oneClassList.course.courseCategory +"班"+"</td>" +
    	       	"<td>" + oneClassList.course.courseSubject +
    	       			oneClassList.course.courseGrade +
    	       			oneClassList.course.courseClass + "年級</td>" +
    	       	"<td class='classMember'>" + oneClassList.classMember + "</td>" +
    	       	"<td>" + oneClassList.course.startDate + "</td>" +
    	       	"<td>" + oneClassList.course.endDate + "</td>" +
    	       	"<td class='test1'><i style='font-size:36px;' class='classList-edit-btn bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
           		
           		
     		//========摺疊起來的學生資料=====================
	       	content +=  "<tr class='foldStudentInfo'>" +
	       				"<td colspan='12' class='hiddenRow'>" +
	       				"<div class='accordian-body collapse' id='demo'>" +
	       				"<table class='table table-bordered'>" +
	       				
	       				"<thead class='thead-dark'>" +
	       				"<tr class='info'>" +
	       				"<th></th>" +
	       				"<th>課程代碼</th>" +
	       				"<th>學生名稱</th>" +
	       				"<th>座號</th>" +
	       				"<th>性別</th>" +
	       				"<th>所屬學校</th>" +
	       				"<th>年級</th>" +
	       				"<th>function</th>" +
	       				"<th>function</th>" +
	       				"</tr></thead>"+
	       				
	       				"<tbody>";
	       				
	      for(var i=0; i < oneClassList.classStudentLists.length; i++){	
	    	  content +=
	       				"<tr data-toggle='collapse' class='accordion-toggle'>"+
	       				"<td></td>" +
	       				"<td class='csl-id' style='display:none'>" + oneClassList.classStudentLists[i].id + "</td>" +
	       				"<td class='oDId-id'>" + oneClassList.classCode + "</td>" +
	       				"<td class='student-id' style='display:none'>" + oneClassList.classStudentLists[i].student.id + "</td>" +
	       				"<td>" + oneClassList.classStudentLists[i].student.name + "</td>" +
	       				"<td class='student-no'>" + oneClassList.classStudentLists[i].studentNo+ "</td>" +
	       				"<td>" + oneClassList.classStudentLists[i].student.gender + "</td>" +
	       				"<td class='course-id'>" +oneClassList.classStudentLists[i].student.schoolName + "</td>" +
	       				"<td>" + oneClassList.classStudentLists[i].student.grade + "</td>" +
	       			  	"<td class='test1'><i style='font-size:36px;' class='csl-edit-btn bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +
	      	       		"<td class=' test2'><i style='font-size:36px;' class='csl-del-btn bx bxs-trash' ></i></td>"+
	       				"</tr>";
	       	}	
	      content +="</tbody></table></div></td></tr>"
           		
           		var info0 = document.getElementById("thead-title");
    			info0.innerHTML = content0;
    			
    			var info = document.getElementById("content-data");
    			info.innerHTML = content;
			
		}
	}
		
		
		
	})
	
	
//=======ClassList中的studetList Edit Btn function============	
	
	$(document).on('click','.csl-edit-btn',function(){
		var oldStuNo = $(this).parent().siblings('.student-no').text();
		contentForUpdateNo = "<input class='clcslStuNoEdit' type='text' size='3' value='"+oldStuNo+ "'>";
		$(this).parent().siblings('.student-no').html(contentForUpdateNo);
			$('.clcslStuNoEdit').blur(function(){
				console.log('uuuuu')	
				var newStuNo = $(this).val();
				var cslId = $(this).parent().siblings('.csl-id').text();
				$(this).parent().html(newStuNo)
				
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClassStudentListByIdAjax.controller?cslId=" + cslId +"&newStuNo=" + newStuNo + "' />", true);
				xhr.send();
		})
	})
//=====================Course Edit Btn===============================
	$(document).on('click','.courseEditBtn',function(){
		$('#exampleModalCenter').modal('show')
	
	})
	
	
	
//========ClassList中的studentList Delete Btn function=================	
	$(document).on('click','.csl-del-btn',function(){
		
		var cslId = $(this).parent().siblings('.csl-id').text();
		var stuId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).closest('.foldStudentInfo').prev().find('.course-id').text();

		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/delClassStudentListAndUpdateOrderDetailByClassListIdAndStudentId.controller?courseId=" + courseId +"&stuId=" + stuId + "&cslId=" + cslId + "' />", true);
		xhr.send();
		
		$(this).closest('tr').remove();
		
	})
	 
//=======================暫時不用=======================
// 	$(document).on('click','#delete-btn',function() {
// 	var id = $(this).parent().siblings("#course-id").text();
// 	console.log($(this));
// 	console.log(id);
	
// 	if(window.confirm('確定刪除嗎?')){
// 		document.location.href = href="${contextRoot}/deleteCourseData.controller?id="+id;
		
// 	} 
// 	else{
// 		console.log("nothing happened")
// 	}
	
	//document.location.href = "${contextRoot}/updateRoomData.controller/"
	//+ id + "/" + roomName + "/" + roomSize;
// });


		

	
</script>
</html>