<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- 【Sweet Alert】 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.32/dist/sweetalert2.all.min.js" integrity="sha256-bdzpgx4rIB/e4FJRNveqYCLZWEgcKyal3W9CQHNiZ3k=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>

<jsp:include page="../framePage/sideBar.jsp"></jsp:include>


<!-- ====更改商品資訊的Modal==== -->
<!-- ====更改商品資訊的Modal==== -->
<!-- ====更改商品資訊的Modal==== -->
<div class="modal fade bd-example-modal-lg" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      
        <h5 class="modal-title" id="exampleModalCenterTitle">Course Edit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        </button>
      </div>
      <div class="modal-body">
        
        
        <form class="row g-3 form1" method="POST" enctype="multipart/form-data">
		<input class='cIdForUpdate' type=hidden name="id" value=""/>
		<div class="col-md-4">
			<label for="courseYear" class="form-label">課程年度</label> <input
				type="text" name="courseYear" class="form-control formYear" id="courseYear"
				value="">
		</div>

		<div class="col-md-4">
			<label for="courseSemester" class="form-label">課程學期</label>
            <input
				type="text" name="courseSemester" class="form-control formSem" id="courseSemester"
				value="">
            <!-- <select name="courseSemester" id="">
                <option value="上">上</option>
                <option value="下">下</option>
            </select> -->
           
		</div>
		
		<div class="col-md-4">
			<label for="courseCategory" class="form-label">課程類別</label>
            <input
            type="text" name="courseCategory" class="form-control formCat" id="courseCategory"
            value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseSubject" class="form-label">課程科目</label> <input
				type="text" name="courseSubject" class="form-control formSub" id="courseSubject"
				 value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseGrade" class="form-label">適合學級</label> <input
				type="text" name="courseGrade" class="form-control formGra" id="courseGrade"
				 value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseClass" class="form-label">適合年級</label> <input
				type="text" name="courseClass" class="form-control formCla" id="courseClass"
				 value="">
		</div>
		
        <div class="col-md-4">
			<label for="coursePrice" class="form-label">課程售價</label> <input
				type="text" name="coursePrice" class="form-control formPri" id="coursePrice"
				 value="">
		</div>
		
        <div class="col-md-8">
			<label for="courseTeachTime" class="form-label">授課星期</label> <input
				type="text" name="courseTeachTime" class="form-control formTT" id="courseTeachTime"
				 value="">
		</div>
		
		<div class="col-md-2">
			<label for="courseMember" class="form-label">上限人數</label> <input
				type="text" name="courseMember" class="form-control formMem" id="courseMember"
				 value="">
		</div>
		
        <div class="col-md-5">
			<label for="startDate" class="form-label">開課日期</label>
			<input type="text" name="startDate" class="form-control formSD datepicker" id="startDate" value="">
<!-- 			<input type="text" class="form-control" name="date" id="date1" style='width:70%'> -->
		</div>
		
        <div class="col-md-5">
			<label for="endDate" class="form-label">結課日期</label>
			<input type="text" name="endDate" class="form-control formED datepicker" id="endDate" value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseOnOff" class="form-label">上架(0/1)</label>
            <input
				type="text" name="courseOnOff" class="form-control formOnOff" id="courseOnOff"
				 value="">
            <!-- <select name="courseCategory" id="">
                <option value="1">上架</option>
                <option value="0">下架</option>
            </select> -->
		</div>



		<div class="input-group mb-13">
			<label class="input-group-text" for="coursePicForUpload">Upload</label>
			<input type="file" name="coursePicForUpload" class="form-control" id="coursePicForUpload" accept="image/gif, image/jpeg, image/png">
		</div>
		
		<input style='display:none;' name='coursePic' id='coursePic' type='text' value=''/>
		
		<div class="col-md-6">
			Picture Preview <img width="200px" class='cPicEdit' id="preview_imgInp" src="" />
		</div>

		<div class="col-12">
			<button type="button" class="updateCourseAjax btn btn-primary">Update</button>
		</div>
	</form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!-- ====End of 更改商品資訊的Modal==== -->
<!-- ====End of 更改商品資訊的Modal==== -->
<!-- ====End of 更改商品資訊的Modal==== -->


<!-- ====新增商品資訊的Modal==== -->
<!-- ====新增商品資訊的Modal==== -->
<!-- ====新增商品資訊的Modal==== -->
<div class="modal fade bd-example-modal-lg" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
      
        <h5 class="modal-title" id="exampleModalCenterTitle2">Course Edit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        </button>
      </div>
      <div class="modal-body">
        
        
        <form class="row g-3 form1" method="POST" enctype="multipart/form-data">
		<input class='cIdForUpdate' type=hidden name="id" value=""/>
		<div class="col-md-4">
			<label for="courseYear2" class="form-label">課程年度</label> <input
				type="text" name="courseYear" class="form-control formYear2" id="courseYear2"
				value="">
		</div>

		<div class="col-md-4">
			<label for="courseSemester2" class="form-label">課程學期</label>
            <input
				type="text" name="courseSemester" class="form-control formSem2" id="courseSemester2"
				value="">
            <!-- <select name="courseSemester" id="">
                <option value="上">上</option>
                <option value="下">下</option>
            </select> -->
           
		</div>
		
		<div class="col-md-4">
			<label for="courseCategory2" class="form-label">課程類別</label>
            <input
            type="text" name="courseCategory" class="form-control formCat2" id="courseCategory2"
            value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseSubject2" class="form-label">課程科目</label> <input
				type="text" name="courseSubject" class="form-control formSub2" id="courseSubject2"
				 value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseGrade" class="form-label">適合學級</label> <input
				type="text" name="courseGrade" class="form-control formGra" id="courseGrade"
				 value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseClass2" class="form-label">適合年級</label> <input
				type="text" name="courseClass" class="form-control formCla2" id="courseClass2"
				 value="">
		</div>
		
        <div class="col-md-4">
			<label for="coursePrice2" class="form-label">課程售價</label> <input
				type="text" name="coursePrice" class="form-control formPri2" id="coursePrice2"
				 value="">
		</div>
		
        <div class="col-md-8">
			<label for="courseTeachTime2" class="form-label">授課星期</label> <input
				type="text" name="courseTeachTime" class="form-control formTT2" id="courseTeachTime2"
				 value="">
		</div>
		
		<div class="col-md-2">
			<label for="courseMember2" class="form-label">上限人數</label> <input
				type="text" name="courseMember" class="form-control formMem2" id="courseMember2"
				 value="">
		</div>
		
        <div class="col-md-5">
			<label for="startDate2" class="form-label">開課日期</label>
			<input type="text" name="startDate" class="form-control formSD2 datepicker" id="startDate2" value="">
<!-- 			<input type="text" class="form-control" name="date" id="date1" style='width:70%'> -->
		</div>
		
        <div class="col-md-5">
			<label for="endDate2" class="form-label">結課日期</label>
			<input type="text" name="endDate" class="form-control formED2 datepicker" id="endDate2" value="">
		</div>
		
        <div class="col-md-4">
			<label for="courseOnOff2" class="form-label">上架(0/1)</label>
            <input
				type="text" name="courseOnOff" class="form-control formOnOff2" id="courseOnOff2"
				 value="">
		</div>

		<div class="input-group mb-13">
			<label class="input-group-text" for="coursePicForUpload">Upload</label>
			<input type="file" name="coursePicForUpload" class="form-control" id="coursePicForUpload2" accept="image/gif, image/jpeg, image/png">
		</div>
		
		<input style='display:none;' name='coursePic' id='coursePic2' type='text' value=''/>
		
		<div class="col-md-6">
			Picture Preview <img width="200px" class='cPicEdit2' id="preview_imgInp2" src="" />
		</div>

		<div class="col-12">
			<button type="button" class="createCourseAjax btn btn-primary">Update</button>
			<button type="button" class="quickCreate btn btn-primary">一鍵輸入</button>
		</div>
	</form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!-- ====End of 新增商品資訊的Modal==== -->
<!-- ====End of 新增商品資訊的Modal==== -->
<!-- ====End of 新增商品資訊的Modal==== -->

		
<!-- 	<div class="container">		 -->
		<h3 class='main-title'>Main Info</h3>
			<div id="forSelect">
			
			</div>
	
			<div id="forBtnOption">
			
			</div>
            <div class="bigDiv">
 				<div class="col-xs-6">
           			<table id="table" class="table table-striped mt-5">
			
					<thead id="thead-title">
				
					</thead>

					<tbody id="content-data">
			
					</tbody>
			
			
					</table>
				</div>
 
 
   			</div>         
