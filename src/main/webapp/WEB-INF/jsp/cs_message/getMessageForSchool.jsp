<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>

<style>
	.msgtable {
					text-align: center;
					/* border-collapse: collapse; */
					/* border: null; */
					width: 75%;
				}

				thead {
					font-size: 20px;
				}
				.orangebtn{
					/* background-color:  #ff9933; */
					color: #ff9933;
					border:1px solid #ff9933;
					padding: 5px 32px;
					text-align: center;
					text-decoration: none;
					display: inline-block;
					font-size: 16px;
					border-radius: 22px;
					margin-left: 600px;
				}
				.orangebtn:hover{
					background-color: #ff9933;
					color: white;
					text-decoration: none;
					display: inline-block;
				}
</style>


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
		<div align="center">
			<h1> 訊息頁面</h1>
			<br> 訊息查詢 : <input type="text" id="name">
			<button id="btn01">查詢</button>
			<button id="btn02">清除查詢</button>
			<br>
			<br>
			<div id="accordionExample" class="accordion">
			<table class="msgtable  table-hover">
				<thead>
				<tr style="border: null;background-color: #496cad;color: aliceblue;">
					<th>家長名稱 </th>
					<th>標題 </th>
					<th>類型 </th>
					<th>日期 </th>
				</tr>
				</thead>
					<c:forEach var="message" items="${list}">
							<tr>
								<td class="ptName" style="display: none;">${message.parent.id}</td>
								<td class="">${message.parent.name}</td>
									<td><button class="btn btn-link tt" type="button" data-toggle="collapse"
										data-target="#msg${message.id}" aria-expanded="true"
										aria-controls="collapseOne">${message.titleOfMsg}</button></td>
									<td>${message.typeOfMsg}</td>
									<td>${message.createTime}</td>
									<tr>
										<td colspan="4">
											<div style="text-align:left;" id="msg${message.id}" class="card-body collapse "
												aria-labelledby="headingOne" data-parent="#accordionExample">
												<blockquote class="">
													<p>${message.whatToSay}</p>
													<footer class="blockquote-footer">${message.school.name}<cite
															title="Source Title"></cite>
													</footer>
													<button type="button" class="orangebtn" data-toggle="modal" data-target="#replymsg">回覆</button>
													<!-- <a href="${contextRoot}/message/viewmessage?id=${message.id}" class="orangebtn ">
														回覆
														<i class='bx bxs-edit-alt' style="font-size: 30px; color: gray"></i>
													</a> -->
												</blockquote>
											</div>
										</td>
									</tr>
						</c:forEach>
						<div class="modal fade" id="replymsg" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
							  <div class="modal-content modal-xl">
								<div class="modal-header">
								  <h5 class="modal-title" id="exampleModalCenterTitle">回復 :</h5>
								  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								  </button>
								</div>
								<div class="modal-body" id="ckArea">
								
								</div>
							  </div>
							</div>
						  </div>
				</table>
			</div>
		</div>
	</div>
</body>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
	$('.orangebtn').click(function () {
				let msgtitle=$(this).parent().parent().parent().parent().prev().children().find('.tt').text();
				let parentName=$(this).parent().parent().parent().parent().prev().find('.ptName').text();
				// console.log(parentName);
				str='<form action="${pageContext.request.contextPath}/message/addMessageBySchool" method="post"> '+
					'<div style="display:none">'+
					'<input type="text" name="titleOfMsg" value="'+msgtitle+'">'+
					'<input type="text" name="typeOfMsg" value="導師回復"> '+
					'<input type="text" name="parentid" value="'+parentName+'"> '+
					'</div><br><h4></h4><br>'+
					'<textarea id="ckeditorContent" class="form-control" name="article"></textarea> '+
					'<input type="submit" value="送出" id="sendbtn" class="orangebtn" style="margin-top: 10px;"></form>'+
					
					'<button type="button" class="btn btn-dark oneKey">OneKey</button>';
					
				$('#ckArea').html(str);
				// console.log(123);
				CKEDITOR.replace('article');
				CKEDITOR.config.width = 800;
				CKEDITOR.config.height = 300;
			})

//=======================版面動作=======================
$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });			
	
	
	$(document).on('click','.oneKey',function(){
		console.log("3333")
		var line1 = '<p>有陰影的地方必有陽光，轉個視角總有路闖蕩,<br /> 讓微光引路，希望就在前方。</p>有陰影的地方必有陽光，轉個視角總有路闖蕩，<br>';
		var line2 = '<p>由財團法人典美文化基金會主辦的「第五屆紙上躍躍然．典美插畫大賞」，今年以〈轉動希望的曙光〉為主題吸引近300多位來自世界的插畫創作者熱情參與。<br />得獎與優秀作品手繪原稿共計58作品安排11月19日至11月27日在藝異空間展出，喜愛插畫的夥伴請現身支持!!</p>';
		var line3 = '<p>參展者名單 (依姓氏筆劃排序)&nbsp;</p>';
		var line4 = '<p>〔一般組〕</p>';
		var line5 = '<p>朱品璇、朱家萱、沈芳因、林季嬅、林季誼、徐元晶、張芸瑄、郭育喬、陳孟嬉、陳品霖、陳威諺、陳淑娟、陳富容、陳麗芳、黃尹玟、詹政融、薛伊蒨、顧淑梅</p>';
	
		var article = line1 + line2 + line3 + line4 + line5;
		
		CKEDITOR.instances.ckeditorContent.insertHtml(article);	
		
	})

</script>
</html>