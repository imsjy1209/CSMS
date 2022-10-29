<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!--box icons-->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
<title>Login</title>
<style>
body{
	background-color: cornflowerblue;	
}
.parentDiv{
	border:  1px solid red;
	display: flex; 
  	align-items: stretch ; 
} 
.childDiv{
  	display: flex; 
  	align-items: stretch ; 
}



</style>
</head>

<body class="parentDiv">
	<div class="picDiv">
		<img src="${contextRoot}/image/LoginLogo.png" alt="" srcset="">
	</div>
	<div class="childDiv">
		<img src="" alt="">
		<div >
			<div>
				<h1>
					<i class='bx bxs-lock-open' >密碼修改</i>
				</h1>
			</div>
			<form class="form" method="post" action="../users/updateFirstLogin">
				<div class="">
					<label for="idPwd1" class="t1"> <b>舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
					</label> <input readonly type="text" id="idPwd1" name="old" value="${users.password}"
					placeholder="" maxlength="30" size="20"
					autocomplete="off" aria-invalid="false"><br> <span
					id="h">舊密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
					id="idsp1" class="">&nbsp</span>
				</div>
				
				<div class="">
					<label for="idPwd2" class="t2"> <b>新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
					</label> <input type="text" id="idPwd2" name="newPassword" value=""
					placeholder="請輸入新密碼" maxlength="30" size="20" autocomplete="off"
					aria-invalid="false"><br> <span id="h">新密碼：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span><span
					id="idsp2" class="">&nbsp</span>
				</div>
				
				<div class="">
					<label for="idPwd3" class="t3"> <b>確認密碼：&nbsp&nbsp&nbsp&nbsp</b>
					</label> <input type="text" id="idPwd3" name="" value=""
					placeholder="請再次輸入新密碼" maxlength="30" size="20" autocomplete="off"
					aria-invalid="false"><br> <span id="h">確認密碼：&nbsp&nbsp&nbsp&nbsp</span><span
					id="idsp3" class="">&nbsp</span>
				</div>
				<div class="">
					<button type="submit" class="btn btn-primary btnn" id="btn">變更密碼</button>
			</div>
		</form>
	</div>
</div>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		window.onload = function() {
			enableBtn();
		}
		function enableBtn() {
			let btn = document.getElementById("btn");
			if ($("#idPwd1").attr("aria-invalid") == "true"
					&& $("#idPwd2").attr("aria-invalid") == "true"
					&& $("#idPwd3").attr("aria-invalid") == "true") {
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
			let specialist = [ "!", "@", "#", "%", "^", "&", "*", "_" ]
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