<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="resources/style/default.css" rel="stylesheet">
<link type="text/css" href="resources/style/common.css" rel="stylesheet">
<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="resources/style/design.css" rel="stylesheet">
<link href="resources/font/fontawesome/css/all.css" rel="stylesheet" type="text/css">
<script src="resources/script/jquery.1.12.0.min.js"></script>
<script src="resources/script/script.js"></script>
<script type="text/javascript">
$(function(){
	$('.btn_menu').click(function(){
		if( $(this).hasClass('on') ){
			$('nav.btm').slideUp(200);
			$(this).removeClass('on');
		}else{
			$('nav.btm').slideDown(200);
			$(this).addClass('on');
		}
	});

	$(window).resize(function(){
		var winW = $(window).width();
		if( winW > 991 ){
			$('nav.btm').show();
		}
	});
});
</script>
</head>
<body>


<script>
	
</script>
<header>
	<div class="wrap">
		<div class="top">
			<a href="#" class="btn_menu"><i class="fa fa-bars"></i></a>
			<h1><a href="/question/Main"><img src="http://www.sunsoft.kr/images/sunsoft_logo.png" width="150" height="43" ></a></h1>
			<a href="#" class="btn_logout">로그아웃</a>
		</div>
		<nav class="btm">
			<ul>
				<li><a href="#">설문 내용 등록</a>
					<ul>
						<li><a href="/question/report/addReport">주간 업무일지</a></li>
					</ul>
				</li>
				<li>
					<a href="#">설문 현황</a>
					<ul>
                        <!-- <li><a href="/question/report/corpRequest">업체 요청 사항</a></li> -->
					</ul>
				</li>
				<li>
					<a href="#">기초코드관리</a>
					<ul>
                        <li><a href="/question/addUser">사용자 관리</a></li>
                        <li><a href="/question/corpManage">거래처 관리</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</header>
<!-- //end header -->
<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h3><i class="fas fa-caret-right"></i> Bookmark</h3>
    </div>
    <div class="card">
      <h3><i class="fas fa-caret-right"></i> Bookmark</h3>
    </div>
    <div class="card">
      <h3><i class="fas fa-caret-right"></i> Bookmark</h3>
    </div>
    <div class="card">
      <h3><i class="fas fa-caret-right"></i> Bookmark</h3>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h3><i class="fas fa-caret-right"></i> 매장별 검침등록</h3>
      <hr />
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
      </div>
   </div>
  </div>

<div class="footer">
  <address>Footer</address>
</div>
</body>
</html>