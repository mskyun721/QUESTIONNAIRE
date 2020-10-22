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
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/script/corpManage.js"></script>
<script>
        $(function() {

            $('.btn_menu').click(function() {
                if ($(this).hasClass('on')) {
                    $('nav.btm').slideUp(200);
                    $(this).removeClass('on');
                } else {
                    $('nav.btm').slideDown(200);
                    $(this).addClass('on');
                }
            });

            $(window).resize(function() {
                var winW = $(window).width();
                if (winW > 991) {
                    $('nav.btm').show();
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
      <div class="breadcrumb">
      <h2><i class="fas fa-building"></i> 사업장 등록</h2>
      </div>
      	<form>
        <div class="Search_set">
            <select id="condition" name="condition">
				<option value="0" selected>사업장명</option>
				<option value="1">대표자</option>
				<option value="2">사업자번호</option>
				<option value="3">업종/업태</option>
			</select>
            <input type="text" placeholder="Search.." name="value" id="value" value="${param.value }">
            <button type="submit" class="bt_search"><i class="fa fa-search"></i></button>
            <button type="button" class="bt_add" id="add"><i class="fas fa-plus"> 추가</i></button>
            <c:if test="${param.condition==null }"><input type="hidden" value="0" id="conditionParam"></c:if>
			<c:if test="${param.condition!=null }"><input type="hidden" value="${param.condition }" id="conditionParam"></c:if>
        </div>
        </form>
        <div class="rightcolumn">
            <table >
                <tr>
                    <th>NO</th>
                    <th>사업장명</th>
                    <th>사업장코드</th>
                    <th>대표자</th>
                    <th>사업자번호</th>
                    <th>업종</th>
                    <th>업태</th>
                    <th>전화번호</th>
                    <th>팩스번호</th>
                    <th>우편번호</th>
                    <th>주소</th>
                    <th>비고</th>
                    <th>출력</th>
                    <th>편집</th>
                    <th>삭제</th>
                </tr>
                <c:forEach items="${corpList }" var="list" varStatus="i">
					<tr><td>${i.index+1 }</td>
						<td>${list.UNTNM }</td>
						<td>${list.UNTCD }</td>
						<td>${list.UNTCEO }</td>
						<td>${list.BIZNO }</td>
						<td>${list.BIZITEM }</td>
						<td>${list.BIZKIND }</td>
						<td>${list.TELNO }</td>
						<td>${list.FAXNO }</td>
						<td>${list.ZIPNO }</td>
						<td>${list.ADDR }&nbsp;${list.ADDRDET }</td>
						<td>${list.REMARK }</td>
						<td><button type="button" id="QrCode${i.index }" style="background: white;"><i class="fas fa-file-powerpoint"></i>&nbsp;QRprt</button></td>
						<td><button type="button" id="edit${i.index }" style="background: white;"><i class="fas fa-edit"></i>Edit</button></td>
						<td><button type="button" id="btnDel${i.index }" style="background: white;"><i class="fas fa-trash-alt"></i>&nbsp;Del</button>
							<input type="hidden" id="delRow${i.index }" value="${list.UNTCD }"></td></tr>
				</c:forEach>
            </table>

        </div>
    </div>
<div class="footer">
    <address>Copyright © 2020 Company</address>
</div>

<%-- 
<div class="printNone">

</div>
<div class="row printNone">
	<div>
		<div class="card">
			<h3><i class="fas fa-caret-right"></i>사업장등록</h3>
			<hr />
			<div class="searchBox">
				<form>
				<div style="display: inline;" class="marginLeft_10">
				
				
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
					<tr><th style="width: 3%"></th>
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
<!-- footer -->
<jsp:include page="public/footer.jsp"/>
<!-- footer --> --%>
</body>
</html>