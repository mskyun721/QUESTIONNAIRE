<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" href="../resources/style/default.css" rel="stylesheet">
<link type="text/css" href="../resources/style/common.css" rel="stylesheet">
<link type="text/css" href="../resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="../resources/style/design.css" rel="stylesheet">
<!-- <link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css"> -->
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#USETYPE').change(function(){
		var USETYPE = $(this).val();
		location.href="/question/survey/addQuestion?USETYPE="+USETYPE;
	});
	
	$("[id^=btnDel]").click(function () {
		var confirmResult = confirm("삭제하시겠습니까?");
		var id = $(this).attr("id");
		var num = id.replace("btnDel","");
		var UNTCDresult = $('#UNTCDRow'+num).val();
		var QUESEQresult = $('#QUESEQRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delQuestion",
				type:"get",
				data:{UNTCD:UNTCDresult,QUESEQ:QUESEQresult},
				success:function(rdata){
					location.reload();
				}
			});
		}
		
	});
	
	var popUpX = (window.screen.width/2)-400;
	var popUpY = (window.screen.height/2)-250;
	$('#add').click(function(){
		window.open('questionForm','_blank','width=790, height=480, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var untcd = $('#UNTCDRow'+num).val();
		var queseq = $('#QUESEQRow'+num).val();
		
		window.open('questionForm?UNTCD='+untcd+'&QUESEQ='+queseq,'_blank','width=790, height=480, left='+popUpX+', top='+popUpY);
	});
	
	
});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="../public/header.jsp"/>
<!-- header -->
<div class="row">
	<div class="breadcrumb">
		<h2><i class="fas fa-clipboard"></i> 설문 등록</h2>
	</div>
	<%--<div class="searchBox">
	 <form >
		<c:if test="${sessionScope.userID == 'sunsoft' }">
			<span>사업장명</span>&nbsp;&nbsp;
			&nbsp;<input type="text" size="10" name="UNTNM" id="UNTNM" value="${param.UNTNM }">
			<button type="submit" ><i class="fas fa-search"></i>&nbsp;Sch</button>
			&nbsp;&nbsp;<span style="margin-left: 10em;">사용구분</span>&nbsp;&nbsp;
		</c:if>
		<c:if test="${sessionScope.userID !='sunsoft' }">
			&nbsp;&nbsp;<span>사용구분</span>&nbsp;&nbsp;
		</c:if>
			<c:choose>
			<c:when test="${param.USETYPE == 'Y' }">
				<select id="USETYPE" name="USETYPE" style="width: 50px;">
					<option value="Y" selected>Y</option>
					<option value="N">N</option>
				</select>
			</c:when>
			<c:when test="${param.USETYPE == 'N' }">
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
	</form>
	</div> --%>
	<form>
		<div class="Search_set">
			<c:if test="${sessionScope.userID == 'sunsoft' }">
			<span>사업장명</span>&nbsp;&nbsp;
			&nbsp;<input type="text" size="10" name="UNTNM" id="UNTNM" value="${param.UNTNM }">
			<button type="submit" class="bt_search"><i class="fa fa-search"></i></button>
			&nbsp;&nbsp;<span style="margin-left: 10em;">사용구분</span>&nbsp;&nbsp;
		</c:if>
		<c:if test="${sessionScope.userID !='sunsoft' }">
			&nbsp;&nbsp;<span>사용구분</span>&nbsp;&nbsp;
		</c:if>
			<c:choose>
			<c:when test="${param.USETYPE == 'Y' }">
				<select id="USETYPE" name="USETYPE" style="width: 50px;">
					<option value="Y" selected>Y</option>
					<option value="N">N</option>
				</select>
			</c:when>
			<c:when test="${param.USETYPE == 'N' }">
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
		
		<button type="submit" class="bt_add" id="add"><i class="fas fa-plus"> 추가</i></button>
		</div>
	</form>
	<div class="rightcolumn">
		<table >
			<tr><c:if test="${sessionScope.userID == 'sunsoft' }"><th>사업장</th></c:if>
				<th style="width: 8%;">번호</th>
				<th style="width: 40%;">질문내용</th>
				<th style="width: 20%;">비고</th>
				<th style="width: 10%;">사용여부</th>
				<th style="width: 5%;">편집</th>
				<th style="width: 5%;">삭제</th></tr>
			<c:forEach items="${questionList }" var="list" varStatus="i">
				<tr>
				<c:if test="${sessionScope.userID == 'sunsoft' }"><td>${list.UNTNM }</td></c:if>
				<td>${list.QUENO }</td>
				<td style="text-align: left;">${list.QUECONT }</td>
				<td>${list.REMARK }</td>
				<td>${list.USETYPE }</td>
				<td width="30"><button type="button" id="edit${i.index }"><i class="fas fa-edit"></i>&nbsp;Edit</button></td>
				<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
					<input type="hidden" id="UNTCDRow${i.index }" value="${list.UNTCD }">
					<input type="hidden" id="QUESEQRow${i.index }" value="${list.QUESEQ }"></td></tr>
			</c:forEach>
		</table>
	</div><!-- table end -->
</div>
<!-- footer -->
<jsp:include page="../public/footer.jsp"/>
<!-- footer -->
</body>
</html>