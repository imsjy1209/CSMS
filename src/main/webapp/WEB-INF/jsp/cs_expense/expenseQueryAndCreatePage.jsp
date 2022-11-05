<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.team3.CSMS.model.Activity"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="../framePage/sideBarForNotAjax.jsp"></jsp:include>

<style>

.ml6 {
  position: relative;
  font-weight: 900;
  font-size: 3.3em;
}

.ml6 .text-wrapper {
  position: relative;
  display: inline-block;
  padding-top: 0.2em;
  padding-right: 0.05em;
  padding-bottom: 0.1em;
  overflow: hidden;
}

.ml6 .letter {
  display: inline-block;
  line-height: 1em;
}
</style>

<!-- =================for chart.js======================= -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"
	integrity="sha512-ElRFoEQdI5Ht6kZvyzXhYG9NqjtkmlkfYk0wr6wHxU9JEHakS7UJZNeml5ALk+8IKlU6jDgMabC3vkumRokgJA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- =================for char.js======================= -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>

	
<div class="container">
	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-dollar-circle'></i>損益紀錄</h3>
	<br>
	<div class="container">
		<!-- 新增成功訊息 -->
		<div class="ml6" style="color:#E0777D;font-size:20px;margin-left:12%">
			<span class="text-wrapper">
		    	<span class="letters">${message}</span>
		  	</span>
		</div>
		
		<br>
		<!-- 選單按鈕群組 --> 
		<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style="width:395px">
			<!-- 年份/學期選單 -->
	  		<div class="input-group">	    		
				<select id="myYear" class="form-control" style="width:150px">
					<!-- data from script -->
				</select>
				&nbsp;&nbsp;&nbsp;
				<select id="semester" class="form-control" style="width:150px">
					<option value="上學期">上學期</option>
					<option value="下學期">下學期</option>
				</select> 
						
	  		</div>
	  		&nbsp;&nbsp;&nbsp;
	  		<!-- 查詢按鈕 -->
	  		<div class="btn-group mr-2" role="group" aria-label="First group">
	    		<button id='btn01' class="btn btn-info">查詢</button>
	  		</div>
		</div>
	</div><!-- End Of Container -->
		
  	<br>
	<div id="container">
		<div id='dataArea'>
			&nbsp;
			<!-- data from script -->
		</div>
	</div><!-- End Of Container -->	
</div><!-- End Of Container -->
			
</div>
	
<!-- ================for Side Bar==================	 -->
	</div>
</body>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
//=========================================
// 俏皮版新增成功
var textWrapper = document.querySelector('.ml6 .letters');
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline({loop: true})
  .add({
    targets: '.ml6 .letter',
    translateY: ["1.1em", 0],
    translateZ: 0,
    duration: 750,
    delay: (el, i) => 50 * i
  }).add({
    targets: '.ml6',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1000
  });

//=========================================
$(function() {
	$("#datepicker").datepicker({
		appendText : "(西元年-月-日)",
		altField : "#datepicker",
		altFormat : "yy/mm/dd",
		dateFormat : "yy/mm/dd"
	});
});

