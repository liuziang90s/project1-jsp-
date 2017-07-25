<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="pro.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content=""> <!-- 页面关键词 -->
	<meta name="author" content="刘兹昂, liuziang90s@163.com">
    <title>管理首页 | 用户中心</title>
    <script type="text/javascript" src="js/IE.js"></script>
	<script type="text/javascript" src="js/javascript/jquery.min.js"></script>    
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" /><!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->    
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
	<script type="text/javascript">
			$(function(){
				var ajaxNew = function(){
					var url = "http://localhost:8080/produce/message_servlet";
	//				var data = {type:1};
					$.ajax({
						type : "GET",
						async : false, //同步请求
						url : url,
						dataType:"json",
						timeout:1000,
						success:function(dates){
		//				$("#mainContent").html(dates);//要刷新的div
							if(dates.count != 0){
								$(".news1").show();
								console.log(dates.count);
							}else{
								$(".news1").hide();
							}
						},
						error: function() {
						// alert("失败，请稍后再试！");
						}
					});
				}
				setInterval(ajaxNew,1000);
			
			})
		</script>
</head>
<body>
<div class="page">
<!--header begin-->
<header>
<% String username=(String)session.getAttribute("username");%>
<%-- <% session.setAttribute("username",username);%> --%>
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
					<a class="item" href="index.jsp" id="Cancellation"><i class="sign out icon"></i>注销登录</a>
				</div><!--  http://localhost:8080/produce/index.jsp  -->
				
			</div>
		</div>
	</div>
	 <a class="item" href="ht-order.jsp">
		<img src="img/news.gif" alt="订单消息" class="news news1" style="display:none ;width:3em;height:3em;float:right;margin-right:2rem;"/>
	</a>
</header>
<!-- the main menu-->
<div class="ui teal inverted menu">
	<div class="bigcontainer">
		<div class="right menu">
			<a class="active item" href="admin.jsp"><i class="home icon"></i>管理首页</a>
			<a class="item" href="middle_servlet?query=qt&forpage=user-front&isvalid=0"><i class="sitemap icon"></i>用户管理</a>
            <a class="item" href="middle_servlet?query=pro&forpage=product"><i class="cloud icon"></i>图片管理</a>
            <a class="item" href="middle_servlet?query=lb&forpage=class"><i class="cloud icon"></i>类名管理</a>
            <a class="item" href="middle_servlet?query=dd&forpage=ht-order"><i class="cloud icon"></i>订单管理</a>
			<a class="item" href="ht-add.jsp"><i class="cloud icon"></i>后台账号管理</a>			
		</div>
	</div>
</div>

<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="pageHeader">
			<div class="segment">
				<h3 class="ui dividing header">
  					<i class="large home icon"></i>
  					<div class="content">
    					管理首页
    					<div class="sub header">快速查看和编辑</div>
  					</div>
				</h3>
			</div>
		</div>
    </div>


<script type="text/javascript" src="js/javascript/framework.js"></script>
<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript" src="js/javascript/index.js"></script>
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
</script>
</body>
</html>