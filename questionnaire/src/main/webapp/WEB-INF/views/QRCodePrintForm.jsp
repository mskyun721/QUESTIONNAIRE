<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<title>QRCode</title>
</head>
<body>
<div class="printNone">
<button type="button" onclick="window.print(); return false;"><i class="fas fa-file-powerpoint"></i>&nbsp;출력</button>
<hr/>
</div>
<div style="text-align: center;">
	<h1>QR코드 전자출입명부 이용방법</h1>
	<div><img id="QrImg" src="${param.Url }"></div>
</div>
</body>
</html>