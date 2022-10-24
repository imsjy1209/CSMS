<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../framePage/sideBar.jsp"></jsp:include>
<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
      <a class="nav-item nav-link active navSch" id="nav-school-tab" data-toggle="tab" href="#nav-school" role="tab" aria-controls="nav-school" aria-selected="true">校方</a>
      <a class="nav-item nav-link navTea" id="nav-teacher-tab" data-toggle="tab" href="#nav-teacher" role="tab" aria-controls="nav-teacher" aria-selected="false">教師</a>
      <a class="nav-item nav-link navStu" id="nav-student-tab" data-toggle="tab" href="#nav-student" role="tab" aria-controls="nav-student" aria-selected="false">學生</a>
      <a class="nav-item nav-link navPar" id="nav-parents-tab" data-toggle="tab" href="#nav-parents" role="tab" aria-controls="nav-parents" aria-selected="false">家長</a>
    </div>
  </nav>
  <div class="tab-content" id="nav-tabContent">
    <div class="tab-pane fade show active" id="nav-school" role="tabpanel" aria-labelledby="nav-school-tab">
        <table class="table table-hover" id="schoolList">
            <thead>
              <tr>
                  <th scope="col">校方人員</th>
                  <th scope="col">姓名</th>
                  <th scope="col">職位</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody id="sLbody">

            </tbody>
          </table>
    </div>
    <div class="tab-pane fade" id="nav-teacher" role="tabpanel" aria-labelledby="nav-teacher-tab">
        <table class="table table-hover" id="teacherList">
            <thead>
              <tr>
                  <th scope="col">教師編號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">主科</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody id ="tLbody">

            </tbody>
          </table>
    </div>
    <div class="tab-pane fade" id="nav-student" role="tabpanel" aria-labelledby="nav-student-tab">
        <table class="table table-hover" id="studentList">
            <thead>
              <tr>
                  <th scope="col">學生編號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody id="stubody"></tbody>
          </table>
    </div>
    <div class="tab-pane fade" id="nav-parents" role="tabpanel" aria-labelledby="nav-parents-tab">
        <table class="table table-hover" id="parentList">
            <thead>
              <tr>
                  <th scope="col">家長編號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody id="pLbody">

            </tbody>
          </table>
    </div>
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
// 校方人員 分頁按鈕
$("#nav-school-tab").click(getSchoolList);
$("#nav-teacher-tab").click(getTeacherList);
$("#nav-student-tab").click(getStudentList);
$("#nav-parents-tab").click(getParentList);

function getSchoolList(){
  // console.log("school");
  let xhr = new XMLHttpRequest();
    xhr.open("GET","<c:url value='/getSchoolList.page'/>",true);
    xhr.send();
    xhr.onreadystatechange = function(){
  
      if (xhr.readyState==4 && xhr.status == 200){
        let schoolList = JSON.parse(xhr.responseText);
        let schoolBody;
        $('#sLbody').html('');
        schoolList.forEach(object => {
          schoolBody +='<tr><td>'+object.schoolId+'</td>';
          schoolBody +='<td>' +object.schoolName+'</td>';
          schoolBody +='<td>'+object.title+'</td>';
          let propermissionText;
          if (object.whitelist==0){
            propermissionText="Disable";
          }else{
            propermissionText="Enable";
          }
          schoolBody+="<td><select class='prop' id='prop' name='prop'><option value='"+object.whitelist+"' selected='selected'>"+propermissionText +"</option>"
          schoolBody+="<option value='0' >Disable</option>"
          schoolBody+="<option value='1' >Enable</option>"
          schoolBody +='<td></td></tr>';
        });
        // schoolBody +='</tobody>';
        $('#sLbody').append(schoolBody);
        }
      }
    }

function getTeacherList(){
  let xhr2 = new XMLHttpRequest();
    xhr2.open("GET","<c:url value='/getTeacherList.page'/>",true);
    xhr2.send();
    xhr2.onreadystatechange = function(){
      if (xhr2.readyState==4 && xhr2.status == 200){
        let teacherList = JSON.parse(xhr2.responseText);
        let teacherBody;
        $('#tLbody').html('');
        teacherList.forEach(object => {
          teacherBody +='<tr><td>'+object.teacherId+'</td>';
          teacherBody +='<td>' +object.teacherName+'</td>';
          teacherBody +='<td>'+object.subject+'</td>';
          let propermissionText;
          if (object.whitelist==0){
            propermissionText="Disable";
          }else{
            propermissionText="Enable";
          }
          teacherBody+="<td><select class='prop' id='prop' name='prop'><option value='"+object.whitelist+"' selected='selected'>"+propermissionText +"</option>"
          teacherBody+="<option value='0' >Disable</option>"
          teacherBody+="<option value='1' >Enable</option>"
          teacherBody +='<td></td></tr>';
        });
        // schoolBody +='</tobody>';
        $('#tLbody').append(teacherBody);
        }
      }
    }
function getStudentList(){
  // console.log("student");
  let xhr3 = new XMLHttpRequest();
    xhr3.open("GET","<c:url value='/getStudentList.page'/>",true);
    xhr3.send();
    xhr3.onreadystatechange = function(){
      if (xhr3.readyState==4 && xhr3.status == 200){
        let studentList = JSON.parse(xhr3.responseText);
        let studentBody;
        $('#stubody').html('');
        studentList.forEach(object => {
          studentBody +='<tr><td>'+object.studentID+'</td>';
          studentBody +='<td>' +object.studentName+'</td>';
          let propermissionText;
          if (object.whitelist==0){
            propermissionText="Disable";
          }else{
            propermissionText="Enable";
          }
          studentBody+="<td><select class='prop' id='prop' name='prop'><option value='"+object.whitelist+"' selected='selected'>"+propermissionText +"</option>"
          studentBody+="<option value='0' >Disable</option>"
          studentBody+="<option value='1' >Enable</option>"
          studentBody +='<td></td></tr>';
        });
        $('#stubody').append(studentBody);
        }
      }
}
function getParentList(){
  let xhr4 = new XMLHttpRequest();
    xhr4.open("GET","<c:url value='/getParentList.page'/>",true);
    xhr4.send();
    xhr4.onreadystatechange = function(){
      if (xhr4.readyState==4 && xhr4.status == 200){
        let parentList = JSON.parse(xhr4.responseText);
        let parentBody;
        $('#pLbody').html('');
        parentList.forEach(object => {
          parentBody +='<tr><td>'+object.parentId+'</td>';
          parentBody +='<td>' +object.parentsName+'</td>';
          let propermissionText;
          if (object.whitelist==0){
            propermissionText="Disable";
          }else{
            propermissionText="Enable";
          }
          parentBody+="<td><select class='prop' id='prop' name='prop'><option value='"+object.whitelist+"' selected='selected'>"+propermissionText +"</option>"
          parentBody+="<option value='0' >Disable</option>"
          parentBody+="<option value='1' >Enable</option>"
          parentBody +='<td></td></tr>';
        });
        $('#pLbody').append(parentBody);
        }
      }
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