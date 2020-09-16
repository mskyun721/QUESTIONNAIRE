<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					window.close();
				}
			});
		}
	});
	
});
</script>
<style>
@font-face {
    font-family: 'NotoSansCJKkr-Regular';
    src: url("../resources/font/NotoSansCJKkr-Regular.otf") format("opentype");
}
body {font-family: NotoSansCJKkr-Regular;
background-image:url(../resources/images/bg1.JPG);font-size:14px;
    background-repeat: no-repeat; background-size:cover;
    background-position: 50% 0;
}

header{width:800px;margin:0 auto;}
.container {
  width:100%;
  background-color:#fff;
   margin-top:20px;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.row  { width:90%; min-height:500px;padding:30px; margin:20px;   }
.row h1 { text-align: center; color:#777;} 
input[type=text], input[type=password] {
  width: 70%;
  padding: 5px 10px;
  margin: 5px 0;
  display: inline-block;  
  box-sizing: border-box;
  border: none;
  border-bottom: 1px solid #ddd;
}

button {
  background-color: #4aacbd;
  color: white;
  padding: 15px;
  margin: 20px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  font-size:16px;
  border-radius: 5px;
}
button:hover {
  opacity: 0.8;
  border-radius: 5px;
}
span.psw {
  float: right;
}

footer {clear: both; width: 100%; height:50px; text-align: center; font-size:12px; color:#fff;} 

/* Change styles for span and cancel button on extra small screens */

@media screen and (max-width: 768px) {
  span.psw {
     display: block;
     float: none;
  }
header{width:80%;margin:auto;}
.container {
  width:100%;
  background-color:#fff;
   margin-top:100px;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.row  { width:85%; height:150px; padding:15px; margin:20px;   } 
}
@media screen and (max-width: 480px) {
  span.psw {
     display: block;
     float: none;
  }
header{width:280px;margin:auto;}
.container {
  width:100%;
  background-color:#fff;
   margin-top:80px;
  border-radius: 10px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.row  { width:80%; height:400px; padding:10px; margin:15px;   }
  
}

</style>
</head>
<body>
	<header>
		<div class="container">
			<div class="row">
				<h1 style="text-align: left;">설문지 제목</h1><br>
				<pre>설문 내용 <br> 설문내용 설명입니다.<br> 설문내용 설명입니다.<br> 설문내용 설명입니다.<br> 설문내용 설명입니다.</pre>
				<br><hr/>
				<span>이름 : ${param.QUEEMPNM}</span><span style="margin-left: 5em;">온도 : ${param.TEMPERATURE}</span>
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
	
	</footer>
</body>
</html>