<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
      <jsp:include page="../framePage/sideBar.jsp"></jsp:include>
      <!-- <<form class="form" method="post" action="/Project/TeaherPwd">
        <div class="d1">
          <label for="idPwd1" class="t1"> <b>舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
            <input class="form-control" placeholder="Enter Last Name" name="password1" id="idPwd1">
        </div>
        <div class="d2">
          <label for="idPwd2" class="t2"> <b>新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
            <input class="form-control" placeholder="Enter Last Name" name="password2" id="idPwd2">
        </div>
        <div class="d2">
          <label for="idPwd3" class="t2"> <b>確認密碼：&nbsp&nbsp&nbsp&nbsp</b>
            <input class="form-control" placeholder="Enter Last Name" name="password3" id="idPwd3">
          </label>
        </div>
        <div class="d4">
          <input type="submit" value="變更密碼" id="btn" disabled />
        </div>
        </form> -->
		<!-- <div id="content">
			<article class="article">
				<section class="section">
					<h4>&nbsp</h4>
					<div class="container">
						<div class="g1">
							<div class="title1">
								<h4>▰ 個人資料</h4>
							</div>
							<table class="table table-bordered">
								<tr>
									<th>員工編號：</th>
									<td>${accBean.account}</td>
								</tr>
								<tr>
									<th>姓名：</th>
									<td>${sessionScope.teacherName}</td>
								</tr>
								<tr>
									<th>職稱：</th>
									<td>${sessionScope.title}</td>
								</tr>
								<tr>
									<th>到職日：</th>
									<td>${sessionScope.hiredate}</td>
								</tr>
								<tr>
									<th>負責班級：</th>
									<td>${sessionScope.grade}&nbsp年&nbsp${sessionScope.classNum}&nbsp班</td>
								</tr>
							</table>
						</div>
						<br> <span id="hid"></span> -->
						<div class="g2">
							<div class="title2">
								<h4>▰ 密碼修改</h4>
							</div>
							<form class="form" method="post" action="/Project/TeaherPwd">
							<div class="d1">
								<label for="idPwd1" class="t1"> <b>舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
								</label> 
                <input type="password" id="idPwd1" name="password1" value=""
									placeholder="請輸入現在使用的密碼" maxlength="30" size="20"
									autocomplete="off" aria-invalid="false"><br> <span
									id="h">舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
									id="idsp1" class="">&nbsp</span>
							</div>
							<div class="d2">
								<label for="idPwd2" class="t2"> <b>新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
								</label> <input type="password" id="idPwd2" name="password2" value=""
									placeholder="請輸入新密碼" maxlength="30" size="20"
									autocomplete="off" aria-invalid="false"><br> <span
									id="h">新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
									id="idsp2" class="">&nbsp</span>
							</div>
							<div class="d3">
								<label for="idPwd3" class="t3"> <b>確認密碼：&nbsp&nbsp&nbsp&nbsp</b>
								</label> <input type="password" id="idPwd3" name="password3" value=""
									placeholder="請再次輸入新密碼" maxlength="30" size="20"
									autocomplete="off" aria-invalid="false"><br> <span
									id="h">確認密碼：&nbsp&nbsp&nbsp&nbsp</span><span id="idsp3"
									class="">&nbsp</span>
							</div>
							<div class="d4">
								<input type="submit" value="變更密碼" id="btn" disabled />
							</div>
							</form>
						</div>
					</div>
				</section>
			</article>
		</div>

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			crossorigin="anonymous"></script>
		<!-- <script src="/Project/Teacher/scripts/TeacherInfo.js"></script> -->

