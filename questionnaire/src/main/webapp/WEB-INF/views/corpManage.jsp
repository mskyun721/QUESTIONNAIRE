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
		var result = $('#delRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delMst",
				type:"get",
				data:{UNTCD:result},
				success:function(data){
					location.reload();
				}
			});
		}
		
	});
	
	var conditionParam = $('#conditionParam').val();
	$('#condition').val(conditionParam).attr("selected");
	
	$('#add').click(function(){
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('corpManageForm','_blank','width=580, height=390, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var result = $('#delRow'+num).val();
		
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('corpManageForm?UNTCD='+result,'_blank','width=580, height=390, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=QrCode]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("QrCode","");
		var result = $('#delRow'+num).val();
		var strUrl = "QrCode/"+result;
		$.ajax({
			url:strUrl,
			type:"get",
			data:{untcd:result},
			success:function(data){
				window.open('QRCodePrintForm?Url='+strUrl, 'Print', 'Width=700, height=1000');
				
			},
			error:function(data){
				alert("error");
			}
		});
		
	});
	
});
</script>
</head>
<body>
<div class="printNone">
<!-- header -->
<jsp:include page="public/header.jsp"/>
<!-- header -->
</div>
<div class="row printNone">
	<div>
		<div class="card">
			<h3><i class="fas fa-caret-right"></i>사업장등록</h3>
			<hr />
			<div class="searchBox">
				<form>
				<div style="display: inline;" class="marginLeft_10">
				<select style="width: 70px;" id="condition" name="condition">
					<option value="0" selected>사업장명</option>
					<option value="1">대표자</option>
					<option value="2">사업자번호</option>
					<option value="3">업종/업태</option>
				</select>
				
				<input type="text" name="value" id="value" value="${param.value }">&nbsp;&nbsp;
				<button type="submit" ><i class="fas fa-search"></i>&nbsp;Sch</button>
				</div>
				<c:if test="${param.condition==null }"><input type="hidden" value="0" id="conditionParam"></c:if>
				<c:if test="${param.condition!=null }"><input type="hidden" value="${param.condition }" id="conditionParam"></c:if>
				
				</form>
			</div>
			<div>
				<table class="table100">
				<thead>
					<tr><th style="width: 3%"><button type="button" id="add" style="background-color: #1467b3;color: white;"><i class="fas fa-plus-square"></i>&nbsp;Add</button></th>
						<th style="width: 2%">No.</th>
						<th style="width: 7%">사업장명</th>
						<th style="width: 5%">대표자</th>
						<th style="width: 8%">사업자번호</th>
						<th style="width: 8%">업종</th>
						<th style="width: 8%">업태</th>
						<th style="width: 8%">전화번호</th>
						<th style="width: 8%">팩스번호</th>
						<th style="width: 5%">우편 번호</th>
						<th style="width: 20%">주소</th>
						<th style="width: 10%">비고</th>
						<th style="width: 5%">QR출력</th>
						<th style="width: 3%"></th></tr>
					<!-- <tr><td></td>
						<td><input type="text" readonly="readonly"></td>
						<td><input type="text" name="UNTNM" id="UNTNM"></td>
						<td><input type="text" name="UNTCEO" id="UNTCEO"></td>
						<td><input type="text" name="BIZNO" id="BIZNO"></td>
						<td><input type="text" name="BIZITEM" id="BIZITEM"></td>
						<td><input type="text" name="BIZKIND" id="BIZKIND"></td>
						<td><input type="text" name="TELNO" id="TELNO"></td>
						<td><input type="text" name="FAXNO" id="FAXNO"></td>
						<td><input type="text" name="ZIPNO" id="ZIPNO"></td>
						<td><input type="text" name="ADDR" id="ADDR"></td>
						<tD><input type="text" name="REMARK" id="REMARK"></td>
						<td></td>
						</tr> -->
				</thead>
					<tbody>
						<c:forEach items="${corpList }" var="list" varStatus="i">
						<tr><td><button type="button" id="edit${i.index }"><i class="fas fa-edit"></i>Edit</button></td>
							<td>${i.index+1 }</td>
							<td>${list.UNTNM }</td>
							<td>${list.UNTCEO }</td>
							<td>${list.BIZNO }</td>
							<td>${list.BIZITEM }</td>
							<td>${list.BIZKIND }</td>
							<td>${list.TELNO }</td>
							<td>${list.FAXNO }</td>
							<td>${list.ZIPNO }</td>
							<td>${list.ADDR }&nbsp;${list.ADDRDET }</td>
							<td>${list.REMARK }</td>
							<td><button type="button" id="QrCode${i.index }"><i class="fas fa-file-powerpoint"></i>&nbsp;QRprt</button></td>
							<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
								<input type="hidden" id="delRow${i.index }" value="${list.UNTCD }"></td></tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
</div>
<div>
<div><img id="QrImg" src=""></div>
</div>
</body>
</html>