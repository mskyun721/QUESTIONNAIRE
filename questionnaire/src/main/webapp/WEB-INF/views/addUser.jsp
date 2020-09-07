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
				url:"delUser",
				type:"get",
				data:{USERID:result},
				success:function(data){
					location.reload();
				}
			});
		}
		
	});
	function InsertAlert(insertType) {
		if (insertType == "I") {
			alert("추가 되었습니다.")
		}else {
			alert("수정 되었습니다.")
		}
	}
	
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
			<h3><i class="fas fa-caret-right"></i> 사용자 등록</h3>
			<hr />
			<div>
				<form method="post" action="searchUser">
				<table class="table100">
					<thead class="tableSection">
						<tr><th style="width: 5%"></th>
							<th style="width: 5%">NO.</th>
							<th style="width: 10%">ID</th>
							<th style="width: 10%">PassWord</th>
							<th style="width: 15%">이름</th>
							<th style="width: 15%">부서</th>
							<th style="width: 15%">H.P</th>
							<th style="width: 20%">비고</th>
							<th style="width: 5%"></th></tr>
						<tr><td><button type="button" onclick="window.open('userForm','_blank','width=300, height=350'); return false"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;Add</button></td>
							<td><input type="text" size="1" readonly="readonly"></td>
							<td><input type="text" size="4" name="USERID" value="" id="USERID"></td>
							<td><input type="text" size="4" name="USERPW" value="" id="USERPW"></td>
							<td><input type="text" size="4" name="EMPNM" value="" id="USERNM"></td>
							<td><input type="text" size="3" name="DPTNM" value="" id="DPTNM"></td>
							<td><input type="text" size="1" name="HPNO" value="" id="HPNO"></td>
							<td><input type="text" size="7" name="REMAKR" value="" id="REMAKR"></td>
							<td><button type="submit"><i class="fas fa-search"></i>&nbsp;검색</button></td>
							</tr>
					</thead>
					<tbody>
					<c:forEach items="${userList }" var="user" varStatus="i">
						<tr><td width="30"><button type="button" onclick="window.open('userForm?USERID=${user.USERID}&USERPW=${user.USERPW}','_blank','width=300, height=350'); return false"><i class="fas fa-edit"></i>&nbsp;Edit</button></td>
						<td>${i.index+1 }</td>
						<td>${user.USERID }</td>
						<td>${user.USERPW }</td>
						<td>${user.EMPNM }</td>
						<td>${user.DPTNM }</td>
						<td>${user.HPNO }</td>
						<td>${user.REMARK }</td>
						<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
							<input type="hidden" id="delRow${i.index }" value="${user.USERID }"></td></tr>
					</c:forEach>
					</tbody>
				</table>
				</form>
			</div><!-- table end -->
		</div>
	</div>
</div>
</body>
</html>