//用户注销登录
$(function(){
	var Cancellation=$("#Cancellation");
	Cancellation.click(function(){
		var form=$("<form action='' method='' name='Cancellation' value='Cancellation'></form>");
			$("body").append(form);
			setTimeout(function(){
				form.remove();
			},1000);
	});










});