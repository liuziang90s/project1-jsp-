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
    
	<!--<script type="text/javascript" src="js/myCart.js"></script>-->
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
</style>
</head>
<body>
<div class="page">
<!--header begin-->
<header>
<% String username=(String)session.getAttribute("username");%>
<% if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
<%//int currpage=0;currpage=(int)request.getAttribute("currpage");if (currpage==0) currpage=1;%>
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
			<a class="item" href="middle_servlet?query=qt_one&forpage=qt-profile"><i class="info icon"></i>账户</a>
			<a class="active item" href="middle_servlet?query=clt&forpage=qt-collection"><i class="bullseye icon"></i>我的收藏</a>
		</div>
	</div>
</div>
<div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 	<tr>
 		<td colspan="6">选择收藏的产品提交后可下单</td>
 	</tr>
 <div>
  <tr>
    <td class="title_1">选择</td>
    <td class="title_2" colspan="2">收藏图片</td>
    <td class="title_3">货号</td>
    <td style="display: none"><b>用户名</b></td>
    <td class="title_4">收藏时间</td>
    <td class="title_7">操作</td>
  </tr>
  <tr>
    <td colspan="6" class="line"></td>
  </tr>
  <%
		//获取图片信息集合
		List<user_clt>list=(List<user_clt>)request.getAttribute("list_clt");
		//判断集合是否有效
		if(list==null || list.size()<1){
				out.print("没有数据");
		}else{
			for(user_clt clt:list){
							%>
			   <tr>
			    <td class="cart_td_1">
			    	<input name="cartCheckBox" type="checkbox" value="product1"  />
			    </td>
			    <td class="cart_td_2"><img width="60px;" height="60px;" align="center" style="margin-top: 5px; margin-bottom: 5px;" src="<%="img\\"+clt.getpath()+clt.getpic_name()%>" alt="<%=clt.getpic_name()%>"/></td>
			    <td class="cart_td_3"><a href="#"><%=clt.getpic_name()%></a>
			    <td class="cart_td_4"><%=clt.getnum()%></td>
			    <td style="display: none"><%=clt.getusername()%></td>
			    <td class="cart_td_5"><%=clt.getdatetime()%></td>
			    <td class="cart_td_8"><a href="#" class="cl-del">删除</a></td>
			  </tr>
  <%
	          }
		}
			%>
   <tr>
   	
	   <td  colspan="3">
	   	<br />
	    <button class="order" type="button">提交订单</button>
	   </td>
  </tr>
  </div>
</table>
</div>
<!--删除弹出框-->
<div class="cont_info_log_sign_up">
		<div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h4>真的要删除吗？</h4>
            <form action="user_clt_servlet"method="post" class="myform">
            <div class="cl-mydel"></div>
            <button class="btn_sign_up" type="submit">删除</button>
             <input type="hidden"  name="method" value="user_clt_del">
            </form>
            <button class="cl-dl-form"  type="button">取消</button>
          </div>
        </div>
</div>	
<!--订单提交弹出框-->
<div class="cont_info_log_sign_up">
		<div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h4>确认提交订单？</h4>
            <form action="user_dd_servlet" method="post" class="myform">
            <div class="cl-mydel"></div>
            <button class="btn_sign_up" type="submit">确认</button>
             <input type="hidden"  name="method" value="user_dd_add">
             <input type="hidden"  name="page" value="qt-clooection">
            </form>
            <button class="cl-dl-form"  type="button">取消</button>
          </div>
        </div>
</div>	
<script>
	$(function(){
//		删除操作
		$(".cl-del").click(function(){
			$(".cl-mydel").html("");
			$(".cont_info_log_sign_up").eq(0).show();
			var num=$(this).parent().siblings().eq(3);
			var txt=num.text();
			$(".cl-mydel").append($("<input type='hidden' name='id' value='"+txt+"' />"));
		});
//		提交订单
		$(".order").click(function(){
			$(".cl-mydel").html("");
			$(".cont_info_log_sign_up").eq(1).show();
			var oInput=document.getElementsByName("cartCheckBox");
			var oTd=$(".cart_td_4");
			var oTn=$(".cart_td_3");
			var Index;
	 	for (var i=oInput.length-1;i>=0;i--){
	   	if(oInput[i].checked==true){
		 	var txt2=oTd.eq(i).text();
		 	var txt3=oTn.eq(i).text();
	     	$(".cl-mydel").append($("<input type='hidden' name='ids' value='"+txt2+"' />"));
	     	$(".cl-mydel").append($("<input type='hidden' name='pic_names' value='"+txt3+"' />"));
		    }
		}
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
