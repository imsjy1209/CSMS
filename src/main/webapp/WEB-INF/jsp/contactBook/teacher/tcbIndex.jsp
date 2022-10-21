<!-- SETTING -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../../framePage/sideBar.jsp"></jsp:include>
	
<!-- CONTENT -->
<div class="container">	
	<h4>【老師】聯絡簿首頁</h4>
	<br>
	<div class="form-group">
  		<label for="exampleFormControlSelect1">選擇課程：</label>
  		<select class="form-control" id="classInfoList" name="classInfoList">
    		<option value="-1" selected="selected" hidden>請選擇</option>
<<<<<<< HEAD
<!--     		<option Value="5">【CH11201】&nbsp&nbsp&nbsp日常班&nbsp&nbsp-&nbsp&nbsp國文&nbsp&nbsp-&nbsp&nbsp國小6年級</option> -->
<!--         	<option Value="4">【EN11201】&nbsp&nbsp&nbsp衝刺班&nbsp&nbsp-&nbsp&nbsp英文&nbsp&nbsp-&nbsp&nbsp國小6年級</option> -->
<!-- 			<option Value="3">【MA11201】&nbsp&nbsp&nbsp日常班&nbsp&nbsp-&nbsp&nbsp數學&nbsp&nbsp-&nbsp&nbsp國小6年級</option> -->
  		</select>
  	</div>
  	<br>
  	<!-- <span id="sessionAcc" hidden>BA001</span> -->
  	<!-- 記得改${sessionScope.account} -->
	<div>
  		<a href="#" type="button" class="btn btn-success" tabindex="-1" role="button" aria-disabled="false">建立聯絡簿</a>
=======
  		</select>
  	</div>
  	<br>
  	<br>
<!-- 	<div> -->
<!-- 		<label for="exampleFormControlSelect1">建立聯絡簿：</label> -->
<!-- 		<table id="add_cbList" class="table table-borderless" style="text-align:center"> -->
<!-- 			<tr> -->
<!-- 			  <td><input type="text" class="form-control" id="createAt" name="createAt" placeholder=""/></td> -->
<!-- 			  <td><input type="text" class="form-control" id="createAt" name="createAt" placeholder="課程內容" /></td> -->
<!-- 			  <td><input type="text" class="form-control" id="hw" name="hw" placeholder="回家作業" /></td> -->
<!-- 			  <td><input type="text" class="form-control" id="quiz" name="quiz" placeholder="考試通知" /></td> -->
<!-- 			  <td><a href="#" type="button" class="btn btn-danger" tabindex="-1" role="button" aria-disabled="false">新增</a></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</div> -->
	<div id="btn-area">
		<button id="btn-init" type="button" class="btn btn-secondary" disabled>建立聯絡簿</button>
>>>>>>> e7b73a0dbd3abbc59adde6958947887cbcc57b7b
	</div>

	<br>
  	<div>
  		<table id="cbList" class="table table-bordered" style="text-align:center">
  			<thead  id="cbList-title">
    			<tr>
<<<<<<< HEAD
			      <th class="table-info" scope="col">編號</th>
			      <th class="table-info" scope="col">建立日期</th>
			      <th class="table-info" scope="col">課程代號</th>
			      <th class="table-info" scope="col">授課教師</th>
			      <th class="table-info" scope="col">班導師</th>
			      <th class="table-info" scope="col">課程內容</th>
			      <th class="table-info" scope="col">回家作業</th>
			      <th class="table-info" scope="col">考試通知</th>
			      <th class="table-info" scope="col">案件狀態</th>
			      <th class="table-info" scope="col">操作</th>
			    </tr>
			</thead>
			<tbody id="cbList-data">
				<tr>
			      <td style="padding-top:20px">4</td>
			      <td style="padding-top:20px">2022-10-12</td>
			      <td style="padding-top:20px">CH11201</td>
			      <td style="padding-top:20px">王亭潞</td>
			      <td style="padding-top:20px">曾沛湘</td>
			      <td style="padding-top:20px"></td>
			      <td style="padding-top:20px"></td>
			      <td style="padding-top:20px"></td>
			      <td style="padding-top:20px">編輯中</td>
			      <td>
				      <a href="#" type="button" class="btn btn-danger" tabindex="-1" role="button" aria-disabled="false">編輯</a>
				      <a href="#" type="button" class="btn btn-secondary" tabindex="-1" role="button" aria-disabled="false">刪除</a>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>2022-10-04</td>
			      <td>CH11201</td>
			      <td>王亭潞</td>
			      <td>曾沛湘</td>
			      <td>第五章、月考考前複習</td>
			      <td>國文評量試卷*2</td>
			      <td>月考模擬考</td>
			      <td>審核通過</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>2022-09-27</td>
			      <td>CH11201</td>
			      <td>王亭潞</td>
			      <td>曾沛湘</td>
			      <td>第三、四章</td>
			      <td>國文評量試卷*1</td>
			      <td>前三章小考</td>
			      <td>審核通過</td>
			      <td></td>
			    </tr>
			    <tr>
			      <th scope="row">1</th>
			      <td>2022-09-20</td>
			      <td>CH11201</td>
			      <td>王亭潞</td>
			      <td>曾沛湘</td>
			      <td>第一、二章</td>
			      <td>國文評量試卷*1</td>
			      <td>成語抽考</td>
			      <td>審核通過</td>
			      <td></td>
			    </tr>
			</tbody>
