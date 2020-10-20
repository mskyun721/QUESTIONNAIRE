<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link href="resources/font/fontawesome/css/all.css" rel="stylesheet" type="text/css">
<link href="resources/style/login.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
    <div id="login">
    <div class="row">
     <div class="col_l"></div>
     <div class="col_r">
      <h1 >로그인</h1>
      <div >
	<form method="post" action="loginCheck">
    <input type="text" placeholder="Username" name="uname" required>    
    <input type="password" placeholder="Password" name="psw" required>  
    <button type="submit">Login</button>
    
      <input type="checkbox" checked="checked" name="remember"> Remember me
   </form>
      </div>
      </div>  
    </div> 
        
        
    </div>


<footer>Copyright © 2020 Company</footer>
</div>
</body>
</html>
