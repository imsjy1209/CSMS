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
	<div class="topbtn"></div>
	
	<div class="container">
<%-- 		<form action="${contextRoot}/scoreDataCreate.controller" method="POST" --%>
<!-- 			class="row g-3 form1" enctype="multipart/form-data"> -->
<!-- 		</form> -->
		<h3>All Score Data</h3>
	<div>
	
	<!-- 課程選單 -->
	<label> 
		<select class="form-control" id="classCode" style="width:150px">
			<option value="-1" selected="selected">請選擇</option>
		</select>
	</label>	
	
	<!-- 搜尋次數 -->
	<div>
		<div style="width:50%">
			<label for="inputScore" class="form-label"></label>
			<input type="text" name="score" class="form-control"  placeholder="請輸入次數" id="inputfrequency" size="5" value="${score1.score}">
		</div>
		<button id='selectBtn' class="btn btn-success">搜尋</button>
		<button id='send' class="btn btn-success">send</button>
	</div>

	<div style="width:50%">
		<table class="table table-bordered" id="scoreTable" style="text-align:center">
			<thead id="thead-title">
				<tr>
					<th>id</th>
					<th>學生姓名</th>
					<th>請輸入成績</th>
				</tr>
			</thead>
			<tbody id="content-data">
				<!-- 成績資料json載入區 -->
			</tbody>
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

	<!--####################################################################### -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>


<!-- jsp作業區 -->
<script type="text/javascript">
	window.onload = function() {
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
		let classCodeIdvalue = classSelected.value;
		let xhr2 = new XMLHttpRequest();
		xhr2.open("GET", "<c:url value='/findAllScore2.controller'/>" + "?classCodeId="+ classCodeIdvalue , true);
		xhr2.send();
		xhr2.onreadystatechange = function(){
	      if(xhr2.readyState == 4 && xhr2.status == 200){
	        displayScoreListAndInfo(xhr2.responseText);//當選擇改變時找出對應資訊和學生清單
	      }
	    }
		function displayScoreListAndInfo(responseText){
			let dataSource =JSON.parse(responseText);
			let fcList=dataSource.fcList;
 		    let scoreLength=fcList.classStudentLists.length;   
		    $('#scoreTable tbody tr td').remove();
		    scolist_data='<tbody>';
		    for (i=0;i<scoreLength; i++){
		    	scolist_data+='<tr>'		 	    
		    	scolist_data+='<td>' + fcList.classStudentLists[i].student.id+'</td>'
    			scolist_data+='<td>' + fcList.classStudentLists[i].student.name+'</td>'
    			scolist_data+='<td><input type="text" name="score" maxlength="4"  size="2" width="5" class="form-control getscore" id="inputScore" value="${score1.score}"></td>'
		       	scolist_data +='</tobody>';
		}
 		    scolist_data +='</tobody>';
 		    $('#scoreTable').append(scolist_data);
		}}
//========================================================================
	$("#send").click(function(){
      // ===============傳送absent List=============
      confirm('確定送出嗎?')
      let scoreList=[];
          // 找到classcodeId的值< class="classCodeId">
          let classCodeId=$("#classCode").val();
          let frequency=$("#inputfrequency").val();
        //  console.log(frequency);
          let studentId;
          let getscore;
          // table 裡的每一列
          $('.getscore').each(function(){
            // 取的每一列tr 裡面的select有沒有沒有出席的數值
             let getscore=$(this).val();
//              console.log("getscore"+getscore);
            // 找到每一頁隱藏 學生的id
            let studentId=$(this).parent().prev().prev().text();
            //console.log("studentId"+studentId);
            // 建立一個 物件塞入陣列
            let eachList={"classCodeId":classCodeId,"studentId":studentId,"score":getscore,"frequency":frequency};
            // 塞入 131的 AbsentList
            scoreList.push(eachList);
          })
          let scoreListJsonString=JSON.stringify(scoreList);
           console.log(scoreListJsonString);
          $.ajax({                            
                url:'http://localhost:8081/CSMS/scoreDataCreate',
                contentType:'application/json;charset=UTF-8',
                dataType:null,
                method:'post',
                data:scoreListJsonString,
                success:function(result){
                  console.log("okokok")
                },
                error:function(err){
                  console.log("ngngngng")
                }
	        })
    })    
	

	//=======================暫時不用=======================
	$(".test1").on("click", function() {
		let roomSize = $(this).prev().prev().children("input").val()
		let roomName = $(this).prev().prev().prev().children("input").val()
		let id = $(this).prev().prev().prev().prev().text();
		console.log(id);
		console.log(roomName);
		console.log(roomSize);
	});
</script>
</body>
</html>