<!--        </div> -->
       
<!--  ===============for side bar============  -->
       </div>
    </nav>

</body>    


<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    

<script type="text/javascript">

$(function() {
	$(".datepicker").datepicker({
// 		appendText : "(西元年-月-日)",
		altField : "#datepicker",
		altFormat : "yy-mm-dd",
		dateFormat : "yy-mm-dd"
	});
});
  
    
//======================Course Create Page=======================
	$('#courseCreate-Btn').click(function(){
		showCourseCreatePage();
	})
	
	function showCourseCreatePage(){
	
	$('#exampleModalCenter2').modal('show');
	
	//====一鍵輸入課程商品資訊=========
	$('.quickCreate').click(function(){
		
		
		
	})
	
	
	//==========將圖片轉換成base64===============
	var data_64;
	$('#coursePicForUpload2').change(function(e){
		
		readURL(this);
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview_imgInp2").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	
	var file=e.target.files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onloadend=function(){
	//轉換成Base64
		data_64 = reader.result.substring(reader.result.indexOf(",")+1);
		console.log(data_64)
		
		$('#coursePic2').val(data_64); //==把base64塞在一個Input
		
		}
	})	
//========Ajax更新Form表單====================
$(document).on('click','.createCourseAjax',function(e){
		var coursePicForUpdateVal = $('#coursePic2').val()
		
// 		if(coursePicForUpdateVal==""){
// 			var oriPicVal = $('.cPicEdit').attr('src').substr(23);
// 			$('#coursePic').val(oriPicVal);
// 		}
		
		e.preventDefault();
	    var form = $('form')[0];
	    var formData = new FormData(form);
	    $.ajax({
	        url:'http://localhost:8081/CSMS/createCourseDataAjax.controller',
	        type : "POST",
	        data : formData,
	        contentType: false,
	        cache: false,
	        processData: false,
	        success : function(data) 
	        {
	        	
	    		//===新增成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已成功更新商品資訊'
				})
				//===End of 更改成功alert======
					
	            console.log(data);
	        },error: function(data) 
	        {
	            console.log('無法送出');
	        }
	    })
	
	})
	
	}//=======End Of Course Create Page========

		
//======================Course=======================		
	$('#course-Btn').click(function(){
		showAllCourse();
		//=========前置作業========
			$('.OrderListBtnGroup').remove();
			$('.classListSelDiv').remove();
			$('.ClassStudentListBtnGroup').remove();
			$('.main-title').text('課程商品-Course')
	})
		function showAllCourse(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/AllCourseBackAjax.page' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				var content0 = "";
				content0 += 
				"<tr>" +
				"<td>年度</td>"+
				"<td>學期</td>"+
				"<td>分類</td>"+
				"<td>學級</td>"+
				"<td>年級</td>"+
				"<td>科目</td>"+
				"<td>價錢</td>"+
				"<td>授課時間</td>"+
				"<td>人數</td>"+
				"<td>起始</td>"+
				"<td>結業</td>"+
				"<td>上/下架</td>"+
				"<td>圖片</td>"+
				"<td>編輯</td>"+
				"</tr>"; 
				
				var content = "";
				var courseList = JSON.parse(xhr.responseText);
				console.log(courseList);
				for(var i=0; i < courseList.length; i++){
					content += 
					"<tr>" +
						"<td id='course-id' hidden='hidden'>" + courseList[i].id + "</td>" +
						"<td class='courseYearInfo'>" + courseList[i].courseYear + "</td>" +
						"<td class='courseSemInfo'>" + courseList[i].courseSemester + "</td>" +
						"<td class='courseCategoryInfo'>" + courseList[i].courseCategory + "</td>" +
						"<td class='courseGradeInfo'>" + courseList[i].courseGrade + "</td>" +
						"<td class='courseClassInfo'>" + courseList[i].courseClass + "年級</td>" +
						"<td class='courseSubjectInfo'>" + courseList[i].courseSubject + "</td>" +
	    	       		"<td class='coursePriceInfo'>" + courseList[i].coursePrice + "</td>" +
	    	       		
	    	       		"<td class='courseTeachTimeBoxGroup'><p class='course-info'><button class='teachBtn'>一</button><button class='teachBtn'>二</button><button class='teachBtn'>三</button class='teachBtn'><button class='teachBtn'>四</button><button class='teachBtn'>五</button><button class='teachBtn'>六</button><button class='teachBtn'>日</button></p></td>" +
	    	       		
	    	       		"<td style='display:none;' class='courseTeachTimeInfo'>" + courseList[i].courseTeachTime + "</td>" +
	    	       		
	    	       		"<td class='courseMemberInfo'>" + courseList[i].courseMember + "</td>" +
	    	       		"<td class='startDateInfo'>" + courseList[i].startDate + "</td>" +
	    	       		"<td class='endDateInfo'>" + courseList[i].endDate + "</td>" +
	    	       		"<td><button class='con'>ON</button><button class='coff'>OFF</button></td>" +
	    	       		"<td class='cPic-td'>" + "<img alt='I am Pic' width='50px' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" + "</td>" +
	    	       		"<td><a style='font-size:36px;' class='courseEditBtn bx bxs-edit bx-tada bx-rotate-90' ></a></td>" +
						"<td class='onOrOff-td'>"+ "<input class='onOrOff' type='hidden' value='" + courseList[i].courseOnOff + "'/>" + "</td>" +
			        "</tr>";
				}
				var info0 = document.getElementById("thead-title");
				info0.innerHTML = content0;
				
				var info = document.getElementById("content-data");
				info.innerHTML = content;
				
				//===上課日期的燈控=========
				var ctt = $('.courseTeachTimeInfo');
//	 			console.log(ctt.eq(0).val());
				var cttlength = ctt.length;
				
				//第幾個courseTeachTime
				for(var j=0; j < cttlength; j++){
					var cttValue = ctt.eq(j).text();
					
					//第j個courseTeachTime的第z個星期是否有上課
					for(var z=0;z<7;z++){
					var onOrOff = cttValue.substr(z,1);
						if(onOrOff==1){
							ctt.eq(j).siblings('.courseTeachTimeBoxGroup').find('button').eq(z).addClass('active');
						}
					}
				}
		
				//=========上下架的燈控=========
				var onlist = $(".con");
				var offlist = $(".coff")
				var conlist = $(".onOrOff")
				for(var i=0;i<conlist.length;i++){
					if(conlist.eq(i).val()==1){
						onlist.eq(i).addClass('active');
					}
					else{
						offlist.eq(i).addClass('active');
					}
				}
				
				//=========授課日期的變更===========
				$('.teachBtn').click(function(){
				var thisBtnClass = $(this).attr('class')
				var nowId = $(this).parent().parent().siblings('#course-id').text();
				var newTT="";
				
				if(thisBtnClass=='teachBtn active'){
					$(this).removeClass('active')
				}
				
				else{
					$(this).addClass('active')
				}
				
				var allBtn = $(this).parent().find('button')
				allBtn.each(function(){
					var eachTeachTimeBtnClass = $(this).attr('class')
					if(eachTeachTimeBtnClass=='teachBtn active')
						newTT+="1";
					else
						newTT+="0";
				})
					
				console.log(newTT)
				console.log(nowId)
				
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateCourseTeachTime.controller?id=" + nowId + "&teachTime=" + newTT + "' />", true);
				xhr.send();
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
				
				})
				
				
				
				//=========上下架的變更=========
				$(".con").click(function(){
				var onOrOffVal = $(this).parent().siblings('.onOrOff-td').children().val();
				var nowId = $(this).parent().siblings("#course-id").text();
				if(onOrOffVal==0){
					console.log("change value to 1")
					$(this).addClass('active');
					$(this).next().removeClass('active');
					$(this).parent().siblings('.onOrOff-td').children().val(1);
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateCourseDataOnOrOff.controller?id=" + nowId + "&onOrOff=1' />", true);
					xhr.send();
					
					//===更改成功alert======
					const Toast = Swal.mixin({
				  	toast: true,
				  	position: 'top-end',
				  	showConfirmButton: false,
				  	timer: 1000,
				  	timerProgressBar: true,
				  	didOpen: (toast) => {
				    toast.addEventListener('mouseenter', Swal.stopTimer)
				    toast.addEventListener('mouseleave', Swal.resumeTimer)
				 	 }
					})

					Toast.fire({
					  icon: 'success',
				 	 title: '已將此商品上架'
					})
					//===End of 更改成功alert======
					
				}
				
				})
				$(".coff").click(function(){
				var onOrOffVal =$(this).parent().siblings('.onOrOff-td').children().val();
				var nowId = $(this).parent().siblings("#course-id").text();
				if(onOrOffVal==1){
					console.log("change value to 0")
					$(this).addClass('active');
					$(this).prev().removeClass('active');
					$(this).parent().siblings('.onOrOff-td').children().val(0);
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateCourseDataOnOrOff.controller?id=" + nowId + "&onOrOff=0' />", true);
					xhr.send();
					
					//===更改成功alert======
					const Toast = Swal.mixin({
				  	toast: true,
				  	position: 'top-end',
				  	showConfirmButton: false,
				  	timer: 1000,
				  	timerProgressBar: true,
				  	didOpen: (toast) => {
				    toast.addEventListener('mouseenter', Swal.stopTimer)
				    toast.addEventListener('mouseleave', Swal.resumeTimer)
				 	 }
					})

					Toast.fire({
					  icon: 'success',
				 	 title: '已將此商品下架'
					})
					//===End of 更改成功alert======
					
					
				}
				})
				
				//=========多選變色功能=========
				$('input[type="checkbox"]').click(function() {
					console.log('checkbox', $(this));
					let bgColor = 'none';
					if ($(this).prop('checked')) {
						bgColor = 'lightblue';
					}
					$(this).closest('tr').css('background', bgColor)
			})
		}
	}
		
}

	//==========將圖片轉換成base64===============
	var data_64;
	$('#coursePicForUpload').change(function(e){
		
		readURL(this);
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preview_imgInp").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	
	var file=e.target.files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onloadend=function(){
	//轉換成Base64
		data_64 = reader.result.substring(reader.result.indexOf(",")+1);
		console.log(data_64)
		
		$('#coursePic').val(data_64); //==把base64塞在一個Input
		
		}
	})	
