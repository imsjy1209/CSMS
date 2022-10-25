<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>註冊頁面</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

</script>
</head>
<body>
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<div class="container" align="center">
		<h3>註冊頁面</h3>
		<br>
		選擇對象: 
		<select id="type">
			<option value="2">導師</option>
			<option value="3">講師</option>
			<option value="4">學生</option>
			<option value="5">家長</option>
		</select> <br><br>
		<button id='btn01'>送出</button><br><br>
		<div style="clear: both;" id='dataArea'>&nbsp;</div>
	</div>
	<script>
		window.onload = function() {
			btn01.onclick = function() {
				var type = document.getElementById("type").value;
				//console.log(type);
				var htmlSeg = ""
					if (type == "2") {
						console.log(type);
						console.log("ON");
						htmlSeg += "建立導師帳號<br><br>"
						htmlSeg += "<form action=${pageContext.request.contextPath}/register/addschool method=get>";
						htmlSeg += "帳號: <input name='account'><br><br>";
						htmlSeg += "密碼: <input name='password'><br><br>";
						htmlSeg += "名字: <input name='name'><br><br>";
						htmlSeg += "職位: <input name='title'><br><br>";
						htmlSeg += "聘用日期: <input name='hiredate' id='datepicker'><br><br>";
						htmlSeg += "離職: <input name='resigndate' id='datepicker2'><br><br>";
						htmlSeg += "<input type='submit' value='註冊'>"
						htmlSeg += "</form>"
					}if (type == "3") {
						htmlSeg += "建立講師帳號<br><br>"
						htmlSeg += "<form action=${pageContext.request.contextPath}/register/addteacher method=get>";
						htmlSeg += "帳號: <input name='account'><br><br>";
						htmlSeg += "密碼: <input name='password'><br><br>";
						htmlSeg += "名字: <input name='name'><br><br>";
						htmlSeg += "職位: <input name='title'><br><br>";
						htmlSeg += "聘用日期: <input name='hiredate' id='datepicker'><br><br>";
						htmlSeg += "離職: <input name='resigndate' id='datepicker2'><br><br>";
						htmlSeg += "專長: <input name='expertise'><br><br>";
						htmlSeg += "<input type='submit' value='註冊'>"
						htmlSeg += "</form>"
					}if (type == "4") {
						htmlSeg += "建立學生帳號<br><br>"
							htmlSeg += "<form action=${pageContext.request.contextPath}/register/addStudent method=get>";
							htmlSeg += "帳號: <input name='account'><br><br>";
							htmlSeg += "密碼: <input name='password'><br><br>";
							htmlSeg += "名字: <input name='name'><br><br>";
							htmlSeg += "性別: <input name='gender'><br><br>";
							htmlSeg += "教育階段: <input name='schoolType'><br><br>";
							htmlSeg += "就讀學校: <input name='schoolName'><br><br>";
							htmlSeg += "年級: <input name='grade'><br><br>";
							htmlSeg += "(選填)父母名字: <input name='parentname'><br><br>";
							htmlSeg += "(選填)關係: <input name='relationship'><br><br>";
							htmlSeg += "<input type='submit' value='上傳'>"
							htmlSeg += "</form>"
						}if (type == "5") {
							htmlSeg += "建立家長帳號<br><br>"
								htmlSeg += "<form action=${pageContext.request.contextPath}/register/addParent method=get>";
								htmlSeg += "帳號: <input name='account'><br><br>";
								htmlSeg += "密碼: <input name='password'><br><br>";
								htmlSeg += "名字: <input name='name'><br><br>";
								htmlSeg += "性別: <input name='gender'><br><br>";
								htmlSeg += "電話: <input name='tel'><br><br>";
								htmlSeg += "信箱: <input name='email'><br><br>";
								htmlSeg += "<input type='submit' value='上傳'>"
								htmlSeg += "</form>"
							}
				dataArea.innerHTML = htmlSeg;
				$(function() {
					$("#datepicker").datepicker({
						appendText : "(西元年-月-日)",
						altField : "#datepicker",
						altFormat : "yy-mm-dd",
						dateFormat : "yy-mm-dd"
					});
				});
				$(function() {
					$("#datepicker2").datepicker({
						appendText : "(西元年-月-日)",
						altField : "#datepicker2",
						altFormat : "yy-mm-dd",
						dateFormat : "yy-mm-dd"
					});
				});
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
				htmlSeg += "尚未建立，請新增資料<br><br>"
				htmlSeg += "<form action=${pageContext.request.contextPath}/addExpense method=get>";
				htmlSeg += "<input style='display:none' name='year' value="+year+">";
				htmlSeg += "<input style='display:none' name='semester' value="+semester+">";
				htmlSeg += "總共收入: <input name='income' value="+obj.income+"><br><br>";
				htmlSeg += "總共花費: <input name='totalcost' value="+obj.totalcost+"><br><br>";
				htmlSeg += "行銷費用: <input name='markting' value="+obj.markting+"><br><br>";
				htmlSeg += "人事費用: <input name='personnel' value="+obj.personnel+"><br><br>";
				htmlSeg += "其他費用: <input name='other' value="+ obj.other+"><br><br>";
				htmlSeg += "<input type='submit' value='上傳'>"
				htmlSeg += "</form>"
			} else {
				htmlSeg += "已存在，可更新資料<br><br>"
				htmlSeg += "<form action=${pageContext.request.contextPath}/expense/edit method=get>";
				htmlSeg += "<input style='display:none' name='id' value="+obj.id+">";
				htmlSeg += "<input style='display:none' name='year' value="+year+">";
				htmlSeg += "<input style='display:none' name='semester' value="+semester+">";
				htmlSeg += "總共收入: <input name='income' value="+obj.income+"><br><br>";
				htmlSeg += "總共花費: <input name='totalcost' value="+obj.totalcost+"><br><br>";
				htmlSeg += "行銷費用: <input name='markting' value="+obj.markting+"><br><br>";
				htmlSeg += "人事費用: <input name='personnel' value="+obj.personnel+"><br><br>";
				htmlSeg += "其他費用: <input name='other' value="+ obj.other+"><br><br>";
				htmlSeg += "<input type='submit' value='更新'>"
				htmlSeg += "</form>"
			}
			return htmlSeg;
		}
	</script>
</body>
</html>