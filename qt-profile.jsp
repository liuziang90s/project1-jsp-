<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>  
<%@ page import="java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="author" content="刘兹昂, liuziang90s@163.com"> 	
    <title>账户设置 | 用户中心</title>
    <script type="text/javascript" src="js/IE.js"></script> 
    <script src="js/jquery-1.7.2.min.js"></script>
<script src="js/common.js"></script>
<script src="js/jquery.validate.min.js?var1.14.0"></script>
    <!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
    <!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
          
    <style>
    	.qt-p-field field >input{
			width:14em !important;
			}
		.state1{
                color:#aaa;
            }
            .state2{
                color:#000;
            }
            .state3{
                color:red;
            }
            .state4{
                color:green;
            }

    </style>
    <!--用户信息修改表单验证开始-->
      <script>
            $(function(){
 
                var ok1=true;
                var ok2=true;
                var ok3=true;
                var ok4=true;
                var ok6=true;
                var ok8=true;
                // 验证用户名
                $('input[name="username"]').focus(function(){
                    $(this).next().text('以字母开头，以字母、数字、下划线结尾长度为3-11字符').removeClass('state1').addClass('state2');
                }).blur(function(){
                    if($(this).val().search(/^[a-zA-Z][a-zA-Z0-9_]*$/)==-1 || $(this).val().length <3  || $(this).val().length >11 || $(this).val()==''){
                        $(this).next().text('以字母开头，以字母、数字、下划线结尾长度为3-11字符').removeClass('state1').removeClass('state4').addClass('state3');
                        ok1=false;
                    }else{
                        $(this).next().text('输入成功').removeClass('state1').removeClass('state3').addClass('state4');
                        ok1=true;
                    }
                     
                });
 				//验证公司名company
 				$('input[name="company"]').focus(function(){
                    $(this).next().text('至少6个字符，至多12个字符').removeClass('state1').addClass('state2');
                }).blur(function(){
                    if($(this).val().length >= 6 && $(this).val().length <=12&& $(this).val()!=''){
                        $(this).next().text('输入成功').removeClass('state1').removeClass('state3').addClass('state4');
                        ok2=true;
                    }else{
                        $(this).next().text('至少6个字符，至多12个字符').removeClass('state1').removeClass('state4').addClass('state3');
                        ok2=false;
                    }
                     
                });
                //验证密码
                $('input[name="password"]').focus(function(){
                    $(this).next().text('密码应该为6-20位之间').removeClass('state1').addClass('state2');
                }).blur(function(){
                    if($(this).val().length >= 6 && $(this).val().length <=12&& $(this).val()!=''){
                        $(this).next().text('输入成功').removeClass('state1').removeClass('state3').addClass('state4');
                        ok3=true;
                    }else{
                        $(this).next().text('密码应该为6-20位之间').removeClass('state1').removeClass('state4').addClass('state3');
                        ok3=false;
                    }
                     
                });
 
                //验证确认密码
                    $('input[name="repass"]').focus(function(){
                    $(this).next().text('输入的确认密码要和上面的密码一致,规则也要相同').removeClass('state1').addClass('state2');
                }).blur(function(){
                    if($(this).val().length >= 6 && $(this).val().length <=12 && $(this).val()!='' && $(this).val() == $('input[name="password"]').val()){
                        $(this).next().text('输入成功').removeClass('state1').removeClass('state3').addClass('state4');
                        ok4=true;
                    }else{
                        $(this).next().text('输入的确认密码要和上面的密码一致,规则也要相同').removeClass('state1').removeClass('state4').addClass('state3');
                        ok4=false;
                    }
                     
                });
                //验证手机
                $('input[name="newtel"]').focus(function(){
                    $(this).next().text('请输入正确的手机格式').removeClass('state1').addClass('state2');
                }).blur(function(){
                    if($(this).val().search(/^(13|15)[0-9]{9}$/)==-1){
                        $(this).next().text('请输入正确的手机格式').removeClass('state1').removeClass('state4').addClass('state3');
                        ok6=false;
                    }else{                  
                        $(this).next().text('输入成功').removeClass('state1').removeClass('state3').addClass('state4');
                        ok6=true;
                    }
                     
                });
 				//验证备注
 				$('input[name="meno"]').focus(function(){
                	$(this).next().text('最多30个字符').removeClass('state1').addClass('state2');
                }).blur(function(){
                    if($(this).val().length <=30 ){
                        $(this).next().text('输入成功').removeClass('state1').removeClass('state3').addClass('state4');
                        ok8=true;
                    }else{
                        $(this).next().text('最多30个字符').removeClass('state1').removeClass('state4').addClass('state3');
                        ok8=false;
                    }
                     
                });
                //提交按钮,所有验证通过方可提交
 				
                $('button[class="myButton"]').click(function(){
                	
                
                    if(ok1==true && ok2==true && ok3==true && ok4==true && ok6==true && ok8==true){
                    	 $('form').submit();
                        alert("修改成功");
                    }else{
                    	alert("非法修改");
                        return false;
                    }
                });
                 
            });
        </script>
        <!--用户信息修改表单验证结束-->