//========Ajax更新Form表單====================
$(document).on('click','.updateCourseAjax',function(e){
		var coursePicForUpdateVal = $('#coursePic').val()
		
		if(coursePicForUpdateVal==""){
			var oriPicVal = $('.cPicEdit').attr('src').substr(23);
			$('#coursePic').val(oriPicVal);
		}
		
		e.preventDefault();
	    var form = $('form')[0];
	    var formData = new FormData(form);
	    $.ajax({
	        url:'http://localhost:8081/CSMS/updateCourseDataAjax.controller',
	        type : "POST",
	        data : formData,
	        contentType: false,
	        cache: false,
	        processData: false,
	        success : function(data) 
	        {
	        	
	    		//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已成功更新商品資訊'
				})
				//===End of 更改成功alert======
					
	            console.log(data);
	        },error: function(data) 
	        {
	            console.log('無法送出');
	        }
	    })
	
	})



//========================ClassList==================
	
	$('#classList-Btn').click(function(){
		findAllClassListGo()
		//=========前置作業========
		$('.OrderListBtnGroup').remove();
		$('.ClassStudentListBtnGroup').remove();
		$('.main-title').text('班級資訊-ClassList')
		

	})
	
	
	function findAllClassListGo(){
		
		//======Create ClassCode Select====================	
		var contentSel="";		
			contentSel += "<div class='classListSelDiv form-group row'>" +
							"<div class='col-sm-2 courseGrade'>" +
								"<label class='my-1 mr-2' for='inlineFormCustomSelectPref'>班級代碼</label>"+
	  								"<select class='classCodeSel custom-select my-1 mr-sm-2' id='inlineFormCustomSelectPref'>"+

	  								"</select>" +
							"</div>";
		$('#forSelect').html(contentSel);
				//======End Of Create ClassCode Select==============		
	
	
	var xhr = new XMLHttpRequest();
	var xhrRoom = new XMLHttpRequest();
	var xhrTeacher = new XMLHttpRequest();
	var xhrSchool = new XMLHttpRequest();
	
	xhrRoom.open("GET", "<c:url value='/findAllRoomAjax.controller' />", true);
	xhrRoom.send();
	
	xhrTeacher.open("GET", "<c:url value='/findAllTeacherAjax.controller' />", true);
	xhrTeacher.send();
	
	xhrSchool.open("GET", "<c:url value='/findAllSchoolAjax.controller' />", true);
	xhrSchool.send();
	
	xhr.open("GET", "<c:url value='/findAllClassListAjax.controller' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200 &&
			xhrRoom.readyState == 4 && xhrRoom.status == 200 &&
			xhrTeacher.readyState == 4 && xhrTeacher.status == 200 &&
			xhrSchool.readyState == 4 && xhrSchool.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>班導</td>"+
			"<td>行政</td>"+
			"<td>教室</td>"+
			"<td>分類</td>"+
			"<td>課程</td>"+
			"<td>人數</td>"+
			"<td>起始</td>"+
			"<td>結業</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var classListList = JSON.parse(xhr.responseText);
			var roomList = JSON.parse(xhrRoom.responseText);
			var teacherList = JSON.parse(xhrTeacher.responseText);
			var schoolList = JSON.parse(xhrSchool.responseText);
			
			var contentClassCodeOpt = "<option selected value='0'>ClassCode Choose...</option>";
			var content = "";
			for(var i=0; i < classListList.length; i++){
				
			contentClassCodeOpt +=
				"<option value='"+Number(i+1)+"'>" + classListList[i].classCode + "</option>";
				
				content += 
				"<td class='classListId'>" + classListList[i].id + "</td>" +
				"<td><a class='class-studentList' href='####'>" + classListList[i].classCode + "</a></td>" +

				"<td>" + "<select class='teacherDataSelect'>" 
				for(var j=0;j<teacherList.length;j++){
					if(classListList[i].teacher.id==teacherList[j].id){	
	    		content += 	"<option value='"+ teacherList[j].id +"' selected>"+teacherList[j].expertise + "-"+teacherList[j].name+"</option>";
					}
					else{
						content += 	"<option value='"+ teacherList[j].id +"'>"+teacherList[j].expertise + "-"+ teacherList[j].name+"</option>";
						}
					}
				
	    		content +=  "</select>"+
    	    	"</td>" +
    	    	"<td>" + "<select class='schoolDataSelect'>";
				for(var j=0;j<schoolList.length;j++){
					if(classListList[i].school.id==schoolList[j].id){	
	    		content += 	"<option value='"+ schoolList[j].id +"' selected>"+schoolList[j].name+"</option>";
	    					}
					else{
						content += 	"<option value='"+ schoolList[j].id +"'>"+schoolList[j].name+"</option>";
					}
				}
	    		content +=  "</select>"+
    	    	"</td>" +
				
				//====教室資訊Select Option======
				"<td>" + 
				"<select class='roomDataSelect'>";
				for(var j=0;j<roomList.length;j++){
					if(classListList[i].room.id==roomList[j].id){
	content += 	"<option value='"+ roomList[j].id +"' selected>"+roomList[j].roomName+"</option>";
					}
					else{
						content += 	"<option value='"+ roomList[j].id +"'>"+roomList[j].roomName+"</option>";	
					}
				}
	content +=  "</select>"+
				"</td>" +
				
				
    	       	"<td>" + classListList[i].course.courseCategory + "班"+"</td>" +
    	       	"<td>" + classListList[i].course.courseSubject+"-" +
    	       			 classListList[i].course.courseGrade +
    	       			 classListList[i].course.courseClass + "年級</td>" +
    	       	"<td class='classMember'>" + classListList[i].classMember + "</td>" +
    	       	"<td>" + classListList[i].course.startDate + "</td>" +
    	       	"<td>" + classListList[i].course.endDate + "</td>" +
    	       	"<td class='test1'><i style='font-size:36px;' class='classList-edit-btn bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('.classCodeSel').html(contentClassCodeOpt);
			
			
			//======各項下拉式改值==========	
			$('.roomDataSelect').change(function(){
				var roomId = $(this).find('option:selected').val();
				var classListId = $(this).parent().siblings('.classListId').text();
				console.log(classListId)
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClssListRoomDataAjax.controller?classListId=" + classListId + "&roomId=" + roomId +"' />", true);
				xhr.send();
				
				console.log('change Success')
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
				
			})
			
			$('.teacherDataSelect').change(function(){
				var teacherId = $(this).find('option:selected').val();
				var classListId = $(this).parent().siblings('.classListId').text();
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClssListTeacherDataAjax.controller?classListId=" + classListId + "&teacherId=" + teacherId +"' />", true);
				xhr.send();
				console.log('change Success')
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
			})
			
			$('.schoolDataSelect').change(function(){
				var schoolId = $(this).find('option:selected').val();
				var classListId = $(this).parent().siblings('.classListId').text();
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClssListSchoolDataAjax.controller?classListId=" + classListId + "&schoolId=" + schoolId +"' />", true);
				xhr.send();
				console.log('change Success')
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
			})
			

			//=====編輯按鈕功能=============	
			$('.classList-edit-btn').click(function(){
				var classM = $(this).parent().siblings('.classMember')
				var clMem = classM.text();
				console.log(classM)
				
				contentEdit = "<input class='clMemEdit' type='text' size='1' value='"+ clMem + "'>";
				classM.html(contentEdit)
				
				$('.clMemEdit').blur(function(){
					var clMemVal = $(this).val();
					var clId = $(this).parent().siblings('.classListId').text();
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateClssListMemberDataAjax.controller?clMemVal=" + clMemVal +"&clId=" + clId + "' />", true);
					xhr.send();
					
					var cslNewMem = $(this).parent();
					$(this).remove();
					cslNewMem.text(clMemVal);
					
					//===更改成功alert======
					const Toast = Swal.mixin({
				  	toast: true,
				  	position: 'top-end',
				  	showConfirmButton: false,
				  	timer: 1000,
				  	timerProgressBar: true,
				  	didOpen: (toast) => {
				    toast.addEventListener('mouseenter', Swal.stopTimer)
				    toast.addEventListener('mouseleave', Swal.resumeTimer)
				 	 }
					})

					Toast.fire({
					  icon: 'success',
				 	 title: '已更改成功'
					})
					//===End of 更改成功alert======
					
				})
				
			})
			

		}
	}
	}
	
	
	//========ClassList中的studentList Delete Btn function=========	
	$(document).on('click','.csl-del-btn',function(){
		
		var cslId = $(this).parent().siblings('.csl-id').text();
		var stuId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).closest('.foldStudentInfo').prev().find('.course-id').text();

		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/delClassStudentListAndUpdateOrderDetailByClassListIdAndStudentId.controller?courseId=" + courseId +"&stuId=" + stuId + "&cslId=" + cslId + "' />", true);
		xhr.send();
		
		$(this).closest('tr').remove();
		
	})
	
