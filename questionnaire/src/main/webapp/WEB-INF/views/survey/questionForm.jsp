<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 등록</title>
<link type="text/css" href="../resources/style/default.css" rel="stylesheet">
<link type="text/css" href="../resources/style/common.css" rel="stylesheet">
<link type="text/css" href="../resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="../resources/style/design.css" rel="stylesheet">
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="popUpCard">
	<div>
		<h3 style="text-align: center;">질문 등록</h3><br>
	</div>
	<form action="insertQuestion" method="post" class="subPageForm">
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="QUENO">질문 번호</label></div>
				<input type="number" min="0" name="QUENO" required="required" value="${questionOne.QUENO }" style="width: 50px;">
				<c:if test="${questionOne.QUESEQ == null}"><input type="hidden" name="QUESEQ" value="0"></c:if>
				<c:if test="${questionOne.QUESEQ != null}"><input type="hidden" name="QUESEQ" value="${questionOne.QUESEQ }"></c:if>
				<c:if test="${questionOne.UNTCD == null}"><input type="hidden" name="UNTCD" value="${sessionScope.untcd }"></c:if>
				<c:if test="${questionOne.UNTCD != null}"><input type="hidden" name="UNTCD" value="${questionOne.UNTCD}"></c:if>
			</div>
			<div class="floatLeft marginLeft_30">
				<div class="lbWidth"><label for="USETYPE">사용여부</label></div>
				<c:choose>
					<c:when test="${questionOne.USETYPE == 'Y' }">
						<select id="USETYPE" name="USETYPE" style="width: 50px;">
							<option value="Y" selected>Y</option>
							<option value="N">N</option>
						</select>
					</c:when>
					<c:when test="${questionOne.USETYPE == 'N' }">
						<select id="USETYPE" name="USETYPE" style="width: 50px;">
							<option value="Y" >Y</option>
							<option value="N" selected>N</option>
						</select>
					</c:when>
					<c:otherwise>
						<select id="USETYPE" name="USETYPE" style="width: 50px;">
							<option value="Y" selected>Y</option>
							<option value="N">N</option>
						</select>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth verticalTop"><label for="QUECONT">질문 내용</label></div>
				<textarea rows="5" cols="50" name="QUECONT">${questionOne.QUECONT }</textarea>
			</div>
		</div>
		<div class="clear"></div>
		<br>
		<div class="buttonBox">
		<button type="submit"><i class="fas fa-save" style="font-size:15px;"></i>&nbsp;&nbsp;저장</button>&nbsp;
		<button type="button" onclick="window.close(); return false;"><i class="fas fa-window-close" style="font-size:15px;"></i>&nbsp;&nbsp;취소</button>
		</div>
	</form>
</div>
</body>
</html>