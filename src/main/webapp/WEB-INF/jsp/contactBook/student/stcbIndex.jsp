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
</head>
<body>
<!-- NAVBAR -->
<%-- <jsp:include page="../../framePage/sideBar.jsp"></jsp:include> --%>
<jsp:include page="../../layout/nav_student.jsp"></jsp:include>

<!-- STUDENT -->	
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
  	<div>
  		<table id="cbList" class="table table-bordered" style="text-align:center">
  			<thead id="cbList-title">
    			<tr>
				     <th class="table-info" scope="col">編號</th>
				     <th class="table-info" scope="col">建立日期</th>
				     <th class="table-info" scope="col">課程代號</th>
				     <th class="table-info" scope="col">授課教師</th>
				     <th class="table-info" scope="col">班導師</th>
				     <th class="table-info" scope="col">課程內容</th>
				     <th class="table-info" scope="col">回家作業</th>
				     <th class="table-info" scope="col">考試通知</th>
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


<!-- SCRIPT -->
<script type="text/javascript">
//=======================作業區=======================
/* 視窗載入事件：帶入【學生】課程選單 */
window.onload = function(){ 
	var xhr1 = new XMLHttpRequest();
    xhr1.open("GET", "<c:url value='/allStudentClassList.json'/>", true);
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

/* 選單change事件：依選到的項目(classListId)帶出對應的聯絡簿清單 */	
$("#classInfoList").on("change",function(){
	// 抓選到的option的value屬性值(classListId=?)
	var selectedClassListId = $(this).prop("value"); 
	// console.log($(this).prop("value"));
	
	// 找出對應contactBookList
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET","<c:url value='/studentContactBookList.json'/>"+"?classListId="+selectedClassListId,true); 
	xhr2.send();                    
  	xhr2.onreadystatechange = function(){
  		
  		if(xhr2.readyState == 4 && xhr2.status == 200){
  			var cbList = JSON.parse(xhr2.responseText);
	  	  	
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
		  	    	
		  	    	cb_content +='</tr>';
	  	    	} 
	  	    	
  			} else{
  				console.log(cbList.length);
  				cb_content +='<tr><td colspan="8">查無結果</td></tr>';
  			}
	  	  	cb_content +='</tbody>';
	  	  	$('#cbList').append(cb_content); 
  		}
  	}
});

</script>

</body>
</html>