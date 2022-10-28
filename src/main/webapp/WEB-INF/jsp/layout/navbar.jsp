<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script type="text/javascript" src="${contextRoot}/ckeditor/ckeditor.js"></script>
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
        <a class="nav-link" href="${contextRoot}/homepage.controller">首頁<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          活動功能
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/activitymain.controller">新增活動(老師)</a>
          <a class="dropdown-item" href="${contextRoot}/getAllman">管理活動(老師)</a>
          <a class="dropdown-item" href="${contextRoot}/getAll">瀏覽活動(學生)</a>
          <a class="dropdown-item" href="${contextRoot}/getmyact">管理活動(學生)</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          財務功能
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/expenseform">財務表單</a>
          <a class="dropdown-item" href="${contextRoot}/trypage">財務圖表</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          學生管理
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/createstu">得到學生</a>
          <a class="dropdown-item" href="${contextRoot}/deletestu">清除學生</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          公告系統
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/post/postform">新增公告(校方)</a>
          <a class="dropdown-item" href="${contextRoot}/post/getall">管理公告</a>
          <a class="dropdown-item" href="${contextRoot}/post/viewbyschool">查看公告(校方)</a>
          <a class="dropdown-item" href="${contextRoot}/post/viewbyall">查看公告(學生)</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          註冊系統
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/register/form">新增帳號(校方)</a>
          <a class="dropdown-item" href="${contextRoot}/register/edit">管控帳號(校方)</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          個人資料
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/school/edit">個人資料(校方)</a>
          <a class="dropdown-item" href="${contextRoot}/teacher/edit">個人資料(講師)</a>
          <a class="dropdown-item" href="${contextRoot}/student/edit">個人資料(學生)</a>
          <a class="dropdown-item" href="${contextRoot}/parent/edit">個人資料(家長)</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
          留言板
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="${contextRoot}/message">傳送留言(家長)</a>
          <a class="dropdown-item" href="${contextRoot}/message/getallByParent">查看留言(家長)</a>
          <a class="dropdown-item" href="${contextRoot}/message/getallBySchool">查看留言(導師)</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
     <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/courseAllOnPageAjax.page">購買課程</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/signout">登出</a>
      </li>
    </ul>
  </div>
</nav>


<script type="text/javascript" src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="${contextRoot}/js/bootstrap.bundle.js"></script>

</body>
</html>