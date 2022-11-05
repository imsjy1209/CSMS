<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/nav_parent.jsp"></jsp:include>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>
<style>
	.msgCard{
		margin-left: 100px;
		position:absolute;
		justify-content: center;
	}
	.msg{
		margin-top: 50px;
	}
</style>
<div class="container msg">
<div class="card" style="width: 900px;">
	<div class="card-header">
		Messages
	</div>
	<form action="message/addMessageByParent" method="post">
		<ul class="list-group list-group-flush">
		<li class="list-group-item"><label class="col-sm-2 col-form-label">發送對象 : </label><select id="school" class="form-control" name="school"></select></li>
		<li class="list-group-item"><label class="col-sm-2 col-form-label">標題 :</label><input type="text" class="form-control oneKeyTopic" name="topic"></p></li>
		<li class="list-group-item"><label class="col-sm-2 col-form-label">類型 :</label><input type="text" class="form-control oneKeyType" name="type"></li>
		<li class="list-group-item" >內容:<br><textarea style="margin-left: 50px;" id="ckeditorContent" class="form-control" name="article"></textarea>
			<input type="submit" class="form-control" style="margin-top: 10px;width: 50px; margin-left: 775px;" value="送出">&nbsp;&nbsp;<button type="button" class="btn btn-dark oneKey">OneKey</button></li>
		</ul>
	</form>
  </div>
</div>
</body>
<script type="text/javascript">
	window.onload = function() {
		var selectElement = document.getElementById('school'); // 取出select標籤
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/message/getteacher' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			var name = JSON.parse(xhr.responseText);
			if (xhr.readyState == 4 && xhr.status == 200) {
				for (var i = 0; i < name.length; i++) {
					console.log(name[i]);
					var option = new Option(name[i], name[i]);
					selectElement.options[selectElement.options.length] = option;
				}
			}
		}
	}
</script>
<script>
		CKEDITOR.replace('article');
		CKEDITOR.config.width = 858;
		CKEDITOR.config.height = 300;
		
	</script>
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
	$(document).ready(function() {
		$('#sidebarCollapse').on('click', function() {
			$('#sidebar').toggleClass('active');
		});
	});
	//==========================end of bar=============================
		
		$(document).on('click','.oneKey',function(){
			// console.log("3333")

		$('.oneKeyTopic').val('想要幫國文班的王彤穎請假')
		$('.oneKeyType').val('請假')
			var line1 = '<p>曾沛湘導師你好，<br/>因為家裡有人確診的關係，家裡的王彤穎為密切接觸者<br/></p>';
			var line2 = '<p>所以想要幫他請假，也煩請導師幫忙通知班上的其他同學，謝謝。</p>'
			var article = line1 + line2;
			
			CKEDITOR.instances.ckeditorContent.insertHtml(article);	
			
		})
		
		
</script>

</html>