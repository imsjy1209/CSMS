<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- NAVBAR -->
<%-- <jsp:include page="../../framePage/sideBar.jsp"></jsp:include> --%>
<jsp:include page="../../layout/nav_teacher.jsp"></jsp:include>

 <!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<!-- TEACHER -->	
<!-- CONTENT -->
<br><br>
<div class="wrapper">
<div class="container">	
	<h3><i class='bx bx-book-reader'></i>&nbsp;聯絡簿首頁</h3>
	<br>
	<div class="form-group">
  		<label for="exampleFormControlSelect1">選擇課程：</label>
  		<select class="form-control" id="classInfoList" name="classInfoList">
    		<option value="-1" selected="selected" hidden>請選擇</option>
  		</select>
  	</div>
  	<br>
  	<br>
	<div id="btn-area">
		<button id="btn-init" type="button" class="btn btn-secondary" disabled>建立聯絡簿</button>
	</div>
	<br>
  	<div>
  		<table id="cbList" class="table table-bordered" style="text-align:center">
  			<thead  id="cbList-title">
    			<tr>
				     <th class="table-info" scope="col">編號</th>
				     <th class="table-info" scope="col">建立日期</th>
				     <th class="table-info" scope="col">課程代號</th>
				     <th class="table-info" scope="col">授課教師</th>
				     <th class="table-info" scope="col">班導師</th>
				     <th class="table-info" scope="col">課程內容</th>
				     <th class="table-info" scope="col">回家作業</th>
				     <th class="table-info" scope="col">考試通知</th>
				     <th class="table-info" scope="col">案件狀態</th>
<!-- 				     <th class="table-info" scope="col">操作</th> -->
			    </tr>
			</thead>
<!-- 				      <a href="#" type="button" class="btn btn-danger" tabindex="-1" role="button" aria-disabled="false">編輯</a> -->
<!-- 				      <a href="#" type="button" class="btn btn-secondary" tabindex="-1" role="button" aria-disabled="false">刪除</a> -->
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


<!-- SCRIPT -->
<script type="text/javascript">
//=======================作業區=======================
/* 視窗載入事件：帶入【老師】課程選單 */
window.onload = function(){ 
	var xhr1 = new XMLHttpRequest();
    xhr1.open("GET", "<c:url value='/allTeacherClassList.json'/>", true);
    xhr1.send();
    xhr1.onreadystatechange = function(){
    	if (xhr1.readyState == 4 && xhr1.status == 200) {
    		var clsInfoList = JSON.parse(xhr1.responseText);
	        if (clsInfoList.length > 0){
		        for (let i = 0; i < clsInfoList.length; i++) {
		        	var clslistId = clsInfoList[i].classListId;
		        	var clscode = clsInfoList[i].classCode;
		        	var category = clsInfoList[i].courseCategory;
		        	var subject = clsInfoList[i].courseSubject;
		        	var grade = clsInfoList[i].courseGrade;
		        	var level = clsInfoList[i].courseClass;
		        	var itemStr = '【'+clscode+'】&nbsp&nbsp&nbsp'+category+'班&nbsp&nbsp-&nbsp&nbsp'+subject+'&nbsp&nbsp-&nbsp&nbsp'+grade+level+'年級';
		        	var optObj = '<option value=\"'+clslistId+'\">'+itemStr+'</option>';
		        	$('#classInfoList').append(optObj);
	        	}
	        } else {
	        	var optObj = '<option value=\"-2\" disabled>查無結果</option>';
	        	$('#classInfoList').append(optObj);
	        }
      	}
    }
} 