//=========================================
var myDate = new Date();
var startYear = myDate.getFullYear() - 5;//起始年份 
var endYear = myDate.getFullYear() + 5;//结束年份 
var obj = document.getElementById('myYear')
for (var i = startYear; i <= endYear; i++) {
	obj.options.add(new Option(i, i));
}
obj.options[obj.options.length - 6].selected = 1;
window.onload = function() {
	btn01.onclick = function() {
		var year = document.getElementById("myYear").value;
		var semester = document.getElementById("semester").value;
		var queryString = "year=" + year + "&semester=" + semester;
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "<c:url value='/expense/selectdate' />" + "?"
				+ queryString, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				dataArea.innerHTML = displayData01(xhr.responseText);
				console.log(xhr.responseText);
			}
		}
	}
}
function displayData01(data) {
	document.querySelector("#dataArea").innerHTML = '&nbsp;';
	var year = document.getElementById("myYear").value;
	var semester = document.getElementById("semester").value;
	var htmlSeg = ""
	var expense = JSON.parse(data);
	var obj = expense;
	console.log(expense.income);
	if (expense.id == 0) {
		htmlSeg += "<div style='color:#FF9933;font-weight:700;width:250px'>【尚未建立，請新增資料】</div><br>"
		htmlSeg += "<form action=${pageContext.request.contextPath}/addExpense method=get style='margin-left:10px'>";
		htmlSeg += "<div class='form-group row' style='display:none'>";
		htmlSeg += "<input style='display:none' name='year' value="+year+"class='form-control' id='semester'>";
		htmlSeg += "<input style='display:none' name='semester' value="+semester+" class='form-control' id='semester' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='income' class='col-sm-2 col-form-label'>總共收入：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='income' value="+obj.income+" class='form-control' id='income' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='totalcost' class='col-sm-2 col-form-label'>總共花費：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='totalcost' value="+obj.totalcost+" class='form-control' id='totalcost' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row''>";
		htmlSeg += "<label for='markting' class='col-sm-2 col-form-label'>行銷費用：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='markting' value="+obj.markting+" class='form-control' id='markting' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='personnel' class='col-sm-2 col-form-label'>人事費用：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='personnel' value="+obj.personnel+" class='form-control' id='personnel' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='other' class='col-sm-2 col-form-label'>其他費用：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='other' value="+ obj.other+" class='form-control' id='other' style='width:200px'></div>";
		htmlSeg += "</div><br>";
		htmlSeg += "<div style='margin-left:10%'>";
		htmlSeg += "<input type='submit' class='btn btn-success' value='上傳'>&nbsp;&nbsp;";
		htmlSeg += "<button type='button' class='btn btn-dark oneKey'>OneKey</button>";
		htmlSeg += "</form>"
	} else {
		htmlSeg += "<div style='color:#FF9933;font-weight:700;width:250px;margin-left:10%'>【已存在，可更新資料】</div><br>"
		htmlSeg += "<form action=${pageContext.request.contextPath}/expense/edit method=get style='margin-left:10px'>";
		htmlSeg += "<div class='form-group row' style='display:none'>";
		htmlSeg += "<input style='display:none' name='id' value="+obj.id+">";
		htmlSeg += "<input style='display:none' name='year' value="+year+">";
		htmlSeg += "<input style='display:none' name='semester' value="+semester+">";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='income' class='col-sm-2 col-form-label'>總共收入：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='income' value="+obj.income+" class='form-control' id='income' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='totalcost' class='col-sm-2 col-form-label'>總共花費：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='totalcost' value="+obj.totalcost+" class='form-control' id='totalcost' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row''>";
		htmlSeg += "<label for='markting' class='col-sm-2 col-form-label'>行銷費用：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='markting' value="+obj.markting+" class='form-control' id='markting' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='personnel' class='col-sm-2 col-form-label'>人事費用：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='personnel' value="+obj.personnel+" class='form-control' id='personnel' style='width:200px'></div>";
		htmlSeg += "</div>";
		htmlSeg += "<div class='form-group row'>";
		htmlSeg += "<label for='other' class='col-sm-2 col-form-label'>其他費用：</label>"
		htmlSeg += "<div class='col-sm-10'><input name='other' value="+ obj.other+" class='form-control' id='other' style='width:200px'></div>";
		htmlSeg += "</div><br>";
		htmlSeg += "<div style='margin-left:14%'>";
		htmlSeg += "<input type='submit' class='btn btn-success' value='更新'>"
		htmlSeg += "</div>";
		htmlSeg += "</form>"
	}
	return htmlSeg;
}

//=======================版面動作=======================
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });

	$(document).on('click','.oneKey',function(){
		$('input').eq(2).val('210000')
		$('input').eq(3).val('155550')
		$('input').eq(4).val('67000')
		$('input').eq(5).val('50000')
		$('input').eq(6).val('35000')
		
		
	})

</script>

</html>

	
<!-- <div class="container"> -->
<!-- 	<h3 class='main-title'><i style='font-size:36px;' class='bx bxs-dollar-circle'></i>損益紀錄</h3> -->
	
<!-- 	<div class="container" align="center">	 -->
<!--		<div>${message}</div>-->
<!-- 		<select id="myYear"> -->
<!-- 		</select> -->
		 
<!-- 		<select id="semester"> -->
<!-- 			<option value="上學期">上學期</option> -->
<!-- 			<option value="下學期">下學期</option> -->
<!-- 		</select>  -->
<!-- 		<br><br> -->
<!-- 		<button class="btn btn-info" id='btn01'>查詢</button> -->
<!-- 		<br><br> -->
<!-- 		<div style="clear: both;" id='dataArea'>&nbsp;</div> -->
<!-- 	</div> -->