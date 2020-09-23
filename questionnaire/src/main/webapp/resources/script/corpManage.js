$(document).ready(function() {
	$("[id^=btnDel]").click(function () {
		var confirmResult = confirm("삭제하시겠습니까?");
		var id = $(this).attr("id");
		var num = id.replace("btnDel","");
		var result = $('#delRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delMst",
				type:"get",
				data:{UNTCD:result},
				success:function(data){
					location.reload();
				}
			});
		}
		
	});
	
	var conditionParam = $('#conditionParam').val();
	$('#condition').val(conditionParam).attr("selected");
	
	
	var popUpX = (window.screen.width/2)-400;
	var popUpY = (window.screen.height/2)-250;
	$('#add').click(function(){
		window.open('corpManageForm','_blank','width=580, height=435, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var result = $('#delRow'+num).val();
		
		window.open('corpManageForm?UNTCD='+result,'_blank','width=580, height=435, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=QrCode]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("QrCode","");
		var result = $('#delRow'+num).val();
		var strUrl = "QrCode/"+result;
		$.ajax({
			url:strUrl,
			type:"get",
			data:{untcd:result},
			success:function(data){
				window.open('QRCodePrintForm?Url='+strUrl, 'Print', 'width=700, height=800');
				
			},
			error:function(data){
				alert("error");
			}
		});
		
	});
	
});