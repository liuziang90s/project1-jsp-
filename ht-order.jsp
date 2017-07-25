<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>  
<%@ page import="java.util.*" %>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="author" content="刘兹昂, liuziang90s@163.com"> 	
    <title>我的收藏 |用户中心</title>
    <script src="//cdn.bootcss.com/jquery/1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/IE.js"></script> 
    <link href="css/myCart.css" type="text/css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
    
	<style type="text/css">
	table.hovertable {
		font-family: verdana,arial,sans-serif;
		font-size:11px;
		color:#333333;
		border-width: 1px;
		border-color: #999999;
		border-collapse: collapse;
	}
	table.hovertable th {
		background-color:#c3dde0;
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
	}
	table.hovertable tr {
		background-color:#d4e3e5;
	}
	table.hovertable td {
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #a9c6c9;
	}
	.my_page a{
		font-size: 1em;
	    line-height: 1em;
	    padding: 0.5em;
	}
	.my_page a :hover{
		color:red;
	}	
	.page_all{
		display: inline-block;
		padding:0 0.5em;
	}
	.page_all a:hover{
		color: red;
	}
	.page_live{
		background-color:rgba(204,0,204,0.5) ;
	}
	.hidden{
		display: none;
	}
	td{
         white-space: nowrap;
      }	 
    .order{
    	font-size: 12px;
		    padding: .4em 1.5em .42em;
			color: #fef4e9;
		    border: solid 1px #da7c0c;
		    border-radius: .5em;
		    background: #f78d1d;
		    background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
			position: relative;
			margin-right:2px;
			z-index: 100;
    } 
    .editor{
    	border-radius: 14px;
    	padding: 4px 16px;
    	color: #fff;
    	background-color: #FF6600;
    }
    .remove{
    	border-radius: 14px;
    	padding: 4px 16px;
    	color: #000;
    	background-color:red;
    }   		
</style>
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
<% if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
<%//int currpage=(int)request.getAttribute("currpage");if (currpage==0) currpage=1;%>
<%//int pages=(int)request.getAttribute("pages");%>
<%//int pageprev=currpage-1; if (currpage==1) pageprev++;%>
<%//int pagenext=currpage+1; if (currpage==pages) pagenext--;%>
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
	<a class="item" href="ht-order.jsp">
		<img src="img/news.gif" alt="订单消息" class="news news1" style="display:none ;width:3em;height:3em;float:right;margin-right:2rem;"/>
	</a>
</header>
<!-- the main menu-->
<div class="ui teal inverted menu fluid">
	<div class="bigcontainer">
		<div class="right menu">
			<a class="item" href="admin.jsp"><i class="home icon"></i>管理首页</a>
			<a class="item" id="active-item" href="middle_servlet?query=qt&forpage=user-sh&isvalid=1"><i class="sitemap icon" ></i>用户审核</a>
			
			<a class="item" id="active-item" href="middle_servlet?query=qt&forpage=user-front&isvalid=0"><i class="user icon" ></i>前台用户</a>
			<a class="active item" id="active-item" href="middle_servlet?query=dd&forpage=ht-order"><i class="money icon" ></i>用户订单</a>
		</div>
	</div>
</div>
<div class="container">
	
</div>
        		
