/**
 * 
 */
$(document).ready(function() {
	$("[id^=btnDel]").click(function () {
		var confirmResult = confirm("삭제하시겠습니까?");
		var id = $(this).attr("id");
		var num = id.replace("btnDel","");
		var UNTCDresult = $('#UNTCDRow'+num).val();
		var USERIDresult = $('#USERIDRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delUser",
				type:"get",
				data:{UNTCD:UNTCDresult,USERID:USERIDresult},
				success:function(rdata){
					location.reload();
				}
			});
		}
		
	});
	var paramDptnm = $('#paramDPTNM').val();
	var EMPNM = $('#EMPNM').val();
	$('#DPTNM').val(paramDptnm).attr("selected");
	
	$('#DPTNM').change(function(){
		var DPTNM = $(this).val();
		if (EMPNM != null) {
			location.href="/question/addUser?DPTNM="+DPTNM+"&EMPNM="+EMPNM;
		}else{
			location.href="/question/addUser?DPTNM="+DPTNM;	
		}
		
	});
	
	var conditionParam = $('#conditionParam').val();
	$('#condition').val(conditionParam).attr("selected");
	
	$('#add').click(function(){
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('userForm','_blank','width=730, height=745, left='+popUpX);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var userid = $('#USERIDRow'+num).val();
		var userpw = $('#USERPWRow'+num).val();
		
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('userForm?USERID='+userid+'&USERPW='+userpw,'_blank','width=730, height=745, left='+popUpX);
	});
	
});