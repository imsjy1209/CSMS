<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- BOX ICONS -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<style>
.container {
	width: 1500px;
	margin: auto;
}

</style>
<!-- NAVBAR -->
<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

<!-- CONTENT -->
<div class="container">

	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-edit-location'></i>建立班級成績</h3>
	<br>
	<div class="content">
		<!-- 操作說明 -->
		<div style="margin-bottom:20px;color:#E0777D">
			※ 操作說明：1. 選擇課程 2. 帶入名單 3. 輸入第幾次考試及成績 4. 送出
		</div>
		<!-- (1) 先查詢班級名單 -->
		<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
			<!-- 課程選單 -->
	  		<div class="input-group">	    		
				<select class="form-control" id="classCode" style="width:150px">
					<option value="-1" selected="selected" hidden>請選擇課程</option>
				</select>						
	  		</div>
	  		&nbsp;&nbsp;&nbsp;
	  		<!-- 課程選單查詢鈕 -->
	  		<div class="btn-group mr-2" role="group" aria-label="First group">
	    		<button id='selectBtn' class="btn btn-primary">帶入名單</button>
	  		</div>
		</div>
		<!-- (2) 再輸入次數 -->
		<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
			<!-- 輸入欄位 -->
			<div style="width:150px">
				<input type="number" min="1" max="4" name="score" class="form-control" placeholder="請輸入次數" id="inputfrequency" size="5" value="${score1.score}">
			</div>
		</div>
		<!-- (3) 再輸入學生成績 -->
		<div style="width:50%">
			<table class="table table-bordered" id="scoreTable" style="text-align:center">
				<thead id="thead-title">
					<tr>
						<th>ID</th>
						<th>學生姓名</th>
						<th>請輸入成績</th>
					</tr>
				</thead>
				<tbody id="content-data">
					<!-- 成績資料json載入區 -->
				</tbody>
			</table>
		</div>
		<!-- (4) 最後送出 -->
		<button id='send' class="btn btn-success">送出</button>&nbsp;&nbsp;
		<!-- 一鍵輸入有空再做 -->	
<!-- 	<button id='send' class="btn btn-success" id="oneKey">一鍵輸入</button> -->	
	</div><!-- End Of Content -->
	
</div><!-- End Of Container -->

	<!-- ================for Side Bar==================	 -->
	</div>
</body>
	

	<!-- CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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


<!-- jsp作業區 -->
<script type="text/javascript">
	window.onload = function() {
		let xhr = new XMLHttpRequest(); //for classcodeList
		// let classCodeDate = [];// create a classcode array -- 沒用到
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
	        	displayScoreListAndInfo(xhr2.responseText); // 當選擇改變時找出對應資訊和學生清單
			}
		}
		
		function displayScoreListAndInfo(responseText){
			let dataSource =JSON.parse(responseText);
			let fcList=dataSource.fcList;
		 	let scoreLength=fcList.classStudentLists.length;   
			$('#scoreTable tbody tr td').remove();
			scolist_data='<tbody>';
			for (i=0 ; i<scoreLength; i++){
				scolist_data+='<tr>'		 	    
				scolist_data+='<td>' + fcList.classStudentLists[i].student.id+'</td>'
		    	scolist_data+='<td>' + fcList.classStudentLists[i].student.name +'</td>'
		    	scolist_data+='<td><input type="number" name="score" min="0" max="100" size="2" width="5" class="form-control getscore" id="inputScore" value="${score1.score}"></td>'
				scolist_data +='</tobody>';
			}
		 	scolist_data +='</tobody>';
		 	$('#scoreTable').append(scolist_data);
		}
	}

	
//========================================================================
	$("#send").click(function() {
		
		var frequency = $("#inputfrequency").val();
		// console.log(frequency);
      	
		if (frequency == "") {
			Swal.fire({
				title:'請填寫次數',
				icon:'warning',
				showConfirmButton: false,
				showCancelButton: false
			});
		} else {
			// confirm('確定送出嗎?')
			let scoreList=[];
			
			// 找到classcodeId的值 < id="classCodeId">
			let classCodeId = $("#classCode").val();
			
			// console.log("classCodeId = " + classCodeId);
			// console.log("frequency = " + frequency);
			
			let studentId;
			let getscore;
			
			// table 裡的每一列
			 $('.getscore').each(function() {
				 
				// 取的每一列td有沒有分數的數值
				let getscore = $(this).val();
				console.log("getscore = " + getscore);
				
				// 找到每一頁隱藏 學生的id
				let studentId = $(this).parent().prev().prev().text();
             	console.log("studentId = "+ studentId);
				
				if (getscore < 0 || getscore > 100){
					
					Swal.fire({
						title:'分數需介於數字0~100間',
						icon:'warning',
						showConfirmButton: false,
						showCancelButton: false
					});
					
				}

				// 建立一個 物件塞入陣列
	            let eachList = {"classCodeId":classCodeId,
	             				"studentId":studentId,
	             				"score":getscore,
	             				"frequency":frequency};
	             	
	            // 塞入 scoreList
	            scoreList.push(eachList);
	            // console.log(scoreList);

			    let scoreListJsonString = JSON.stringify(scoreList);
		        // console.log(scoreListJsonString);
		        $.ajax({                            
			        url:'http://localhost:8081/CSMS/scoreDataCreate',
			        contentType:'application/json;charset=UTF-8',
			        dataType:null,
			        method:'post',
			        data:scoreListJsonString,
			        success:function(result){
			        	console.log("okokok");
				    	
			        	Swal.fire({
			        		title:'送出成功',
			        		icon:'success',
			        		showConfirmButton: false,
			        		showCancelButton: false
			        	});
				    	
						setTimeout(function() {
						 	window.location.href = "/CSMS/score";
						 }, 1500);	
			        },
			        error:function(err){
			            console.log("ngngngng")
			        } 	
				});
				
			});
			
		}

    });    
	

	//=======================暫時不用=======================
	$(".test1").on("click", function() {
		let roomSize = $(this).prev().prev().children("input").val()
		let roomName = $(this).prev().prev().prev().children("input").val()
		let id = $(this).prev().prev().prev().prev().text();
		console.log(id);
		console.log(roomName);
		console.log(roomSize);
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


<!-- 	原本內容  -->
		<!-- 	<label>  -->
<!-- 		<select class="form-control" id="classCode" style="width:150px"> -->
<!-- 			<option value="-1" selected="selected">請選擇</option> -->
<!-- 		</select> -->
<!-- 	</label>	 -->
<!-- 		<div> -->
<!-- 		<div style="width:20%"> -->
<!-- 			<label for="inputScore" class="form-label"></label> -->
<!-- 			<input type="text" name="score" class="form-control"  placeholder="請輸入次數" id="inputfrequency" size="5" value="${score1.score}"> -->
			
<!-- 		</div>    -->
		<!-- 	    		<button type="button" class="btn btn-secondary">1</button> -->
<!-- 		<button id='send' class="btn btn-success">送出</button> -->
<!-- 	</div> -->	
<!-- 	<div style="width:50%"> -->
<!-- 		<table class="table table-bordered" id="scoreTable" style="text-align:center"> -->
<!-- 			<thead id="thead-title"> -->
<!-- 				<tr> -->
<!-- 					<th>id</th> -->
<!-- 					<th>學生姓名</th> -->
<!-- 					<th>請輸入成績</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody id="content-data"> -->
<!-- 				成績資料json載入區 -->
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<button id='send' class="btn btn-success">送出</button> -->