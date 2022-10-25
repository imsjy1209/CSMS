<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
      <jsp:include page="../framePage/sideBar.jsp"></jsp:include>
             
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
              Change password
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                          placeholder="請輸入現在使用的密碼" maxlength="30" size="20"
                          autocomplete="off" aria-invalid="false"><br> <span
                          id="h">舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
                          id="idsp1" class="">&nbsp</span>
                      </div>
                      <div class="d2">
                        <label for="idPwd2" class="t2"> <b>新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
                        </label> <input type="text" id="idPwd2" name="password2" value=""
                          placeholder="請輸入新密碼" maxlength="30" size="20"
                          autocomplete="off" aria-invalid="false"><br> <span
                          id="h">新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
                          id="idsp2" class="">&nbsp</span>
                      </div>
                      <div class="d3">
                        <label for="idPwd3" class="t3"> <b>確認密碼：&nbsp&nbsp&nbsp&nbsp</b>
                        </label> <input type="text" id="idPwd3" name="password3" value=""
                          placeholder="請再次輸入新密碼" maxlength="30" size="20"
                          autocomplete="off" aria-invalid="false"><br> <span
                          id="h">確認密碼：&nbsp&nbsp&nbsp&nbsp</span><span id="idsp3"
                          class="">&nbsp</span>
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
              Launch demo modal
            </button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
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
                    <input type="text" id="phonePwd" name="phonePwd" value=""
                      placeholder="請輸入現在使用的密碼" maxlength="30" size="20"
                      autocomplete="off" aria-invalid="false"><br> <span
                      id="h">舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
                      id="phoneSpan" class="">&nbsp</span>
                    </div>
                    <div>
                      <label for="phone" class="t1"><b>電話號碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
                      </label>
                      <input type="text" id="phone" name="phone" value=""
                      placeholder="請輸入電話號碼" maxlength="30" size="20">
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>  
						<!-- <div class="g2">
							<div class="title2">
								<h4>▰ 密碼修改</h4>
							</div>
							<form class="form" method="post" action="/Project/TeaherPwd">
							<div class="d1">
								<label for="idPwd1" class="t1"> <b>舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
								</label> 
                <input type="text" id="idPwd1" name="password1" value=""
									placeholder="請輸入現在使用的密碼" maxlength="30" size="20"
									autocomplete="off" aria-invalid="false"><br> <span
									id="h">舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
									id="idsp1" class="">&nbsp</span>
							</div>
							<div class="d2">
								<label for="idPwd2" class="t2"> <b>新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
								</label> <input type="text" id="idPwd2" name="password2" value=""
									placeholder="請輸入新密碼" maxlength="30" size="20"
									autocomplete="off" aria-invalid="false"><br> <span
									id="h">新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
									id="idsp2" class="">&nbsp</span>
							</div>
							<div class="d3">
								<label for="idPwd3" class="t3"> <b>確認密碼：&nbsp&nbsp&nbsp&nbsp</b>
								</label> <input type="text" id="idPwd3" name="password3" value=""
									placeholder="請再次輸入新密碼" maxlength="30" size="20"
									autocomplete="off" aria-invalid="false"><br> <span
									id="h">確認密碼：&nbsp&nbsp&nbsp&nbsp</span><span id="idsp3"
									class="">&nbsp</span>
							</div>
							<div class="d4">
                <button type="button" class="btnn" id="btn" disabled>變更密碼</button>
							</div>
            </form>
          </div> -->
          <!-- <input type="submit" value="變更密碼" id="btn" disabled /> -->
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
        window.onload=function(){
        	updatePwdFunction();
        }
          function updatePwdFunction(){
            //FIXME: 要改成透過session 找到那個人的密碼, 互動視窗資料不會清除
            //TODO: 在取得網頁時就要抓到user_id和舊密碼

            let userId=8;
          	
            var xhr = new XMLHttpRequest();
    		xhr.open("GET", "<c:url value='/userProfile.json?userId=" +  userId + " '/>", true);
    		xhr.send();
    		
    		xhr.onreadystatechange = function() {
    			if (xhr.readyState == 4 && xhr.status == 200) {
    				var userProfile = JSON.parse(xhr.responseText);
    				var prevPwd = userProfile.password;
    				console.log(prevPwd)
    				
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
    		            let pwd1Length=pwd1Value;
    		            let msg1 = document.getElementById("idsp1");
    		            // console.log(pwd1Value);
    		            let pwd2 = document.getElementById("idPwd2");
    		            let pwd2Value = pwd2.value;
    		            // console.log(pwd2Value);
    		            let msg2 = document.getElementById("idsp2");
    		            let pwd2Length = pwd2Value.length;
    		            if (pwd2Length !=0){

    		              if(pwd1Value == pwd2Value){
    		                msg2.innerHTML = "❌ 新密碼跟舊密碼一樣";
    		                msg2.style = "color : #56282D";//red
    		                $(this).attr("aria-invalid", "false");
    		                // console.log(this);
    		                
    		              }else {
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
    		              msg1.style.color="green";
    		              $(this).attr("aria-invalid", "true");
    		              // console.log(this);
    		            }
    		            enableBtn();
    		          }
    		            
    		          //   /* 新密碼 */
    		          //   // 離開焦點使用checkPwd2()
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
    		            let specialist = ["!", "@", "#", "%", "^", "&", "*","_"]
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
    		                if (pwd2Value == pwd1Value){
    		                    msg2.innerHTML = "❌ 新密碼跟舊密碼一樣";
    		                    msg2.style = "color : #56282D";//red
    		                    $(this).attr("aria-invalid", "false");
    		                    // console.log(this);
    		                }else if (pwd3Length!=0){
    		                    if(pwd2Value!=pwd3Value){
    		                      msg3.innerHTML ="❌ 確認密碼需與新密碼相同";
    		                      console.log("pwd2Value!=pwd3Value")
    		                      msg3.style = "color : #56282D";
    		                      $("#idPwd3").attr("aria-invalid", "false");
    		                      // console.log(this);
    		                    }else {
    		                      msg3.innerHTML = "✔  正確";
    		                      msg3.style = "color : #01B468";
    		                      $("#idPwd3").attr("aria-invalid", "true");
    		                      // console.log($("#idPwd3"));
    		                      // console.log(this);
    		                    }
    		                }else{
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
    		          // document.getElementById("idPwd3").addEventListener("blur", checkPwd3);
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
    		            if (pwd3Length==0){
    		              msg3.innerHTML = "❌ 請輸入密碼";
    		              msg3.style = "color : #56282D";//red
    		              $(this).attr("aria-invalid", "false");
    		              // console.log(this);
    		            }else if (pwd3Length<8){
    		              msg3.innerHTML = "❌ 密碼長度 需大於8位";
    		              msg3.style.color = "color : #56282D";
    		              $(this).attr("aria-invalid", "false");
    		              // console.log(this);
    		            }else if(pwd2Value!=pwd3Value){
    		              msg3.innerHTML ="❌ 確認密碼需與新密碼相同";
    		              msg3.style = "color : #56282D";
    		              $(this).attr("aria-invalid", "false");
    		              // console.log(this);
    		            }else if(pwd1Value==pwd3Value){
    		              msg3.innerHTML ="❌ 確認密碼跟舊密碼一樣";
    		              msg3.style = "color : #56282D";
    		              $(this).attr("aria-invalid", "false");
    		            }else {
    		              msg3.innerHTML = "✔  正確";
    		              msg3.style = "color : #01B468";
    		              $(this).attr("aria-invalid", "true");
    		              // console.log(this);
    		            }
    		            enableBtn();
    		            // 按確認後送出新密碼
    		           
    		          }
    		          // FIXME: 怪怪ㄉ 按件好像會垮住
    		          $(".btnn").click(changePwd); 
    		           
    		            function changePwd(){
    		              let userId =8;
    		              var newPwd = $("#idPwd3").val();//FIXME: 改query寫法
    		              var userKeyInPrevPwd = $('#idPwd1').val();
//     		              TODO: post請求 把新密碼往後丟
    		              let xhr2 = new XMLHttpRequest(); //for classcodeList
    		              xhr2.open("POST","<c:url value='/updateUsersPwdAjax.controller?userId="+ userId + "&newPwd=" + newPwd +"&userKeyInPrevPwd=" + userKeyInPrevPwd+"'/>",true);
    		              xhr2.send();
    		              
    		              xhr2.onreadystatechange = function(){
    		                if (xhr2.readyState==4 && xhr2.status == 200){
    		                  let result = JSON.parse(xhr2.responseText);
//     		                  console.log(result)
//     		                  console.log(result.password)
// 							  console.log("ttttt")
							  window.alert('修改成功')
							  $('#exampleModalCenter').modal('hide')
							  updatePwdFunction()
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