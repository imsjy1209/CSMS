<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../framePage/sideBar.jsp"></jsp:include>

<div class="container">
<h1>更改出缺勤</h1>

<BR/>
<div class="form-group">
  <form class="form-inline" action="">
  <label for="exampleFormControlSelect1">選擇班級&nbsp&nbsp</label>
  <select class="" id="classCode" name="classCode">
    <option value="-1" selected="selected" hidden>selected</option>
  </select>
  <label for="">&nbsp&nbsp輸入日期&nbsp&nbsp&nbsp</label>
  <input type="text" name="days" placeholder="ex:20221010" id="days">&nbsp&nbsp
</form>
</div>

<div>
  <p id="classInfo">
  </p>
</div>
<form class="form-inline" action="">
  <i style='font-size:36px;' class='bx bx-search-alt bx-flashing' ></i>
   <input class="form-control mr-sm-2" type="search" value="" placeholder="Search" aria-label="Search">
   <button id="mohuBtn" class="btn btn-outline-success my-2 my-sm-0">Search</button>
 </form></br>
<form:form>
<table class="table table-hover" id="studentList">
    <thead>
      <tr>
        <th scope="col">坐號</th>
        <th scope="col">姓名</th>
        <th scope="col">出席</th>

      </tr> 
    </thead>
    <tbody>
      <tr>
        <td><input type="checkbox" checkes></td>
        <td>22</td>
        <td>謝冬冬</td>
      </tr>
    </tbody>
  </table>
</form:form>
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
		
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

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
  let daysblur=$("#days")
  let classcodeSelect=$("#classCode"); // 取得select
  //select change event
  classcodeSelect.change(sendIdAndGetStudentListAndInfo);
  daysblur.blur(sendIdAndGetStudentListAndInfo);

  function sendIdAndGetStudentListAndInfo(){
    let classSelected =document.getElementById("classCode");
    let days=document.getElementById("days");
    let daysvalue=days.value;
    //get the select value
    let classCodeIdvalue = classSelected.value;
    //for studentList and classinfo
    let xhr2 = new XMLHttpRequest();
    // get the information from select value
    xhr2.open("GET","<c:url value='/getAbsentData.json'/>"+"?classCodeId="+classCodeIdvalue+"&days="+daysvalue,true); 
    xhr2.send();
    xhr2.onreadystatechange = function(){
      if(xhr2.readyState == 4 && xhr2.status == 200){
        displayAbsentListAndInfo(xhr2.responseText);//當選擇改變時找出對應資訊和學生清單
      }
    }
    // insert class info and Absent list
    function displayAbsentListAndInfo (responseText){
    let dataSource =JSON.parse(responseText);
    let abListLength=dataSource.abList.length;
    let teacher=dataSource.cliDto[0].teacherName;
    let clsRoom=dataSource.cliDto[0].classroom;
    let subject=dataSource.cliDto[0].subject;
    let school=dataSource.cliDto[0].schoolType;
    let grade=dataSource.cliDto[0].grade;
    // insert class info
    $('#classInfo').remove();
    let  classInfo=$("#classInfo");
    classInfo.html(" 教室: "+clsRoom+" 課程內容: "+school+'&nbsp&nbsp&nbsp&nbsp'+grade+'&nbsp&nbsp&nbsp&nbsp'+subject+'&nbsp'+" 老師: "+teacher)
    // insert students list
    $('#studentList tbody tr td').remove();
    //判斷職相等
      stulist_data="<tbody>";
    for (i=0;i<abListLength; i++){
        stulist_data+="<tr>"
        // console.log(dataSource.abList[i].id);
        let absid=dataSource.abList[i].id;
        stulist_data+="<td>" +dataSource.abList[i].student.classStudentLists[0].studentNo +"</td>"
        stulist_data+="<td style='display:none' class='absid  '>"+absid +"</td>"
        stulist_data+="<td>" +dataSource.abList[i].student.name+"</td>"
        // console.log(dataSource.abList[i].arrviedOrNot)
        let InorOut=dataSource.abList[i].arrviedOrNot
        let absesntText;
        if (InorOut==0){
          absesntText="缺席";
        } else if(InorOut==1){
          absesntText="出席";
        } else if (InorOut==2){
          absesntText="請假";
        }
        stulist_data+="<td><select class='abs' id='abs' name='abs'><option value='"+InorOut+"' selected='selected' hidden>"+absesntText+"</option>"
        stulist_data+="<option value='0' >缺席</option>"
        stulist_data+="<option value='1' >出席</option>"
        stulist_data+="<option value='2' >請假</option>"
        stulist_data+="</select></td></tr>"
    }

    stulist_data +='</tobody>';
    $('#studentList').append(stulist_data)

    // absent select change event
    $('.abs').change(function(){
    // get student id
    let absentid=$(this).parent().siblings('.absid ').text();
    let absOrNot=$(this).val();
    console.log(absOrNot);
    let xhr3 = new XMLHttpRequest();
    // get the information from select value
    xhr3.open("GET","<c:url value='/updateStudentOrNotByID'/>"+"?absid="+absentid+"&absOrNot="+absOrNot,true); 
    xhr3.send();

    })
  }//end of funtion displayStudentListAndInfox
  }

  //=======================版面動作=======================
  $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });

  
</script>
</body>
</html>