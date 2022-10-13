<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Cool App</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/">首頁<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/absentCheck">出勤表</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/messages/page">最新3筆</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/messages/ajax">Ajax version</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/newPhoto">Upload Photo</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/messages/add">列出圖片</a>
      </li>
      
     
    </ul>
  </div>
</nav>



<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.js"></script>
</body>
</html>