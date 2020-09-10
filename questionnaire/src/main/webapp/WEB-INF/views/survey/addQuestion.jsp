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
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#orderType').change(function(){
		var Type = $(this).val();
		var USETYPE = $('#USETYPE').val();
		location.href="/question/survey/addQuestion?orderType="+Type+"&USETYPE="+USETYPE;
	});
	
	$('#USETYPE').change(function(){
		var USETYPE = $(this).val();
		var Type = $('#orderType').val();
		location.href="/question/survey/addQuestion?orderType="+Type+"&USETYPE="+USETYPE;
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
	
	
});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="../public/header.jsp"/>
<!-- header -->
<div class="row">
	<!-- sidebar -->
	<jsp:include page="../public/sidebar.jsp"/>
	<!-- sidebar -->
	<div class="rightcolumn">
		<div class="card">
			<h3><i class="fas fa-caret-right"></i>설문 추가</h3>
			<hr />
			<div class="searchBox">
				<div>
					&nbsp;&nbsp;<p style="display: inline;">사용구분</p>&nbsp;&nbsp;
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
				</div>
			</div>
			<div>
				<form method="post" action="searchUser">
				<table class="table100">
					<thead class="tableSection">
						<tr><th style="width: 5%"><button type="button" onclick="window.open('questionForm','_blank','width=520, height=300'); return false" style="background-color: #1467b3;color: white;"><i class="fas fa-plus-square"></i>&nbsp;Add</button></th>
							<th style="width: 5%">질문번호</th>
							<th style="width: 50%">질문내용</th>
							<th style="width: 20%">비고</th>
							<th style="width: 10%">사용여부</th>
							<th style="width: 5%"></th></tr>
						<!-- <tr><td style="width: 5%"><button type="button" onclick="window.open('questionForm','_blank','width=520, height=300'); return false"><i class="fas fa-plus-square"></i>&nbsp;Add</button></td>
							<td style="width: 5%"><input type="text"></td>
							<td style="width: 5%"><input type="text"></td>
							<td style="width: 50%"><input type="text"></td>
							<td style="width: 20%"><input type="text"></td>
							<td style="width: 10%"><input type="text"></td>
							<td style="width: 5%"></td></tr> -->
					</thead>
					<tbody>
					<c:forEach items="${questionList }" var="list" varStatus="i">
						<tr><td width="30"><button type="button" onclick="window.open('questionForm?UNTCD=${list.UNTCD}&QUESEQ=${list.QUESEQ}','_blank','width=520, height=300'); return false"><i class="fas fa-edit"></i>&nbsp;Edit</button></td>
						<td>${list.QUENO }</td>
						<td style="text-align: left;">${list.QUECONT }</td>
						<td>${list.REMARK }</td>
						<td>${list.USETYPE }</td>
						<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
							<input type="hidden" id="UNTCDRow${i.index }" value="${list.UNTCD }">
							<input type="hidden" id="QUESEQRow${i.index }" value="${list.QUESEQ }"></td></tr>
					</c:forEach>
					</tbody>
				</table>
				</form>
			</div><!-- table end -->
		</div><!-- card end -->
	</div>
</div>
</body>
</html>