=======
				     <th class="table-info" scope="col">編號</th>
				     <th class="table-info" scope="col">建立日期</th>
				     <th class="table-info" scope="col">課程代號</th>
				     <th class="table-info" scope="col">授課教師</th>
				     <th class="table-info" scope="col">班導師</th>
				     <th class="table-info" scope="col">課程內容</th>
				     <th class="table-info" scope="col">回家作業</th>
				     <th class="table-info" scope="col">考試通知</th>
				     <th class="table-info" scope="col">案件狀態</th>
			    </tr>
			</thead>
<!-- 				      <a href="#" type="button" class="btn btn-danger" tabindex="-1" role="button" aria-disabled="false">編輯</a> -->
<!-- 				      <a href="#" type="button" class="btn btn-secondary" tabindex="-1" role="button" aria-disabled="false">刪除</a> -->

>>>>>>> e7b73a0dbd3abbc59adde6958947887cbcc57b7b
		</table>
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

<<<<<<< HEAD
/* 選單change事件：依選到的項目(classListId)帶出對應的聯絡簿清單 */	
$("#classInfoList").on("change",function(){
	var selectedClassListId = $(this).prop("value"); // 抓選到的option的value屬性值(classListId=?)
	console.log($(this).prop("value"));
	var jsonUrl = "<c:url value='/teacherContactBookList.json'/>";
	xhr2.open("GET","<c:url value='/teacherContactBookList.json'/>"+"?classListId="+selectedClassListId,true); // 失敗???
	xhr2.send();
  	xhr2.onreadystatechange = function(){
  		if(xhr2.readyState == 4 && xhr2.status == 200){
  			// 找出對應contactBookList
  			var cbListData = JSON.parse(xhr2.responseText);
  			console.log(cbListData);
  	  	    var cbList = cbListData.cblTDto;
	  	  	console.log(cbList);
	  	  	cb_content ='<tbody id="cbList-data">';
	  	    for (i=0 ; i < cbList.length ; i++){
	  	    	if (cbList.length > 0){
		  	    	cb_content +='<tr>';
		  	    	cb_content +='<td>' + cbList[i].cb_id + '</td>';
		  	    	cb_content +='<td>' + cbList[i].create_at + '</td>';
		  	    	cb_content +='<td>' + cbList[i].classCode + '</td>';
		  	    	cb_content +='<td>' + cbList[i].teacherName + '</td>';
		  	    	cb_content +='<td>' + cbList[i].schoolName + '</td>';
		  	    	cb_content +='<td>' + cbList[i].courseContent + '</td>';
		  	    	cb_content +='<td>' + cbList[i].homework + '</td>';
		  	    	cb_content +='<td>' + cbList[i].quizNotice + '</td>';
		  	    	cb_content +='<td>' + cbList[i].phase + '</td>';  // 寫條件
		  	    	cb_content +='<td></td>';
		  	    	cb_content +='</tr>';
	  	    	} else {
	  	    		cb_content ='<tr><td colspan="10">查無結果</td></tr>';
	  	    	}
	  	    }
		  	cb_content ='</tbody>';
		  	$('#cbList').append(cb_content);
	  	}
  	}
 });	
	
=======

/* 選單change事件：(1)替換為enable版建立聯絡簿按鈕 (2)依選到的項目(classListId)帶出對應的聯絡簿清單 */	
$("#classInfoList").on("change",function(){
	// 抓選到的option的value屬性值(classListId=?)
	var selectedClassListId = $(this).prop("value"); 
	// console.log($(this).prop("value"));
	
	// 新增enable的button、移除disable的button
	var EnableBtnUrl = "<c:url value='/ContactBook/T_Edit/"+selectedClassListId+"'/>";
	var EnableBtn = "<a href='"+EnableBtnUrl+"' type='button' class='btn btn-success' tabindex='-1' role='button' aria-disabled='true'>建立聯絡簿</a>";
	$("#btn-area").append(EnableBtn); // 記得!!!!!!!!要加判斷能否連去EnableBtnUrl!!!!!!!!! 擺放位置要等json那一包載完吧???
	$("#btn-init").remove();
	
	// 找出對應contactBookList
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET","<c:url value='/teacherContactBookList.json'/>"+"?classListId="+selectedClassListId,true); 
	xhr2.send();                    
  	xhr2.onreadystatechange = function(){
  		
  		if(xhr2.readyState == 4 && xhr2.status == 200){
  			var cbList = JSON.parse(xhr2.responseText);
	  	  	
	  	  	cb_content ='<tbody id="cbList-data">';
	  	    for (i = 0 ; i < cbList.length ; i++){
	  	    	if (cbList.length > 0){
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
						cb_content +='<td>編輯中</td>';
					} else if (cbList[i].phase == 2) {
						cb_content +='<td>審核中</td>';
					} else if (cbList[i].phase == 3) {
						cb_content +='<td>已通過</td>';
					} else if (cbList[i].phase == 4) {
						cb_content +='<td>已取消</td>';
					} else {
						cb_content +='<td>系統發生問題，請通知系統管理員</td>';
					}
		  	    	
		  	    	cb_content +='</tr>';
	  	    	} else {
	  	    		cb_content ='<tr><td colspan="10">查無結果</td></tr>';
	  	    	}
	  	    }
		  	cb_content +='</tbody>';
		  	$('#cbList').append(cb_content);
	  	}
  	}
 });	
>>>>>>> e7b73a0dbd3abbc59adde6958947887cbcc57b7b


//=======================版面動作=======================

$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});

</script>

</body>
</html>