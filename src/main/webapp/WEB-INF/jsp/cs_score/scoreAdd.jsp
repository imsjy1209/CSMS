<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

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

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-check-square'></i>Create Score Data</h3>

	<div class="topbtn" topbtn></div>
	
	<!-- 課程選單 -->
		<div  >
	<label> 
		<select class="form-control" id="classCode" style="width:150px">
			<option value="-1" selected="selected">請選擇</option>
		</select>
	</label>	
	
	<!-- 搜尋次數 -->
	<div class="form-group row">
		<div style="width:20%">
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
	
<!-- 	=====End Of Container============== -->
	</div>
		
	<!-- ================for Side Bar==================	 -->
	</div>
</body>
	

	<!-- CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



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
	
	
	//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
	
</script>
</body>
</html>