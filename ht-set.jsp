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
	<style type="text/css">
		.close-icon{
				
				height:30px;
				width:30px;
				float:right;
				background:url("img/close.ico");
				background-size:100% 100%;
			}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
			onerror:function(msg,obj,errorlist){
				//$.map(errorlist,function(msg1){alert(msg1)});
				alert(msg);
			}
		});
		$("#t_UserName").formValidator({onshow:"以字母、数字、下划线命名，3-11个字符",onfocus:"3-11个字符",oncorrect:"该用户名可以注册"}).inputValidator({min:3,max:11,onerror:"输入有误"}).regexValidator({regexp:"username",datatype:"enum",onerror:"格式有误"});
		$("#iptNickName").formValidator({onshow:"至少3个字符,至多20个字符",onfocus:"至少3个字符,至多20个字符",oncorrect:"通过"}).inputValidator({min:3,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
		$("#t_UserPass").formValidator({onshow:"至少6个字符,至多12个字符",onfocus:"至少6个字符,至多12个字符",oncorrect:"密码合法"}).inputValidator({min:6,max:12,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"});
		$("#t_RePass").formValidator({onshow:"请再次输入密码",onfocus:"请再次输入密码",oncorrect:"密码一致"}).inputValidator({min:6,empty:{leftempty:false,rightempty:false,emptyerror:"输入有误"},onerror:"输入有误"}).compareValidator({desid:"t_UserPass",operateor:"=",onerror:"密码不一致"});	
		$("#t_mobile").formValidator({onshow:"11个字符",onfocus:"11个字符",oncorrect:"恭喜你,你输对了"}).inputValidator({min:6,max:36,onerror:"长度非法"}).regexValidator({regexp:"^(1)[0-9]{10}$",onerror:"格式不正确"});
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
</head>
<body>
<header>
<% String username=(String)session.getAttribute("username");%>
<% if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
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
			<a class="item" id="active-item" href="ht-add.jsp"><i class="sitemap icon" ></i>添加管理员</a>			
			<a class="active item" id="active-item" href="middle_servlet?query=ht&forpage=ht-set"><i class="sitemap icon" ></i>修改管理员</a>
		</div>
	</div>
</div>
<!--the main content begin-->
<div class="container">
	<div class="main">
		<!--图片信息放置区域-->
		<!--主页图片信息分页显示-->
		<div class="mainPage">
			<div class="tabel-mainImg">
				<jsp:useBean id="pro" class="pro.product"></jsp:useBean>
				<table align="center" width="100%" class="hovertable">
					<tr>
						<td align="center" colspan="10">
							<h5>系统中的所有管理员信息</h5>
						</td>
					</tr>
					<tr align="center">
						<td><b>id</b></td>
						<td><b>用户名</b></td>
						<td><b>所属部门</b></td>
						<td><b>手机号</b></td>
						<td><b>姓名</b></td>
						<td><b>修改信息</b></td>
						<td><b>删除账号</b></td>
					</tr>
					<%
						//获取图片信息集合
						List<user_ht>list=(List<user_ht>)request.getAttribute("list_ht");
							//判断集合是否有效
							if(list==null || list.size()<1){
								out.print("没有数据");
							}else{
								//遍历集合中的数据
								for(user_ht ht:list){
									%>
									<tr align="center">
										<td><%=ht.getid()%></td>
										<td class="ht-info"><%=ht.getusername()%></td>
										<td class="ht-info"><%=ht.getdepartment()%></td>
										<td class="ht-info"><%=ht.gettel()%></td>
										<td class="ht-info"><%=ht.getname()%></td>
										<td  class="ht-xg"><a href="#">修改</a></td>
										<td>
											<a href="#" class="ht-del">删除</a>
										</td>
									</tr>
									<%
								}
							}
							%>
							<tr>
							<td align="center" colspan="10">
							</td>
							</tr>
				</table>				
			</div>
		   </div>
	</div>
	
	<div class="reg reg_zc" style="display: none;border: 1px solid #00BFFF;">
		<div class="close-icon">
		</div>
	<!--添加管理员开始-->
	    <div class="reg_inner">
	    	
	        <form action="user_ht_servlet" method="post" name="form1" id="form1">
	            <dl>
	                <dt class="f14 b">管理员账号修改</dt>
	                <dd><span class="title">账号：</span><input class="reg_input ht-info-xg" name="username" id="t_UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip" class="onshow"></span></dd>
	                <dd><span class="title">密码：</span><input class="reg_input" onblur="return checkpasswd(this);" id="t_UserPass" name="password" type="password" placeholder=""/><span id="t_UserPassTip" class="onshow"></span></dd>
	                <dd><span class="title">确认密码：</span><input onblur="checkdoublepassword();" class="reg_input" type="password" id="t_RePass" name="user_password"/><span id="t_RePassTip" class="onshow"></span></dd>
                	<dd><span class="title">部门名称：</span><input class="reg_input ht-info-xg" name="department" id="iptNickName" onblur="checkNickName(this.value)" type="text" /><span id="iptNickNameTip" class="onshow"></span></dd>                               	
                	<dd><span class="title">手机号码：</span><input class="reg_input ht-info-xg" name="tel" type="text" id="t_mobile" onblur="checkemobile(this.value)" /><span id="t_mobileTip" class="onshow"></span></dd>	            	
	            	<dd><span class="title">姓名：</span><input class="reg_input ht-info-xg" name="name" id="t_meno" onblur="checkNickName(this.value)" type="text" /><span id="t_menoTip" class="onshow"></span></dd>               
	            </dl>
	            <input type="hidden"  name="method" id="method" value="user_ht_mod">
	            <div class="f_reg_but"><input id="button" name="ok" type="submit" value="确认修改" style="border-radius: 14px;padding: 4px 10px;color: #fff;background-color: #FF6600;"/></div>
	            <input type="hidden"  name="method" id="method" value="user_ht_mod">
	        </form>                              
	    </div>
	<!--注册结束-->
	</div>
</div>
<script type="text/javascript">
//	管理员信息修改
	$(function(){
		
		$(".ht-xg").click(function(){
			var info1 = $(this).siblings(".ht-info").eq(0).text();
			var info2 = $(this).siblings(".ht-info").eq(1).text();
			var info3 = $(this).siblings(".ht-info").eq(2).text();
			var info4 = $(this).siblings(".ht-info").eq(3).text();
			$(".reg").show();
			$(".ht-info-xg").eq(0).val(info1);
			$(".ht-info-xg").eq(1).val(info2);
			$(".ht-info-xg").eq(2).val(info3);
			$(".ht-info-xg").eq(3).val(info4);
			
		});
		$(".close-icon").click(function(){
			$(".reg").hide();
			$(".ht-info-xg").val("");
		});
	})
</script>
<!--删除管理员弹出框-->
<footer>
	<!--删除用户提醒弹出框/form表单提交-->
	<div class="cont_info_log_sign_up">
		<div class="col_md_login">
          	<div class="cont_ba_opcitiy">
            	<h4>真的要删除吗？</h4>
            	<form action="user_qt_servlet" class="myform">
            	<div class="cl-mydel"></div>
            	    <button class="btn_sign_up" type="submit" name="123">删除</button>
			        <input type="hidden" name="method" value="user_qt_mod">
                    <input type="hidden" name="isvalid" value="0">
                    <input type="hidden"  name="page"  value="front">
            	</form>
             	<button class="cl-dl-form" type="">取消</button>
          	</div>
        	</div>
        	</div>
        <script>
			$(function(){
				$(".ht-del").click(function(){
					$(".cl-mydel").html("");
					$(".cont_info_log_sign_up").show();
					var num=$(this).parent().siblings().eq(4);
					var txt=num.text();
					$(".cl-mydel").append($("<input type='hidden' name='id' value='"+txt+"' />"));
				
				});
				$(".cl-dl-form").click(function(){
					$(".cl-mydel").html("");
					$(".cont_info_log_sign_up").hide();
				});
			})
		</script>
</footer>
</body>
</html>