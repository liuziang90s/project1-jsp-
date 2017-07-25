<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>  
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> 	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
    <title>前台管理 |管理员中心</title>
    <script src="js/jquery-1.7.2.min.js" type=text/javascript></script>
    <script type="text/javascript" src="js/IE.js"></script> 
    <!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
	<script type="text/javascript" src="js/IE.js"></script>
	<link rel="stylesheet" type="text/css" href="css/zhuce.css"/>
	
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
		$("#t_UserName").formValidator({onshow:"以字母、数字、下划线命名，3-11个字符",onfocus:"3-11个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:3,max:11,onerror:"输入有误"}).regexValidator({regexp:"username",datatype:"enum",onerror:"格式有误"});	$("#iptNickName").formValidator({onshow:"至少6个字符,至多20个字符",onfocus:"至少6个字符,至多50个字符",oncorrect:"通过"}).inputValidator({min:6,max:50,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
		$("#t_UserPass").formValidator({onshow:"至少6个字符,至多12个字符(数字与字母组合更安全)",onfocus:"至少6个字符,至多12个字符(数字与字母组合更安全)",oncorrect:"密码合法"}).inputValidator({min:6,max:12,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
		$("#t_RePass").formValidator({onshow:"请再次输入密码",onfocus:"请再次输入密码",oncorrect:"密码一致"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"}).compareValidator({desid:"t_UserPass",operateor:"=",onerror:"密码不一致"});	
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
</head>
<body>
<header>
<% String username=(String)session.getAttribute("username");%>
<% if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
<%int currpage=(int)request.getAttribute("currpage");if (currpage==0) currpage=1;%>
<%int pages=(int)request.getAttribute("pages");%>
<%int pageprev=currpage-1; if (currpage==1) pageprev++;%>
<%int pagenext=currpage+1; if (currpage==pages) pagenext--;%>
<div class="bigcontainer">
		<div id="logo">
		</div>
		<div class="user">
			<div class="ui inline labeled icon top right pointing dropdown">
			<img class="ui avatar image" src="img/avatar-default.gif">
			欢迎<tabel class="user-name"><%=username%></tabel>
			<i class="dropdown icon"></i>
				<div class="menu">
					<a class="item" href="admin.jsp"><i class="reply mail icon"></i>返回首页</a>
					<a class="item" href="index.jsp"><i class="sign out icon"></i>注销登录</a>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- the main menu-->
<div class="ui teal inverted menu fluid">
	<div class="bigcontainer">
		<div class="right menu">
			<a class="item" href="admin.jsp"><i class="home icon"></i>管理首页</a>
			<a class="active item" id="active-item" href="ht-add.jsp"><i class="sitemap icon" ></i>添加管理员</a>			
			<a class="item" id="active-item" href="middle_servlet?query=ht&forpage=ht-set"><i class="sitemap icon" ></i>修改管理员</a>
		</div>
	</div>
</div>
<!--the main content begin-->
<div class="container">
	<div class="reg reg_zc">
	<!--添加管理员开始-->
	    <div class="reg_inner">
	    	
	        <form action="user_ht_servlet" method="post" name="form1" id="form1">
	            <dl>
	                <dt class="f14 b">添加管理员</dt>
	                <dd><span class="title">账号：</span><input class="reg_input" name="username" id="t_UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip" class="onshow"></span></dd>
	                <dd><span class="title">密码：</span><input class="reg_input" onblur="return checkpasswd(this);" id="t_UserPass" name="password" type="password" placeholder=""/><span id="t_UserPassTip" class="onshow"></span></dd>
	                <dd><span class="title">确认密码：</span><input onblur="checkdoublepassword();" class="reg_input" type="password" id="t_RePass" name="user_password"/><span id="t_RePassTip" class="onshow"></span></dd>
	            </dl>
	            <div class="f_reg_but"><input id="button" name="ok" type="submit" value="确认添加" style="border-radius: 14px;padding: 4px 10px;color: #fff;background-color: #FF6600;"/></div>
	            <input type="hidden"  name="method" id="method" value="user_ht_add">
	        </form>                              
	    </div>
	<!--注册结束-->
	</div>
</div>	
</body>
</html>