<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="resources/style/default.css" rel="stylesheet">
<link type="text/css" href="resources/style/common.css" rel="stylesheet">
<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="resources/style/design.css" rel="stylesheet">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>QRCode</title>
</head>
<body>
<div class="printNone">
<button type="button" class="marginLeft_50 marginTop_10" onclick="window.print(); return false;" style="border: 1px solid;border-radius: 3px;padding: 3px; "><i class="fas fa-file-powerpoint"></i>&nbsp;출력</button>
<hr/>
</div>
<div style="text-align: center;">
	<br><h1>QR코드를 스캔해주세요.</h1><br>
	<div><img src="resources/images/phone.png" style="position: relative; width: 300px;height: 530px;z-index:2;" ></div>
	<img id="QrImg" src="${param.Url }" style="position: relative; top: -430px;z-index: 1;">
	<pre style="position: relative;top:-250px;">스마트폰 카메라 또는 네이버 QR코드 스캔을 이용해서 <br> QR코드를 스캔 후<br> 이름, 온도, 전화번호를 입력해 주세요. </pre>
</div>
</body>
</html>