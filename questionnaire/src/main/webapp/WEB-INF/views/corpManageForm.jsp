<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
	<div class="marginLeft_30 floatLeft"><h3>사업장 등록</h3></div>
</div>
<div class="clear"></div>
<div class="marginLeft_20">
	<form action="insertUNT" method="post" class="subPageForm">
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="UNTCD">사업장코드</label></div>
				<input type="text" size="10" name="UNTCD" required="required" value="${mstOne.UNTCD }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="UNTNM">사업장명</label></div>
				<input type="text" size="10" name="UNTNM" required="required" value="${mstOne.UNTNM }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="UNTCEO">대표자</label></div>
				<input type="text" size="10" name="UNTCEO" value="${mstOne.UNTCEO }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="BIZNO">사업자번호</label></div>
				<input type="text" size="10" name="BIZNO" value="${mstOne.BIZNO }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for=CORPNO>법인번호</label></div>
				<input type="text" size="10" name="CORPNO" value="${mstOne.CORPNO }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="BIZITEM">업태</label></div>
				<input type="text" size="10" name="BIZITEM" value="${mstOne.BIZITEM }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="BIZKIND">업종</label></div>
				<input type="text" size="10" name="BIZKIND" value="${mstOne.BIZKIND }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="TELNO">전화번호</label></div>
				<input type="text" size="10" name="TELNO" value="${mstOne.TELNO }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="FAXNO">팩스번호</label></div>
				<input type="text" size="10" name="FAXNO" value="${mstOne.FAXNO }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="lbWidth"><label for="ZIPNO">우편번호</label></div>
			<input type="text" size="5" name="ZIPNO" value="${mstOne.ZIPNO }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label for="ADDR">주소</label></div>
			<input type="text" size="30" name="ADDR" value="${mstOne.ADDR }"><br>
			<div class="lbWidth"><label></label></div>
			<input type="text" size="30" name="ADDRDET" value="${mstOne.ADDRDET }">
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label for="REMARK">비고</label></div>
			<textarea rows="5" cols="60" name="REMARK">${mstOne.REMARK }</textarea>
		</div>
		<div class="buttonBox">
		<button type="submit" id="">저장</button>&nbsp;
		<button type="button" onclick="window.close();">취소</button>&nbsp;
		</div>
	</form>
</div>
</body>
</html>