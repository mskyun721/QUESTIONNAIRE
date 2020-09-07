<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
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
						<li><a href="/question/survey/addQuestion">설문 등록</a></li>
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
