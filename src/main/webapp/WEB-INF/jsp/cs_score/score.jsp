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
		<a href="${contextRoot}/findAllScore.controller" type="button"
			class="btn btn-primary " href="${contextRoot}/scoreDataCreate.controller">新增</a> <a type="button"
			class="btn btn-warning" href="${contextRoot}/homepage.controller">Go
			To HomePage</a>
	</div>
	<div class="container">
		<h3>All Score Data</h3>
		
		
	
		
		
		
		<div>
			<label> 
				<select class="form-control" id="classCode" style="width:150px">
					<option value="-1" selected="selected">請選擇</option>
				</select>
			</label>
			<label> 
				<select class="form-control" id="tool_type" name="tool_type" style="cursor:pointer;" class="selectpicker ml-1 mb-2" data-width="150px">
					<option value="0">請選擇</option>
					<option value="1">第1次</option>
					<option value="2">第2次</option>
			    </select>
			</label>
			
			<div>
				<p class="info">
			</div>
			<div>
				<button id='selectBtn' class="btn btn-success">搜尋</button>
			</div>
		</div>
		<table class="table table-striped mt-5 " id="scoreTable">
			<thead id="thead-title">
				<tr>

					<td>id</td>
					<td>學生姓名</td>
					<!-- 					<td>考試科目</td> -->
					<!-- 					<td>次數</td> -->
					<td>分數</td>
					<!-- 					<td>班導名稱</td> -->