//========================ClassRecord==================
	
	$('#classRecord-Btn').click(function(){
		
		//=========前置作業========
		$('.OrderListBtnGroup').remove();
		$('.classListSelDiv').remove();
		$('.ClassStudentListBtnGroup').remove();
		$('.main-title').text('上課紀錄-ClassRecord')
		
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllClassRecordAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>多選</td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>班導</td>"+
			"<td>教室</td>"+
			"<td>開始時間</td>"+
			"<td>結束時間</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var classRecordList = JSON.parse(xhr.responseText);
			for(var i=0; i < classRecordList.length; i++){
				content += 
				"<tr><td><input type='checkbox'/></td>" +	
				"<td>" + classRecordList[i].id + "</td>" +
				"<td>" + classRecordList[i].classList.classCode + "</td>" +
				"<td>" + classRecordList[i].teacher.name + "</td>" +
				"<td>" + classRecordList[i].room.roomName + "</td>" +
    	       	"<td>" + classRecordList[i].startTime + "</td>" +
    	       	"<td>" + classRecordList[i].endTime + "</td>" +
    	       	"<td class='test1'><a type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})
	

	
//========================OrderList==================
	
	$('#orderList-Btn').click(function(){
		
		//======前置作業==========
		$('.classListSelDiv').remove();
		$('.ClassStudentListBtnGroup').remove();
		$('.main-title').text('訂單總表-OrderList')

		
		
		//======Create Btn Option====================	
		var contentBtnOpt="";		
		contentBtnOpt += 
					  '<div class="OrderListBtnGroup btn-group" role="group" aria-label="Basic example">' +
		 				 '<button type="button" class="OLDescOrAsc btn btn-outline-success">訂單時間降冪</button>' +
		 				 '<button type="button" class="OLDescOrAsc btn btn-outline-success">訂單時間升冪</button>' +
		 				 '<button type="button" class="OLDescOrAsc btn btn-outline-info">訂單ID降冪</button>' +
		 				 '<button type="button" class="OLDescOrAsc btn btn-outline-info">訂單ID升冪</button>' +
		 				
					  '</div>';
	$('#forBtnOption').html(contentBtnOpt);
		//======End Of Create Btn Option====================
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllOrderListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<th></th>"+
			"<th>訂單ID</th>"+
			"<th>訂購學生</th>"+
			"<th>總金額</th>"+
			"<th>付款方式</th>"+
			"<th>結帳時間</th>"+
			"<th>Function</th>"+
			"</tr>";
			
			var content = "";
			var orderListList = JSON.parse(xhr.responseText);
			
			for(var i=0; i < orderListList.length; i++){
				content += 
				"<tr data-toggle='collapse' data-target='#demo" +i+"' class='accordion-toggle'>" +	
				"<td><button class='btn btn-default btn-xs'><i class='bx bx-happy-heart-eyes'></i></span></button></td>"+
				"<td class='ol-id'>" + orderListList[i].id + "</td>" +
				"<td>" + orderListList[i].student.name + "</td>" +
				"<td>" + orderListList[i].amount + "</td>" +
				"<td>" + orderListList[i].payment + "</td>" +
    	       	"<td>" + orderListList[i].orderDate + "</td>";
    	       	
      content +=
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='ol-del-btn btn btn-danger'>Delete</a></td>"+
           		"</tr>";
           		
     
	       	content +=  "<tr>" +
	       				"<td colspan='12' class='hiddenRow'>" +
	       				"<div class='accordian-body collapse' id='demo"+i+"'>" +
	       				"<table class='table table-bordered'>" +
	       				"<thead class='thead-dark'>" +
	       				
	       				"<tr class='info'>" +
	       				"<th></th>" +
	       				"<th>明細ID</th>" +
	       				"<th>訂購人</th>" +
	       				"<th>學級</th>" +
	       				"<th>科目</th>" +
	       				"<th>年級</th>" +
	       				"<th>金額</th>" +
	       				"<th>購買狀態</th>" +
	       				"<th>排課狀態</th>" +
	       				
	       				"</tr></thead>"+
	       				"<tbody>";
	       				
	      for(var j=0; j < orderListList[i].orderDetails.length; j++){	
	    	  content +=
	       				"<tr data-toggle='collapse' class='accordion-toggle'>"+
	       				"<td></td>" +
	       				"<td class='oDId-id'>" + orderListList[i].orderDetails[j].id + "</td>" +
	       				"<td class='student-id' style='display:none;'>" + orderListList[i].orderDetails[j].student.id + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].student.name + "</td>" +
	       				"<td class='course-id' style='display:none;'>" + orderListList[i].orderDetails[j].course.id + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseGrade + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseSubject+ "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.courseClass + "</td>" +
	       				"<td>" + orderListList[i].orderDetails[j].course.coursePrice + "</td>" +
	       				"<td><span class='orderWaitText'>未結帳</span><span class='orderNoPText'>未購買</span><span class='orderFinText'>已購買</span><span class='order-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].confirmOrder +"</span></td>" +
	    				"<td><span class='oDonText'>已排課</span><span class='oDoffText'>未排課</span><span class='arrange-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].arrangeClassList +"</span></td>" +
	       				"</tr>";
	       	}	
	      content +="</tbody></table></div></td></tr>"
	      
	      
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			
			//判斷Text要顯示已排課or Not
			$('.arrange-info').each(function(){
				var arrangeInfo = $(this).text();
				if(arrangeInfo==1){
					$(this).prev().attr('hidden','hidden')
				}else{
					$(this).prev().prev().attr('hidden','hidden')
				}
				
			})
			
			//判斷Text要顯示哪種購買狀態
			$('.order-info').each(function(){
				var orderInfo = $(this).text();
				console.log(orderInfo)
				if(orderInfo==0){
					$(this).prev().prev().attr('hidden','hidden')
					$(this).prev().attr('hidden','hidden')
				}
				else if(orderInfo==1){
					$(this).prev().prev().prev().attr('hidden','hidden')
					$(this).prev().attr('hidden','hidden')
				}
				else{
					$(this).prev().prev().prev().attr('hidden','hidden')
					$(this).prev().prev().attr('hidden','hidden')
				}
			})
			
			
			
			
			//刪除orderList
			$('.ol-del-btn').click(function(){
				if(window.confirm('確定刪除嗎?')){
					var orderListId = $(this).parent().siblings('.ol-id').text();
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/deleteOrderListByIdAjax.controller?orderListId="+orderListId+"' />", true);
					xhr.send();
					$(this).parent().parent().remove();
					
					//===更改成功alert======
					const Toast = Swal.mixin({
				  	toast: true,
				  	position: 'top-end',
				  	showConfirmButton: false,
				  	timer: 1000,
				  	timerProgressBar: true,
				  	didOpen: (toast) => {
				    toast.addEventListener('mouseenter', Swal.stopTimer)
				    toast.addEventListener('mouseleave', Swal.resumeTimer)
				 	 }
					})

					Toast.fire({
					  icon: 'success',
				 	 title: '已刪除成功'
					})
					//===End of 更改成功alert======
					
					}
					else{
						console.log('nothing happened')
					}
			})
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	
	
	
	//=====OrderListBtn升降冪按鈕功能===========
	$('.OLDescOrAsc').click(function(){
		if($(this).text()=='訂單時間降冪'){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/findAllByOrderByOrderDateDesc.controller' />", true);
			xhr.send();
		}
		else if($(this).text()=='訂單時間升冪'){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/findAllByOrderByOrderDateAsc.controller' />", true);
			xhr.send();
		}
		
		else if($(this).text()=='訂單ID降冪'){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/findAllByOrderByIdDesc.controller' />", true);
			xhr.send();
			
		}
		else if($(this).text()=='訂單ID升冪'){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/findAllByOrderByIdAsc.controller' />", true);
			xhr.send();
			
		}
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				var content0 = "";
				content0 += 
				"<tr>" +
				"<th></th>"+
				"<th>訂單ID</th>"+
				"<th>訂購學生</th>"+
				"<th>總金額</th>"+
				"<th>付款方式</th>"+
				"<th>結帳時間</th>"+
				"<th>Function</th>"+
				"</tr>";
				
				var content = "";
				var orderListList = JSON.parse(xhr.responseText);
				
				for(var i=0; i < orderListList.length; i++){
					content += 
					"<tr data-toggle='collapse' data-target='#demo" +i+"' class='accordion-toggle'>" +	
					"<td><button class='btn btn-default btn-xs'><i class='bx bx-happy-heart-eyes'></i></span></button></td>"+
					"<td class='ol-id'>" + orderListList[i].id + "</td>" +
					"<td>" + orderListList[i].student.name + "</td>" +
					"<td>" + orderListList[i].amount + "</td>" +
					"<td>" + orderListList[i].payment + "</td>" +
	    	       	"<td>" + orderListList[i].orderDate + "</td>";
	    	       	
	      content +=
	    	       	"<td class=' test2'><a id='delete-btn' type='button' class='ol-del-btn btn btn-danger'>Delete</a></td>"+
	           		"</tr>";
	           		
	     
		       	content +=  "<tr>" +
		       				"<td colspan='12' class='hiddenRow'>" +
		       				"<div class='accordian-body collapse' id='demo"+i+"'>" +
		       				"<table class='table table-bordered'>" +
		       				"<thead class='thead-dark'>" +
		       				
		       				"<tr class='info'>" +
		       				"<th></th>" +
		       				"<th>明細ID</th>" +
		       				"<th>訂購人</th>" +
		       				"<th>學級</th>" +
		       				"<th>科目</th>" +
		       				"<th>年級</th>" +
		       				"<th>金額</th>" +
		       				"<th>購買狀態</th>" +
		       				"<th>排課狀態</th>" +
		       				"</tr></thead>"+
		       				"<tbody>";
		       				
		      for(var j=0; j < orderListList[i].orderDetails.length; j++){	
		    	  content +=
		       				"<tr data-toggle='collapse' class='accordion-toggle'>"+
		       				"<td></td>" +
		       				"<td class='oDId-id'>" + orderListList[i].orderDetails[j].id + "</td>" +
		       				"<td class='student-id' style='display:none;'>" + orderListList[i].orderDetails[j].student.id + "</td>" +
		       				"<td>" + orderListList[i].orderDetails[j].student.name + "</td>" +
		       				"<td class='course-id' style='display:none;'>" + orderListList[i].orderDetails[j].course.id + "</td>" +
		       				"<td>" + orderListList[i].orderDetails[j].course.courseGrade + "</td>" +
		       				"<td>" + orderListList[i].orderDetails[j].course.courseSubject+ "</td>" +
		       				"<td>" + orderListList[i].orderDetails[j].course.courseClass + "</td>" +
		       				"<td>" + orderListList[i].orderDetails[j].course.coursePrice + "</td>" +
		       				"<td><span class='orderWaitText'>未結帳</span><span class='orderNoPText'>未購買</span><span class='orderFinText'>已購買</span><span class='order-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].confirmOrder +"</span></td>" +
		    				"<td><span class='oDonText'>已排課</span><span class='oDoffText'>未排課</span><span class='arrange-info' hidden='hidden'>"+ orderListList[i].orderDetails[j].arrangeClassList +"</span></td>" +
		       				"</tr>";
		       	}	
		      content +="</tbody></table></div></td></tr>"
		      
		      
				}
				var info0 = document.getElementById("thead-title");
				info0.innerHTML = content0;
				
				var info = document.getElementById("content-data");
				info.innerHTML = content;
				
				
				//判斷Text要顯示已排課or Not
				$('.arrange-info').each(function(){
					var arrangeInfo = $(this).text();
					if(arrangeInfo==1){
						$(this).prev().attr('hidden','hidden')
					}else{
						$(this).prev().prev().attr('hidden','hidden')
					}
					
				})
				
				//判斷Text要顯示哪種購買狀態
				$('.order-info').each(function(){
					var orderInfo = $(this).text();
					console.log(orderInfo)
					if(orderInfo==0){
						$(this).prev().prev().attr('hidden','hidden')
						$(this).prev().attr('hidden','hidden')
					}
					else if(orderInfo==1){
						$(this).prev().prev().prev().attr('hidden','hidden')
						$(this).prev().attr('hidden','hidden')
					}
					else{
						$(this).prev().prev().prev().attr('hidden','hidden')
						$(this).prev().prev().attr('hidden','hidden')
					}
				})
				
				
				
				
				//刪除orderList
				$('.ol-del-btn').click(function(){
					if(window.confirm('確定刪除嗎?')){
						var orderListId = $(this).parent().siblings('.ol-id').text();
						var xhr = new XMLHttpRequest();
						xhr.open("GET", "<c:url value='/deleteOrderListByIdAjax.controller?orderListId="+orderListId+"' />", true);
						xhr.send();
						$(this).parent().remove();
						
						//===更改成功alert======
						const Toast = Swal.mixin({
					  	toast: true,
					  	position: 'top-end',
					  	showConfirmButton: false,
					  	timer: 1000,
					  	timerProgressBar: true,
					  	didOpen: (toast) => {
					    toast.addEventListener('mouseenter', Swal.stopTimer)
					    toast.addEventListener('mouseleave', Swal.resumeTimer)
					 	 }
						})

						Toast.fire({
						  icon: 'success',
					 	 title: '已刪除成功'
						})
						//===End of 更改成功alert======
						}
						else{
							console.log('nothing happened')
						}
				})
				
				$('input[type="checkbox"]').click(function() {
					console.log('checkbox', $(this));
					let bgColor = 'none';
					if ($(this).prop('checked')) {
						bgColor = 'lightblue';
					}
					$(this).closest('tr').css('background', bgColor)
				})
			}
		}
		
		
		
	})//End Of OrderList OrderDateBtn Desc Or Asc
	
	
	})//End Of OrderListLoading		
	
//========================OrderDetail==================
	
	$('#orderDetail-Btn').click(function(){
		
		//=========前置作業========
		$('.OrderListBtnGroup').remove();
		$('.classListSelDiv').remove();
		$('.ClassStudentListBtnGroup').remove();
		$('.main-title').text('購買/排課狀態-OrderDetail')
		
		
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllOrderDetail.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<th></th>"+
			"<th>所屬學校</th>"+
			"<th>學生名稱</th>"+
			"<th>性別</th>"+
			"<th>方案資訊</th>"+
			"<th>價錢</th>"+
			"<th>購買狀態</th>"+
			"<th>排課狀態</th>"+
			"<th>Function</th>"+
			"</tr>";
			
			var content = "";
			var orderDetailList = JSON.parse(xhr.responseText);
			
			console.log(orderDetailList);
			
			for(var i=0; i < orderDetailList.length; i++){
				content += 
				"<td></td>" +	
				"<td class='oDId-id' style='display:none;'>" + orderDetailList[i].id + "</td>" +
				"<td class='student-id' style='display:none;'>" + orderDetailList[i].student.id + "</td>" +
				"<td>" + orderDetailList[i].student.schoolName + "</td>" +
				"<td>" + orderDetailList[i].student.name + "</td>" +
				"<td>" + orderDetailList[i].student.gender + "</td>" +
				"<td class='course-id' style='display:none;'>" + orderDetailList[i].course.id + "</td>" +
				"<td>"+ orderDetailList[i].course.courseCategory +"班-"+ orderDetailList[i].course.courseGrade +orderDetailList[i].course.courseClass +"年級-"+ orderDetailList[i].course.courseSubject + "</td>" +
				"<td>"+ orderDetailList[i].course.coursePrice + "</td>" +
				"<td><button class='orderWait'>未結帳</button><button class='orderNoP'>未購買</button><button class='orderFin'>已購買</button><span class='order-info' hidden='hidden'>"+ orderDetailList[i].confirmOrder +"</span></td>" +
				"<td><button class='oDon'>已排課</button><button class='oDoff'>未排課</button><span class='arrange-info' hidden='hidden'>"+ orderDetailList[i].arrangeClassList +"</span></td>" +
    	       	"<td class='oD-delete-td'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			//將是否已排課轉換成按鈕
			$('.arrange-info').each(function(){
				var arrangeInfo = $(this).text();
				if(arrangeInfo==1){
					$(this).prev().prev().addClass('active')
				}else{
					$(this).prev().addClass('active')
				}
				
			})
			
			//將購買狀態轉換成按鈕
			$('.order-info').each(function(){
				var orderInfo = $(this).text();
				console.log(orderInfo)
				if(orderInfo==0){
					$(this).prev().prev().prev().addClass('active')
				}
				else if(orderInfo==1){
					$(this).prev().prev().addClass('active')
				}
				else{
					$(this).prev().addClass('active')
				}
			})
			
	//針對已購買課程的OrderDetail，透過CourseId找到對應的ClassListId並新增到ClassStudentList中
	$('.oDon').click(function(){
		
		if($(this).next().next().text()==0){
		$(this).addClass('active');
		$(this).next().removeClass('active');
		var studentId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).parent().siblings('.course-id').text();
		var orderId = $(this).parent().siblings('.oDId-id').text();
		
		$(this).siblings('.arrange-info').text(1);
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findClassStudentListByCourseIdAndClassListIdAjax.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
		xhr.send();
		
		//===更改成功alert======
		const Toast = Swal.mixin({
	  	toast: true,
	  	position: 'top-end',
	  	showConfirmButton: false,
	  	timer: 1000,
	  	timerProgressBar: true,
	  	didOpen: (toast) => {
	    toast.addEventListener('mouseenter', Swal.stopTimer)
	    toast.addEventListener('mouseleave', Swal.resumeTimer)
	 	 }
		})

		Toast.fire({
		  icon: 'success',
	 	 title: '已排班成功'
		})
		//===End of 更改成功alert======
		
		}else{
			console.log('nothing happened');
		}
				
	})
	
	$('.oDoff').click(function(){
		if($(this).next().text()==1){
			$(this).addClass('active');
			$(this).prev().removeClass('active');
		var studentId = $(this).parent().siblings('.student-id').text();
		var courseId = $(this).parent().siblings('.course-id').text();
		var orderId = $(this).parent().siblings('.oDId-id').text();
		
		$(this).siblings('.arrange-info').text(0);
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/findClassStudentListByClassListIdAndStudentId.controller?studentId=" + studentId + "&courseId=" + courseId + "&orderId=" + orderId +"' />", true);
		xhr.send();
		
		//===更改成功alert======
		const Toast = Swal.mixin({
	  	toast: true,
	  	position: 'top-end',
	  	showConfirmButton: false,
	  	timer: 1000,
	  	timerProgressBar: true,
	  	didOpen: (toast) => {
	    toast.addEventListener('mouseenter', Swal.stopTimer)
	    toast.addEventListener('mouseleave', Swal.resumeTimer)
	 	 }
		})

		Toast.fire({
		  icon: 'success',
	 	 title: '移除排班成功'
		})
		//===End of 更改成功alert======
		
		}else{
			console.log('nothing happened')
			}
		
	})
			
			//刪除按鈕的功能
			$('.oD-delete-td').click(function(){
			var oDidDel = $(this).siblings('.oDId-id').text();
			console.log(oDidDel);
			if(window.confirm('確定刪除嗎?')){
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/deleteOrderDetailByIdAjax.controller?id=" + oDidDel + "' />", true);
				xhr.send();
				$(this).parent().remove();
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已刪除成功'
				})
				//===End of 更改成功alert======
				
		 	} 
		 	else{
		 		console.log("nothing happened")
		 	}
			})
			
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})		
	
