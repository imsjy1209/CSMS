<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../../framePage/sideBar.jsp"></jsp:include>
	
<!-- CONTENT -->
<div class="container">	
	<h4>【老師】聯絡簿修改</h4>
	<br>
	
	<div id="classInfo-area">
		<table id="classInfo" class="table table-bordered" style="text-align:center">
			<!-- 課程資訊內容放置處 -->
		</table>
	</div>
	<br>

	<div id=cbList-area>
		<table id="cbListEdit" class="table table-bordered" style="text-align:center">
			<tr>
    			<th class="table-info" scope="col" style="text-align:center">聯絡簿編號</th>
    			<td><input type="text" class="form-control" id="cbId" name="cbId" value="${cbBean.id}" readonly /></td>
    		</tr>
    		<tr>
    			<th class="table-info" scope="col" style="text-align:center">建立日期</th>
    			<td><input type="text" class="form-control" id="createAt" name="createAt" value="${cbBean.create_at}" readonly /></td>
    		</tr>
    		<tr>
    			<th class="table-info" scope="col" style="text-align:center">課程內容</th>
    			<td><input type="text" class="form-control" id="courseContent" name="courseContent" value="${cbBean.courseContent}" readonly /></td>
    		</tr>
    		<tr>
    			<th class="table-info" scope="col" style="text-align:center">回家作業</th>
    			<td><input type="text" class="form-control" id="homework" name="homework" value="${cbBean.homework}" readonly /></td>
    		</tr>
    		<tr>
    		<th class="table-info" scope="col" style="text-align:center">考試通知</th>
    			<td><input type="text" class="form-control" id="quizNotice" name="quizNotice" value="${cbBean.quizNotice}" readonly /></td>
    		</tr>			
		</table>
		<br><br>
		<div id="cbListBtnArea" style="text-align:center">
			<button id="btn-init" type="button" class="btn btn-secondary" disabled>確認送出</button>&nbsp&nbsp
			<a href="${contextRoot}/ContactBook/T_GoPrevPage?cbId=${cbBean.id}" type="button" class="btn btn-primary" tabindex="-1" role="button" aria-disabled="false">回上一頁</a>
		</div>
	</div>
</div>

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
/* 取得路徑變數@PathVariable("classListId") */ 
var clsListId = ${clsListId};
// console.log(clsListId);

