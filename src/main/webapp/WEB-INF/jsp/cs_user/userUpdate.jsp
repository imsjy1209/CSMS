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
                  <th scope="col">校方人員邊號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">職位</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody>
              <tr>
              </tr>
            </tbody>
          </table>
    </div>
    <div class="tab-pane fade" id="nav-teacher" role="tabpanel" aria-labelledby="nav-teacher-tab">
        <table class="table table-hover" id="teacherList">
            <thead>
              <tr>
                  <th scope="col">教師邊號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">主科</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody>
              <tr>
              </tr>
            </tbody>
          </table>
    </div>
    <div class="tab-pane fade" id="nav-student" role="tabpanel" aria-labelledby="nav-student-tab">
        <table class="table table-hover" id="studentList">
            <thead>
              <tr>
                  <th scope="col">學生邊號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody>
              <tr>
              </tr>
            </tbody>
          </table>
    </div>
    <div class="tab-pane fade" id="nav-parents" role="tabpanel" aria-labelledby="nav-parents-tab">
        <table class="table table-hover" id="parentList">
            <thead>
              <tr>
                  <th scope="col">家長邊號</th>
                  <th scope="col">姓名</th>
                  <th scope="col">權限</th>
              </tr> 
            </thead>
            <tbody>
              <tr>
              </tr>
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





//=======================版面動作=======================
  $(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
</script>
</body>
</html>