//========================ClassStudentList==================
	
	$('#classStudentList-Btn').click(function(){
		//=========前置作業========
		$('.OrderListBtnGroup').remove();
		$('.classListSelDiv').remove();
		$('.main-title').text('學員對應班級清單-ClassStudentList')
		
		
		//======Create Btn Option====================	
		var contentBtnOpt="";		
		contentBtnOpt += 
					  '<div class="ClassStudentListBtnGroup btn-group" role="group" aria-label="Basic example">' +
		 				 '<button type="button" class="CLLDescOrAsc btn btn-outline-info">ID降冪</button>' +
		 				 '<button type="button" class="CLLDescOrAsc btn btn-outline-info">ID升冪</button>' +
		 				
					  '</div>';
	$('#forBtnOption').html(contentBtnOpt);
		//======End Of Create Btn Option====================
		
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllClassStudentListAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>學生名稱</td>"+
			"<td>座號</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var content = "";
			var cslList = JSON.parse(xhr.responseText);
			
			console.log(cslList);
			
			for(var i=0; i < cslList.length; i++){
				content += 
				"<tr>"+
				"<td class='cslId-td'>" + cslList[i].id + "</td>" +
				"<td>" + cslList[i].classList.classCode + "</td>" +
				"<td>" + cslList[i].student.name + "</td>" +
				"<td class='cslStudentNo'>" + cslList[i].studentNo + "</td>" +
				"<td><i style='font-size:36px;' class='bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +	
    	       	"<td class='cslDel-td'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('.cslDel-td').click(function(){
				if(window.confirm('確定刪除嗎?')){
				var cslId = $(this).siblings('.cslId-td').text();
				console.log(cslId);
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/deleteClassStudentListByEntityAjax.controller?cslId=" + cslId +"' />", true);
				xhr.send();
				$(this).parent().remove();
				}
				else{
					console.log('nothing happened')
				}
			})
	
		}
	}
	
	
	
	//=====	ClassStudentListBtn升降冪按鈕功能===========
	$('.CLLDescOrAsc').click(function(){
		if($(this).text()=='ID降冪'){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/findAllByOrderByIdDescAjax.controller' />", true);
			xhr.send();
			
		}
		else if($(this).text()=='ID升冪'){
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/findAllByOrderByIdAscAjax.controller' />", true);
			xhr.send();
			
		}
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				var content0 = "";
				content0 += 
				"<tr>" +
				"<td>id</td>"+
				"<td>課程代碼</td>"+
				"<td>學生名稱</td>"+
				"<td>座號</td>"+
				"<td>Function</td>"+
				"<td>Function</td>"+
				"</tr>";
				
				var content = "";
				var cslList = JSON.parse(xhr.responseText);
				
				console.log(cslList);
				
				for(var i=0; i < cslList.length; i++){
					content += 
					"<tr>"+
					"<td class='cslId-td'>" + cslList[i].id + "</td>" +
					"<td>" + cslList[i].classList.classCode + "</td>" +
					"<td>" + cslList[i].student.name + "</td>" +
					"<td class='cslStudentNo'>" + cslList[i].studentNo + "</td>" +
					"<td><i style='font-size:36px;' class='bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +	
	    	       	"<td class='cslDel-td'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
	           		"</tr>";
				}
				var info0 = document.getElementById("thead-title");
				info0.innerHTML = content0;
				
				var info = document.getElementById("content-data");
				info.innerHTML = content;
				
				$('.cslDel-td').click(function(){
					if(window.confirm('確定刪除嗎?')){
					var cslId = $(this).siblings('.cslId-td').text();
					console.log(cslId);
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/deleteClassStudentListByEntityAjax.controller?cslId=" + cslId +"' />", true);
					xhr.send();
					$(this).parent().remove();
					}
					else{
						console.log('nothing happened')
					}
				})
					
			}
		}
	})
	
	
	
	//========座號修改=================
		$(document).on('click','.bxs-edit',function(){
			console.log($(this));
			var oriStuNo = $(this).parent().siblings('.cslStudentNo').text();
			contentEdit = "<input class='stuNoEdit' type='text' size='3' value='"+oriStuNo+ "'>";
			$(this).parent().siblings('.cslStudentNo').html(contentEdit);
			
			$('.stuNoEdit').blur(function(){
				var newStuNo = $(this).val();
				var cslId= $(this).parent().siblings('.cslId-td').text();
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClassStudentListByIdAjax.controller?cslId=" + cslId +"&newStuNo=" + newStuNo + "' />", true);
				xhr.send();
				var cslStudentNoTd = $(this).parent();
				$(this).remove();
				cslStudentNoTd.text(newStuNo);
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更新'
				})
				//===End of 更改成功alert======
			})
		})
	
	})	

