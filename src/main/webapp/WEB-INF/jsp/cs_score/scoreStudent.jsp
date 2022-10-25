<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Welcome</title>
<style>
.topbtn {
	text-align: center;
	width: 500px;
	margin: auto;
}

.container {
	width: 1500px;
	margin: auto;
}
</style>
</head>
<body>
	<div class="topbtn">
		<!-- 	<a id="showdata" href="#" type="button" class="btn btn-primary ">show data</a> -->
		<a href="${contextRoot}/frontAllScore.controller" type="button"
			class="btn btn-primary ">新增</a> <a type="button"
			class="btn btn-warning" href="${contextRoot}/homepage.controller">Go
			To HomePage</a>
	</div>
	<div class="container">
		<h3>All Score Data</h3>
		
		
	
		
		<span id="hiddenUserId" hidden>15</span><!-- 改${sessionScope.user.id} -->
		<div>
			<label> 
				<select class="form-control" id="classCode" style="width:150px">
					<option value="-1" selected="selected" hidden>請選擇</option>
				</select>
			</label>
<!-- 			<label>  -->
<!-- 				<select class="form-control" id="tool_type" name="tool_type" style="cursor:pointer;" class="selectpicker ml-1 mb-2" data-width="150px"> -->
<!-- 					<option value="0">請選擇</option> -->
<!-- 					<option value="1">第1次</option> -->
<!-- 					<option value="2">第2次</option> -->
<!-- 			    </select> -->
<!-- 			</label> -->
<!-- 			<label>  -->
<!-- 				<select class="form-control" id="tool_student" name="tool_student" style="cursor:pointer;" class="selectpicker ml-1 mb-2" data-width="150px"> -->
<!-- 					<option value="0">請選擇</option> -->
<!-- 					<option value="王彤穎">王彤穎</option> -->
<!-- 					<option value="羅潮萬">羅潮萬</option> -->
<!-- 			    </select> -->
<!-- 			</label> -->
			
			<div>
				<p class="info">
			</div>
<!-- 			<div> -->
<!-- 				<button id='selectBtn' class="btn btn-success">搜尋</button> -->
<!-- 			</div> -->
		</div>
		<table class="table table-striped mt-5 " id="scoreTable">
			<thead id="thead-title">
				<tr>
					<td>次數</td>					
					<td>分數</td>
				</tr>
			</thead>
			<tbody id="content-data">

			</tbody>
		</table>
	</div>

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

	<!--####################################################################### -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>


</body>
<script type="text/javascript">
	window.onload = function() {
		let xhr = new XMLHttpRequest(); //for classcodeList
		// let classCodeDate = [];// create a classcode array
		xhr.open("GET", "<c:url value='/ClassInfoForStudentScorePage.json'/>", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let classcodes = JSON.parse(xhr.responseText);
				let id;
				let clscode;
				// insert option to select
				for (let i = 0; i < classcodes.length; i++) {
					id = classcodes[i].classListId; // 放在option的value屬性的值
					clscode = classcodes[i].classCode;
					let opt = '<option value=\"'+id+'\">' + clscode
							+ '</option>';
					$('#classCode').append(opt);
				}
			}
		}
	}
	
	$("#classCode").on("change",function(){
		//get the select value
		var classCodeId = $(this).prop("value");
		console.log(classCodeId);
		
		//get the session user id
		var sessionUserId = $("#hiddenUserId").text();
		console.log(sessionUserId);
		
		//get student score list by classcodeid
		let xhr2 = new XMLHttpRequest();
		xhr2.open("GET", "<c:url value='/findStudentPersonalScoreList.json'/>" + "?classCodeId="+ classCodeId + "&sessionUserId=" + sessionUserId, true);
		xhr2.send();
		xhr2.onreadystatechange = function(){
		    if(xhr2.readyState == 4 && xhr2.status == 200){
		    	var scoreStuList = JSON.parse(xhr2.responseText);
		    	var scoreStuListLength = scoreStuList.length;
		    	$('#scoreTable tbody tr td').remove();
		    	
		    	scolist_data='<tbody>';
		    	for (i=0 ; i<scoreStuListLength ; i++){
		    		scolist_data+='<tr>';
	    			scolist_data+='<td>' + scoreStuList[i].frequency+'</td>'
	    			scolist_data+='<td>' + scoreStuList[i].score+'</td>'
	    			scolist_data+='<tr>'
		    	}
		    	scolist_data +='</tobody>';
		    	$('#scoreTable').append(scolist_data);
		    }
	    }
	});
	
// scolist_data+='<td>' + scoreStuList[i].studentId+'</td>'
// scolist_data+='<td>' + scoreStuList[i].student+'</td>'
// scolist_data+="<td style='display:none' class='scoreId'>" +scoreStuList[i].scoreId+"</td>"	
</script>
</html>