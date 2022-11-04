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

<script>



</script>

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

	<div class="container">
		<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-universal-access'></i>建立活動</h3>
		
		<form action="${pageContext.request.contextPath}/createActivityWithCkeditor.controller" method="post">
			<div class="form-group row">
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputEmail1">活動名稱：</label>
					<input type="text" class="form-control" name="name" style="width:90%" size="50" maxlength="50" required/>
				</div>
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputPassword1">地點：</label>
					<input type="text" class="form-control" name="place" style="width:90%" size="50" maxlength="50" required/>
				</div>
				<div class="col-sm-3">
					<label class="my-1 mr-2" for="exampleInputPassword1">日期：</label>
					<input type="text" class="form-control" name="date" style="width:90%" id="datepicker" size="50" required/>	
				</div>
			</div>	
			<div class="form-group">
				<label for="exampleFormControlTextarea1">詳細內容：</label>
				<textarea id="text123" class="form-control" name="contentDetail"/></textarea>
			</div>
			<div style="margin-left:27%">
				<button type="submit" class="btn btn-primary">Submit</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-dark oneKey">OneKey</button>
			</div>
		</form>	
	</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>

$(function() {
	$("#datepicker").datepicker({
		appendText : "(西元年-月-日)",
		altField : "#datepicker",
		altFormat : "yy-mm-dd",
		dateFormat : "yy-mm-dd"
	});
});

CKEDITOR.replace('contentDetail');
CKEDITOR.config.width = 800;
CKEDITOR.config.height = 300;


//=======================版面動作=======================
	$(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
          $('#sidebar').toggleClass('active');
      });
  });
  
  $(document).on('click','.oneKey',function(){	  
	  console.log($('input'))
	  $('input').eq(0).val('文藝之旅')
		$('input').eq(1).val('松菸')
		$('input').eq(2).val('2022-11-06')
		var line1 = '<p>有陰影的地方必有陽光，轉個視角總有路闖蕩,<br /> 讓微光引路，希望就在前方。</p>有陰影的地方必有陽光，轉個視角總有路闖蕩，<br>';
		var line2 = '<p>由財團法人典美文化基金會主辦的「第五屆紙上躍躍然．典美插畫大賞」，今年以〈轉動希望的曙光〉為主題吸引近300多位來自世界的插畫創作者熱情參與。<br />得獎與優秀作品手繪原稿共計58作品安排11月19日至11月27日在藝異空間展出，喜愛插畫的夥伴請現身支持!!</p>';
		var line3 = '<p>參展者名單 (依姓氏筆劃排序)&nbsp;</p>';
		var line4 = '<p>〔一般組〕</p>';
		var line5 = '<p>朱品璇、朱家萱、沈芳因、林季嬅、林季誼、徐元晶、張芸瑄、郭育喬、陳孟嬉、陳品霖、陳威諺、陳淑娟、陳富容、陳麗芳、黃尹玟、詹政融、薛伊蒨、顧淑梅</p>';
		var line6 = '<p>&nbsp;</p>';
		var line7 = '<p>〔學生組〕</p>';
		var line8 = '<p>尤靖瑜、吳懿芸、李幸臻、楊璿</p>';
		var line9 = '<p>【展覽資訊】</p>';
		var line10 = '<p>展覽日期：11/19(六) ~11/27(日)</p>';
		var line11 = '<p>展覽時間：10:00-17:00 免費參觀</p>';
		var line12 = '<p>展覽地點：藝異空間&nbsp;</p>';
		var line13 = '<p>【展期活動資訊】免費入場，因現場座位有限，敬請提前報名</p>';
		var line14 = '<p>11/19(六) 14:00-16:00 頒獎典禮暨得獎者分享會<br />  &nbsp;<br />  11/20(日) 14:00-15:00 藝術家 徐至宏/ 插畫的藝想世界：怪獸與牠們主人&nbsp;</p>  ';
		var article = line1 + line2 + line3 + line4 + line5 + line6 + line7 + line8 + line9+line10+line11+line12+line13+line14;
		
		CKEDITOR.instances.text123.insertHtml(article);
		  
  })

  
  

  
  
  
  </script>

</html>