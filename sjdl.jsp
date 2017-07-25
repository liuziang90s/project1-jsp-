    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>登录注册</title>
            <%session.removeAttribute("username"); %>
            <%session.removeAttribute("list_qt_page"); %>
            <%session.removeAttribute("list_clt_page"); %>
            <%session.removeAttribute("list_cp_page"); %>
        <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/sj-styles.css">
        <style>
        .state2{
        color:#fff;
        background:rgba(255,255,255,0.1);
        }
        .state3{
        color:red;
        background: rgba(255,0,0,0.5  );
        }
        </style>
        </head>
        <body>

        <div style="height:30px;"></div>

        <div class="login-wrap">
        <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked /><label for="tab-1" class="tab">登录</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up" /><label for="tab-2" class="tab">注册</label>
        <div class="login-form">
	        <form class="sign-in-htm" action="user_judge_servlet_wx" method="post" name="form1">
		        <div class="group row">
			        <label for="" class="label col-xs-3">用户名</label>
			        <input id="" type="text" class="input col-xs-9" name="username"/>
		        </div>
		        <div class="group row">
			        <label for="" class="label col-xs-3">密码</label>
			        <input id="" type="password" class="input password col-xs-9" data-type="password" name="pwd"/>
		        </div>
		        <div class="group">
			        <input id="check" type="checkbox" class="check" checked />
			        <label for="check"><span class="icon"></span> 记住密码</label>
		        </div>
		        <div class="group row">
		        	<input type="submit" class="button col-xs-9 col-xs-offset-3" value="登录" name="button"/>
		        </div>
		        <input type="radio" id="Sex_Man" name="method" value="qt" checked="checked" style="display:none;"/>
		        <div class="hr"></div>
		        <div class="foot-lnk">
		        	<label for="tab-2">没有账号？快注册吧</label>
		        </div>
	        </form>
	        <form class="sign-up-htm" action="user_qt_servlet" method="post" name="form2">
		        <div class="group row">
			        <label for="" class="label col-xs-3">用户名</label>
			        <input id="" type="text" class="input ok col-xs-9" name="username" placeholder="由数字、26个英文字母或下划线组成,3-11个字符"/>
		        </div>
		        <div class="group row">
			        <label for="" class="label col-xs-3" >密&nbsp码</label>
			        <input name="password" type="password" class="input ok col-xs-9" data-type="password" placeholder="输入密码，长度为6-12个字符"/>
		        </div>
		        <div class="group row">
			        <label for="" class="label col-xs-3" >密&nbsp码</label>
			        <input name="user_password" type="password" class="input ok col-xs-9" data-type="password" placeholder="确认密码"/>
		        </div>
		        <div class="group row">
			        <label for="" class="label col-xs-3" >公司名</label>
			        <input  type="text" class="input ok col-xs-9" placeholder="长度为6-12个字符" name="company"/>
		        </div>
		        <div class="group row">
			        <label for="" class="label col-xs-3" >手机号</label>
			        <input id="" type="text" class="input ok col-xs-9" name="tel"/>
		        </div>
		        <div class="group row">
			        <label for="" class="label col-xs-3" >备&nbsp注</label>
			        <input  type="text" class="input col-xs-9" placeholder="不超过20个字符" name="meno"/>
		        </div>
		        <div class="group row">
		        	<input type="submit" class="button col-xs-9 col-xs-offset-3" value="注册" name="ok" disabled="disabled"/>
		        </div>
		        <div class="hr hr2">
		        </div>
		        <div class="foot-lnk">
		        	<label for="tab-1">已注册登录?</label>
		        </div>
		        <input type="hidden"  name="method" id="method" value="user_qt_add">
		        <input type="hidden"  name="page" id="method" value="sj">
	        </form>
        </div>
        </div>
        </div>
        <script>
            $(function(){
 
                var ok1=true;
                var ok2=true;
                var ok3=true;
                var ok4=true;
                var ok5=true;
                var ok6=true;
                // 验证用户名
                $('input[name="username"]').focus(function(){

                    $(this).removeClass('state3').addClass('state2');
                }).blur(function(){
                    if($(this).val().search(/^[0-9a-zA-Z_]{1,}$/)==-1 || $(this).val().length <3  || $(this).val().length >11 || $(this).val()==''){
                        $(".hr2").html('由数字、26个英文字母或下划线组成,3-11个字符').removeClass('state2').addClass('state3');
                        $(this).removeClass('state2').addClass('state3');
                        ok1=false;
                    }else{
                        $(this).removeClass('state3').addClass('state2');
                        $(".hr2").html("");
                        ok1=true;
                        console.log(ok1);
                    }
                     
                });
 				//验证公司名company
 				$('input[name="company"]').focus(function(){

                    $(this).removeClass('state3').addClass('state2');
                }).blur(function(){
                    if($(this).val().length >= 6 && $(this).val().length <=12&& $(this).val()!=''){
                       $(this).removeClass('state3').addClass('state2');
                        $(".hr2").html("");
                        ok2=true;
                        console.log(ok2);
                    }else{
                        $(".hr2").html('至少6个字符，至多12个字符').removeClass('state2').addClass('state3');
                        $(this).removeClass('state2').addClass('state3');
                        ok2=false;
                    }
                     
                });
                //验证密码
                $('input[name="password"]').focus(function(){

                    $(this).removeClass('state3').addClass('state2');
                    
                }).blur(function(){
                    if($(this).val().length >= 6 && $(this).val().length <=12&& $(this).val()!=''){
                        $(this).removeClass('state3').addClass('state2');
                        $(".hr2").html("");
                        ok3=true;
                        console.log(ok3);
                    }else{
                        $(".hr2").html('密码应该为6-20位之间').removeClass('state2').removeClass('state3').addClass('state3');
                        $(this).removeClass('state2').addClass('state3');
                        ok3=false;
                    }
                     
                });
 
                //验证确认密码
                    $('input[name="user_password"]').focus(function(){
                    	$(this).removeClass('state3').addClass('state2');
                    $(this).removeClass('state3').addClass('state2');
                }).blur(function(){
                    if($(this).val().length >= 6 && $(this).val().length <=12 && $(this).val()!='' && $(this).val() == $('input[name="password"]').val()){
                        $(this).removeClass('state3').addClass('state2');
                        $(".hr2").html("");
                        ok4=true;
                        console.log(ok4);
                    }else{
                        $(".hr2").html('输入的确认密码要和上面的密码一致,规则也要相同').removeClass('state2').addClass('state3');
                        $(this).removeClass('state2').addClass('state3');
                        ok4=false;
                    }
                     
                });
                //验证手机
                $('input[name="tel"]').focus(function(){
					$('input[name="ok"]').removeAttr("disabled");
                    
                }).blur(function(){
                    if($(this).val().search(/^(10|11|12|13|14|15|16|17|18|19)[0-9]{9}$/)==-1){
                        $(".hr2").html('请输入正确的手机格式').removeClass('state2').addClass('state3');
                        $(this).removeClass('state2').addClass('state3');
                        ok5=false;
                    }else{                  
                        $(this).removeClass('state3').addClass('state2');
                        $(".hr2").html("");
                        
                        ok5=true;
                        console.log(ok5);
                    }
                     
                });
 				//验证备注
 				$('input[name="meno"]').focus(function(){

                	$(this).removeClass('state3').addClass('state2');
                }).blur(function(){
                    if($(this).val().length <=25 ){
                        $(this).removeClass('state3').addClass('state2');
                        $(".hr2").html("");
                        ok6=true;
                        console.log(ok6);
                    }else{
                        $(".hr2").html('最多25个字').removeClass('state2').addClass('state3');
                        $(this).removeClass('state2').addClass('state3');
                        ok6=false;
                    }
                     
                });
                //提交按钮,所有验证通过方可提交
 				
                $('input[name="ok"]').click(function(){
                	
                
                    if(ok1==true && ok2==true && ok3==true && ok4==true && ok5==true && ok6==true ){
                    	 $('form').submit();
                    }else{
                    	alert("非法注册");
                        return false;
                    }
                });
                 
            });
        </script>


        </body>
        </html>