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
          background: #6494ED;
          display: flex;
          align-items: center;
          justify-content: center;
          height: 100vh;
          color: #2e446e;
        }

        .login {
          background-color: #6494ED;
          width: 29%;
          height: 35%;
          border-radius: 15px;
          text-align: center;
          color: #2e446e;
        }

        .login input {
          display: block;
          margin: 2% auto;
          text-align: center;
          background: white;
          border-radius: 22px;
          padding: 12px;
          font-size: 15px;
          outline: none;
        }

        .login input[type="text"],
        .login input[type="password"] {
          border: 3px solid #2e446e;
          width: 220px;
          transition: 0.5s;
        }

        .login input[type="text"]:focus,
        .login input[type="password"]:focus {
          border: 3px solid #ff9933;
          width: 280px;
          /* transition: 0.5s; */
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
        }
      </style>
    </head>

    <body>
      <div class="">
        <img src="${contextRoot}/image/LoginLogo.png" alt=""> 
      </div>
      <div class="login">
        <form action="users/checklogin" method="post">
          <div class="container form-group maindiv">
            <h1>Login</h1>
            <label for="username"><b>Username</b></label>
            <input type="text" class="form-control" placeholder="Enter Username" name="username" required>

            <label for="pwd"><b>Password</b></label>
            <input type="password" class="form-control" placeholder="Enter Password" name="pwd" required>
            <p>${LoginError}</p>
            <button type="submit" class="orangebtn">Login</button>
          </div>
        </form>
      </div>
      <script>
      </script>
    </body>

    </html>