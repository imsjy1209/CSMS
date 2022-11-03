<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<!-- PARENT NAVBAR -->
<%-- <jsp:include page="../../framePage/sideBar.jsp"></jsp:include> --%>
<jsp:include page="../../layout/nav_parent.jsp"></jsp:include>
	
<!-- CONTENT -->
<br><br>
<div class="wrapper">
<div class="container">	
	<h3><i class='bx bx-book-reader'></i>&nbsp;聯絡簿</h3>
	<br>
	<div class="form-group">
  		<label for="exampleFormControlSelect1">選擇課程：</label>
  		<select class="form-control" id="classInfoList" name="classInfoList">
    		<option value="-1" selected="selected" hidden>請選擇</option>
  		</select>
  	</div>
  	<br>
  	<br>
	<div id="sthHidden"><!-- 放studentId --></div>
  	<div>
  		<table id="cbList" class="table table-bordered" style="text-align:center">
  			<thead  id="cbList-title">
    			<tr>
				     <th class="table-info" scope="col">編號</th>
				     <th class="table-info" scope="col">建立日期</th>
				     <th class="table-info" scope="col">課程代號</th>
				     <th class="table-info" scope="col">授課教師</th>
				     <th class="table-info" scope="col">班導師</th>
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
</div>

<!-- footer -->
<jsp:include page="../../footer/footer.jsp"></jsp:include>	

<!-- CDN -->
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

<!-- SCRIPT -->
<script type="text/javascript">
//=======================作業區=======================
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
	
	var thisCbsId = $(this).closest("td").prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
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
	
	// (3) 告知簽名成功
	const Toast = Swal.mixin({
	    toast: true,
	    position: 'top-end',
	    showConfirmButton: false,
	    timer: 2000
	})

	Toast.fire({
		icon: 'success',
		title: '簽名成功'
	})
		
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
		  	  	for (i = 0 ; i < map.cblpDto.length ; i++){
		  	    	cb_content +='<tr>';
		  	    	cb_content +='<td>' + map.cbspDto[i].cbsId + '</td>';
		  	    	cb_content +='<td>' + map.cblpDto[i].create_at + '</td>';
		  	    	cb_content +='<td>' + map.cblpDto[i].classCode + '</td>';
		  	    	cb_content +='<td>' + map.cblpDto[i].teacherName + '</td>';
		  	    	cb_content +='<td>' + map.cblpDto[i].schoolName + '</td>'; 
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
		    	cb_content +='<tr><td colspan="11">查無結果</td></tr>';
		    }
  			cb_content +='</tbody>';	
  			$('#cbList').append(cb_content);	
  		}
  	}	
}

</script>

</body>
</html>