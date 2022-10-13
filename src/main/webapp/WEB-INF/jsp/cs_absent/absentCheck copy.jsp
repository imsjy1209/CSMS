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
    <c:forEach var="ClList" items="${ClList}" >
      <option value="-1" selected="selected" hidden>selected</option>
      <option value="${ClList.id}">${ClList.classCode}</option>
    </c:forEach>
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
<script src="${contextRoot}/js/classAndStudentList.js"></script>
<script>
  let length=data.length;
  // console.log(length);
  // console.log(data[0].teacher);
  let classcode=$("#classCode");
  
  classcode.change(getClssInfoAndStudentList);
  // classcode.change(getStudentList);
  function getClssInfoAndStudentList() {
    let  classSelect =document.getElementById("classCode");
    let idx = classSelect.value-1;
    let  classInfo=$("#classInfo");
    classInfo.html(" 教室: "+data[idx].classroom+" 科目: "+data[idx].subject+" 老師: "+data[idx].teacher)
    // classInfo.append("data")
    let studentList=$("#studentList");
    let studentLength=data[idx].clsStu.length;
    $('#studentList tbody tr td').remove();

    console.log(studentLength +"people");
    stulist_data='<tbody>';
    for (i=0;i<studentLength; i++){
      stulist_data+='<tr>'
      stulist_data+='<td><input type="checkbox" checked> </td>'
      stulist_data+='<td>' +data[idx].clsStu[i].studentID +'</td>'
      stulist_data+='<td>' +data[idx].clsStu[i].studentName +'</td>'
      stulist_data+='<tr>'
    }
    
    stulist_data +='</tobody>';
    $('#studentList').append(stulist_data)
  }

</script>
</body>
</html>