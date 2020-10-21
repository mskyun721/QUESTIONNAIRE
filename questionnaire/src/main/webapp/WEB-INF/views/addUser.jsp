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
<script type="text/javascript" src="resources/script/addUser.js"></script>
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
<!-- <div class="row">
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
						<tr><td>${i.index+1 }</td>
						<td>${user.UNTNM }</td>
						<td>${user.USERID }</td>
						<td>*****</td>
						<td>${user.EMPNM }</td>
						<td>${user.DPTNM }</td>
						<td>${user.HPNO }</td>
						<td>${user.REMARK }</td>
						<td width="30"><button type="button" id="edit${i.index }"><i class="fas fa-edit"></i>&nbsp;Edit</button></td>
						<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
							<input type="hidden" id="UNTCDRow${i.index }" value="${user.UNTCD }">
							<input type="hidden" id="USERIDRow${i.index }" value="${user.USERID }">
							<input type="hidden" id="USERPWRow${i.index }" value="${user.USERPW }"></td></tr>
					</c:forEach>
					</tbody>
				</table>
				</form>
			</div><!-- table end -->
<%-- 		</div>
	</div>
</div>
<!-- footer -->
<jsp:include page="public/footer.jsp"/>
<!-- footer --> --%>
<div class="row">
	<div class="breadcrumb">
		<h2><i class="fas fa-user-plus"></i> 사용자 등록</h2>
	</div>
	<form action="">
	<%-- <div style="display: inline;" class="marginLeft_10">
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
				</div> --%>
		<div class="Search_set">
			<select >
			    <option>사업자명</option>
			    <option>ID</option>
			    <option>이름</option>
			
			</select>
			<input type="text" placeholder="Search.." name="search">
			<button type="submit" class="bt_search"><i class="fa fa-search"></i></button>
			<button type="button" class="bt_add" id="add"><i class="fas fa-plus"> 추가</i></button>
		</div>
		
	</form>
	<div class="rightcolumn">
	
		<table >
			<tr><th>NO</th>
				<th>사업장</th>
				<th>ID</th>
				<th>Password</th>
				<th>이름</th>
				<th>부서</th>
				<th>휴대폰번호</th>
				<th>비고</th>
				<th>편집</th>
				<th>삭제</th></tr>
			<c:forEach items="${userList }" var="user" varStatus="i">
				<tr><td>${i.index+1 }</td>
				<td>${user.UNTNM }</td>
				<td>${user.USERID }</td>
				<td>*****</td>
				<td>${user.EMPNM }</td>
				<td>${user.DPTNM }</td>
				<td>${user.HPNO }</td>
				<td>${user.REMARK }</td>
				<td width="30"><button type="button" id="edit${i.index }" style="background-color: white;"><i class="fas fa-edit"></i>&nbsp;Edit</button></td>
				<td><button type="button" id="btnDel${i.index }" style="background-color: white;"><i class="fas fa-trash-alt"></i>&nbsp;Del</button>
					<input type="hidden" id="UNTCDRow${i.index }" value="${user.UNTCD }">
					<input type="hidden" id="USERIDRow${i.index }" value="${user.USERID }">
					<input type="hidden" id="USERPWRow${i.index }" value="${user.USERPW }"></td></tr>
			</c:forEach>
		</table>
	
	</div>
</div>
<div class="footer">
    <address>Copyright © 2020 Company</address>
</div>
</body>
</html>