<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>Absent Check</title>
</head>
<body>
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
<h1>出缺勤</h1>
<BR/>
<div class="form-group">
  <label for="exampleFormControlSelect1">chose class</label>
  <select class="form-control" id="classCode" name="classCode">
    <!-- <c:forEach var="ClList" items="${ClList}" >
      <option value="-1" selected="selected" hidden>selected</option>
      <option value="${ClList.id}">${ClList.classCode}</option>
    </c:forEach> -->
  </select>
</div>

<div>
  <p id="classInfo">
  </p>
</div>
<table class="table table-hover" id="studentList">
    <thead>
      <tr>
        <th scope="col">出席</th>
        <th scope="col">學號</th>
        <th scope="col">姓名</th>
      </tr> 
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" checkes></td>
        <td>91538</td>
        <td>肯伊斯古德</td>
      </tr>
    </tbody>
  </table>
</div>
<script>
  let selectElement = document.getElementById('classCode');	// 取得select
  let classInfo = document.getElementById('classInfo');	// 顯示課堂資訊的地方
  let stuList = document.getElementById('studentList'); 	// 顯示學生頁表的table
  let xhr = new XMLHttpRequest();
  let XHR2 = new XMLHttpRequest();
  let classDate = [];
  xhr.onreadystatechange = function(){
    if (xhr.readyState==4 && xhr.status == 200){
      let classcodes = JSON.parse(xhr.responseText);
      for (let i = 0;i<classcodes.length;i++){
        let code= [classcodes[i].classcode, classcode[i].classList_id]
        classDate.push(code);
      }
      for (let j=0;j<classData.length;j++){
        let option = new Option(classDate[j][0],""+classDate[j][1])
        selectElement.option[selectElement.options.length] = option
      }
    }
  }
  xhr.open("GET","<c:url value='/clCodeList.json'/>",true);
  xhr.send;
  selectElement.onchange =  function(){
    xhr2.onreadystatechange = function(){
      if(xhr2.readyState == 4 && xhr2.status == 200){
        displayStudentList(xh2.responseText);//當選擇改變時 去把學生清單拉出來
      }
    }
    let classCodeId= selectElement.options[selectElement.selectIndex].value;
    xhr2.open("GET","<c:url value='?????'/>"+"?classCodeId="+classCodeId,true); 
    xhr2.send();
  }

</script>
</body>
</html>