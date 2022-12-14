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

.input{border:0;
  background-color:#003C9D;
  color:#fff;
  border-radius:10px;
  cursor:pointer;}

.input:hover{
  color:#003C9D;
  background-color:#fff;
  border:2px #003C9D solid;
}
</style>

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

<div class="container">
 <h3 class='main-title'><i style='font-size:36px;' class='bx bx-search-alt-2'></i>All Score Data</h3>
           
   <br>
 <div class="topbtn">
 </div>
 

  <div>
  <!-- 課程選單 -->
   <label> <select class="form-control" id="classCode"
    style="width: 150px">
     <option value="-1" selected="selected">請選擇</option>
           </select>
   </label> 
  <!-- 考試次數選單 -->
   <label> <select class="form-control" id="tool_type"
    name="tool_type" style="cursor: pointer;"
    class="selectpicker ml-1 mb-2" data-width="150px">
     <option value="0">請選擇</option>
     <option value="1">第1次</option>
     <option value="2">第2次</option>
     <option value="3">第3次</option>
     <option value="4">第4次</option>
                   </select>
   </label>
   <br>
   
   <br>
   <div>
    <button id='selectBtn' class="btn btn-info">搜尋</button>        
       
   </div>

  
    <table class="table table-striped mt-5 " id="scoreTable">
   <thead id="thead-title">
    <tr>
     <td>id</td>
     <td>學生姓名</td>
     <td>分數</td>

    </tr>
   </thead>
   <tbody id="content-data">
   </tbody>
  </table>
 
 <!--  =====End Of Container============== -->
 </div>
  
 <!-- ================for Side Bar==================  -->
 </div>
</body>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



<!-- jsp作業區 -->
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
 //console.log("oooo")
 ciassListSelect.click(sendClassCodeId);
 function sendClassCodeId() {
  let classSelected = document.getElementById("classCode");
 // console.log("233")
  let anotherSelect = document.getElementById("tool_type");  //get the select value
  let classCodeIdvalue = classSelected.value;
 // console.log("553")
  let anotherSelectvalue = anotherSelect.value;  //for studentList and classinfo
  let xhr2 = new XMLHttpRequest();  // get the information from select value
  xhr2.open("GET", "<c:url value='/findPassScore.controller'/>"
    + "?classCodeId=" + classCodeIdvalue + "&frequency="
    + anotherSelectvalue, true);
  xhr2.send();
  xhr2.onreadystatechange = function() {
   if (xhr2.readyState == 4 && xhr2.status == 200) {
    displayScoreListAndInfo(xhr2.responseText);//當選擇改變時找出對應資訊和學生清單
   }
  }
  function displayScoreListAndInfo(responseText) {
   let dataSource = JSON.parse(responseText);
 //  console.log("666s")
   let sidto = dataSource.sidto;
 //  console.log("999")
   console.log(sidto[1]);
   console.log("555")
   console.log(sidto[1].score);
   console.log("222")
   let scoreLength = sidto.length;
   $('#scoreTable tbody tr td').remove();
   scolist_data = '<tbody>';
   for (i = 0; i < scoreLength; i++) {
    scolist_data += '<tr>'
    scolist_data += '<td>' + sidto[i].studentId + '</td>'
    scolist_data += '<td>' + sidto[i].student + '</td>'
    scolist_data += '<td>' + sidto[i].score + '</td>'
    scolist_data += "<td style='display:none' class='scoreId'>"
      + sidto[i].scoreId + "</td>"    
    scolist_data += '<tr>'
   }
   console.log("999")
   scolist_data += '</tobody>';
   $('#scoreTable').append(scolist_data)
  }
 }
 //=======================暫時不用=======================
//  $(".test1").on("click", function() {
//   let roomSize = $(this).prev().prev().children("input").val()
//   let roomName = $(this).prev().prev().prev().children("input").val()
//   let id = $(this).prev().prev().prev().prev().text();
//   console.log(id);
//   console.log(roomName);
//   console.log(roomSize);
//   //document.location.href = "${contextRoot}/updateRoomData.controller/"
//   //+ id + "/" + roomName + "/" + roomSize;
//  });
</script>
</body>
</html>