//========================Room==================
	
	$('#room-Btn').click(function(){
		//=========前置作業========
		$('.OrderListBtnGroup').remove();
		$('.classListSelDiv').remove();
		$('.ClassStudentListBtnGroup').remove();
		$('.main-title').text('教室清單-Room')
		
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/findAllRoomAjax.controller' />", true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			
			var content0 = "";
			content0 += 
			"<tr>" +
			"<th></th>"+
			"<th>id</th>"+
			"<th>教室名稱</th>"+
			"<th>教室容納人數</th>"+
			"<th>教室照片</th>"+
			"<th>Function</th>"+
			"<th>Function</th>"+
			"</tr>";
			
			var content = "";
			var roomList = JSON.parse(xhr.responseText);
			console.log(roomList);
			for(var i=0; i < roomList.length; i++){
				content += 
				"<tr>"+
				"<td></td>"+
				"<td>" + roomList[i].id + "</td>" +
				"<td>" + roomList[i].roomName + "</td>" +
				"<td>" + roomList[i].roomSize + "</td>" +
    	    	"<td>" + "<img alt='img' width='100px' src='${contextRoot}/AllRoomPic/" + roomList[i].id +"' class='room-img'>" + "</td>" +
    	       	"<td class='test1'><a href='${contextRoot}/roomData/edit?id=" + roomList[i].id + "' type='button' class='btn btn-warning'>Edit</a></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
			}
			var info0 = document.getElementById("thead-title");
			info0.innerHTML = content0;
			
			var info = document.getElementById("content-data");
			info.innerHTML = content;
			
			$('input[type="checkbox"]').click(function() {
				console.log('checkbox', $(this));
				let bgColor = 'none';
				if ($(this).prop('checked')) {
					bgColor = 'lightblue';
				}
				$(this).closest('tr').css('background', bgColor)
			})
		}
	}
	})
	
	
	