</head>
<body>

<div class="page">

<!--header begin-->
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
					<a class="item" href="middle_servlet?query=pro&forpage=home"><i class="reply mail icon"></i>返回首页</a>
					<a class="item" href="index.jsp"><i class="sign out icon"></i>注销登录</a>
				</div>
			</div>
		</div>
	</div>
</header>
<!-- the main menu-->
<div class="ui teal inverted menu">
	<div class="bigcontainer">
		<div class="right menu">
			<a class="item" href="middle_servlet?query=pro&forpage=home"><i class="home icon"></i>返回首页</a>
			<a class="active item" href="middle_servlet?query=qt_one&forpage=qt-profile"><i class="info icon"></i>账户</a>
		</div>
	</div>
</div>
<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="ui grid">
			<!--the vertical menu-->
			<div class="four wide column">
				<div class="verticalMenu">
					<div class="ui vertical pointing menu fluid">
  						<a class="active teal item" href="middle_servlet?query=qt_one&forpage=qt-profile">
							<i class="edit icon"></i>账户设置
  						</a>
						<a class="item" href="middle_servlet?query=clt&forpage=qt-collection">
    						<i class="chat icon"></i> 我的收藏
  						</a>
					</div>
				</div>
			</div>
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large edit icon"></i>
  							<div class="content">
    							账户设置(信息修改)
    							<div class="sub header" style="color:red;">以下是您的个人账户信息，请谨慎修改！</div>
  							</div>
						</h3>
					</div>
				</div>
				<!--the user_profile form-->
				<div class="ui form vertical segment register-container">
					<form action=user_qt_servlet name="form" method="post" id="registerForm">
					<%
						List<user_qt>list=(List<user_qt>)request.getAttribute("list_qt");
							//判断集合是否有效
							if(list==null || list.size()<1){
								out.print("没有数据");
							}else{
								//遍历集合中的数据
								for(user_qt qt:list){
									%>
						<div class="one fields qt-p-field">
							<div class="field">
								<label>用户名</label>
								<div class="ui left labeled icon input">
									<input type="text" id="username" name="username" required="required" value=<%=qt.getusername

()%>>
									<span class='state1'>以字母开头，以字母、数字、下划线结尾长度为5-10字符</span><br/><br/>
								</div>
							</div>
                        </div>
						<div class="one fields qt-p-field">
				            <div class="field">
								<label>手机号</label>
								<div class="ui left labeled icon input">
								<input type="text" id="useremail" name="newtel" required="required" value=<%=qt.gettel()%>>
								<span class='state1'>请输入手机号</span><br/><br/>
								</div>
				            </div>
						</div>
						<input type="hidden" id="useremail"  name="id" value=<%=qt.getid()%>>		
						<div class="one fields qt-p-field">
				            <div class="field">
								<label>公司</label>
								<div class="ui left labeled icon input">
								<input type="text" id="useremail" name="company" required="required" value=<%=qt.getcompany()%>>
								<span class='state1'>至少6个字符,至多20个字符</span><br/><br/>
								</div>
				            </div>
						</div>
						<div class="one fields qt-p-field">
                    	<div class="field">
                        	<label>密码</label>
                            <div class="ui left labeled icon input">
                            	<input type="password" id="password1" name="password" size="30" required="required" >
                                <span class='state1'>至少6个字符,至多12个</span><br/><br/>
                            </div>
                        </div>
                        </div>
                        <div class="one fields qt-p-field">
                    	<div class="field">
                        	<label>确认密码</label>
                            <div class="ui left labeled icon input">
                            	<input type="password" id="password2" name="repass" size="30" required="required" >
                                <span class='state1'>至少6个字符,至多12个</span><br/><br/>
                            </div>
                        </div>
                        </div>
						<div class="one fields qt-p-field">
                    	<div class="field">
                        	<label>备注</label>
                            <div class="ui left labeled icon input">
                            	<input type="text" id="meno" name="meno" size="30" value=<%=qt.getmeno()%>>
                                <span class='state1'>至多20个字符</span><br/><br/>
                            </div>
                        </div>
                    	</div>
                        <input type="hidden" name="method"  value="user_qt_mod">
                        <input type="hidden"  name="page"  value="profile">
                        <button class="myButton" type="button">提交</button>
							<%
								}
							}
							%>
					</form>
					<br/>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="js/javascript/jquery.min.js"></script>
<script type="text/javascript" src="js/javascript/framework.js"></script>
<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
</script>
</body>
</html>
