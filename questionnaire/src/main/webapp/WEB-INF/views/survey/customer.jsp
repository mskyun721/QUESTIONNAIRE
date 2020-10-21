<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<link href="../resources/font/fontawesome/css/all.css" rel="stylesheet" type="text/css">
<link href="../resources/style/login.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap_g">
	<div id="login">
		<div class="row">
			<div class="col_l_g"></div>
			<div class="col_r_g">
				<h1 >방문자 입력</h1>
				<div >
					<form method="post" action="research">
						<c:if test="${sessionScope.untcd != null}"><input type="text" name="UNTCD" value="${sessionScope.untcd }"></c:if>
						<c:if test="${sessionScope.untcd == null}"><input type="text" name="UNTCD" value="${param.UNTCD }"></c:if>
						<input type="text" placeholder="이름" name="QUEEMPNM" required>
						<br>
						<input type="text" placeholder="온도" name="TEMPERATURE" required>
						<br>
						<input type="text" placeholder="전화번호   ex)010-1234-5678" name="QUEHPNO" required>
						<button type="submit">등록</button>
					</form>
				</div>
			</div>  
		</div> 
	</div>
	
	<footer>Copyright © 2020 Company</footer>
</div>
<%-- <div class="container">
    <div class="row">
      <h1>설문조사</h1><br/>
      <div >
	<form method="post" action="research">
	<c:if test="${sessionScope.untcd != null}"><input type="hidden" name="UNTCD" value="${sessionScope.untcd }"></c:if>
	<c:if test="${sessionScope.untcd == null}"><input type="hidden" name="UNTCD" value="${param.UNTCD }"></c:if>
    <input type="text" placeholder="이름" name="QUEEMPNM" required>
    <br>
    <input type="text" placeholder="온도" name="TEMPERATURE" required>
    <br>
    <input type="text" placeholder="전화번호   ex)010-1234-5678" name="QUEHPNO" required>
    <button type="submit">설문 조사 시작</button>
    </form>
   
      </div>  
    </div>
</div> --%>
</body>
</html>