//=======================版面動作=======================
	
	$(document).ready(function () {
        $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
        });
    });
	
//====================ClassList ClassCode Sel===============
	$(document).on('change','.classCodeSel',function(){
		console.log('qqqqqqqqqqqqq')
		var classListId = $(this).val();
		console.log(classListId)
		
		if(classListId==0){
			findAllClassListGo()
		}
		
// 		var xhrRoom = new XMLHttpRequest();
// 		var xhrTeacher = new XMLHttpRequest();
// 		var xhrSchool = new XMLHttpRequest();
		var xhrClassList = new XMLHttpRequest();

		xhrClassList.onreadystatechange = function() {
		if (xhrClassList.readyState == 4 && xhrClassList.status == 200
// 				&&
// 			xhrRoom.readyState == 4 && xhrRoom.status == 200 &&
// 			xhrTeacher.readyState == 4 && xhrTeacher.status == 200 &&
// 			xhrSchool.readyState == 4 && xhrSchool.status == 200
			) {
			var content0 = "";
			content0 += 
			"<tr>" +
			"<td></td>"+
			"<td>id</td>"+
			"<td>課程代碼</td>"+
			"<td>教師</td>"+
			"<td>班導</td>"+
			"<td>教室</td>"+
			"<td>分類</td>"+
			"<td>課程</td>"+
			"<td>人數</td>"+
			"<td>起始</td>"+
			"<td>結業</td>"+
			"<td>Function</td>"+
			"<td>Function</td>"+
			"</tr>";
			
			var oneClassList = JSON.parse(xhrClassList.responseText);
// 			var roomList = JSON.parse(xhrRoom.responseText);
// 			var teacherList = JSON.parse(xhrTeacher.responseText);
// 			var schoolList = JSON.parse(xhrSchool.responseText);
			
			var content = "";
			content += 
	
				"<tr class='accordion-toggle'>" +	
				"<td><button data-toggle='collapse' data-target='#demo' class='btn btn-default btn-xs'><i class='bx bx-happy-heart-eyes'></i></button></td>"+
    	       	"<td class='classListId'>" + oneClassList.id + "</td>" +
    	       	"<td>" + oneClassList.classCode+ "</td>" +
    	       	
    	       	"<td>" + oneClassList.teacher.expertise+"-"+ oneClassList.teacher.name+ "</td>" +
//     	    	"<td>" + "<select class='teacherDataSelect'>";
// 				for(var j=0;j<teacherList.length;j++){
// 					if(oneClassList.teacher.id==teacherList[j].id){	
// 	    		content += 	"<option value='"+ teacherList[j].id +"' selected>"+teacherList[j].name+"</option>";
// 					}else{
// 						content +="<option value='"+ teacherList[j].id +"'>"+teacherList[j].name+"</option>";
// 					}
// 					}
// 	    		content +=  "</select>"+
//     	    	"</td>" +
    	    	
    	    	
    	    	"<td>" + oneClassList.school.name+ "</td>" +
//     	    	"<td>" + "<select class='schoolDataSelect'>";
// 				for(var j=0;j<schoolList.length;j++){
// 					if(oneClassList.school.id==schoolList[j].id){	
// 	    		content += 	"<option value='"+ schoolList[j].id +"' selected>"+schoolList[j].name+"</option>";
// 					}		
// 					else{
// 						content +="<option value='"+ schoolList[j].id +">"+schoolList[j].name+"</option>";
// 					}
// 					}
// 	    		content +=  "</select>"+
//     	    	"</td>" +
    	    	
    	    	
    	    	"<td>" + oneClassList.room.roomName+ "</td>" +
//     	    	"<td>" + "<select class='roomDataSelect'>";
//     	    	for(var j=0;j<roomList.length;j++){
//     	    		if(oneClassList.room.id==roomList[j].id){	
//     	    		content +="<option value='"+ roomList[j].id +"' selected>"+roomList[j].roomName+"</option>";
//     	    		}		
//     	    		else{
//     	    			content += 	"<option value='"+ roomList[j].id +"'>"+roomList[j].roomName+"</option>";
//     	    		}
//     	    		}
//     	    	content +=  "</select>"+
//     	    	"</td>" +
    	    	
    	    	"<td class='course-id' style='display:none'>" + oneClassList.course.id +"</td>" +
    	    	"<td>" + oneClassList.course.courseCategory +"班"+"</td>" +
    	       	"<td>" + oneClassList.course.courseSubject +
    	       			oneClassList.course.courseGrade +
    	       			oneClassList.course.courseClass + "年級</td>" +
    	       	"<td class='classMember'>" + oneClassList.classMember + "</td>" +
    	       	"<td>" + oneClassList.course.startDate + "</td>" +
    	       	"<td>" + oneClassList.course.endDate + "</td>" +
    	       	"<td class='test1'><i style='font-size:36px;' class='classList-edit-btn bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +
    	       	"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
           		"</tr>";
           		
           		
     		//========摺疊起來的學生資料=====================
	       	content +=  "<tr class='foldStudentInfo'>" +
	       				"<td colspan='12' class='hiddenRow'>" +
	       				"<div class='accordian-body collapse' id='demo'>" +
	       				"<table class='table table-bordered'>" +
	       				
	       				"<thead class='thead-dark'>" +
	       				"<tr class='info'>" +
	       				"<th></th>" +
	       				"<th>課程代碼</th>" +
	       				"<th>學生名稱</th>" +
	       				"<th>座號</th>" +
	       				"<th>性別</th>" +
	       				"<th>所屬學校</th>" +
	       				"<th>年級</th>" +
	       				"<th>function</th>" +
	       				"<th>function</th>" +
	       				"</tr></thead>"+
	       				
	       				"<tbody>";
	       				
	      for(var i=0; i < oneClassList.classStudentLists.length; i++){	
	    	  content +=
	       				"<tr data-toggle='collapse' class='accordion-toggle'>"+
	       				"<td></td>" +
	       				"<td class='csl-id' style='display:none'>" + oneClassList.classStudentLists[i].id + "</td>" +
	       				"<td class='oDId-id'>" + oneClassList.classCode + "</td>" +
	       				"<td class='student-id' style='display:none'>" + oneClassList.classStudentLists[i].student.id + "</td>" +
	       				"<td>" + oneClassList.classStudentLists[i].student.name + "</td>" +
	       				"<td class='student-no'>" + oneClassList.classStudentLists[i].studentNo+ "</td>" +
	       				"<td>" + oneClassList.classStudentLists[i].student.gender + "</td>" +
	       				"<td class='course-id'>" +oneClassList.classStudentLists[i].student.schoolName + "</td>" +
	       				"<td>" + oneClassList.classStudentLists[i].student.grade + "</td>" +
	       			  	"<td class='test1'><i style='font-size:36px;' class='csl-edit-btn bx bxs-edit bx-tada bx-rotate-90' ></i></td>" +
	      	       		"<td class=' test2'><i style='font-size:36px;' class='csl-del-btn bx bxs-trash' ></i></td>"+
	       				"</tr>";
	       	}	
	      content +="</tbody></table></div></td></tr>"
           		
           		var info0 = document.getElementById("thead-title");
    			info0.innerHTML = content0;
    			
    			var info = document.getElementById("content-data");
    			info.innerHTML = content;
    			
		}// End Of Finish Ajax
    			//=========各項下拉式改值============
    			$('.roomDataSelect').change(function(){
    				var roomId = $(this).find('option:selected').val();
    				var classListId = $(this).parent().siblings('.classListId').text();
    				console.log(classListId)
    				var xhr = new XMLHttpRequest();
    				xhr.open("GET", "<c:url value='/updateClssListRoomDataAjax.controller?classListId=" + classListId + "&roomId=" + roomId +"' />", true);
    				xhr.send();
    				
    				console.log('change Success')
    				
    				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
    				
    			})
    			
    			
    			$('.teacherDataSelect').change(function(){
    				var teacherId = $(this).find('option:selected').val();
    				var classListId = $(this).parent().siblings('.classListId').text();
    				var xhr = new XMLHttpRequest();
    				xhr.open("GET", "<c:url value='/updateClssListTeacherDataAjax.controller?classListId=" + classListId + "&teacherId=" + teacherId +"' />", true);
    				xhr.send();
    				console.log('change Success')
    				
    				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
    			})
    			
    			$('.schoolDataSelect').change(function(){
    				var schoolId = $(this).find('option:selected').val();
    				var classListId = $(this).parent().siblings('.classListId').text();
    				var xhr = new XMLHttpRequest();
    				xhr.open("GET", "<c:url value='/updateClssListSchoolDataAjax.controller?classListId=" + classListId + "&schoolId=" + schoolId +"' />", true);
    				xhr.send();
    				console.log('change Success')
    				
    				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
    			})
    			
    			
		
	}
// 		xhrRoom.open("GET", "<c:url value='/findAllRoomAjax.controller' />", true);
// 		xhrRoom.send();
// 		xhrTeacher.open("GET", "<c:url value='/findAllTeacherAjax.controller' />", true);
// 		xhrTeacher.send();
// 		xhrSchool.open("GET", "<c:url value='/findAllSchoolAjax.controller' />", true);
// 		xhrSchool.send();
		xhrClassList.open("GET", "<c:url value='/findClassListByIdAjax.controller?classListId="+ classListId +"' />", true);
		xhrClassList.send();
		
	})
	
	
