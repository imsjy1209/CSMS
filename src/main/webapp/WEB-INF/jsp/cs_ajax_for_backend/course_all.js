//======================Course=======================
	$('#course-Btn').click(function(){
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/AllCourseBackAjax.page' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				
				var content0 = "";
				content0 += 
				"<tr>" +
				"<td>多選</td>"+
				"<td>id</td>"+
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
				"<td>Function</td>"+
				"<td>Function</td>"+
				"</tr>"; 
				
				var content = "";
				var courseList = JSON.parse(xhr.responseText);
				console.log(courseList);
				for(var i=0; i < courseList.length; i++){
					content += 
						

					"<tr>" +
						"<td><input type='checkbox'/></td>" +	
						"<td id='course-id'>" + courseList[i].id + "</td>" +
						"<td>" + courseList[i].courseYear + "</td>" +
						"<td>" + courseList[i].courseSemester + "</td>" +
						"<td>" + courseList[i].courseCategory + "</td>" +
						"<td>" + courseList[i].courseGrade + "</td>" +
						"<td>" + courseList[i].courseClass + "年級</td>" +
						"<td>" + courseList[i].courseSubject + "</td>" +
	    	       		"<td>" + courseList[i].coursePrice + "</td>" +
	    	       		"<td>" + courseList[i].courseTeachTime + "</td>" +
	    	       		"<td>" + courseList[i].courseMember + "</td>" +
	    	       		"<td>" + courseList[i].startDate + "</td>" +
	    	       		"<td>" + courseList[i].endDate + "</td>" +
	    	       		"<td><button class='con'>ON</button><button class='coff'>OFF</button></td>" +
	    	       		"<td>" + "<img alt='img' width='50px' src='data:image/jpeg;base64,"+courseList[i].coursePic + "' class='product-img'>" + "</td>" +
	    	       		"<td class='test1'><a href='${contextRoot}/updateCourseData1.controller?id=" + courseList[i].id + "' type='button' class='btn btn-warning'>Edit</a></td>" +
						"<td class=' test2'><a id='delete-btn' type='button' class='btn btn-danger'>Delete</a></td>"+
						"<td class='onOrOff-td'>"+ "<input class='onOrOff' type='hidden' value='" + courseList[i].courseOnOff + "'/>" + "</td>" +
			        "</tr>";
				}
				var info0 = document.getElementById("thead-title");
				info0.innerHTML = content0;
				
				var info = document.getElementById("content-data");
				info.innerHTML = content;
		
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
				//=========上下架的變更=========
				$(".con").click(function(){
				var onOrOffVal = $(this).parent().siblings('.onOrOff-td').children().val();
				var nowId = $(this).parent().siblings("#course-id").text();
// 				console.log(nowId);
// 				console.log(onOrOffVal);
				if(onOrOffVal==0){
					console.log("change value to 1")
					$(this).addClass('active');
					$(this).next().removeClass('active');
					$(this).parent().siblings('.onOrOff-td').children().val(1);
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateCourseDataOnOrOff.controller?id=" + nowId + "&onOrOff=1' />", true);
					xhr.send();
				}
				
				})
				$(".coff").click(function(){
				var onOrOffVal =$(this).parent().siblings('.onOrOff-td').children().val();
				var nowId = $(this).parent().siblings("#course-id").text();
// 				console.log(nowId);
// 				console.log(onOrOffVal);
				if(onOrOffVal==1){
					console.log("change value to 0")
					$(this).addClass('active');
					$(this).prev().removeClass('active');
					$(this).parent().siblings('.onOrOff-td').children().val(0);
					
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/updateCourseDataOnOrOff.controller?id=" + nowId + "&onOrOff=0' />", true);
					xhr.send();
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
		
})