/* 視窗載入事件：(1)帶入【老師】選定的課程相關資訊 (2)帶入insert的該筆聯絡簿資料 (3)帶入「確認送出」按鈕 (4)帶入「回上一頁」按鈕 */
window.onload = function(){ 
	
	// (1) 帶入【老師】選定的課程相關資訊
	var xhr1 = new XMLHttpRequest();
    xhr1.open("GET", "<c:url value='/findClsInfoByClassListId.json'/>"+"?classListId="+clsListId, true);
    xhr1.send();
    xhr1.onreadystatechange = function(){
    	if (xhr1.readyState == 4 && xhr1.status == 200) {
    		
    		var clsInfoList = JSON.parse(xhr1.responseText);
    		console.log(clsInfoList); // 得到ClassList物件
    		var clscode = clsInfoList.classCode;
        	var category = clsInfoList.course.courseCategory;
        	var subject = clsInfoList.course.courseSubject;
        	var grade = clsInfoList.course.courseGrade;
        	var level = clsInfoList.course.courseClass;
    		var teacherName = clsInfoList.teacher.name;
    		var schoolName = clsInfoList.school.name;
    		
    		var clsInfoObj = '<tr>';
    		clsInfoObj += '<th class="table-warning" scope="col">課程代號</th>';
    		clsInfoObj += '<td>' + clscode + '</td>';
    		clsInfoObj += '<th class="table-warning" scope="col">課程資訊</th>';
    		clsInfoObj += '<td>'+ category + '班&nbsp-&nbsp' + subject + '&nbsp-&nbsp' + grade + level +'年級</td>';
    		clsInfoObj += '</tr>';
    		clsInfoObj += '<tr>';
    		clsInfoObj += '<th class="table-warning" scope="col">授課教師</th>';
    		clsInfoObj += '<td>' + teacherName + '</td>';
    		clsInfoObj += '<th class="table-warning" scope="col">班導師</th>';
    		clsInfoObj += '<td>' + schoolName + '</td>';
    		clsInfoObj += '</tr>';
    		
    		$('#classInfo').append(clsInfoObj);
    	}
    }
    
//     // (2)帶入update的該筆聯絡簿資料courseContent, homework, quizNotice, cbId
// 	var xhr2 = new XMLHttpRequest();
//     xhr2.open("POST", "<c:url value='/insertTheClassListIdIntoContactBook.json'/>"+"?classListId="+clsListId, true);
//     xhr2.send();
//     xhr2.onreadystatechange = function(){
//     	if (xhr2.readyState == 4 && xhr2.status == 200) {
    		
//     		var cbList = JSON.parse(xhr2.responseText);  
//      		console.log(cbList); // 得到ContactBookList物件
//     		var cbId = cbList.id;
//     		console.log(cbId);
//         	var createAt = cbList.create_at;
//         	var courseContent = cbList.courseContent;
//         	var homework = cbList.homework;
//         	var quizNotice = cbList.quizNotice;
        	
//     		var cbListObj = '<tr>';
//     		cbListObj += '<th class="table-info" scope="col" style="text-align:center">聯絡簿編號</th>';
//     		cbListObj += '<td><input type="text" class="form-control" id="cbId" name="cbId" value="' + cbId + '" readonly /></td>';
//     		cbListObj += '</tr>';
    		
//     		cbListObj += '<tr>';
//     		cbListObj += '<th class="table-info" scope="col" style="text-align:center">建立日期</th>';
//     		cbListObj += '<td><input type="text" class="form-control" id="createAt" name="createAt" value="' + createAt + '" readonly /></td>';
//     		cbListObj += '</tr>';
    		
//     		cbListObj += '<tr>';
//     		cbListObj += '<th class="table-info" scope="col" style="text-align:center">課程內容</th>';
//     		// cbListObj += '<td><input type="text" class="form-control" id="courseContent" name="courseContent" value="' + courseContent + '" /></td>';
//     		if(courseContent != null){
//     			cbListObj += '<td><input type="text" class="form-control" id="courseContent" name="courseContent" value="' + courseContent + '" readonly  /></td>';
//     		} else {
//     			cbListObj += '<td><input type="text" class="form-control" id="courseContent" name="courseContent" value=" " readonly /></td>';
//     		}
//     		cbListObj += '</tr>';
    		
//     		cbListObj += '<tr>';
//     		cbListObj += '<th class="table-info" scope="col" style="text-align:center">回家作業</th>';
//     		// cbListObj += '<td><input type="text" class="form-control" id="homework" name="homework" value="' + homework + '" /></td>';
//     		if(homework != null){
//     			cbListObj += '<td><input type="text" class="form-control" id="homework" name="homework" value="' + homework + '" readonly /></td>';
//     		} else {
//     			cbListObj += '<td><input type="text" class="form-control" id="homework" name="homework" value=" " readonly /></td>';
//     		}
//     		cbListObj += '</tr>';
    		
//     		cbListObj += '<tr>';
//     		cbListObj += '<th class="table-info" scope="col" style="text-align:center">考試通知</th>';
//     		// cbListObj += '<td><input type="text" class="form-control" id="quizNotice" name="quizNotice" value="' + quizNotice + '" /></td>';
//     		if(quizNotice != null){
//     			cbListObj += '<td><input type="text" class="form-control" id="quizNotice" name="quizNotice" value="' + quizNotice + '" readonly /></td>';
//     		} else {
//     			cbListObj += '<td><input type="text" class="form-control" id="quizNotice" name="quizNotice" value=" " readonly /></td>';
//     		}
//     		cbListObj += '</tr>';
    		
//     		$('#cbListEdit').append(cbListObj);
    		
//     		// (3)帶入「確認送出」按鈕 
//     		UpdateBtnObj = '<button id="btn-init" type="button" class="btn btn-secondary" disabled>確認送出</button>&nbsp&nbsp'
//     		$('#cbListBtnArea').append(UpdateBtnObj);
    		
//     		// (4)帶入「回上一頁」按鈕
//     		prevPageBtnObj = '<a href="/CSMS/ContactBook/T_GoPrevPage?cbId='+cbId+'" type="button" class="btn btn-primary" tabindex="-1" role="button" aria-disabled="false">回上一頁</a>';
//     		$('#cbListBtnArea').append(prevPageBtnObj);
//     	}
//     }
    
}


//=======================版面動作=======================

$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});

</script>
</body>
</html>

