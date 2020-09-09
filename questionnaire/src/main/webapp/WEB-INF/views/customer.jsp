<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link href="resources/font/fontawesome/css/all.css" rel="stylesheet" type="text/css">
<style>
@font-face {
    font-family: 'NotoSansCJKkr-Regular';
    src: url("resources/font/NotoSansCJKkr-Regular.otf") format("opentype");
}
body {font-family: NotoSansCJKkr-Regular;
background-image:url(resources/images/bg1.JPG);font-size:14px;
    background-repeat: no-repeat; background-size:cover;
    background-position: 50% 0
}

header{width:550px;margin:0 auto;}
.container {
  width:100%;
  background-color:#fff;
   margin-top:150px;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.row  { width:85%; height:400px; padding:30px; margin:20px;   }
.row h1 { text-align: center; color:#777;} 
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;  
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid #ddd;
}

button {
  background-color: #4aacbd;
  color: white;
  padding: 15px;
  margin: 20px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  font-size:16px;
  border-radius: 5px;
}
button:hover {
  opacity: 0.8;
  border-radius: 5px;
}
span.psw {
  float: right;
}

footer {clear: both; width: 100%; height:50px; text-align: center; font-size:12px; color:#fff;} 

/* Change styles for span and cancel button on extra small screens */

@media screen and (max-width: 768px) {
  span.psw {
     display: block;
     float: none;
  }
header{width:80%;margin:auto;}
.container {
  width:100%;
  background-color:#fff;
   margin-top:100px;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.row  { width:85%; height:400px; padding:15px; margin:20px;   } 
}
@media screen and (max-width: 480px) {
  span.psw {
     display: block;
     float: none;
  }
header{width:280px;margin:auto;}
.container {
  width:100%;
  background-color:#fff;
   margin-top:80px;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.row  { width:80%; height:400px; padding:10px; margin:15px;   }
  
}

</style>
</head>
<body>
<header>
<div class="container">
    <div class="row">
      <h1>설문조사</h1><br/>
      <div >
	<form method="post" action="loginCheck">
    <input type="text" placeholder="이름" name="USERID" required>
    <br></br>
    
    <input type="text" placeholder="전화번호 ex)010-1234-5678" name="USERPW" required>
    <button type="submit">설문 조사 시작</button>
    </form>
      <input type="checkbox" checked="checked" name="remember"> Remember me
   
      </div>  
    </div>
</div>
</header>
<footer class="footer">Copyright © 2019 Company</footer>
</body>
</html>
