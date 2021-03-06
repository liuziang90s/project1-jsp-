<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>  
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="author" content="刘兹昂, liuziang90s@163.com"> 	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
    <title>前台管理 |管理员中心</title>
    <script src="//cdn.bootcss.com/jquery/1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/IE.js"></script> 
    <!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
    <!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
	<style type="text/css">
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
	<a class="item" href="ht-order.jsp">
		<img src="img/news.gif" alt="订单消息" class="news news1" style="display:none ;width:3em;height:3em;float:right;margin-right:2rem;"/>
	</a>
</header>
<!-- the main menu-->
<div class="ui teal inverted menu fluid">
	<div class="bigcontainer">
		<div class="right menu">
			<a class="item" href="admin.jsp"><i class="home icon"></i>管理首页</a>
			<a class="item" id="active-item" href="middle_servlet?query=qt&forpage=user-sh&isvalid=1"><i class="sitemap icon" ></i>待审核用户</a>
			
			<a class="active item" id="active-item" href="middle_servlet?query=qt&forpage=user-front&isvalid=0"><i class="sitemap icon" ></i>已审核用户</a>
		</div>
	</div>
</div>
<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div>
			<!--the Devicelist-->
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large settings icon"></i>
  							<div class="content">
    							前台用户
    							<div class="sub header">用户都在这里</div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="field">
				<!--搜索条件-->
                <div class="ui mini left icon input">
				  <form action="user_qt_servlet" method="post" class="uf-form">
                    用户名：<input type="text" name="username" placeholder="请输入用户名" >
                    公司名：<input type="text" name="company"  placeholder="请输入公司名" >
                    手机：<input type="text"  name="tel" placeholder="请输入手机号" >
                    <button class="ui small blue button search-up" value="">开始搜索</button>
                    <input type="hidden"  name="method"  value="user_qt_query">
                    <input type="hidden"  name="isvalid"  value="0">
                    <input type="hidden"  name="page"  value="front">
                 </form>
                </div>
                
        		</div>
        		<br>
        		<br>
        		<br>
        		<br>
				<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<!--主体部分，插入请求数据-->
	<div class="main">
		<!--图片信息放置区域-->
		<!--主页图片信息分页显示-->
		<div class="mainPage">
			<div class="tabel-mainImg">
				<jsp:useBean id="pro" class="pro.product"></jsp:useBean>
				<table align="center" width="100%" class="hovertable">
					<tr>
						<td align="center" colspan="10">
							<h1>已审核用户列表</h1>
						</td>
					</tr>
					<tr align="center">
						<td><b>用户名</b></td>
						<td><b>公司名</b></td>
						<td><b>有效性</b></td>
						<td><b>手机号</b></td>
						<td style="display:none;"><b>id</b></td>
						<td style="display:none;"><b>用户类别</b></td>
						<td><b>备注</b></td>
						<td style="display:none;"><b>授权用户名</b></td>
						<td><b>操作</b></td>
					</tr>
					<%
						//获取图片信息集合
						List<user_qt>list=(List<user_qt>)request.getAttribute("list_qt");
							//判断集合是否有效
							if(list==null || list.size()<1){
								out.print("没有数据");
							}else{
								//遍历集合中的数据
								for(user_qt qt:list){
									%>
									<tr align="center">
										<td><%=qt.getusername()%></td>
										<td><%=qt.getcompany()%></td>
										<td><%if  (qt.getisvalid().equals("1")){out.print("已审核");}else {out.print("待审核");}%></td>
										<td><%=qt.gettel()%></td>
										<td style="display:none;"><%=qt.getid()%></td>
										<td style="display:none;"><%=qt.getlb()%></td>
										<td><%=qt.getmeno()%></td>
										<td style="display:none;"><%=qt.getisuser()%></td>
										<td>
											<button class="cl-del">删除</button>
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
				<div class="home_page">
	        	<div class="page">
					<div align="center" class="my_page" id="my_page">
				 	<div class="sum" style="display:none;"><%=pages%></div><!--从后台得到总页码数-->
					<div class="current" style="display:none;"><%=currpage%></div><!--从后台得到当前页码-->
					<div class="mypage">
					<div class="page_all">
						<div class="page_all"><a href="page_servlet?forpage=user-front&currpage=1">首页</a></div>
						<div class="page_all"><a href="page_servlet?forpage=user-front&currpage=<%=pageprev%>">上一页</a></div>
						<div class="one page_all"></div>
						<div class="page_all"><a href="page_servlet?forpage=user-front&currpage=<%=pagenext%>">下一页</a></div>
						<div class="page_all"><a href="page_servlet?forpage=user-front&currpage=<%=pages%>">末页</a></div>
					</div>
					</div>
					</div>
				</div>
	          </div>				
			</div>
		   </div>
	</div>
    </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
			$(function(){
				
				function page(){
					$(".one").html("");
					var sum=parseInt($(".sum").text()),//总页数
						num =parseInt($(".current").text());//当前页码
					var num_my=9,//每页限制显示的页码数量
						num_prev=4,//当前页前面显示的的页码数量
						num_next=4;//当前页后面显示的的页码数量
					var n = sum - num;//总页数与当前页的差值
					
					var n1=parseInt(num - num_prev);//页码显示行显示的第一个页码
					var	n2=parseInt(num) + parseInt(num_next);//页码显示行显示的最后一个页码
					var n3=parseInt(num+((sum-num)));
					var n4=parseInt(sum-num);
					//如果总页码小于每页限制显示的数量
					if(sum<=num_my){
						for (var i=1;i<=sum;i++) {
							$(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage="+i+"'>"+i+"</a></div>");
						}
					}else{//否则则执行以下代码
						//如果总页数与当前页的差值大于或等于每页限制数
						if(num<=num_my){
								for (var i=1;i<=num_my;i++) {
									$(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage="+i+"'>"+i+"</a></div>");
								}
							
						}else{
								if(n4>=num_next){
									for(var i=n1;i <= n2;i++){
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage="+i+"'>"+i+"</a></div>");
									}
								}else{
									for (var i=n1;i<=n3;i++) {
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=user-front&currpage="+i+"'>"+i+"</a></div>");
								}
							}
					}}
					//当前页码样式设置
					$(".one div a").each(function(){
						var txt =parseInt($(this).text());//页码存储文本 
						if(txt==num){
						$(this).parent().addClass("page_live");
					}
					});
				}
				page();
					
			})
		</script>
<!--footer begin-->
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
			        <input type="hidden" name="currpage" class="" value="<%=currpage %>"/>
                    <input type="hidden" name="isvalid" value="0">
                    <input type="hidden"  name="page"  value="front">
            	</form>
             	<button class="cl-dl-form" type="">取消</button>
          	</div>
        </div>
    </div>
        <script>
			$(function(){
				$(".cl-del").click(function(){
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
<script type="text/javascript" src="js/javascript/jquery.min.js"></script>
<script type="text/javascript" src="js/javascript/framework.js"></script>
<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
</script>
<script>
	$(function(){	
		$(document).onload(function(){
			$(".search").click();
			});
	})
</script>
</body>
</html>
