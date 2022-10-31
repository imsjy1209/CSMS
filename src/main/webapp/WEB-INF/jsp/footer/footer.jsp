<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Footer Style (start) */
html, body {
	height: 100%;
	margin: 0;
}

.wrapper { /* 每一頁都要用wrapper包起來 */
	min-height: calc(100% - 107px); /*減去navebar(77px)和footer(40)高度*/
}

.footer {
	height: 40px; /*設定footer本身高度*/
	background-color: #cbe6f5;
	font-size: 15px;
	text-align: center;
	color: gray;
}

/* Footer Style (end) */
</style>
</head>
<body>


	<footer class="footer mt-auto py-2" >
		<div class="container" style="color:#214461">
			Copyright &copy 2022 CSMS Corporation. All rights reserved.
		</div>
	</footer>
</body>
</html>