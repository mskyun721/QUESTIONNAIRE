<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <div class="wrap">
        <div class="top">
            <a href="#" class="btn_menu"><i class="fa fa-bars"></i></a>
            <h1><a href="/question/Main"><img src="/question/resources/images/logo.png" width="150" height="43"></a></h1>
            <h2>${sessionScope.userNM }님</h2>
            <a href="/question/logout" class="btn_logout" ><i class="fas fa-user"></i> 로그아웃</a>
        </div>
        <nav class="btm">
            <ul>
                <li><a href="#">설문 조사</a>
					<ul>
						<li><a href="/question/survey/customer" target="_blank">설문 조사</a></li>
						<li><a href="/question/survey/addQuestion">설문 등록</a></li>
					</ul>
                </li>
                <li><a href="#">설문 현황</a>
					<ul>
                        <li><a href="/question/survey/queResult">설문 현황</a></li>
					</ul>
                </li>
                <li><a href="#">기초코드관리</a>
					<ul>
                        <li><a href="/question/addUser">사용자 관리</a></li>
                        <li><a href="/question/corpManage">사업장 관리</a></li>
					</ul>
                </li>
            </ul>
        </nav>
    </div>
</header>