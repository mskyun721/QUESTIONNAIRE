<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link type="text/css" href="resources/style/default.css" rel="stylesheet">
<link type="text/css" href="resources/style/common.css" rel="stylesheet">
<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="resources/style/design.css" rel="stylesheet">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("[id^=btnDel]").click(function () {
		var confirmResult = confirm("삭제하시겠습니까?");
		var id = $(this).attr("id");
		var num = id.replace("btnDel","");
		var result = $('#delRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delCorp",
				type:"get",
				data:{CSTCD:result},
				success:function(data){
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
<jsp:include page="public/header.jsp"/>
<!-- header -->
<div class="row">
	<!-- sidebar -->
	<jsp:include page="public/sidebar.jsp"/>
	<!-- sidebar -->
	<div class="rightcolumn">
		<div class="card">
			<h3><i class="fas fa-caret-right"></i>사업장등록</h3>
			<hr />
		
			<div>
				<form method="GET">
				<table class="table100">
				<thead>
					<tr><th style="width: 3%"></th>
						<th style="width: 2%">No.</th>
						<th style="width: 7%">사업장명</th>
						<th style="width: 5%">대표자</th>
						<th style="width: 8%">사업자번호</th>
						<th style="width: 8%">법인번호</th>
						<th style="width: 5%">업종</th>
						<th style="width: 5%">업태</th>
						<th style="width: 10%">전화번호</th>
						<th style="width: 10%">팩스번호</th>
						<th style="width: 5%">우편 번호</th>
						<th style="width: 15%">주소</th>
						<th style="width: 15%">비고</th>
						<th style="width: 3%"></th></tr>
					<tr><td><button type="button" onclick="window.open('corpManageForm','_blank','width=585, height=390'); return false"><i class="fas fa-plus-square"></i>Add</button></td>
						<td><input type="text" size="1" readonly="readonly"></td>
						<td><input type="text" size="10" name="UNTNM" id="UNTNM"></td>
						<td><input type="text" size="2" name="UNTCEO" id="UNTCEO"></td>
						<td><input type="text" size="10" name="BIZNO" id="BIZNO"></td>
						<td><input type="text" size="10" name="CORPNO" id="CORPNO"></td>
						<td><input type="text" size="5" name="BIZITEM" id="BIZITEM"></td>
						<td><input type="text" size="5" name="BIZKIND" id="BIZKIND"></td>
						<td><input type="text" size="20" name="TELNO" id="TELNO"></td>
						<td><input type="text" size="20" name="FAXNO" id="FAXNO"></td>
						<td><input type="text" size="7" name="ZIPNO" id="ZIPNO"></td>
						<td><input type="text" size="40" name="ADDR" id="ADDR"></td>
						<tD><input type="text" size="10"name="REMARK" id="REMARK"></td>
						<td><button type="submit"><i class="fas fa-search"></i><br>검색</button></td>
						</tr>
				</thead>
					<tbody>
						<c:forEach items="${corpList }" var="list" varStatus="i">
						<tr><td><button type="button" 
									onclick="window.open('corpManageForm?UNTCD=${list.UNTCD}',
									'_blank','width=585, height=390'); return false"><i class="fas fa-edit"></i>Edit</button></td>
							<td>${i.index+1 }</td>
							<td>${list.UNTNM }</td>
							<td>${list.UNTCEO }</td>
							<td>${list.BIZNO }</td>
							<td>${list.CORPNO }</td>
							<td>${list.BIZITEM }</td>
							<td>${list.BIZKIND }</td>
							<td>${list.TELNO }</td>
							<td>${list.FAXNO }</td>
							<td>${list.ZIPNO }</td>
							<td>${list.ADDR }&nbsp;${list.ADDRDET }</td>
							<td>${list.REMARK }</td>
							<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i><br>Del</button>
								<input type="hidden" id="delRow${i.index }" value="${list.UNTCD }"></td></tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>