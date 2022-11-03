<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/nav_parent.jsp"></jsp:include>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>
<form action="message/addMessageByParent" method="post">

			<h5>發送對象</h5>
			<select id="school" name="school"></select>
			<p>標題<br><input type="text" name="topic"></p>
			<p>類型<br><input type="text" name="type"></p>

	內容:<br><textarea class="form-control" name="article"></textarea>
	<input type="submit" value="送出">



</form>
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
		CKEDITOR.config.width = 800;
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
</script>

</html>