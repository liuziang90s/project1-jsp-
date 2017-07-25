<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账号注册中心</title>
<script type="text/javascript" src="js/IE.js"></script>
<link rel="stylesheet" type="text/css" href="css/zhuce.css"/>
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
	$("#t_UserName").formValidator({onshow:"以字母、数字、下划线命名，3-11个字符",onfocus:"3-11个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:3,max:11,onerror:"输入有误"}).regexValidator({regexp:"username",datatype:"enum",onerror:"格式有误"});
	$("#iptNickName").formValidator({onshow:"至少6个字符,至多20个字符",onfocus:"至少6个字符,至多50个字符",oncorrect:"通过"}).inputValidator({min:6,max:50,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
	$("#t_UserPass").formValidator({onshow:"至少6个字符,至多12个字符(数字与字母组合更安全)",onfocus:"至少6个字符,至多12个字符(数字与字母组合更安全)",oncorrect:"密码合法"}).inputValidator({min:6,max:12,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
	$("#t_RePass").formValidator({onshow:"请再次输入密码",onfocus:"请再次输入密码",oncorrect:"密码一致"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"}).compareValidator({desid:"t_UserPass",operateor:"=",onerror:"密码不一致"});	
	$("#t_mobile").formValidator({onshow:"6-36个字符",onfocus:"6-36个字符",oncorrect:"恭喜你,你输对了"}).inputValidator({min:6,max:36,onerror:"长度非法"}).regexValidator({regexp:"^(1|0)[0-9]{10}$",onerror:"格式不正确"});
	$("#t_meno").formValidator({onshow:"至多20个字符",onfocus:"至多20个字符",oncorrect:"通过"}).inputValidator({min:0,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
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
			background:url(img/bg2.jpg) no-repeat;
			width:100%;  
		    height:100%;  
		    background-size:100vw 100vh;  
		    position:absolute;  
		    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='img/bg2.jpg',sizingMethod='scale');  }
		}
		
	</style>
</head>
<body>
<div class="reg reg_zc">
	<h1 class="h1_zc">如果您还没有账号 赶紧注册吧</h1>
<!--注册开始-->
    <div class="reg_inner">
    	
        <form action="user_qt_servlet" method="post" name="form1" id="form1">
            <dl>
                <dt class="f14 b">帐户基本信息</dt>
                <dd><span class="title">登录账号：</span><input class="reg_input" name="username" id="t_UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip" class="onshow"></span></dd>
                <dd><span class="title">公司名：</span><input class="reg_input" name="company" id="iptNickName" onblur="checkNickName(this.value)" type="text" /><span id="iptNickNameTip" class="onshow"></span></dd>               
            </dl>
            <dl>
                <dt class="f14 b">帐户安全设置</dt>
                <dd><span class="title">登录密码：</span><input class="reg_input" onblur="return checkpasswd(this);" id="t_UserPass" name="password" type="password" placeholder="数字与字母的混合更安全"/><span id="t_UserPassTip" class="onshow"></span></dd>
                <dd><span class="title">确认登录密码：</span><input onblur="checkdoublepassword();" class="reg_input" type="password" id="t_RePass" name="user_password"/><span id="t_RePassTip" class="onshow"></span></dd>
                <dd><span class="title">手机号码：</span><input class="reg_input" name="tel" type="text" id="t_mobile" onblur="checkemobile(this.value)" /><span id="t_mobileTip" class="onshow"></span></dd>
                <dd><span class="title">备注信息：</span><input class="reg_input" name="meno" id="t_meno" onblur="checkNickName(this.value)" type="text" /><span id="t_menoTip" class="onshow"></span></dd>               
            </dl>
            <div class="f_reg_but"><input id="button" name="ok" type="submit" value="免费注册" class="r_button"/><span class="clew_txt">如果您已有帐号，可<a href="index.jsp">直接登录</a></span></div>
            <input type="hidden"  name="method" id="method" value="user_qt_add">
        </form>                              
    </div>
<!--注册结束-->
</div>
</body>
</html>