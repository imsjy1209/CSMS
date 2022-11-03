<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>

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
	<br>
	<div class="container">
		<div>
		<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-message-square-edit' ></i>新增公告</h3>
		<br>
		<form action="${contextRoot}/postCreate" method="post">
			<div class="form-group row">
				<div class="col-sm-3">
					<div class="form-group">
						<label for="exampleInputEmail1">公告標題：</label> 
						<input type="text" class="form-control" name="topic" size="100" maxlength="30" required/>
					</div>
				</div>
			
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputEmail1">公告對象：</label>
					<select class="cg custom-select my-1 mr-sm-2" name="userType">
						<option value="1" selected>校方</option>
						<option value="2">所有人</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="exampleFormControlTextarea1">詳細內容：</label>
				<textarea id="desc" class="form-control" name="article"></textarea>
			</div>
			<div style="margin-left:27%">		
				<button type="submit" class="btn btn-success">確認送出</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-secondary" id="oneKey">一鍵輸入</button>
			</div>
		</form>
	</div>
</div>

	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 【Sweet Alert】 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js" 
	integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" 
	crossorigin="anonymous"></script>
<script>


CKEDITOR.replace('article');
CKEDITOR.config.width = 800;
CKEDITOR.config.height = 300;

$('.showModalEye').click(function(){
	var articleHtml = $(this).parent().siblings('.articleTd').html();
// 	console.log(articleHtml)
	$('.modal-body').html(articleHtml);
	
	var updateTimeText = $(this).parent().siblings('.updateTimeTd').text();
	$('.modal-footer').html(updateTimeText);
	
	var topicText = $(this).parent().siblings('.topicTd').text();
	$('.modal-title').html(topicText);
	
})

// 一鍵輸入
$(document).on("click","#oneKey", function() {
	// 輸入標題
	$("input").eq(0).val("【111學年(下)高中開學前停課表】");
	// 輸入內文
	var line1 = '<p><span style="font-size:14px">開學前一週為了讓同學們收心做準備</span></p>';
	var line2 = '<p><span style="font-size:14px">故各科<span class="marker">停課時間</span>如下圖 👇</span></p>';
	var line3 = '<p><span style="font-size:14px">同學們不管是</span></p>';
	var line4 = '<p><span style="font-size:14px">沒寫完的作業&nbsp;📝</span></p>';
	var line5 = '<p><span style="font-size:14px">沒補完的課程 📚</span></p>';
	var line6 = '<p><span style="font-size:14px">沒背完的單字&nbsp;🆎</span></p>';
	var line7 = '<p><span style="font-size:14px">趕快把握這週時間補齊吧‼ 💪&nbsp;</span></p>';
	var line8 = '<p><span style="font-size:14px">也別忘了調整作息為了開學做準備~~&nbsp;🌞</span></p>';
	var line9 = '<p><a href="http://sheimon.com.tw/wp-content/uploads/111%E6%9A%91%E7%A7%8B%E9%96%8B%E5%AD%B8%E5%89%8D%E5%81%9C%E8%AA%B2%E8%A1%A8-01-scaled.jpg"><img alt="" src="http://sheimon.com.tw/wp-content/uploads/111%E6%9A%91%E7%A7%8B%E9%96%8B%E5%AD%B8%E5%89%8D%E5%81%9C%E8%AA%B2%E8%A1%A8-01-scaled.jpg" style="height:419px; width:800px" /></a></p>';
	
	var article = line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9;
	
	CKEDITOR.instances.desc.insertHtml(article);
})


//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });


</script>


</html>