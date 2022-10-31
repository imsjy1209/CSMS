<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
			<!--box icons-->
			<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
			<title>Login</title>
			<style>
				body {
					font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
					background: #6494ED;
					display: flex;
					align-items: center;
					justify-content: center;
					height: 100vh;
					color: #2e446e;
				}

				.pwdReset {
					background-color: #f9f9f9;
					width: 29%;
					height: 60%;
					border-radius: 15px;
					/* text-align: center; */
					color: #2e446e;
					border: 5px solid #E5892D;
					transition: 0.5s;
				}

				.pwdReset input {
					display: block;
					margin: 2% auto;
					text-align: center;
					background: none;
					border-radius: 22px;
					padding: 12px;
					font-size: 15px;
					outline: none;
					transition: 0.5s;

				}

				.pwdReset input[type="text"],
				.pwdReset input[type="password"] {
					border: 2px solid #2e446e;
					width: 220px;

				}

				.pwdReset input[type="submit"] {
					border: 2px solid #ff9933;
					width: 150px;
					color: #ff9933;
					cursor: pointer;
				}

				.pwdReset input[type="text"]:focus,
				.pwdReset input[type="password"]:focus {
					border: 2px solid #ff9933;
					width: 280px;
/* 					transition: 0.5s; */
				}

				.pwdReset input[type="submit"]:hover {
					background-color: green;
					color: #ffffff;
/* 					transition: 0.5s; */
				}

				.orangebtn {
					margin-top: 5px;
					
					border: 2px solid #2e446e;
					color: #2e446e;
					padding: 15px 32px;
					text-align: center;
					text-decoration: none;
					display: inline-block;
					font-size: 16px;
					border-radius: 22px;
				}
				.spanOrange{
					font-weight:bold;
				}
				.btnDiv{
					text-align: center;
				}
				.spanMargin{
					margin-left: 10px;
				}
			</style>
		</head>
		<div class="pwdReset">
			<div>
				<h1  class="btnDiv">
					<i class='bx bxs-lock-open'>密碼修改</i>
				</h1>
			</div>
			<form class="form" method="post" action="../users/updateFirstLogin">
				
				<div class="">
					<label for="idPwd1" class="t1"> <b class="spanMargin">舊密碼：</b></label><input readonly type="text" id="idPwd1" name="old" value="${users.password}" placeholder=""
					maxlength="30" size="20" autocomplete="off" aria-invalid="false"><br> 
				</div>

				<div class="">
					<label for="idPwd2" class="t2"> <b class="spanMargin">新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b> <br>
						<span id="h" class="spanMargin" >提示：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span id="idsp2" class="spanOrange">&nbsp</span>
					</label> <input type="text" id="idPwd2" name="newPassword" value="" placeholder="請輸入新密碼"
						maxlength="30" size="20" autocomplete="off" aria-invalid="false"><br>
				</div>
				
				
				<div class="">
					<label for="idPwd3" class="t3"> <b class="spanMargin">確認密碼：&nbsp&nbsp&nbsp&nbsp</b><br>
						<span id="h" class="spanMargin" >提示：&nbsp&nbsp&nbsp&nbsp</span><span id="idsp3" class="spanOrange">&nbsp</span>
						<input type="text" id="idPwd3" name="" value="" placeholder="請再次輸入新密碼" maxlength="30" size="20" autocomplete="off" aria-invalid="false">
					</label> 
				</div>
				<div class="btnDiv" >
					<button type="submit" class="orangebtn" id="btn">變更密碼</button>
				</div>
			</form>
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<script>
			window.onload = function () {
				enableBtn();
			}
			function enableBtn() {
				let btn = document.getElementById("btn");
				if ( $("#idPwd2").attr("aria-invalid") == "true"
					&& $("#idPwd3").attr("aria-invalid") == "true") {
					btn.disabled = false;
					btn.style.background ="#ff9933";
					// console.log("按鈕打開");
				} else {
					btn.disabled = true;
				}
			}
			/* 舊密碼 */
			// 離開焦點使用checkPwd1()
			// document.getElementById("idPwd1").addEventListener("blur", checkPwd1);
			// $("#idPwd1").blur(checkPwd1);
			// function checkPwd1() {
			// 	// console.log(prevPwd);
			// 	let pwd1 = document.getElementById("idPwd1");
			// 	let pwd1Value = pwd1.value;
			// 	let pwd1Length = pwd1Value;
			// 	let msg1 = document.getElementById("idsp1");
			// 	// console.log(pwd1Value);
			// 	let pwd2 = document.getElementById("idPwd2");
			// 	let pwd2Value = pwd2.value;
			// 	// console.log(pwd2Value);
			// 	let msg2 = document.getElementById("idsp2");
			// 	let pwd2Length = pwd2Value.length;
			// 	if (pwd2Length != 0) {

			// 		if (pwd1Value == pwd2Value) {
			// 			msg2.innerHTML = "❌ 新密碼跟舊密碼一樣";
			// 			msg2.style = "color : #56282D";//red
			// 			$(this).attr("aria-invalid", "false");
			// 			// console.log(this);

			// 		} else {
			// 			msg2.innerHTML = "✔  正確";
			// 			msg2.style = "color : #01B468";
			// 			$(this).attr("aria-invalid", "true");
			// 			// console.log(this);
			// 		}
			// 	}
			// 	// 檢查欄位是否空白未填
			// 	if (pwd1Length < 1) {
			// 		msg1.append = "❌ 請輸入密碼";
			// 		msg1.style.color = "red";
			// 		$(this).attr("aria-invalid", "false");
			// 	}
			// 	else {
			// 		msg1.innerHTML = "✔ 正確";
			// 		msg1.style.color = "green";
			// 		$(this).attr("aria-invalid", "true");
			// 		// console.log(this);
			// 	}
			// 	enableBtn();
			// }
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
						if (flag1 && flag2 && flag3)
							break;
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
				} else {
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
		</script>
		</body>

		</html>