<div id="content">
				<!--搜索条件-->
	<div class="ui mini left icon input" style="margin-right:4em;">
		<form action="user_dd_servlet" method="post" class="uf-form">
		按用户账号查询：<input type="text" name="username" placeholder="可输入用户名查询" >
        <button class="ui small blue button search-up" value="">开始搜索</button>
        <input type="hidden"  name="method"  value="user_dd_query">
        <input type="hidden"  name="page"  value="ht-order">
        <input type="hidden"  name="isread"  value="4">
        </form><br><br><br><br>
    </div>
    <div class="ui mini left icon input">
		<form action="user_dd_servlet" method="post" class="uf-form">
		按订单状态查询：<select name="isread" style="padding:6px 8px;">
			<option value="0">未处理订单</option>
			<option value="1">已处理订单</option>
			<option value="2">全部订单</option>
		</select>
        <button class="ui small blue button search-up dd-state" value="">开始搜索</button>
        <input type="hidden"  name="method"  value="user_dd_query">
        <input type="hidden"  name="page"  value="ht-order">
        </form><br><br><br><br>
    </div>
    
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
   <%
		//获取图片信息集合
		List<user_dd>list=(List<user_dd>)request.getAttribute("list_dd");
		//判断集合是否有效
		if(list==null || list.size()<1){
		out.print("<p style='text-align:center;'>未查询到订单</p>");
		}else{
	%>
	 	<tr>
	 		<td colspan="8">订单信息</td>
	 	</tr>
	 <div>
	  <tr>
	    <td class="title_1">图片</td>
	    <td class="title_2">订单</td>
	    <td class="title_3">货号</td>
	    <td class="title_4">下单时间</td>
	    <td class="title_5"><b>用户名</b></td>
	    <td class="title_6"><b>订单状态</b></td>
	    <td class="title_7"><b>确认订单</b></td>
	    <td class="title_8"><b>删除</b></td>
	  </tr>
	  <tr>
	    <td colspan="8" class="line"></td>
	  </tr>
  <%
		for(user_dd dd:list){
	%>
   <tr>
    <td class="cart_td_2"><img width="60px;" height="60px;" align="center" style="margin-top: 5px; margin-bottom: 5px;" src="<%="img\\"+dd.getpath()+dd.getpic_name()%>" alt="<%=dd.getpic_name()%>"/></td>
    <td class="cart_td_3"><a href="#"><%=dd.getpic_name()%></a>
    <td class="cart_td_4"><%=dd.getid()%></td>
    <td class="cart_td_5"><%=dd.getdatetime()%></td>
    <td class="cart_td_6"><%=dd.getusername()%></td>
    <td class="cart_td_6"><%=dd.getisread()%></td>
    <td class="cart_td_7">
    	<form action="user_dd_servlet" method="post">
			<input type="hidden" name="id" value="<%=dd.getid()%>">
			<input type="hidden" name="method" value="user_dd_mod">
            <input type="hidden"  name="page"  value="ht-order">
            <input type="hidden" name="isread" value="0">
			<button class="editor">接单</button>
			
		</form>	
    </td>
    <td class="cart_td_8"><button class="remove">退单</button></td>
  </tr>
  <%
		}
			}
			%>
  </div>
</table>
</div>
<!--删除弹出框-->
		<div class="cont_info_log_sign_up">
				<div class="col_md_login">
		          <div class="cont_ba_opcitiy">
		            <h4>真的要删除吗？</h4>
		            <form action="user_dd_servlet"method="post" class="myform">
		            <div class="cl-mydel"></div>
		            <button class="btn_sign_up" type="submit">删除</button>
		             <input type="hidden"  name="method" value="user_dd_del">
		             <input type="hidden"  name="page" value="dd">
		            </form>
		            <button class="cl-dl-form"  type="button">取消</button>
		          </div>
		        </div>
		</div>	
		<script>
		$(function(){
			//		删除操作
			$(".remove").click(function(){
				$(".cl-mydel").html("");
				$(".cont_info_log_sign_up").show();
				var num=$(this).parents().siblings(".cart_td_4");
				var txt=num.text();
				$(".cl-mydel").append($("<input type='hidden' name='id' value='"+txt+"' />"));
			});
			//		提交取消后还原设置
		 	$(".cl-dl-form").click(function(){
				$(".cont_info_log_sign_up").hide();
				$(".cl-mydel").html("");
			});
			
		})			
		</script>       
<script type="text/javascript" src="js/javascript/jquery.min.js"></script>
<script type="text/javascript" src="js/javascript/framework.js"></script>
<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
</script>
</body>
</html>
