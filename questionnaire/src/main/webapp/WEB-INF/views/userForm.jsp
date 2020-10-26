<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<link type="text/css" href="resources/style/default.css" rel="stylesheet">
<link type="text/css" href="resources/style/common.css" rel="stylesheet">
<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="resources/style/design.css" rel="stylesheet">
<!-- <link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css"> -->
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var ArrHp = $('#HPNO').val().split("-");
	$('#HPNO1').val(ArrHp[0]);
	$('#HPNO2').val(ArrHp[1]);
	$('#HPNO3').val(ArrHp[2]);
	
});
</script>

</head>
<body>

<div class="row">
         <div class="breadcrumb">

  </div>
    <div class="personal-info">
        <h3>사용자 등록</h3>
        <form action="insertUser" method="post">
        <div class="form-area">

            <table>
                <tbody>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 사업장</th>
                        <td>
                            <input type="text" name="UNTCD" required="required" value="${userOne.USERID }" placeholder="" maxlength="20" style="max-width: 320px;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 아이디</th>
                        <td>
                            <input type="text" name="USERID" required="required" value="${userOne.USERID }" placeholder="" maxlength="20" style="max-width: 320px;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 비밀번호</th>
                        <td>
                            <input type="password" name="USERPW" required="required" value="${userOne.USERPW }" placeholder="" maxlength="20" style="max-width: 320px;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 이 름</th>
                        <td>
                            <input type="text" name="EMPNM" value="${userOne.EMPNM }" placeholder="" style="max-width: 320px;">

                        </td>
                    </tr>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 부서명</th>
                        <td>
                            <input type="text" name="DPTNM" value="${userOne.DPTNM }" placeholder="" style="max-width: 320px;">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 핸드폰</th>
                        <td>
                            <input type="text" id="HPNO1" name="HPNO1" value="" style="max-width: 90px;"><span class="space"> - </span>
                            <input type="text" id="HPNO2" name="HPNO2" value="" style="max-width: 90px;"><span class="space"> - </span><input type="text" id="HPNO3" name="HPNO3" value="" style="max-width: 90px;">
                        	<input type="hidden" id="HPNO" name="HPNO" value="${userOne.HPNO }">
                        </td>
                    </tr>
                    <tr>
                        <th scope="col"><i class="fas fa-caret-right"></i> 비 고</th>
                        <td>
							<textarea placeholder="" style="max-width: 320px; height: 100px" name="REMARK">${mstOne.REMARK }</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="button">
                 <button type="submit" class="btn success01">저장</button>
             <button type="submit" onclick="window.close(); return false;" class="btn success01">취소</button>
        </div>
        </form>
    </div>
</div>
</body>
</html>