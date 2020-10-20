<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<link href="../resources/style/guest_ask.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var strBuffType = "";
	var strBuffRemark = "";
	var count = $('#listCount').val();
	var untcd = $('#UNTCD').val();
	var hpno = $('#QUEHPNO').val();
	var arrCheck = new Array(count);
	var allCheck = false;
	
	$('#check').click(function () {
		
		for(var i = 0; i<count; i++){
			arrCheck[i] = $("input:radio[name=QUEINTYPE"+i+"]").is(':checked');
			if (!arrCheck[i]) {
				alert((i+1)+"번 질문에 답해주세요.");
				allCheck=false;
				strBuffType="";
				strBuffRemark="";
				break;
			}else{
				var type = $("input:radio[name=QUEINTYPE"+i+"]:checked").val();
				var remark = $('#QUEREMARK'+i).val();
				strBuffType += type+"/";
				if (remark=="") {
					strBuffRemark += " /";
				}else{
					strBuffRemark += remark+"/";
				}
				allCheck=true;
			}
			
		};
		if (allCheck) {
			$.ajax({
				url:"insertResearch",
				type:"get",
				data:{QUEINTYPE:strBuffType,UNTCD:untcd,QUEHPNO:hpno,QUEREMARK:strBuffRemark},
				success:function(rdata){
					alert("설문조사 완료되었습니다.");
					window.opener.location.reload();
					window.close();
				}
			});
		}
	});
	
});
</script>

</head>
<body>
<div id="wrap">
	<div class="inner">
		<header id="title">
			<div class="logo"><a href="#"><img src="../resources/images/logo.png" alt="로고입니다."></a></div>
			<div class="top_title">
				<h1>${param.QUEEMPNM} /${param.TEMPERATURE} &#176 </h1>
				<span class="b_dot"></span>
				<span class="dot"></span>
				<span class="b_dot"></span>
			</div>
		</header>
		<article id="contents">
			<section id="contents_q">
				<h3>QR코드 전자출입명부란?</h3>
				<p>QR코드 전자출입명부는 기존에 공공장소에 입장하기 위해 수기로 작성했던 개인정보의 문제점을
				    보완하기 위한 방법으로 수기로 작성 시 필기구를 통한 코로나 감염방지 및 개인 정보 유출에 대한
				    문제점을 보완했습니다.</p>
			</section>
			<form action="testResult">
				<section id="contents_a">
				<div class="inbox">
					<h3>${list.QUENO }1.${list.QUECONT }질문</h3>
					<label class="radio-inline">
						<input type="radio" name="QUEINTYPE${i.index}" value="0"> 예
					</label>
					<label class="radio-inline">
						<input type="radio" name="QUEINTYPE${i.index}" value="1"> 아니오
					</label>
					<label class="radio-inline">
						기타 <input type="text" name="QUEREMARK" id="QUEREMARK${i.index}" style="border: 1px solid">
					</label>
					<input type="hidden" id="listCount" value="${listCount }">
					<input type="hidden" id="QUEHPNO" value="${param.QUEHPNO }">
				</div>
			</section>
				<c:if test="${sessionScope.untcd != null}"><input type="hidden" id="UNTCD" name="UNTCD" value="${sessionScope.untcd }"></c:if>
				<c:if test="${sessionScope.untcd == null}"><input type="hidden" id="UNTCD" name="UNTCD" value="${param.UNTCD }"></c:if>
				<div><button type="button" id="check" class="btn success">확인</button></div>
			</form>
			
		</article>
	</div>
</div>
    
    <%-- 
	<header>
		<div class="container">
			<div class="row">
				<h1 style="text-align: left;">설문지 제목</h1><br>
				<pre>설문 내용 <br> 설문내용 설명입니다.<br> 설문내용 설명입니다.<br> 설문내용 설명입니다.<br> 설문내용 설명입니다.</pre>
				<br><hr/>
				<span>이름 : </span><span style="margin-left: 5em;">온도 : </span>
				<br>
				<form action="testResult">
				<c:forEach items="${questionList}" var="list" varStatus="i">
					<div class="card">
						<span>${list.QUENO }.</span>&nbsp;&nbsp;<span>${list.QUECONT }</span><br>
						<input type="radio" name="QUEINTYPE${i.index}" value="0"><span>예</span><input type="radio" name="QUEINTYPE${i.index}" value="1" style="margin-left: 50px;"><span>아니요</span>
						<br><span>기타 내용</span><input type="text" name="QUEREMARK" id="QUEREMARK${i.index}">
					</div>
					
				</c:forEach>
				<input type="hidden" id="listCount" value="${listCount }">
				<input type="hidden" id="QUEHPNO" value="${param.QUEHPNO }">
				<c:if test="${sessionScope.untcd != null}"><input type="hidden" id="UNTCD" name="UNTCD" value="${sessionScope.untcd }"></c:if>
				<c:if test="${sessionScope.untcd == null}"><input type="hidden" id="UNTCD" name="UNTCD" value="${param.UNTCD }"></c:if>
				<div><button type="button" id="check">저장</button></div>
				</form>
			</div>
		</div>
	</header>
	<article>
	
	</article>
	<footer>
	
	</footer> --%>
</body>
</html>