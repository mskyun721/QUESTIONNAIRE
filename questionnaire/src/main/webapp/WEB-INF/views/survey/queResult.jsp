<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$("[id^=detail]").click(function () {
		var id = $(this).attr("id");
		var num = id.replace("detail","");
		var untcd = $('#untcd'+num).val();
		var quedate = $('#quedate'+num).val();
		var quehpno = $('#quehpno'+num).val();
		var untnm = $('#UNTNM').val();
		var queempnm = $('#QUEEMPNM').val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		
		if (untnm !=null) {
			location.href="/question/survey/queResult?UNTNM="+untnm+"&STDATE="+stdate+"&LTDATE="+ltdate+"&UNTCD="+untcd+"&QUEDATE="+quedate+"&QUEHPNO="+quehpno;
		}else if(queempnm != null){
			location.href="/question/survey/queResult?QUEEMPNM="+queempnm+"&STDATE="+stdate+"&LTDATE="+ltdate+"&UNTCD="+untcd+"&QUEDATE="+quedate+"&QUEHPNO="+quehpno;	
		}
		

	});
	
	$('#STDATE').change(function(){
		var untnm = $('#UNTNM').val();
		var queempnm = $('#QUEEMPNM').val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		if (untnm !=null) {
			location.href="/question/survey/queResult?UNTNM="+untnm+"&STDATE="+stdate+"&LTDATE="+ltdate;
		}else if(queempnm != null){
			location.href="/question/survey/queResult?QUEEMPNM="+queempnm+"&STDATE="+stdate+"&LTDATE="+ltdate;	
		}
		
	});
	
	$('#LTDATE').change(function(){
		var untnm = $('#UNTNM').val();
		var queempnm = $('#QUEEMPNM').val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		
		if (untnm !=null) {
			location.href="/question/survey/queResult?UNTNM="+untnm+"&STDATE="+stdate+"&LTDATE="+ltdate;
		}else if(queempnm != null){
			location.href="/question/survey/queResult?QUEEMPNM="+queempnm+"&STDATE="+stdate+"&LTDATE="+ltdate;	
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
	<div style="float: left; width: 55%">
		<div class="card" >
			<h3><i class="fas fa-caret-right"></i>설문 현황</h3>
			<hr />
			<div class="searchBox">
			<form action="">
				<div style="display: inline;">
				<c:if test="${sessionScope.userID == 'sunsoft' }">
					&nbsp;&nbsp;<span>사업장명</span>&nbsp;&nbsp;
					<input type="text" size="10" name="UNTNM" id="UNTNM" value="${param.UNTNM }"><button type="submit" >&nbsp;&nbsp;<i class="fas fa-search"></i>&nbsp;Sch</button>
				</c:if>
				<c:if test="${sessionScope.userID != 'sunsoft' }">
					&nbsp;&nbsp;<span>방문자</span>&nbsp;&nbsp;
					<input type="text" size="10" name="QUEEMPNM" id="QUEEMPNM" value="${param.QUEEMPNM }"><button type="submit" >&nbsp;&nbsp;<i class="fas fa-search"></i>&nbsp;Sch</button>
				</c:if>
				</div>
				<div style="display: inline; margin-left: 10em;">
					<span>검색기간</span>&nbsp;&nbsp;
					<c:if test="${param.STDATE == null }"><input type="date" id="STDATE" name="STDATE" value="${stdate }"></c:if>
					<c:if test="${param.STDATE != null }"><input type="date" id="STDATE" name="STDATE" value="${param.STDATE }"></c:if>
					<span>&nbsp;&nbsp;~&nbsp;&nbsp;</span>
					<c:if test="${param.LTDATE == null }"><input type="date" id="LTDATE" name="LTDATE" value="${ltdate }"></c:if>
					<c:if test="${param.LTDATE != null }"><input type="date" id="LTDATE" name="LTDATE" value="${param.LTDATE }"></c:if>
					
				</div>
			</form>
			</div>
			<div>
				<table class="table100">
					<thead>
						<tr><c:if test="${sessionScope.userID == 'sunsoft' }"><th>방문사업장</th></c:if>
							<th>방문자</th>
							<th>연락처</th>
							<th>온도</th>
							<th>방문일</th>
							<th>설문내역 보기</th></tr>
					</thead>
					<tbody><c:forEach items="${qmList }" var="list" varStatus="i">
						<tr><c:if test="${sessionScope.userID == 'sunsoft' }"><td>${list.UNTNM }</td></c:if>
							<td>${list.QUEEMPNM }</td>
							<td>${list.QUEHPNO }</td>
							<td><fmt:formatNumber value="${list.TEMPERATURE }" pattern=".0"/>°C</td>
							<td>${list.QUEDATE }</td>
							<td><button id="detail${i.index }"><i class="fas fa-info-circle"></i>조회</button>
								<input type="hidden" id="untcd${i.index }" value="${list.UNTCD }">
								<input type="hidden" id="quedate${i.index }" value="${list.QUEDATE }">
								<input type="hidden" id="quehpno${i.index }" value="${list.QUEHPNO }"></td></tr>
					</c:forEach></tbody>
				</table>
			</div>
		</div><!-- card end -->
	</div>
	<div style="float: right; width: 45%">
		<div class="card" style="min-height: 30em;">
			<h3><i class="fas fa-caret-right"></i>세부 설문 내역</h3>
			<hr />
				<c:if test="${qhList != null }">
					<c:forEach items="${qhList}" var="list" varStatus="i">
						<div class="card">
							<span>${list.QUEHISSEQ }.</span>&nbsp;&nbsp;<span>${list.QUECONT }</span><br>
							<c:if test="${list.QUEINTYPE == '0' }"><span>답변 : 예</span></c:if>
							<c:if test="${list.QUEINTYPE == '1' }"><span>답변 : 아니요</span></c:if>
							<c:if test="${list.QUEREMARK != ' '}"><pre style="display: inline; margin-left: 5em;">${list.QUEREMARK }</pre></c:if>
						</div>
						
					</c:forEach>
				</c:if>
		</div>
	</div>
</div>
<!-- footer -->
<jsp:include page="../public/footer.jsp"/>
<!-- footer -->
</body>
</html>