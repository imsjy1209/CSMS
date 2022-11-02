<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			
<%-- 			<jsp:include page="../framePage/sideBar.jsp"></jsp:include> --%>
			
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
			
			<span class="userProfiledId" style='display:none'>${users.id}</span>
			<div id="profilePwd" style="flex-direction: column;">
				<div class="card" style="width: 700px; flex-direction: column;  margin: 10px;">
					<div class="card-body">
					  <h5 class="card-title">Personal Profile</h5>
					</div>
					<ul class="list-group list-group-flush " id="porfileLi">
					</ul>
					<div class="" style="display: flex;">
						<!-- 改密碼 -->
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="margin: 5px;">
							Change password
						</button>
						<!-- 改電話 -->
						<input type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#exampleModa2" value="change contact" id="changect" style="margin: 5px;">
					</div>
				</div>
				<div class="card" style="width: 700px; flex-direction: column;  margin: 10px;" id="kidsList">
				</div>
			</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">▰ 密碼修改</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form class="form" method="post" action="/Project/TeaherPwd">
									<div class="d1">
										<label for="idPwd1" class="t1"> <b>舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
										</label>
										<input type="text" id="idPwd1" name="password1" value=""
											placeholder="請輸入現在使用的密碼" maxlength="30" size="20" autocomplete="off"
											aria-invalid="false"><br> <span
											id="h">舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="idsp1"
											class="">&nbsp</span>
									</div>
									<div class="d2">
										<label for="idPwd2" class="t2"> <b>新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
										</label> <input type="text" id="idPwd2" name="password2" value=""
											placeholder="請輸入新密碼" maxlength="30" size="20" autocomplete="off"
											aria-invalid="false"><br> <span
											id="h">新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="idsp2"
											class="">&nbsp</span>
									</div>
									<div class="d3">
										<label for="idPwd3" class="t3"> <b>確認密碼：&nbsp&nbsp&nbsp&nbsp</b>
										</label> <input type="text" id="idPwd3" name="password3" value=""
											placeholder="請再次輸入新密碼" maxlength="30" size="20" autocomplete="off"
											aria-invalid="false"><br> <span id="h">確認密碼：&nbsp&nbsp&nbsp&nbsp</span><span
											id="idsp3" class="">&nbsp</span>
									</div>
							</div>
							<div class="d4 modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
								<button type="button" class="btn btn-primary btnn" id="btn" disabled>變更密碼</button>
							</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Button trigger modal -->
				<!-- Modal -->
				<div class="modal fade" id="exampleModa2" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<!-- <div class="modal-dialog" role="document"> -->
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">更改電話</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div>
									<label for="phonepwd" class="t1"> <b>舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
									</label>
									<input type="text" id="phonePwd" name="phonePwd" value="" placeholder="請輸入現在使用的密碼"
										maxlength="30" size="20" autocomplete="off" aria-invalid="false"><br> <span
										id="h">密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="phonePwdSpan"
										class="">&nbsp</span>
								</div>
								<div>
									<label for="phone" class="t1"><b>電話號碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
									</label>
									<input type="text" id="phone" name="phone" value="" placeholder="請輸入電話號碼"
										maxlength="10" size="20">
									<br> <span id="h">電話：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="phoneSpan"
										class="">&nbsp</span>
								</div>
							</div>
							<div class="modal-footer ">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								
								<input type="hidden" class="btn btn-primary" data-toggle="modal" data-target="#exampleModa2" value="change contact" id="sendPhone">
								<!-- <button type="button" class="btn btn-primary" id="savePhone">Save changes</button> -->
							</div>
						</div>
					</div>
				</div>
			</div><!-- end of profile Div -->
			
			<!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
			<!--       integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
			<!--       crossorigin="anonymous"></script> -->

			<!--     <script -->
			<!--       src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" -->
			<!--       integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" -->
			<!--       crossorigin="anonymous"></script> -->

			<!--     <script -->
			<!--       src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" -->
			<!--       integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" -->
			<!--       crossorigin="anonymous"></script> -->

			<!--     <script src="https://code.jquery.com/jquery-3.6.0.min.js" -->
			<!--       integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" -->
			<!--       crossorigin="anonymous"></script>   -->
			<!-- <script src="/Project/Teacher/scripts/TeacherInfo.js"></script> -->

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

			<script>
				window.onload = function () {
					updateProfileFunction();
				}
				function updateProfileFunction() {
					let userId=$('.userProfiledId').text();
					//FIXME: 要改成透過session
					// let userId=15;// 學生
					// let userId=4; // 校務
					// let userId=8;// 老師
					// let userId = 45;//家長有電話 emai
					var xhr = new XMLHttpRequest();
					xhr.open("GET", "<c:url value='/userProfile.json?userId=" + userId + " '/>", true);
					xhr.send();
					xhr.onreadystatechange = function () {
						if (xhr.readyState == 4 && xhr.status == 200) {
							var userProfile = JSON.parse(xhr.responseText);
							// console.log(userProfile);
							
							var prevPwd = userProfile.password;
							// 家長 按鈕觸發
							if (userProfile.parent != null) {
								//================把按鈕打開=============
								$("#changect").attr("type", "button");
								//=========把卡片塞進去並新增資料=========
								let profileStr ='<li class="list-group-item" id="">姓名: <input type="text" readonly style="border: none;" value="'+userProfile.parent.name+'"></li>'+
												'<li class="list-group-item" id="">身分: <input type="text" readonly style="border: none;" value="'+userProfile.groups.groupsName+'"></li>';
								$('#porfileLi').html(profileStr);
								let kidsList ='<div class="card-body"><h5 class="card-title" >學員清單</h5></div>'+
											  '<table class="table table-hover"><thead><tr><th scope="col">姓名</th><th scope="col">性別</th><th scope="col">學校</th></tr><thead><tbody>'
								let kids=userProfile.parent.student.length
								for(let i=0;i<kids;i++){
									let kidName=userProfile.parent.student[i].name;
									// console.log(kidName);
									let kidSchol=userProfile.parent.student[i].schoolName;
									// console.log(kidSchol);
									let kidGrade=userProfile.parent.student[i].grade;
									// console.log(kidGrade);
									let kidGender=userProfile.parent.student[i].gender;
									// console.log(kidGender); 
									kidsList+=  '<tr><td>'+kidName+'</td>'+
												'<td>'+kidGender+'</td>'+
												'<td>'+kidSchol+' '+kidGrade+'年級'+'</td>';
								}
								kidsList+='</tbody></table>';

								$('#kidsList').append(kidsList)
								
								let oldCellPhone = userProfile.parent.tel;
								$("#phone").val(oldCellPhone)
								// 更改電話的密碼跳脫事件
								$("#phonePwd").blur(phonePwdCheck);
								//檢查密碼
								function phonePwdCheck() {
									if ($("#phonePwd").val().length < 8) {
										$("#phonePwdSpan").html('❌ 密碼長度不正確');
										$("#phonePwdSpan").css('color', "#56282D")
									} if ($("#phonePwd").val() == prevPwd) {
										$("#phonePwdSpan").html('✔  正確');
										$("#phonePwdSpan").css('color', "#01B468")
									} else {
										$("#phonePwdSpan").html('❌ 密碼不正確');
										$("#phonePwdSpan").css('color', "#56282D")
									}
								}
								//電話號碼長度檢查
								$("#phone").blur(telephonecheck);
								function telephonecheck() {
									let phonelength = $("#phone").val().length
									if (phonelength < 10) {
										$("#phoneSpan").html('❌電話長度不正確');
										$("#phoneSpan").css('color', "#56282D");
										$("#sendPhone").attr("type", "hidden");
									} else {
										$("#phoneSpan").html('✔  正確');
										$("#phoneSpan").css('color', '#01B468')
										$("#sendPhone").attr("type", "button");
									}
								}
								$("#sendPhone").click(changetele);
								function changetele() {
									let newPhone = $("#phone").val();
									let oldCheckPwd = $('#phonePwd').val();
									console.log();
									let xhr3 = new XMLHttpRequest(); //for classcodeList
									xhr3.open("POST", "<c:url value='/updateUsersPhoneAjax.controller?userId=" + userId + "&newPhone=" + newPhone + "&oldCheckPwd=" + oldCheckPwd + "'/>", true);
									xhr3.send();
									xhr3.onreadystatechange = function () {
										if (xhr3.readyState == 4 && xhr3.status == 200) {
											let result = JSON.parse(xhr3.responseText);
											window.alert('電話修改成功')
											$("#exampleModa2").modal('hide');
											updatePhoneFunction() //FIXME:不確定要不要修正 by 冬冬
											$("#phonePwd").val('');
											$("#phonePwdSpan").text('');
											$("#phone").val('');
											$("#phoneSpan").text('');
										}
									}
								}
							}
							//=======學生身分=========
							if (userProfile.student!=null) {
								let stuProfileName=userProfile.student.name;
								let stuProfileGender=userProfile.student.gender;
								let stuProfileSchoolName=userProfile.student.schoolName;
								let stuProfileGrade=userProfile.student.grade;
								let emergencyContact=userProfile.student.parent.name;
								let emergencyPhone=userProfile.student.parent.tel;
								let stuProfileRelationship=	userProfile.student.relationship
								let profileStr ='<li class="list-group-item" id="">姓名: <input type="text" readonly style="border: none;" value="'+stuProfileName+'">性別: <input type="text" readonly style="border: none;" value="'+stuProfileGender+'"></li>'+
												'<li class="list-group-item" id="">學校: <input type="text" readonly style="border: none;" value="'+stuProfileSchoolName+' '+stuProfileGrade+'年級'+'"></li>'+
												'<li class="list-group-item" id="">緊急聯絡人: <input type="text" readonly style="border: none;" value="'+emergencyContact+'">關係: <input type="text" readonly style="border: none;" value="'+stuProfileRelationship+'"></li>'+
												'<li class="list-group-item" id="">緊急連絡電話: <input type="text" readonly style="border: none;" value="'+emergencyPhone+'"></li>';
								$('#porfileLi').html(profileStr);
							}
							//=======老師身分=========
							if (userProfile.teacher!=null) {
								let teacherProfileName=userProfile.teacher.name;
								let teacherProfileIdentity=userProfile.groups.groupsName;
								let teacherProfileStatus=userProfile.teacher.status;
								let teacherProfileExpertise=userProfile.teacher.expertise;
								let profileStr ='<li class="list-group-item" id="">姓名: <input type="text" readonly style="border: none;" value="'+teacherProfileName+'"></li>'+
												'<li class="list-group-item" id="">身分: <input type="text" readonly style="border: none;" value="'+teacherProfileIdentity+'"></li>'+
												'<li class="list-group-item" id="">狀態: <input type="text" readonly style="border: none;" value="'+teacherProfileStatus+'"></li>'+
												'<li class="list-group-item" id="">教學項目: <input type="text" readonly style="border: none;" value="'+teacherProfileExpertise+'"></li>';
								$('#porfileLi').html(profileStr);
								
							}
							//=======校務人員身分=========
							if (userProfile.school!=null) {
								let schoolProfileName=userProfile.school.name;
								let schoolProfileGroupsName=userProfile.groups.groupsName;
								let schoolProfileStatus=userProfile.school.status;
								let schoolProfileTitle=userProfile.school.title
								let profileStr ='<li class="list-group-item" id="">姓名: <input type="text" readonly style="border: none;" value="'+schoolProfileName+'"></li>'+
												'<li class="list-group-item" id="">身分: <input type="text" readonly style="border: none;" value="'+schoolProfileGroupsName+'"></li>'+
												'<li class="list-group-item" id="">狀態: <input type="text" readonly style="border: none;" value="'+schoolProfileStatus+'"></li>'+
												'<li class="list-group-item" id="">職稱: <input type="text" readonly style="border: none;" value="'+schoolProfileTitle+'"></li>';
								$('#porfileLi').html(profileStr);
							}
							// 開始改密碼
							function enableBtn() {
								let btn = document.getElementById("btn");
								if ($("#idPwd1").attr("aria-invalid") == "true" && $("#idPwd2").attr("aria-invalid") == "true" && $("#idPwd3").attr("aria-invalid") == "true") {
									btn.disabled = false;
									// console.log("按鈕打開");
								} else {
									btn.disabled = true;
								}
							}
							/* 舊密碼 */
							// 離開焦點使用checkPwd1()
							// document.getElementById("idPwd1").addEventListener("blur", checkPwd1);
							$("#idPwd1").blur(checkPwd1);
							function checkPwd1() {
								// console.log(prevPwd);
								let pwd1 = document.getElementById("idPwd1");
								let pwd1Value = pwd1.value;
								let pwd1Length = pwd1Value;
								let msg1 = document.getElementById("idsp1");
								// console.log(pwd1Value);
								let pwd2 = document.getElementById("idPwd2");
								let pwd2Value = pwd2.value;
								// console.log(pwd2Value);
								let msg2 = document.getElementById("idsp2");
								let pwd2Length = pwd2Value.length;
								if (pwd2Length != 0) {

									if (pwd1Value == pwd2Value) {
										msg2.innerHTML = "❌ 新密碼跟舊密碼一樣";
										msg2.style = "color : #56282D";//red
										$(this).attr("aria-invalid", "false");
										// console.log(this);

									} else {
										msg2.innerHTML = "✔  正確";
										msg2.style = "color : #01B468";
										$(this).attr("aria-invalid", "true");
										// console.log(this);
									}
								}
								// 檢查欄位是否空白未填
								if (pwd1Length < 1) {
									msg1.append = "❌ 請輸入密碼";
									msg1.style.color = "red";
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								}
								else if (pwd1Value != prevPwd) {
									msg1.innerHTML = "❌ 舊密碼與現在使用的密碼不同";
									msg1.style.color = "red";
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								}
								else {
									msg1.innerHTML = "✔ 正確";
									msg1.style.color = "green";
									$(this).attr("aria-invalid", "true");
									// console.log(this);
								}
								enableBtn();
							}
							// /* 新密碼 */
							// 離開焦點使用checkPwd2()
							// document.getElementById("idPwd2").addEventListener("blur", checkPwd2);
							$("#idPwd2").blur(checkPwd2);
							function checkPwd2() {
								let pwd1 = document.getElementById("idPwd1");
								let pwd1Value = pwd1.value;
								// console.log(pwd1Value);
								let pwd2 = document.getElementById("idPwd2");
								let pwd2Value = pwd2.value;
								// console.log(pwd2Value);
								let msg2 = document.getElementById("idsp2");
								let pwd3 = document.getElementById("idPwd3");
								let pwd3Value = pwd3.value;
								// console.log(pwd3Value);
								let msg3 = document.getElementById("idsp3");
								let pwd2Length = pwd2Value.length;
								let pwd3Length = pwd3Value.length;
								let specialist = ["!", "@", "#", "%", "^", "&", "*", "_"]
								//取得輸入幾位數
								let ch, flag1 = false, flag2 = false, flag3 = false;
								//判斷元素值是否為空白，密碼長度是否大於8
								if (pwd2Value == "") {
									msg2.innerHTML = " ❌ 請輸入密碼";
									msg2.style = "color : #56282D"; //red
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								} else if (pwd2Length >= 8) {
									for (let i = 0; i < pwd2Length; i++) {
										ch = pwd2Value.charAt(i).toUpperCase();
										// 判斷字元有沒有包含在A - Z
										if (ch >= "A" && ch <= "Z") {
											flag1 = true;
											//判斷字元有沒有包含0-9
										} else if (ch >= "0" && ch <= "9") {
											flag2 = true;
											// 根據上面的陣列判斷有沒有特殊字元
										} else if (specialist.includes(ch)) {
											flag3 = true;
										}
										//如果三個都符合會跳出迴圈
										if (flag1 && flag2 && flag3) break;
									}
									//跳出檢查狀態
									if (flag1 && flag2 && flag3) {
										msg2.innerHTML = "✔  正確";
										msg2.style = "color : #01B468"; //green
										$(this).attr("aria-invalid", "true");
										// console.log(this);
									} else {
										msg2.innerHTML = "❌ 密碼不符合";
										msg2.style = "color : #56282D"; //red
										$(this).attr("aria-invalid", "false");
										// console.log(this);
									} // 比對新舊密碼 和 新密碼和確認密碼 
									if (pwd2Value == pwd1Value) {
										msg2.innerHTML = "❌ 新密碼跟舊密碼一樣";
										msg2.style = "color : #56282D";//red
										$(this).attr("aria-invalid", "false");
										// console.log(this);
									} else if (pwd3Length != 0) {
										if (pwd2Value != pwd3Value) {
											msg3.innerHTML = "❌ 確認密碼需與新密碼相同";
											console.log("pwd2Value!=pwd3Value")
											msg3.style = "color : #56282D";
											$("#idPwd3").attr("aria-invalid", "false");
											// console.log(this);
										} else {
											msg3.innerHTML = "✔  正確";
											msg3.style = "color : #01B468";
											$("#idPwd3").attr("aria-invalid", "true");
											// console.log($("#idPwd3"));
											// console.log(this);
										}
									} else {
										msg2.innerHTML = "✔  正確";
										msg2.style = "color : #01B468";
										$(this).attr("aria-invalid", "true");
									}
								}
								else {
									msg2.innerHTML = "❌ 密碼數最少為8碼";
									msg2.style = "color : #56282D";//red
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								}
								enableBtn();
							}
							/* 確認密碼 */
							// 離開焦點使用checkPwd3()
							$("#idPwd3").blur(checkPwd3)
							function checkPwd3() {
								let pwd1 = document.getElementById("idPwd1");
								let pwd1Value = pwd1.value;
								let pwd2 = document.getElementById("idPwd2");
								let pwd2Value = pwd2.value;
								// console.log(pwd2Value);
								let pwd3 = document.getElementById("idPwd3");
								let pwd3Value = pwd3.value;
								// console.log(pwd3Value);
								let msg3 = document.getElementById("idsp3");
								let pwd3Length = pwd3Value.length;
								let ch, flag = false;
								if (pwd3Length == 0) {
									msg3.innerHTML = "❌ 請輸入密碼";
									msg3.style = "color : #56282D";//red
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								} else if (pwd3Length < 8) {
									msg3.innerHTML = "❌ 密碼長度 需大於8位";
									msg3.style.color = "color : #56282D";
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								} else if (pwd2Value != pwd3Value) {
									msg3.innerHTML = "❌ 確認密碼需與新密碼相同";
									msg3.style = "color : #56282D";
									$(this).attr("aria-invalid", "false");
									// console.log(this);
								} else if (pwd1Value == pwd3Value) {
									msg3.innerHTML = "❌ 確認密碼跟舊密碼一樣";
									msg3.style = "color : #56282D";
									$(this).attr("aria-invalid", "false");
								} else {
									msg3.innerHTML = "✔  正確";
									msg3.style = "color : #01B468";
									$(this).attr("aria-invalid", "true");
									// console.log(this);
								}
								enableBtn();
								// 按確認後送出新密碼
							}
							$(".btnn").click(changePwd);
							function changePwd() {
								let userId = 8;//FIXME: 純註記 要改成session
								var newPwd = $("#idPwd3").val();
								var userKeyInPrevPwd = $('#idPwd1').val();
								let xhr2 = new XMLHttpRequest(); //for classcodeList
								xhr2.open("POST", "<c:url value='/updateUsersPwdAjax.controller?userId=" + userId + "&newPwd=" + newPwd + "&userKeyInPrevPwd=" + userKeyInPrevPwd + "'/>", true);
								xhr2.send();
								xhr2.onreadystatechange = function () {
									if (xhr2.readyState == 4 && xhr2.status == 200) {
										let result = JSON.parse(xhr2.responseText);
										//     		                  console.log(result)
										//     		                  console.log(result.password)
										// 							  console.log("ttttt")
										window.alert('密碼修改成功')
										$('#exampleModalCenter').modal('hide')
										updatePwdFunction() //FIXME:不確定要不要修正2 by 冬冬
										$('#idPwd1').val("");
										$('#idPwd2').val("");
										$('#idPwd3').val("");
										$('#idsp1').text("");
										$('#idsp2').text("");
										$('#idsp3').text("");

									}
								}//======End Of Onreadystatechange======
							}
						}
					}
				}


//     		})
			</script>
			</body>

			</html>