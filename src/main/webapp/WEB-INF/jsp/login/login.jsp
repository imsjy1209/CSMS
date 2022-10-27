<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>Login</title>
<style>
  html,
 body {
    height: 100%;
    padding: 0;
    margin: 0;
}
  .maindiv{
    border: 1px solid red;
    width: 250px;
    text-align: left;
    position: relative ;
    right: -1200px;
    top: -200px;
  }
</style>
</head>
<body>
<h1>請登入</h1>
<div class="logodiv">
  <img src="${contextRoot}/image/LoginLogo.png" alt="" style="border: 1px solid red;">
</div>
<form action="users/checklogin" method="post">
  <div class="container maindiv" >
    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="pwd" style="border:1px solid red"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
    <p>${LoginError}</p>
    <button type="submit">Login</button>
  </div>

</form>

</body>
</html>