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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
<script type="text/javascript">
$(document).ready(function() {
	var arrDate = new Array();
	var arrCount = new Array();
	var arrChart = new Array();
	<c:forEach items="${date}" var="d">
		arrDate.push("${d}");
	</c:forEach>
	<c:forEach items="${arrCount}" var="c">
		arrCount.push("${c}");
	</c:forEach>
	
	for (var i = 0; i < arrDate.length; i++) {
		arrChart[i]=[arrDate[i],arrCount[i]];
	}
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);
	
	
	
	function drawBasic() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', '방문일');
		data.addColumn('number', '방문자수(명)');
		 
		data.addRows(arrDate.length);
		for (var i = 0; i < arrDate.length; i++) {
			data.setCell(i,0,new Date(arrDate[i]));
			data.setCell(i,1,arrCount[i]);
		}
		
		var options = {
        	chartArea : {width: '80%',	height: '80%'},
        	legend:{position:'top'},
        	hAxis: {
                format: 'MM/dd',
                gridlines: {count:10},
                title: '방문일'
              },
           vAxis:{
        	   format: '#'
           }
        };
		
		
		
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	
	}
});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="public/header.jsp"/>
<!-- header -->

<!-- //end header -->
<div class="row">
	<div class="breadcrumb">
		<h2><i class="fas fa-caret-right"></i>월별 방문자 현황</h2>
	</div>
    <div class="card">
      <div id="chart_div" style="height: 500px;"></div>
      </div>
  </div>

<div class="footer">
    <address>Copyright © 2020 Company</address>
</div>
</body>
</html>