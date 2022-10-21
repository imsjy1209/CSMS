<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<jsp:include page="../framePage/sideBar.jsp"></jsp:include>



            <h3 class='main-title'>Main Info</h3>
<!--             <div class="row"> -->
            <div class="bigDiv">
 <div class="col-xs-6">
           <table id="table" class="table table-striped mt-5 ">
			
			<thead id="thead-title">
				
			</thead>

			<tbody id="content-data">
			
			</tbody>
			
			
		</table>
</div>

 <div class="subDiv col-xs-6"  style='display: none'>
 <table id="table2" class="table table-striped mt-5 ">
 <thead id="thead-title2">
 </thead>

 <tbody id="content-data2">
			
</tbody>
 </table>
 </div>
 
 
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
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>



<script type="text/javascript">

// window.onload = function() {
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET", "<c:url value='/AllCourseBackAjax.page' />", true);
// 	xhr.send();
// 	xhr.onreadystatechange = function() {
// 		if (xhr.readyState == 4 && xhr.status == 200) {
// 			var content0 = "";
// 			content0 += 
// 			"<tr>" +
// 			"<td>多選</td>"+
// 			"<td>id</td>"+
// 			"<td>年度</td>"+
// 			"<td>學期</td>"+
// 			"<td>分類</td>"+
// 			"<td>學級</td>"+
// 			"<td>年級</td>"+
// 			"<td>科目</td>"+
// 			"<td>價錢</td>"+
// 			"<td>授課時間</td>"+
// 			"<td>人數</td>"+
// 			"<td>起始</td>"+
// 			"<td>結業</td>"+
// 			"<td>上/下架</td>"+
// 			"<td>圖片</td>"+
// 			"<td>Function</td>"+
// 			"<td>Function</td>"+
// 			"</tr>"; 
// 			var content = "";
// 			var courseList = JSON.parse(xhr.responseText);
// 			console.log(courseList);
// 			for(var i=0; i < courseList.length; i++){
// 				content += 
// 				"<tr><td><input type='checkbox'/></td>" +	
// 				"<td id='course-id'>" + courseList[i].id + "</td>" +
// 				"<td>" + courseList[i].courseYear + "</td>" +
// 				"<td>" + courseList[i].courseSemester + "</td>" +
// 				"<td>" + courseList[i].courseCategory + "</td>" +
// 				"<td>" + courseList[i].courseGrade + "</td>" +
// 				"<td>" + courseList[i].courseClass + "年級</td>" +
// 				"<td>" + courseList[i].courseSubject + "</td>" +
//     	       	"<td>" + courseList[i].coursePrice + "</td>" +
//     	       	"<td>" + courseList[i].courseTeachTime + "</td>" +
//     	       	"<td>" + courseList[i].courseMember + "</td>" +
//     	       	"<td>" + courseList[i].startDate + "</td>" +
//     	       	"<td>" + courseList[i].endDate + "</td>" +
//     	       	"<td>" + courseList[i].courseOnOff + "</td>" +
//     	       	"<td>" + "<img alt='img' width='50px' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" + "</td>" +
//     	       	"<td class='test1'><a href='${contextRoot}/updateCourseData1.controller?id=" + courseList[i].id + "' type='button' class='btn btn-warning'>Edit</a></td>" +
// 				"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
// 		               		"</tr>";
// 			}
// 			var info0 = document.getElementById("thead-title");
// 			info0.innerHTML = content0;
// 			var info = document.getElementById("content-data");
// 			info.innerHTML = content;
// 			$('input[type="checkbox"]').click(function() {
// 				console.log('checkbox', $(this));
// 				let bgColor = 'none';
// 				if ($(this).prop('checked')) {
// 					bgColor = 'lightblue';
// 				}
// 				$(this).closest('tr').css('background', bgColor)
// 			})
// 		}
// 	}
// }
//======================Course=======================
	$('#course-Btn').click(function(){
// 		console.log($('.main-title'))
		$('.main-title').text('Course')
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/AllCourseBackAjax.page' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				var content0 = "";
				content0 += 
				"<tr>" +
				"<td>多選</td>"+
				"<td>id</td>"+
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
				"<td>Function</td>"+
// 				"<td>Function</td>"+
				"</tr>"; 
				
				var content = "";
				var courseList = JSON.parse(xhr.responseText);
				console.log(courseList);
				for(var i=0; i < courseList.length; i++){
					content += 
						

					"<tr>" +
						"<td><input type='checkbox'/></td>" +	
						"<td id='course-id'>" + courseList[i].id + "</td>" +
						"<td>" + courseList[i].courseYear + "</td>" +
						"<td>" + courseList[i].courseSemester + "</td>" +
						"<td>" + courseList[i].courseCategory + "</td>" +
						"<td>" + courseList[i].courseGrade + "</td>" +
						"<td>" + courseList[i].courseClass + "年級</td>" +
						"<td>" + courseList[i].courseSubject + "</td>" +
	    	       		"<td>" + courseList[i].coursePrice + "</td>" +
	    	       		"<td>" + courseList[i].courseTeachTime + "</td>" +
	    	       		"<td>" + courseList[i].courseMember + "</td>" +
	    	       		"<td>" + courseList[i].startDate + "</td>" +
	    	       		"<td>" + courseList[i].endDate + "</td>" +
	    	       		"<td><button class='con'>ON</button><button class='coff'>OFF</button></td>" +
	    	       		"<td>" + "<img alt='img' width='50px' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" + "</td>" +
	    	       		"<td class='test1'><a href='${contextRoot}/updateCourseData1.controller?id=" + courseList[i].id + "' type='button' class='btn btn-warning'>Edit</a></td>" +
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
// 				console.log(nowId);
// 				console.log(onOrOffVal);
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
// 				console.log(nowId);
// 				console.log(onOrOffVal);
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
		$('.main-title').text('ClassList')
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
			"<td>多選</td>"+
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
			
			var content = "";
			for(var i=0; i < classListList.length; i++){
				
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
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
    	       	"<td>" + classListList[i].course.courseCategory + "</td>" +
    	       	"<td>" + classListList[i].course.courseSubject +
    	       			 classListList[i].course.courseGrade +
    	       			 classListList[i].course.courseClass + "年級</td>" +
    	       	"<td>" + classListList[i].course.courseMember + "</td>" +
    	       	"<td>" + classListList[i].course.startDate + "</td>" +
    	       	"<td>" + classListList[i].course.endDate + "</td>" +
    	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
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
	})
	
//========================ClassRecord==================
	
	$('#classRecord-Btn').click(function(){
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
	
//========================OrderList==================
	
	$('#orderList-Btn').click(function(){
		$('.main-title').text('OrderList')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllOrderListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>學生名稱</td>"+
			"<td>總金額</td>"+
			"<td>付款方式</td>"+
			"<td>結帳時間</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var orderListList = JSON.parse(xhr.responseText);
			
			console.log(orderListList[0].orderDetails[0].student.name);
			console.log(orderListList[0].orderDetails.length);
			
			for(var i=0; i < orderListList.length; i++){
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
				"<td>" + orderListList[i].id + "</td>" +
				"<td>" + orderListList[i].student.name + "</td>" +
				"<td>" + orderListList[i].amount + "</td>" +
				"<td>" + orderListList[i].payment + "</td>" +
    	       	"<td>" + orderListList[i].orderDate + "</td>";
//     	       	"<td>" + orderListList[i].orderDetails[student.name] + "</td>"+
    	       	
    	       	
      content +="<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
           		
      for(var j=0; j < orderListList[i].orderDetails.length; j++){
	       	content +=  "<tr>" +
	       				"<td>訂單明細"+(j+1)+"</td>" +
	       				"<td>訂購人</td>" +
	       				"<td>訂購項目</td>" +
	       				"<td>金額</td>" +
	       				"</tr>"+
	       				
	       				"<tr>"+
	       				"<td></td>"+
	       				"<td>" + orderListList[i].orderDetails[j].student.name + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseSubject + orderListList[i].orderDetails[j].course.courseGrade + orderListList[i].orderDetails[j].course.courseClass + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.coursePrice + "</td>" +
	       				"</tr>";
	       	}	
      
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
	
//========================OrderDetail==================
	
	$('#orderDetail-Btn').click(function(){
		$('.main-title').text('OrderDetail')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllOrderDetail.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
// 			"<td>多選</td>"+
			"<td>OD_id</td>"+
			"<td>學生id</td>"+
			"<td>學生名稱</td>"+
			"<td>方案id</td>"+
			"<td>方案資訊</td>"+
			"<td>購買狀態</td>"+
			"<td>排課狀態</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var orderDetailList = JSON.parse(xhr.responseText);
			
			console.log(orderDetailList);
			
			for(var i=0; i < orderDetailList.length; i++){
				content += 
// 				"<tr><td><input type='checkbox'/></td>" +	
				"<td class='oDId-id'>" + orderDetailList[i].id + "</td>" +
				"<td class='student-id'>" + orderDetailList[i].student.id + "</td>" +
				"<td>" + orderDetailList[i].student.name + "</td>" +
				"<td class='course-id'>" + orderDetailList[i].course.id + "</td>" +
				"<td>" + orderDetailList[i].course.courseGrade +orderDetailList[i].course.courseSubject + orderDetailList[i].course.courseClass + "</td>" +
// 				"<td>" + orderDetailList[i].confirmOrder + "</td>" +
				"<td><button class='orderWait'>未結帳</button><button class='orderNoP'>未購買</button><button class='orderFin'>已購買</button><span class='order-info' hidden='hidden'>"+ orderDetailList[i].confirmOrder +"</span></td>" +
// 				"<td>" + orderDetailList[i].arrangeClassList + "</td>" +
				"<td><button class='oDon'>已排課</button><button class='oDoff'>未排課</button><span class='arrange-info' hidden='hidden'>"+ orderDetailList[i].arrangeClassList +"</span></td>" +
    	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
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
// 		$('.bigDiv').addClass('row')
// 		$('.subDiv').css('display','block')
		
		if($(this).next().next().text()==0){
			$(this).addClass('active');
			$(this).next().removeClass('active');
		var studentId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).parent().siblings('.course-id').text();
		var orderId = $(this).parent().siblings('.oDId-id').text();
		
		console.log("got uuuuuuuuuuuu")
		console.log(orderId)
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findClassStudentListByCourseIdAndClassListIdAjax.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
		xhr.send();
		}else{
			console.log('nothing happened');
		}
// 		xhr.onreadystatechange = function() {
// 		if (xhr.readyState == 4 && xhr.status == 200) {
			
// 			var content0 = "";
// 			content0 += 
// 			"<tr>" +
// 			"<td>多選</td>"+
// 			"<td>id</td>"+
// 			"<td>課程代碼</td>"+
// 			"<td>學生名稱</td>"+
// 			"<td>座號</td>"+
// 			"<td>Function</td>"+
// 			"<td>Function</td>"+
// 			"</tr>";
			
// 			var content = "";
// 			var cslList = JSON.parse(xhr.responseText);
			
// 			console.log(cslList);
			
// 			for(var i=0; i < cslList.length; i++){
// 				content += 
// 				"<tr><td><input type='checkbox'/></td>" +	
// 				"<td>" + cslList[i].id + "</td>" +
// 				"<td>" + cslList[i].classList.classCode + "</td>" +
// 				"<td>" + cslList[i].student.name + "</td>" +
// 				"<td>" + cslList[i].studentNo + "</td>" +
//     	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
//     	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
//            		"</tr>";
// 			}
// 			var info0 = document.getElementById("thead-title2");
// 			info0.innerHTML = content0;
			
// 			var info = document.getElementById("content-data2");
// 			info.innerHTML = content;
				
// 			}
// 		}
				
	})
	
	$('.oDoff').click(function(){
		if($(this).next().text()==1){
			$(this).addClass('active');
			$(this).prev().removeClass('active');
		var studentId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).parent().siblings('.course-id').text();
		var orderId = $(this).parent().siblings('.oDId-id').text();
		
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
		$('.main-title').text('ClassStudentList')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllClassStudentListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>學生名稱</td>"+
			"<td>座號</td>"+
// 			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var cslList = JSON.parse(xhr.responseText);
			
			console.log(cslList);
			
			for(var i=0; i < cslList.length; i++){
				content += 
				"<tr><td><i style='font-size:36px;' class='bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +	
				"<td class='cslId-td'>" + cslList[i].id + "</td>" +
				"<td>" + cslList[i].classList.classCode + "</td>" +
				"<td>" + cslList[i].student.name + "</td>" +
				"<td class='cslStudentNo'>" + cslList[i].studentNo + "</td>" +
//     	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
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
			
			$('.bxs-edit').click(function(){
				console.log($(this));
				var oriStuNo = $(this).parent().siblings('.cslStudentNo').text();
				contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+oriStuNo+ "'>";
				$(this).parent().siblings('.cslStudentNo').html(contentEdit);
				
				$('.stuNoEdit').change(function(){
					console.log('changeeeeeeeee')
					var newStuNo = $(this).val();
// 					console.log(newStuNo);
					var cslId= $(this).parent().siblings('.cslId-td').text();
// 					console.log(cslId)
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateClassStudentListByIdAjax.controller?cslId=" + cslId +"&newStuNo=" + newStuNo + "' />", true);
					xhr.send();
					
					var cslStudentNoTd = $(this).parent();
					$(this).remove();
					cslStudentNoTd.text(newStuNo);
					
				})
				
			})
			
			
			
			
// 			$('input[type="checkbox"]').click(function() {
// 				console.log('checkbox', $(this));
// 				let bgColor = 'none';
// 				if ($(this).prop('checked')) {
// 					bgColor = 'lightblue';
// 				}
// 				$(this).closest('tr').css('background', bgColor)
// 			})
		}
	}
	})	
	


//========================Room==================
	
	$('#room-Btn').click(function(){
		$('.main-title').text('Room')
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllRoomAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>教室名稱</td>"+
			"<td>教室容納人數</td>"+
			"<td>教室照片</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";

			
			
			var content = "";
			var roomList = JSON.parse(xhr.responseText);
			console.log(roomList);
			for(var i=0; i < roomList.length; i++){
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
				"<td>" + roomList[i].id + "</td>" +
				"<td>" + roomList[i].roomName + "</td>" +
				"<td>" + roomList[i].roomSize + "</td>" +
    	    	"<td>" + "<img alt='img' width='100px' src='${contextRoot}/AllRoomPic/" + roomList[i].id +"' class='room-img'>" + "</td>" +
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
	
	
	
//=======================版面動作=======================
	
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });

	 
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