<!-- 					<td>通知家長</td> -->
					<td>編輯功能</td>
					<td>刪除功能</td>


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
		console.log("gogogo")
		let xhr = new XMLHttpRequest(); //for classcodeList
		let classCodeDate = [];// create a classcode array
		xhr.open("GET", "<c:url value='/clCodeList.json'/>", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let classcodes = JSON.parse(xhr.responseText);
				let id;
				let clscode;
				// insert option to select
				for (let i = 0; i < classcodes.length; i++) {
					id = classcodes[i].id;
					clscode = classcodes[i].classCode;
					let opt = '<option value=\"'+id+'\">' + clscode
							+ '</option>';
					$('#classCode').append(opt);
				}
			}
		}
	}
	
	let ciassListSelect = $("#selectBtn");
	ciassListSelect.click(sendClassCodeId);
	function sendClassCodeId() {
		let classSelected = document.getElementById("classCode");
		let anotherSelect = document.getElementById("tool_type");
		//get the select value
		let classCodeIdvalue = classSelected.value;
		let anotherSelectvalue = anotherSelect.value;
		//for studentList and classinfo
		let xhr2 = new XMLHttpRequest();
		// get the information from select value
		xhr2.open("GET", "<c:url value='/findAllScore2.controller'/>" + "?classCodeId="+ classCodeIdvalue + "&frequency=" + anotherSelectvalue, true);
		xhr2.send();
		xhr2.onreadystatechange = function(){
	      if(xhr2.readyState == 4 && xhr2.status == 200){
	        displayScoreListAndInfo(xhr2.responseText);//當選擇改變時找出對應資訊和學生清單
	      }
	    }
		function displayScoreListAndInfo(responseText){
			let dataSource =JSON.parse(responseText);
			let sidto=dataSource.sidto;
			console.log(sidto[1]);
			console.log(sidto[1].score);
		    let scoreLength=sidto.length;
		    $('#scoreTable tbody tr td').remove();
		    // console.log(studentLength);

		    scolist_data='<tbody>';
		    for (i=0;i<scoreLength; i++){
		    	scolist_data+='<tr>'
    			scolist_data+='<td>' + sidto[i].studentId+'</td>'
    			scolist_data+='<td>' + sidto[i].student+'</td>'
    			scolist_data+='<td>' + sidto[i].score+'</td>'
    			scolist_data+="<td style='display:none' class='scoreId'>" +sidto[i].scoreId+"</td>"
    		//  scolist_data+='<td><input type="checkbox" checked> </td>'
   		    //  scolist_data+='<td><input type="checkbox" checked> </td>'
  				scolist_data+="<td class='edit'><a href='${contextRoot}/scoreData/edit?id=" +sidto[i].scoreId+ "' type='button' class='btn btn-warning'>Edit</a></td>"
    		    scolist_data+="<td class='delete'><a onclick="+"\"return confirm('確定刪除嗎?')\" type='button' href='${contextRoot}/scoreData/delete?id="+sidto[i].scoreId+ "' class='btn btn-danger'>Delete</a></td>" 
    		
    			scolist_data+='<tr>'
		    }
		    
		    scolist_data +='</tobody>';
		    $('#scoreTable').append(scolist_data)
		}
		
	}

	// 		var xhr = new XMLHttpRequest();
	// 		xhr.open("GET", "<c:url value='/clCodeList.json'/>",true);
	// 		xhr.send();
	// 		xhr.onreadystatechange = function() {
	// 			if (xhr.readyState == 4 && xhr.status == 200) {
	// 				var content = "";

	/////////////////////////////////////

	// 		for (let i = 0;i<classcodes.length;i++){
	//           id=classcodes[i].id;
	// 		  console.log(id)
	//           clscode=classcodes[i].classCode;
	// 		  console.log(clscode)
	//           let opt='<option value=\"'+id+'\">'+clscode+'</option>';
	//           $('#classCode').append(opt);
	// 		}//選單迴圈結尾

	////////////////////////////////////

	// 				var scoreList = JSON.parse(xhr.responseText);
	// 				//console.log(classListList);
	// 				for (var i = 0; i < scoreList.length; i++) {
	// 					content += "<tr><td>"
	// 							+ scoreList[i].id
	// 							+ "</td>"
	// 							+ "<td>"
	// 							+ scoreList[i].student.name
	// 							+ "</td>"
	// 							+ "<td>"
	// 							+ scoreList[i].classlist.classCode
	// 							+ "</td>"
	// 							+ "<td>"
	// 							+ scoreList[i].frequency
	// 							+ "</td>"
	// 							+ "<td>"
	// 							+ scoreList[i].score
	// 							+ "</td>"
	// 							+ "<td>"
	// 							+ scoreList[i].school.name
	// 							+ "</td>"
	// 							+ "<td class='test1'><a type='button' class='btn btn-info'>email</a></td>"
	// //  						+ "<td class='test2'><a type='button' class='btn btn-warning' href='${contextRoot}/scoreData/edit?id="+${item.id}+"'>Edit</a></td>"
	//  							+"<td class='test2'><a href='${contextRoot}/scoreData/edit?id=" +scoreList[i].id+ "' type='button' class='btn btn-warning'>Edit</a></td>" 
	//  							+ "<td class='test3'><a href='${contextRoot}/scoreData/delete?id=" +scoreList[i].id+ "' type='button' class='btn btn-warning'>Delete</a></td>"

	// //  							"<td class='test3'><a  type="button"  href="${contextRoot}/scoreData/delete?id=" +scoreList[i].id+""     
	// //  							onclick="return confirm('確定刪除嗎?')"	class="btn btn-danger">Delete</a></td>"
	// // 							+ "</tr>";

	// 				}// table 迴圈結尾
	// 				var info = document.getElementById("content-data");
	// 				info.innerHTML = content;

	// 				$('input[type="checkbox"]').click(function() {
	// 					console.log('checkbox', $(this));
	// 					let bgColor = 'none';
	// 					if ($(this).prop('checked')) {
	// 						bgColor = 'lightblue';
	// 					}
	// 					$(this).closest('tr').css('background', bgColor)
	// 				})
	// 			}
	// 		}

	// 	}

	//=======================暫時不用=======================
	$(".test1").on("click", function() {
		let roomSize = $(this).prev().prev().children("input").val()
		let roomName = $(this).prev().prev().prev().children("input").val()
		let id = $(this).prev().prev().prev().prev().text();
		console.log(id);
		console.log(roomName);
		console.log(roomSize);
		//document.location.href = "${contextRoot}/updateRoomData.controller/"
		//+ id + "/" + roomName + "/" + roomSize;
	});
</script>
</html>