/* 按鈕 */
function enableBtn() {
    let btn = document.getElementById("btn");

    if ($("#idPwd1").attr("aria-invalid") == "true" && $("#idPwd2").attr("aria-invalid") == "true" && $("#idPwd3").attr("aria-invalid") == "true") {
        btn.disabled = false;
        console.log("123");
    } else {
        btn.disabled = true;
    }
}
        <script>
          // var regex = new RegExp(/^((?=.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*|(?=.{8,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!\u0022#$%&'()*+,./:;<=>?@[\]\^_`{|}~-]).*)/, "g");
          // // 用另一個變數把使用者輸入的密碼接進來，假設那個密碼變數是 newpwd
          // if (pw2value.match(regex) == null) {
          //   alert('密碼複雜度不符合');
          // }
          function enableBtn() {
            let btn = document.getElementById("btn");

            if ($("#idPwd1").attr("aria-invalid") == "true" && $("#idPwd2").attr("aria-invalid") == "true" && $("#idPwd3").attr("aria-invalid") == "true") {
              btn.disabled = false;
              console.log("123");
            } else {
              btn.disabled = true;
            }
          }

          /* 舊密碼 */
          // 離開焦點使用checkPwd1()
          document.getElementById("idPwd1").addEventListener("blur", checkPwd1);

          function checkPwd1() {
            let prevPwd = $("#hid").text();
            let pwd1 = document.getElementById("idPwd1");
            let pwd1Value = pwd1.value;
            let msg1 = document.getElementById("idsp1");
            let pwd1Length = pwd1Value.length;

            // 檢查欄位是否空白未填
            if (pwd1Length < 1) {
              msg1.append = "❌ 請輸入密碼";
              msg1.style.color = "red";
              $(this).attr("aria-invalid", "false");
            }
            else if (pwd1Value != prevPwd) {
              msg1.innerHTML = "❌ 舊密碼與現在使用的密碼不同";
              msg1.style.color = "red";
              $(this).attr("aria-invalid", "false");
            }
            else {
              msg1.innerHTML = "✔";
              msg1.style.color="green";
              $(this).attr("aria-invalid", "true");
            }
            enableBtn();
          }

          /* 新密碼 */
          // 離開焦點使用checkPwd2()
          document.getElementById("idPwd2").addEventListener("blur", checkPwd2);

          function checkPwd2() {
            let pwd1 = document.getElementById("idPwd1");
            let pwd1Value = pwd1.value;
            let pwd2 = document.getElementById("idPwd2");
            let pwd2Value = pwd2.value;
            let msg2 = document.getElementById("idsp2");
            let pwd2Length = pwd2Value.length;
            let ch, flag = false;

            // 檢查欄位是否空白未填
            if (pwd2Value == "") {
              msg2.innerHTML = "❌ 請輸入密碼";
              msg2.style.color = "red";
              $(this).attr("aria-invalid", "false");
            }
            // 檢查有無至少滿8字
            else if (pwd2Length >= 8) {
              for (let i = 0; i < pwd2Length; i++) {
                ch = pwd2Value.charAt(i);
                // 檢查有無包含空格
                if (ch != " ") {
                  flag = true;
                } else {
                  flag = false;
                  break;
                }
              } // for迴圈結束

              if (flag) {
                if (pwd2Value != pwd1Value) {
                  msg2.innerHTML = "✔";
                  msg2.style.color="green";
                  $(this).attr("aria-invalid", "true");
                } else {
                  msg2.innerHTML = "❌ 新密碼不可與舊密碼相同";
                  msg2.style.color = "red"
                  $(this).attr("aria-invalid", "false");
                }
              }
              else {
                msg2.innerHTML = "❌ 密碼不可包含空格";
                msg2.style.color = "red"
                $(this).attr("aria-invalid", "false");
              }
            }
            else {
              msg2.innerHTML = "❌ 請輸入8個字元以上的密碼";
              msg2.style.color = "red"
              $(this).attr("aria-invalid", "false");
            }
            enableBtn();
          }

          /* 確認密碼 */
          // 離開焦點使用checkPwd3()
          document.getElementById("idPwd3").addEventListener("blur", checkPwd3);

          function checkPwd3() {
            let pwd2 = document.getElementById("idPwd2");
            let pwd2Value = pwd2.value;
            let pwd3 = document.getElementById("idPwd3");
            let pwd3Value = pwd3.value;
            let msg3 = document.getElementById("idsp3");
            let pwd3Length = pwd3Value.length;
            let ch, flag = false;

            // 檢查欄位是否空白未填
            if (pwd3Value == "") {
              msg3.innerHTML = "❌ 請輸入密碼";
              msg3.style.color = "red";
              $(this).attr("aria-invalid", "false");
            }
            // 檢查有無至少滿8字
            else if (pwd3Length >= 8) {
              for (let i = 0; i < pwd3Length; i++) {
                ch = pwd3Value.charAt(i);
                // 檢查有無包含空格
                if (ch != " ") {
                  flag = true;
                } else {
                  flag = false;
                  break;
                }
              } // for迴圈結束

              if (flag) {
                if (pwd3Value == pwd2Value) {
                  msg3.innerHTML = "✔";
                  msg3.style.color="green";
                  $(this).attr("aria-invalid", "true");
                } else {
                  msg3.innerHTML = "❌ 確認密碼需與新密碼相同";
                  msg3.style.color = "red"
                  $(this).attr("aria-invalid", "false");
                }
              }
              else {
                msg3.innerHTML = "❌ 密碼不可包含空格";
                msg3.style.color = "red"
                $(this).attr("aria-invalid", "false");
              }
            }
            else {
              msg2.innerHTML = "❌ 請輸入8個字元以上的密碼";
              msg2.style.color = "red"
              $(this).attr("aria-invalid", "false");
            }
            enableBtn();
          }

        </script>
        </body>

        </html>