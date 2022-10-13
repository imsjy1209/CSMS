<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<jsp:include page="../framePage/sideBar.jsp"></jsp:include>



            <h2>Main Info</h2>
           <table id="table" class="table table-striped mt-5 ">
			
			<thead id="thead-title">
				
			</thead>

			<tbody id="content-data">
			
			</tbody>
			
			
		</table>
           
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
				"<td>Function</td>"+
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
						"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
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
			console.log(roomList);
			
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
	
//========================ClassStudentList==================
	
	$('#classStudentList-Btn').click(function(){
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
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var cslList = JSON.parse(xhr.responseText);
			console.log(cslList);
			for(var i=0; i < cslList.length; i++){
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
				"<td>" + cslList[i].id + "</td>" +
				"<td>" + cslList[i].classList.classCode + "</td>" +
				"<td>" + cslList[i].student.name + "</td>" +
				"<td>" + cslList[i].studentNo + "</td>" +
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
	


//========================Room==================
	
	$('#room-Btn').click(function(){
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
	$(document).on('click','#delete-btn',function() {
	var id = $(this).parent().siblings("#course-id").text();
	console.log($(this));
	console.log(id);
	
	if(window.confirm('確定刪除嗎?')){
		document.location.href = href="${contextRoot}/deleteCourseData.controller?id="+id;
		
	} 
	else{
		console.log("nothing happened")
	}
	
	//document.location.href = "${contextRoot}/updateRoomData.controller/"
	//+ id + "/" + roomName + "/" + roomSize;
});


		

	
</script>
</html>