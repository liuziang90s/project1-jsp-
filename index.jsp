<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录注册</title>
<%session.removeAttribute("username"); %>
<%session.removeAttribute("list_qt_page"); %>
<%session.removeAttribute("list_clt_page"); %>
<%session.removeAttribute("list_cp_page"); %>
<script type="text/javascript" src="js/IE.js"></script>
	<link rel="stylesheet" href="css/zhuce.css">
	<script src="js/jquery-1.7.2.min.js" type=text/javascript></script>
	<script src="js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
	onerror:function(msg,obj,errorlist){
	//$.map(errorlist,function(msg1){alert(msg1)});
	alert(msg);
	}
	});
	$("#t_UserName").formValidator({onshow:"3-11个字符",onfocus:"3-11个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:3,max:11,onerror:"输入有误"}).regexValidator({regexp:"username",datatype:"enum",onerror:"格式有误"});
	$("#t_UserPass").formValidator({onshow:"至少6个字符",onfocus:"至少6个字符",oncorrect:"密码合法"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
	});
	function test1(obj)
	{
	if(obj.value=="全角字符当做1个长度")
	{
	$.formValidator.getInitConfig("1").wideword = false;
	obj.value = "全角字符当做2个长度";
	}
	else
	{
	$.formValidator.getInitConfig("1").wideword = true;
	obj.value = "全角字符当做1个长度";
	}

	}

	</script>
	<style type="text/css">
		body{
			background:url(img/bg1.jpg) no-repeat;
			width:100%;  
		    height:100%;  
		    background-size:100vw 100vh;  
		    position:absolute;  
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='img/bg1.jpg',sizingMethod='scale');  }
		}
		
	</style>
	</head>

	<body>
	<!--登录开始-->
	<div class="reg reg_index login reg_dl">
	<div class="h1"><h1>系统登录</h1></div>
	<form action="user_judge_servlet" method="post" name="form1" id="form1">
	<dl>
	<div style="height:17px; overflow:hidden"></div>
	<dd><span class="title">登录账号：</span><input class="reg_input" name="username" id="t_UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip" class="onshow"></span></dd>
	<dd><span class="title">登录密码：</span><input class="reg_input" onblur="return checkpasswd(this);" id="t_UserPass" name="pwd" type="password"/><span id="t_UserPassTip" class="onshow"></span></dd>
	<dd><span class="title">身份：</span><input type="radio" id="Sex_Man" name="method" value="qt" checked="CHECKED" /><label for="Sex_Man">客户</label>
	<input type="radio" id="Sex_Woman" name="method" value="ht" /><label for="Sex_Woman"> 管理员</label>
	</dd>
	</dl>
	<div class="f_reg_but"><input id="button" name="button" type="submit" value="登录" class="l_button"/><span class="clew_txt">还没账号？<a href="register.jsp">立即注册</a></span></div>
	</form>
	</div>
	<!--登录结束-->
	</body>
	</html>