<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
      <title>Login</title>
      <style>
        body {
          font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
/*           background: #6494ED; */
          background: white;
          display: flex;
          align-items: center;
          justify-content: center;
          height: 100vh;
          color: #2e446e;
        }

        .login {
/*           background-color: #6494ED; */
          background: white;
          width: 29%;
          height: 65%;
          border-radius: 15px;
          text-align: center;
          color: #2e446e;
        }

        .login input {
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

        .login input[type="text"],
        .login input[type="password"] {
          border: 2px solid #2e446e;
          width: 220px;
          
        }

        .login input[type="text"]:focus,
        .login input[type="password"]:focus {
          border: 2px solid #ff9933;
          width: 280px;
          transition: 0.5s;
        }
        .orangebtn{
          background-color:  #ff9933;
          color: #2e446e;
          padding: 15px 32px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          border-radius: 22px;
          cursor: pointer;
        }
        
        
      </style>
    </head>

    <body>

      
      
      <div class="login">
        <form class="form" method="post" action="../users/updateFirstLogin">
          <div class="container form-group maindiv">
            <h1>Change P@ssw0rd</h1>
            
            <label for="idPwd1" class="t1"><b class="spanMargin">Old Pwd</b></label>
            <input readonly type="text" id="idPwd1" name="old" value="${users.password}" placeholder=""
					maxlength="30" size="20" autocomplete="off" aria-invalid="false"><br>

            <label for="idPwd2" class="t2"><b class="spanMargin">New Pwd</b></label>
              <div class="hint1"><span id="h" class="spanMargin" ></span><span id="idsp2" class="spanOrange">&nbsp</span></div>
            <input type="text" id="idPwd2" name="newPassword" value="" placeholder="請輸入新密碼"
						maxlength="30" size="20" autocomplete="off" aria-invalid="false">
          
           
           
            <label for="idPwd3" class="t3"><b class="spanMargin">DBC New Pwd</b></label>
            <div class="hint2"><span id="h" class="spanMargin" ></span><span id="idsp3" class="spanOrange">&nbsp</span></div>
            <input type="text" id="idPwd3" name="" value="" placeholder="請再次輸入新密碼" maxlength="30" size="20" autocomplete="off" aria-invalid="false">
           
            <div class="btnDiv" >
            <button type="submit" class="orangebtn" id="btn">Change</button>
            </div>
            
          </div>
        </form>
      </div>
      
      <div class="csmsPic">
        <img src="${contextRoot}/image/PwdChange.png" alt=""> 
      </div>
      
      
      
      	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
      
      <script>
		window.onload = function () {
			enableBtn();

		}
		var ch;
		var flag1 = false;
		var flag2 = false;
// 		var flag3 = false;
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
		
			//判斷元素值是否為空白，密碼長度是否大於8
	
			if (pwd2Value == "") {
				msg2.innerHTML = " ❌ 請輸入密碼";
				msg2.style = "color : #56282D"; //red
				$(this).attr("aria-invalid", "false");
				// console.log(this);
			} else if (pwd2Length >= 8) {
				for (let i = 0; i < pwd2Length; i++) {
					ch = pwd2Value.charAt(i).toUpperCase();
					console.log(ch)
					// 判斷字元有沒有包含在A - Z
					if (ch >= "A" && ch <= "Z") {
						flag1 = true;
						console.log("flag1 good")
						//判斷字元有沒有包含0-9
					} else if (ch >= "0" && ch <= "9") {
						flag2 = true;
						console.log("flag2 good")
						// 根據上面的陣列判斷有沒有特殊字元
					} else if (specialist.includes(ch)) {
// 						flag3 = true;
						console.log("flag3 good")
					}
					//如果三個都符合會跳出迴圈
					if (flag1 && flag2)
						break;
				}
				//跳出檢查狀態
				if (flag1 && flag2) {
// 					console.log("flag1"+ flag1)
// 					console.log("flag2"+ flag2)
// 					console.log("flag3"+ flag3)
					msg2.innerHTML = "✔  正確";
					msg2.style = "color : darkgreen"; //green
					$(this).attr("aria-invalid", "true");
					// console.log(this);
				} else {
					msg2.innerHTML = "❌ 密碼不符合";
					msg2.style = "color : #56282D"; //red
					$(this).attr("aria-invalid", "false");
					// console.log(this);
					console.log(flag1)
					console.log(flag2)
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
						msg3.style = "color : darkgreen";
						$("#idPwd3").attr("aria-invalid", "true");
						// console.log($("#idPwd3"));
						// console.log(this);
					}
				} else {
					msg2.innerHTML = "✔  正確";
					msg2.style = "color : darkgreen";
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
				msg3.style = "color : darkgreen";
				$(this).attr("aria-invalid", "true");
				// console.log(this);
			}
			enableBtn();
			// 按確認後送出新密碼
		}
      
      
      
      
      
      
      
      </script>
    </body>

    </html>