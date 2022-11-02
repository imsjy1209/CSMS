<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>
    
    

    <head>
      <meta charset="UTF-8">
      <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
      <title>Login</title>
      
      
      <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
      
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
        <form action="${contextRoot}/users/checklogin" method="post">
          <div class="container form-group maindiv">
            <h1>Login</h1>
            <label for="username"><b>Username</b></label>
            <input type="text" class="form-control userName" placeholder="Enter Username" name="username" required>

            <label for="pwd"><b>Password</b></label>
            <input type="password" class="form-control pwd" placeholder="Enter Password" name="pwd" required>
            <p id="errMsg" style="color:#E00000">${LoginError}</p>
            <button type="submit" class="orangebtn">Login</button>
          </div>
        </form>
        
        <button type="submit" class="btn btn-dark oneKey">School</button>
        <button type="submit" class="btn btn-dark oneKey">Teacher</button>
        <button type="submit" class="btn btn-dark oneKey">Student</button>
        <button type="submit" class="btn btn-dark oneKey">Parent</button>
        <button type="submit" class="btn btn-dark oneKey">Admin</button>
        
      </div>
      
      
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      
      <script>
      var userName = $('.userName')
      var pwd = $('.pwd')
      
      
      $(document).on('click','.oneKey',function(){
    	if($(this).text()=='School'){
    		console.log('schooooooooool')
    		userName.val('AA002')
    		pwd.val('abc12345')
    		
    	}
    	else if($(this).text()=='Teacher'){
    		console.log('Teacheeeeeeeeeer')
    		userName.val('BA001')
    		pwd.val('abc12345')
    	}
    	
      	else if($(this).text()=='Student'){
    		console.log('Studennnnnnnnnt')
    		userName.val('CA001')
    		pwd.val('abc12345')
    	}
       	else if($(this).text()=='Parent'){
    		console.log('Parennnnnnnnnnnt')
    		userName.val('DA001')
    		pwd.val('abc12345')
    	}
       	else if($(this).text()=='Admin'){
    		console.log('Parennnnnnnnnnnt')
    		userName.val('admin')
    		pwd.val('abc12345')
    	}
    	  
    	  
      })
      
      
      </script>
    </body>

    </html>