//=======ClassList中的studetList Edit Btn function============	
	
	$(document).on('click','.csl-edit-btn',function(){
		var oldStuNo = $(this).parent().siblings('.student-no').text();
		contentForUpdateNo = "<input class='clcslStuNoEdit' type='text' size='3' value='"+oldStuNo+ "'>";
		$(this).parent().siblings('.student-no').html(contentForUpdateNo);
			$('.clcslStuNoEdit').blur(function(){
				console.log('uuuuu')	
				var newStuNo = $(this).val();
				var cslId = $(this).parent().siblings('.csl-id').text();
				$(this).parent().html(newStuNo)
				
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/updateClassStudentListByIdAjax.controller?cslId=" + cslId +"&newStuNo=" + newStuNo + "' />", true);
				xhr.send();
				
				//===更改成功alert======
				const Toast = Swal.mixin({
			  	toast: true,
			  	position: 'top-end',
			  	showConfirmButton: false,
			  	timer: 1000,
			  	timerProgressBar: true,
			  	didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			 	 }
				})

				Toast.fire({
				  icon: 'success',
			 	 title: '已更改成功'
				})
				//===End of 更改成功alert======
		})
	})
	
	
//=====================Course Edit Btn===============================
		
$('#exampleModalCenter').on('hidden.bs.modal', function (e) {
	showAllCourse();
// 	history.go(0);
	console.log('7777777')
})
	$(document).on('click','.courseEditBtn',function(){
		$('#exampleModalCenter').modal('show')
		var cYear = $(this).parent().siblings('.courseYearInfo').text();
		var cSem = $(this).parent().siblings('.courseSemInfo').text();
		var cCat = $(this).parent().siblings('.courseCategoryInfo').text();
		var cGra = $(this).parent().siblings('.courseGradeInfo').text();
		var ccl = $(this).parent().siblings('.courseClassInfo').text().substr(0,1);
		var cSub = $(this).parent().siblings('.courseSubjectInfo').text();
		var cPri = $(this).parent().siblings('.coursePriceInfo').text();
		var cTT = $(this).parent().siblings('.courseTeachTimeInfo').text();
		var cMem = $(this).parent().siblings('.courseMemberInfo').text();
		var cSD = $(this).parent().siblings('.startDateInfo').text();
		var cED = $(this).parent().siblings('.endDateInfo').text();
		var cOnOff = $(this).parent().siblings('.onOrOff-td').children().val();
		var cPic = $(this).parent().siblings('.cPic-td').children().attr('src');
		var cId = $(this).parent().siblings('#course-id').text();
		
		$('.formYear').val(cYear);
		$('.formSem').val(cSem);
		$('.formCat').val(cCat);
		$('.formSub').val(cSub);
		$('.formGra').val(cGra);
		$('.formCla').val(ccl);
		$('.formPri').val(cPri);
		$('.formTT').val(cTT);
		$('.formSD').val(cSD);
		$('.formED').val(cED);
		$('.formOnOff').val(cOnOff);
		$('.formMem').val(cMem);
		$('.cPicEdit').attr('src',cPic)
		$('.cIdForUpdate').val(cId)
		
	$("#coursePic").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview_imgInp").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	})
	

</script>

</html>