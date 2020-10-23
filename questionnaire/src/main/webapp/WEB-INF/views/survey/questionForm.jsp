<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 등록</title>
<link type="text/css" href="../resources/style/default.css" rel="stylesheet">
<link type="text/css" href="../resources/style/common.css" rel="stylesheet">
<link type="text/css" href="../resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="../resources/style/design.css" rel="stylesheet">
<!-- <link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css"> -->
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="row">
             <div class="breadcrumb">

      </div>
        <div class="personal-info">
            <h3>질문 등록</h3>
            <form action="insertQuestion" method="post" class="subPageForm">
            <div class="form-area">
                <table>
                    <tbody>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 질문 번호</th>
                            <td>
                            	<input type="number" min="0" name="QUENO" required="required" value="${questionOne.QUENO }" style="max-width: 320px; border: 1px solid;">
								<c:if test="${questionOne.QUESEQ == null}"><input type="hidden" name="QUESEQ" value="0"></c:if>
								<c:if test="${questionOne.QUESEQ != null}"><input type="hidden" name="QUESEQ" value="${questionOne.QUESEQ }"></c:if>
								<c:if test="${questionOne.UNTCD == null}"><input type="hidden" name="UNTCD" value="${sessionScope.untcd }"></c:if>
								<c:if test="${questionOne.UNTCD != null}"><input type="hidden" name="UNTCD" value="${questionOne.UNTCD}"></c:if>
                                
                            </td>
                            <th scope="col"><i class="fas fa-caret-right"></i> 사용여부</th>
                            <td>
                                <c:choose>
									<c:when test="${questionOne.USETYPE == 'Y' }">
										<select id="USETYPE" name="USETYPE" style="width: 50px;">
											<option value="Y" selected>Y</option>
											<option value="N">N</option>
										</select>
									</c:when>
									<c:when test="${questionOne.USETYPE == 'N' }">
										<select id="USETYPE" name="USETYPE" style="width: 50px;">
											<option value="Y" >Y</option>
											<option value="N" selected>N</option>
										</select>
									</c:when>
									<c:otherwise>
										<select id="USETYPE" name="USETYPE" style="width: 50px;">
											<option value="Y" selected>Y</option>
											<option value="N">N</option>
										</select>
									</c:otherwise>
								</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th scope="col"><i class="fas fa-caret-right"></i> 질문내용</th>
                            <td colspan="3">
                                <textarea placeholder="" style="max-width: 320px; height: 100px" name="QUECONT">${questionOne.QUECONT }</textarea>
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