/* 選單change事件：(1)替換為enable版建立聯絡簿按鈕 (2)依選到的項目(classListId)帶出對應的聯絡簿清單 */	
$("#classInfoList").on("change",function(){
	// 抓選到的option的value屬性值(classListId=?)
	var selectedClassListId = $(this).prop("value"); 
	// console.log($(this).prop("value"));
	
	// 新增enable的button、移除disable的button
	var EnableBtnUrl = "<c:url value='/ContactBook/T_Edit/"+selectedClassListId+"'/>";
	var EnableBtn = "<a href='"+EnableBtnUrl+"' type='button' class='btn btn-success' id='removeMe' tabindex='-1' role='button' aria-disabled='true'>建立聯絡簿</a>";
	$("#removeMe").remove();
	$("#btn-area").append(EnableBtn); 
	$("#btn-init").remove();
	
	// 找出對應contactBookList
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET","<c:url value='/teacherContactBookList.json'/>"+"?classListId="+selectedClassListId,true); 
	xhr2.send();                    
  	xhr2.onreadystatechange = function(){
  		
  		if(xhr2.readyState == 4 && xhr2.status == 200){
  			
  			var cbList = JSON.parse(xhr2.responseText);
	  	  	
  			$('#cbList tbody tr td').remove(); // 清除還在畫面上的聯絡簿篩選結果清單
  			
	  	  	cb_content ='<tbody id="cbList-data">';
	  	  	if (cbList.length > 0){
		  	  	for (i = 0 ; i < cbList.length ; i++){
		  	    	cb_content +='<tr>';
		  	    	cb_content +='<td>' + cbList[i].cb_id + '</td>';
		  	    	cb_content +='<td>' + cbList[i].create_at + '</td>';
		  	    	cb_content +='<td>' + cbList[i].classCode + '</td>';
		  	    	cb_content +='<td>' + cbList[i].teacherName + '</td>';
		  	    	cb_content +='<td>' + cbList[i].schoolName + '</td>'; 
		  	    	
		  	    	// cb_content +='<td>' + cbList[i].courseContent + '</td>';
		  	    	if (cbList[i].courseContent != null ){
		  	    		cb_content +='<td>' + cbList[i].courseContent + '</td>';
		  	    	} else {
		  	    		cb_content +='<td></td>';
		  	    	}
		  	    	
		  	    	// cb_content +='<td>' + cbList[i].homework + '</td>'; 
		  	    	if (cbList[i].homework != null ){
		  	    		cb_content +='<td>' + cbList[i].homework + '</td>';
		  	    	} else {
		  	    		cb_content +='<td></td>';
		  	    	}
		  	    	
		  	    	// cb_content +='<td>' + cbList[i].quizNotice + '</td>';
		  	    	if (cbList[i].quizNotice != null ){
		  	    		cb_content +='<td>' + cbList[i].quizNotice + '</td>';
		  	    	} else {
		  	    		cb_content +='<td></td>';
		  	    	}
		  	    	
			  	    	// cb_content +='<td>' + cbList[i].phase + '</td>';
					if (cbList[i].phase == 1){
						cb_content +='<td style="color:red">編輯中</td>';
						//cb_content +='<td><a href="/CSMS/ContactBook/T_Cancel?cbId="'+cbList[i].cb_id+'"><i class="bx bx-trash"></i></a>"</td>';
					} else if (cbList[i].phase == 2) {
						cb_content +='<td style="color:blue">審核中</td>';
						//cb_content +='<td></td>';
					} else if (cbList[i].phase == 3) {
						cb_content +='<td>已通過</td>';
						//cb_content +='<td></td>';
					} else if (cbList[i].phase == 4) {
						cb_content +='<td>已取消</td>';
						//cb_content +='<td></td>';
					} else {
						cb_content +='<td>error</td>';
					}
		  	    	
		  	    	cb_content +='</tr>';
	  	  		} // end of for loop 
		    } else {
		    	// console.log(cbList.length);
		    	cb_content +='<tr><td colspan="9">查無結果</td></tr>';
		    }
  			cb_content +='</tbody>';	
  			$('#cbList').append(cb_content);	
  		}
  	} 	
});	
//=======================版面動作=======================

$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});

</script>

</body>
</html>