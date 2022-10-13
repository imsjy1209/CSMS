<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
    <option value="-1" selected="selected" hidden>selected</option>
  </select>
</div>

<div>
  <p id="classInfo">
  </p>
</div>
<form:form>
<table class="table table-hover" id="studentList">
    <thead>
      <tr>
        <th scope="col">出席</th>
        <th scope="col">坐號</th>
        <th scope="col">姓名</th>
      </tr> 
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" checkes></td>
        <td>22</td>
        <td>謝冬冬</td>
      </tr>
    </tbody>
    <button type="submit" class="btn btn-primary mb-2">send</button>
  </table>
</form:form>
</div>
<script>
  window.onload=function(){
    let xhr = new XMLHttpRequest(); //for classcodeList
    let classCodeDate = [];// create a classcode array
    xhr.open("GET","<c:url value='/clCodeList.json'/>",true);
    xhr.send();
    xhr.onreadystatechange = function(){
      if (xhr.readyState==4 && xhr.status == 200){
        let classcodes = JSON.parse(xhr.responseText);
        let id;
        let clscode;
        // insert option to select
        for (let i = 0;i<classcodes.length;i++){
          id=classcodes[i].id;
          clscode=classcodes[i].classCode;
          let opt='<option value=\"'+id+'\">'+clscode+'</option>';
          $('#classCode').append(opt);
        }
      }
    }
  } 

  let classcodeSelect=$("#classCode"); // 取得select
  //select change event
  classcodeSelect.change(sendIdAndGetStudentListAndInfo);
  function sendIdAndGetStudentListAndInfo(){
    let classSelected =document.getElementById("classCode");
    //get the select value
    let classCodeIdvalue = classSelected.value;
    //for studentList and classinfo
    let xhr2 = new XMLHttpRequest();
    // get the information from select value
    xhr2.open("GET","<c:url value='/clInfo.json'/>"+"?classCodeId="+classCodeIdvalue,true); 
    xhr2.send();
    xhr2.onreadystatechange = function(){
      if(xhr2.readyState == 4 && xhr2.status == 200){
        displayStudentListAndInfo(xhr2.responseText);//當選項改變時找出對應課程資訊和學生清單
      }
    }

    // insert class info and student list
    function displayStudentListAndInfo (responseText){
    let dataSource =JSON.parse(responseText);
    let stuList=dataSource.slDto;
    console.log(stuList);
    let teacher=dataSource.cliDto[0].teacherName;
    let clsRoom=dataSource.cliDto[0].classroom;
    let subject=dataSource.cliDto[0].subject;
    let school=dataSource.cliDto[0].schoolType;
    let grade=dataSource.cliDto[0].grade;
    // insert class info
    let  classInfo=$("#classInfo");
    classInfo.html(" 教室: "+clsRoom+" 課程內容: "+school+'&nbsp&nbsp&nbsp&nbsp'+grade+'&nbsp&nbsp&nbsp&nbsp'+subject+'&nbsp'+" 老師: "+teacher)
    // insert students list
    let studentLength=stuList.length;
    $('#studentList tbody tr td').remove();
    // console.log(studentLength);

    stulist_data='<tbody>';
    for (i=0;i<studentLength; i++){
      stulist_data+='<tr>'
      stulist_data+='<td><input type="checkbox" checked> </td>'
      stulist_data+='<td>' +stuList[i].studentSitID +'</td>'
      stulist_data+='<td>' +stuList[i].studentName +'</td>'
      stulist_data+='<tr>'
    }
    
    stulist_data +='</tobody>';
    $('#studentList').append(stulist_data)
    
  }//end of funtion displayStudentListAndInfo
  }


  
</script>
</body>
</html>