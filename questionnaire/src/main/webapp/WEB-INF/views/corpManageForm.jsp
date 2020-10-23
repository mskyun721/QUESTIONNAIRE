<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
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
	var ArrTel = $('#TELNO').val().split("-");
	$('#TELNO1').val(ArrTel[0]);
	$('#TELNO2').val(ArrTel[1]);
	$('#TELNO3').val(ArrTel[2]);
	
	var ArrFax = $('#FAXNO').val().split("-");
	$('#FAXNO1').val(ArrFax[0]);
	$('#FAXNO2').val(ArrFax[1]);
	$('#FAXNO3').val(ArrFax[2]);
	
});
</script>

</head>
<body>
<div class="row">
        <div class="breadcrumb">

        </div>
        
        <div class="company-info">
            <h3>사업자 등록</h3>
            <form action="insertCst" method="post">
            <div class="form-area">
                <table>
                    <tbody>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 사업장명</th>
                            <td colspan="3">
                                <input type="text" name="UNTNM" required="required" value="${mstOne.UNTNM }" placeholder="" style="max-width: 260px;">
                            	<input type="hidden" name="UNTCD" value="${mstOne.UNTCD }">
                            </td>
                            
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 대표자</th>
                            <td colspan="3">
                                <input type="text" name="UNTCEO" value="${mstOne.UNTCEO }" placeholder="" style="max-width: 260px;">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 사업자번호</th>
                            <td colspan="3">
                                <input type="text" name="BIZNO" value="${mstOne.BIZNO }" placeholder="" style="max-width: 260px;">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 법인번호</th>
                            <td colspan="3">
                                <input type="text" name="CORPNO" value="${mstOne.CORPNO }" value="" placeholder="" style="max-width: 260px;">

                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 업 태</th>
                            <td>
                                <input type="text" name="BIZITEM" value="${mstOne.BIZITEM }" placeholder="" maxlength="20" style="max-width: 260px;">
                            </td>
                            <th scope="col"><i class="fas fa-caret-right"></i> 업 종</th>
                            <td>
                                <input type="text" name="BIZKIND" value="${mstOne.BIZKIND }" placeholder="" maxlength="20" style="max-width: 260px;">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 전화번호</th>
                            <td colspan="3">
                                <input type="text" id="TELNO1" name="TELNO1" style="max-width: 90px;"><span class="space"> - </span>
                                <input type="text" id="TELNO2" name="TELNO2" style="max-width: 90px;"><span class="space"> - </span><input type="text" id="TELNO3" name="TELNO3" style="max-width: 90px;">
                            	<input type="hidden" id="TELNO" name="TELNO" value="${mstOne.TELNO }">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 팩스번호</th>
                            <td colspan="3">
                                <input type="text" name="FAXNO1" id="FAXNO1" style="max-width: 90px;"><span class="space"> - </span>
                                <input type="text" name="FAXNO2" id="FAXNO2" style="max-width: 90px;"><span class="space"> - </span><input type="text" name="FAXNO3" id="FAXNO3" style="max-width: 90px;">
                            	<input type="hidden" id="FAXNO" name="FAXNO" value="${mstOne.FAXNO }">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 우편번호</th>
                            <td colspan="3">
                                <input type="text" name="ZIPNO" value="${mstOne.ZIPNO }" placeholder="" style="max-width: 150px;">
                                <button type="button" class="bt_search"><i class="fa fa-search"></i></button>
                                <input type="text" name="ADDR" value="${mstOne.ADDR }" placeholder="" style="max-width: 500px;">
                                <input type="text" name="ADDRDET" value="${mstOne.ADDR }" placeholder="" style="max-width: 700px;">
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 비고</th>
                            <td colspan="3">
                                <textarea placeholder="" style="max-width: 320px; height: 100px" name="REMARK">${mstOne.REMARK }</textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="button">
                <button type="submit" class="btn success01">저장</button>
                <button type="button" onclick="window.close(); return false;" class="btn success01">취소</button>
            </div>
            </form>
        </div>
    </div>
</body>
</html>