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
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
<style type="text/css">
        body{
        	color:#51555c;
        }
        	.container {
			    width: 980px;
			    min-height: 600px;
			    margin: 30px auto 0 auto;
			    border: 1px solid #d3d3d3;
			    background: #fff;
			    -moz-border-radius: 5px;
			    -khtml-border-radius: 5px;
			    -webkit-border-radius: 5px;
			    border-radius: 5px;
			}
			.per {
			    float: left;
			    border: 1px solid #e0e0e0;
			    text-align: center;
			    padding: 10px 0;
			    width: 33%;
			    margin-right: 1px;
			}
			.per .title {
			    text-align: left;
			    overflow: hidden;
			    white-space: nowrap;
			    text-overflow: ellipsis;
			    width: 180px;
			    margin: 0 0 10px 10px;
			}
			.per h3 span {
			    font-size: 20px;
			}
			.per h3 {
		    line-height: 32px;
		    font-size: 1.1em;
		    color: #f30;
		    font-weight: 500;
		    margin-bottom: 6px;
		    overflow:hidden;
			 white-space:nowrap;
			 text-overflow:ellipsis;
		}
			img {
			    border: 0;
			    cursor: pointer;
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
</head>
<body>
<div class="page">
<!--header begin-->
	<header>
	<% String username=(String)session.getAttribute("username");%>
	<% if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
	<%int currpage=0;currpage=(int)request.getAttribute("currpage");if (currpage==0) currpage=1;%>
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
				<a class="active item" href="middle_servlet?query=qt_one&forpage=dd"><i class="order icon"></i>订单记录</a>
			</div>
		</div>
	</div>

			<div class="container">
				<%
						//获取图片信息集合
						List<user_dd>list=(List<user_dd>)request.getAttribute("list_dd");
						//判断集合是否有效
						if(list==null || list.size()<1){
								out.print("没有数据");
						}else{
							for(user_dd dd:list){
							%>
                <div class="per">
                	<span style="display:none;"><%=dd.getid()%></span>	
                    <img src="<%="img\\"+dd.getpath()+dd.getpic_name()%>" width="180" height="240" alt="图片四"/>
                    <h3><%=dd.getpic_name()%></h3>
                    <div class="title">下单时间：<%=dd.getdatetime()%><span></span></div>
                </div>
                <%
												}
											}
											%>
           </div>
        	</div>	
			<div class="home_page">
	        	<div class="page">
					<div align="center" class="my_page" id="my_page">
					 	<div class="sum" style="display:none;"><%=pages%></div><!--从后台得到总页码数-->
						<div class="current" style="display:none;"><%=currpage%></div><!--从后台得到当前页码-->
						<div class="mypage">
						<div class="page_all">
							<div class="page_all"><a href="page_servlet?forpage=dd&currpage=1">首页</a></div>
							<div class="page_all"><a href="page_servlet?forpage=dd&currpage=<%=pageprev%>">上一页</a></div>
							<div class="one page_all"></div>
							<div class="page_all"><a href="page_servlet?forpage=dd&currpage=<%=pagenext%>">下一页</a></div>
							<div class="page_all"><a href="page_servlet?forpage=dd&currpage=<%=pages%>">末页</a></div>
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
							$(".one").append("<div class='page_all'><a href='page_servlet?forpage=dd&currpage="+i+"'>"+i+"</a></div>");
						}
					}else{//否则则执行以下代码
						//如果总页数与当前页的差值大于或等于每页限制数
						if(num<=num_my){
								for (var i=1;i<=num_my;i++) {
									$(".one").append("<div class='page_all'><a href='page_servlet?forpage=dd&currpage="+i+"'>"+i+"</a></div>");
								}
							
						}else{
								if(n4>=num_next){
									for(var i=n1;i <= n2;i++){
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=dd&currpage="+i+"'>"+i+"</a></div>");
									}
								}else{
									for (var i=n1;i<=n3;i++) {
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=dd&currpage="+i+"'>"+i+"</a></div>");
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
		
		<script type="text/javascript" src="js/javascript/jquery.min.js"></script>
		<script type="text/javascript" src="js/javascript/framework.js"></script>
		<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
		<script type="text/javascript">
			$('.ui.dropdown')
			.dropdown();
		</script>
</body>
</html>
