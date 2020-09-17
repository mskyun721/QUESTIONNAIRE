<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
		var UNTCDresult = $('#UNTCDRow'+num).val();
		var USERIDresult = $('#USERIDRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delUser",
				type:"get",
				data:{UNTCD:UNTCDresult,USERID:USERIDresult},
				success:function(rdata){
					location.reload();
				}
			});
		}
		
	});
	var paramDptnm = $('#paramDPTNM').val();
	var EMPNM = $('#EMPNM').val();
	$('#DPTNM').val(paramDptnm).attr("selected");
	
	$('#DPTNM').change(function(){
		var DPTNM = $(this).val();
		if (EMPNM != null) {
			location.href="/question/addUser?DPTNM="+DPTNM+"&EMPNM="+EMPNM;
		}else{
			location.href="/question/addUser?DPTNM="+DPTNM;	
		}
		
	});
	
	var conditionParam = $('#conditionParam').val();
	$('#condition').val(conditionParam).attr("selected");
	
	$('#add').click(function(){
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('userForm','_blank','width=320, height=340, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var userid = $('#USERIDRow'+num).val();
		var userpw = $('#USERPWRow'+num).val();
		
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('userForm?USERID='+userid+'&USERPW='+userpw,'_blank','width=320, height=340, left='+popUpX+', top='+popUpY);
	});
	
});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="public/header.jsp"/>
<!-- header -->
<div class="row">
	<div>
		<div class="card">
			<h3><i class="fas fa-caret-right"></i> 사용자 등록</h3>
			<hr />
			<c:if test="${sessionScope.userID == 'sunsoft' }">
			<div class="searchBox">
				<form>
				<div style="display: inline;" class="marginLeft_10">
				<select style="width: 70px;" id="condition" name="condition">
					<option value="0" selected>사업장명</option>
					<option value="1">아이디</option>
					<option value="2">이름</option>
					<option value="3">부서</option>
				</select>
				
				<input type="text" name="value" id="value" value="${param.value }">&nbsp;&nbsp;
				<button type="submit" ><i class="fas fa-search"></i>&nbsp;Sch</button>
				</div>
				<c:if test="${param.condition==null }"><input type="hidden" value="0" id="conditionParam"></c:if>
				<c:if test="${param.condition!=null }"><input type="hidden" value="${param.condition }" id="conditionParam"></c:if>
				
				</form>
			</div>
			</c:if>
			<c:if test="${sessionScope.userID != 'sunsoft' }">
			<div class="searchBox">
				<form>
				<div style="display: inline;" class="marginLeft_10">
				<p style="display: inline;">부서</p>&nbsp;&nbsp;&nbsp;
				<select style="width: 70px;" id="DPTNM" name="DPTNM">
					<c:if test="${param.DPTNM == null }"><option value="" selected>전체</option></c:if>
					<c:if test="${param.DPTNM != null }"><option value="">전체</option></c:if>
					<c:forEach items="${dptList}" var="dpt">
						<option value="${dpt.DPTNM }">${dpt.DPTNM }</option>
					</c:forEach>
				</select>
				<input type="hidden" value="${param.DPTNM }" id="paramDPTNM">
				</div>
				<div style="display: inline;margin-left: 10em;">
				<p style="display: inline;">사원명</p>&nbsp;&nbsp;&nbsp;
				<input type="text" size="10" id="EMPNM" name="EMPNM" value="${param.EMPNM }">&nbsp;&nbsp;<button type="submit" ><i class="fas fa-search"></i>&nbsp;Sch</button>
				</div>
				</form>
			</div>
			</c:if>
			<div>
				<form method="post" action="searchUser">
				<table class="table100">
					<thead>
						<tr><th style="width: 5%"><button type="button" id="add" style="background-color: #1467b3;color: white;"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;Add</button></th>
							<th style="width: 5%">NO.</th>
							<th style="width: 10%">사업장</th>
							<th style="width: 10%">ID</th>
							<th style="width: 10%">Password</th>
							<th style="width: 10%">이름</th>
							<th style="width: 10%">부서</th>
							<th style="width: 15%">H.P</th>
							<th style="width: 20%">비고</th>
							<th style="width: 5%"></th></tr>
					</thead>
					<tbody>
					<c:forEach items="${userList }" var="user" varStatus="i">
						<tr><td width="30"><button type="button" id="edit${i.index }"><i class="fas fa-edit"></i>&nbsp;Edit</button></td>
						<td>${i.index+1 }</td>
						<td>${user.UNTNM }</td>
						<td>${user.USERID }</td>
						<td>*****</td>
						<td>${user.EMPNM }</td>
						<td>${user.DPTNM }</td>
						<td>${user.HPNO }</td>
						<td>${user.REMARK }</td>
						<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
							<input type="hidden" id="UNTCDRow${i.index }" value="${user.UNTCD }">
							<input type="hidden" id="USERIDRow${i.index }" value="${user.USERID }">
							<input type="hidden" id="USERPWRow${i.index }" value="${user.USERPW }"></td></tr>
					</c:forEach>
					</tbody>
				</table>
				</form>
			</div><!-- table end -->
		</div>
	</div>
</div>
<!-- footer -->
<jsp:include page="public/footer.jsp"/>
<!-- footer -->
</body>
</html>