<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<%-- <jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include> --%>

<c:choose>
  <c:when test="${users.groups.id == 2}">
   <!-- SCHOOL NAVBAR -->
<jsp:include page="../framePage/sideBarForNotAjaxForQueen.jsp"></jsp:include>
  </c:when>
  
  <c:when test="${users.groups.id == 1}">
   <!-- ALL NAVBAR -->
<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>
  </c:when>
 </c:choose>

	<div class="container">
	<h3 class='main-title'><i style='font-size:36px;'class='bx bxs-calendar-event' ></i>公告管理</h3>
	<br><br>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" style="width:200%">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>	
<div>	
			<table class="table table-borded" style="text-align:center">
				<tr>
					<th class="table-info" scope="col">文號</th>
					<th class="table-info" scope="col">標題</th>
					<th class="table-info" scope="col">發布時間</th>
					<th class="table-info" scope="col">修改時間</th>
					<th class="table-info" scope="col">公告對象</th>
					<th class="table-info" scope="col">狀態</th>
					<th class="table-info" scope="col">查看</th>
					<th class="table-info" scope="col">更新</th>
				</tr>
					 <c:forEach var="post" items="${list}">
							<tr class="accordion-toggle">
								<td style="vertical-align: middle;">${post.id}</td>	
								<td class='topicTd' style="vertical-align: middle;">${post.topic}</td>
								<td class='articleTd' style='display:none;'>${post.article}</td>
								<td class='updateTimeTd' style='display:none;'></td>
								<td style="vertical-align: middle;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.create_at}" /></td>
								<td style="vertical-align: middle;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.update_at}" /></td>
								<c:choose>
										<c:when test="${post.userType == 1}">
											<td style="vertical-align: middle;">校方</td>
										</c:when>
										<c:when test="${post.userType ==2}">
											<td style="vertical-align: middle;">所有人</td>
										</c:when>
									</c:choose>
								<c:choose>
										<c:when test="${post.isDelete == 0}">
											<td><button type="button" class="btn btn-primary">上架中</button></td>
										</c:when>
										<c:when test="${post.isDelete ==1}">
											<td><button type="button" class="btn btn-danger">下架中</button></td>
										</c:when>
									</c:choose>
								<td>
									<a class="showModalEye" data-toggle="modal" data-placement="top" data-target="#exampleModalCenter">
										<i class='bx bxs-show' style="font-size: 30px; color: gray; vertical-align: middle;"></i>
									</a>
								</td>
								<td align="center"><a
									href="${contextRoot}/updatePost/${post.id}"><i
									class='bx bxs-edit-alt' style="font-size: 30px; color: gray; vertical-align: middle;"></i></a>

						</c:forEach>
			</table>
			
		</div>
	</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
console.log($(".UpdateTimeTd").text())
$('.showModalEye').click(function(){
	var articleHtml = $(this).parent().siblings('.articleTd').html();
 	//console.log(articleHtml)
	$('.modal-body').html(articleHtml)
	
	var updateTimeText = $(this).parent().siblings('.updateTimeTd').text();
	$('.modal-footer').html(updateTimeText)
	
	var topicText = $(this).parent().siblings('.topicTd').text();
	$('.modal-title').html(topicText)
	
})

//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });


</script>


</html>