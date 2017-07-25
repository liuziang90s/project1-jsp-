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
    <title>图片查询中心</title>
    <script src="//cdn.bootcss.com/jquery/1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/IE.js"></script> 
    <link href="css/clearbox.css" rel="stylesheet" type="text/css" />
    
	<script src="js/clearbox.js" type="text/javascript"></script>
	<style type="text/css">
		*{margin:0;padding:0;list-style-type:none;}
		a,img{border:0;}
		body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
		
		.playbox{width:840px;margin:50px auto;overflow:hidden;padding:20px 0px 0px 20px;border:solid 1px #ddd;}
		.playbox a{ height:360px; overflow:hidden; display:block; float:left; position:relative; text-decoration:none;}
		 
		.playbox a img{min-height:360px;_height:expression(this.height > 360 ? "360px" : this.height);max-width:260px;_width:expression(this.width > 260 ? "260px" : this.width);/*使ie6支持max-width*/ border:none; }
		
		.txt{position: absolute;left: 0;bottom: 0;width: 100%;height: 45px;line-height: 45px;text-align: center;color: #fff;background: rgba(0,0,0,0.6);}
		.txt h3{font-weight: normal; margin:0px}
		.txt p{
			font-size: 14px;
			display: block;
			line-height: 20px;
			-webkit-margin-before: 1em;
			-webkit-margin-after: 1em;
			-webkit-margin-start: 0px;
			-webkit-margin-end: 0px;
			-moz-margin-before: 1em;
			-moz-margin-after: 1em;
			-moz-margin-start: 0px;
			-moz-margin-end: 0px;
		}
		.playbox span{
			font-size: 2em;
			
		}
		.entypo-heart:before {
		    content: "\2764";
		    color: #f171ab;
		}
		.out{
			height: 400px;
			width: 275px;
			display: inline-block;
		}
		.img-cle{
			width: 4em;
			margin-bottom:20px;
		}
		.heart{
			margin-left: 4px;
			text-align: center;
			line-height: 1.2em;
		}
		.gallery-li-bt{
			height: 10%;
			display:inline-block;
		}
		.uf-form input{
					width:145px !important;
				}
		
		.gallery-li-bt button,.down_load,.shopping{
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
	.my_page a{
		font-size: 1.2em;
	    line-height: 1.2em;
	    padding: 0.8em;
	}
	.my_page a :hover{
		color:red;
	}	
	.page_all{
		display: inline-block;
		padding:0 1em;
	}
	.page_all a:hover{
		color: red;
	}
	.page_live{
		background-color:rgba(204,0,204,0.5) ;
	}
	.dd-back{
		    font-size: 12px;
		    padding: .4em 2.5em .42em;
		    color: #fef4e9;
		    border: solid 1px #da7c0c;
		    background-color:#f78d1d;
		    border-radius: .5em;
		    float:right;
	}	
	</style>
	<link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
     
</head>
<body>
<!--header begin-->
<header>
<% String username=(String)session.getAttribute("username");%>
<%-- <% session.setAttribute("username",username);%> --%>
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
			<a class="item active" href="middle_servlet?query=pro&forpage=home"><i class="home icon"></i>查询中心</a>
			<a class="item" id="active-item" href="middle_servlet?query=qt_one&forpage=qt-profile"><i class="sitemap icon" ></i>账户设置</a>
			<a class=" item" id="active-item" href="middle_servlet?query=clt&forpage=qt-collection&currpage=1"><i class="sitemap icon" ></i>我的收藏</a>
			<a class=" item" id="active-item" href="middle_servlet?query=dd&forpage=dd&currpage=1"><i class="sitemap icon" ></i>我的订单</a>
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
    							图片搜索中心
    							<div class="sub header">请按照搜索条件查询</div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="field">
				<!--搜索条件-->
                <div class="ui mini left icon input">
				  <form action="product_servlet" method="post" class="uf-form">
                    产品名：<input type="text" name="product" placeholder="请输入产品名" >
                    产品类别：<input type="text" name="lb"  placeholder="请输入产品类别" >
                    图片名：<input type="text" name="pic_name"  placeholder="请输入图片名" >
                    图片描述：<input type="text"  name="pic_meno" placeholder="请输入图片描述" >
                    <button class="ui small blue button search-up" value="">开始搜索</button>
                    <input type="hidden"  name="method"  value="product_query">
                    <input type="hidden"  name="page"  value="home_only">
                    <input type="hidden"  name="currpage"  value="1">
                 </form>
                </div>
                
        		</div>
        		<br>
        		<br>
        		<br>
        		<br>
        		</div>
        		</div>
				<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<!--主体部分，插入请求数据-->
	<div class="main">
		<!--图片信息放置区域-->
		<!--主页图片信息分页显示-->
		<div class="mainPage">
			<div class="playbox">	
				<%  
						List<product>list=(List<product>)request.getAttribute("list_cp");
							//判断集合是否有效
							if(list==null || list.size()<1){
								out.print("没有数据");
							}else{
								//遍历集合中的数据
								for(product p:list){
									%>
				<div class="out">
					<a href=<%="img\\"+p.getpath()+p.getpic_name()%> rel="clearbox[test1]">
						<img src="<%="img\\"+p.getpath()+p.getpic_name()%>"/>
						<div class="txt">
							<h3><%=p.getproduct()%> <span class="entypo-heart heart"><%=p.getcollection()%></span></h3>
							<p><%=p.getpic_meno()%></p>
						</div>
					</a>
					<a href="<%="img\\"+p.getpath()+p.getpic_name()%>" download=<%=p.getproduct()%>">
						<button class="down_load" >点击下载</button>
					</a>
											
						<form action="user_clt_servlet" method="post"class="gallery-li-bt">
							<input type="hidden" name="id" class="" value="<%=p.getid()%>"/>
							<input type="hidden" name="method" class="" value="user_clt_add"/>
							<!-- 改动 -->
							<input type="hidden" name="currpage" class="" value="<%=currpage %>"/>
							<button type="submit">点击收藏</button><!--//js在index.js-->
						</form>
					<a>
						<button type="submit" class="shopping">下单</button>
						<span style="display:none"><%=p.getid()%></span>
						<span style="display:none"><%=p.getpic_name()%></span>
						<span style="display:none"><%=currpage %></span>
					</a>
																		
				</div>
				<%
								}
							}
							%>
			</div>	
			
        </div>
        <!--下单提醒弹出框/form表单提交-->
	<div class="cont_info_log_sign_up">
		<div class="col_md_login">
          	<div class="cont_ba_opcitiy">
            	<h4>确定要下单吗？</h4>
            	<form action="user_dd_servlet" method="post"class="gallery-li-bt">
							<input type="hidden" name="ids" class="dd-id dd"/>
							<input type="hidden" name="method" class="" value="user_dd_add"/>
                            <input type="hidden"  name="page"  value="home">
							<input type="hidden" name="currpage" class="currpage dd "/>
							<input type="hidden" name="pic_names" class="dd-name dd"/>
							<button type="submit">确认下单</button><!--//js在index.js-->
				</form>
             	<button class="dd-back" type="">取消</button>
          	</div>
        </div>
    </div>
        <script>
			$(function(){
				$(".shopping").click(function(){
					$(".dd").html("");
					$(".cont_info_log_sign_up").show();
					var txt1=$(this).siblings("span").eq(0).text();
					var txt2=$(this).siblings("span").eq(1).text();
					var txt3=$(this).siblings("span").eq(2).text();
					$(".dd-id").val(txt1);
					$(".dd-name").val(txt2);
					$(".currpage").val(txt3);
				});
				$(".dd-back").click(function(){
					$(".dd").html("");
					$(".cont_info_log_sign_up").hide();
				});
			})
		</script>
	        <div class="home_page">
	        	<div class="page">
					<div align="center" class="my_page" id="my_page">
				 	<div class="sum" style="display:none;"><%=pages%></div><!--从后台得到总页码数-->
					<div class="current" style="display:none;"><%=currpage%></div><!--从后台得到当前页码-->
					<div class="mypage">
					<div class="page_all">
						<div class="page_all"><a href="page_servlet?forpage=home&currpage=1">首页</a></div>
						<div class="page_all"><a href="page_servlet?forpage=home&currpage=<%=pageprev%>">上一页</a></div>
						<div class="one page_all"></div>
						<div class="page_all"><a href="page_servlet?forpage=home&currpage=<%=pagenext%>">下一页</a></div>
						<div class="page_all"><a href="page_servlet?forpage=home&currpage=<%=pages%>">末页</a></div>
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
							$(".one").append("<div class='page_all'><a href='page_servlet?forpage=home&currpage="+i+"'>"+i+"</a></div>");
						}
					}else{//否则则执行以下代码
						//如果总页数与当前页的差值大于或等于每页限制数
						if(num<=num_my){
								for (var i=1;i<=num_my;i++) {
									$(".one").append("<div class='page_all'><a href='page_servlet?forpage=home&currpage="+i+"'>"+i+"</a></div>");
								}
							
						}else{
								if(n4>=num_next){
									for(var i=n1;i <= n2;i++){
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=home&currpage="+i+"'>"+i+"</a></div>");
									}
								}else{
									for (var i=n1;i<=n3;i++) {
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=home&currpage="+i+"'>"+i+"</a></div>");
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

<script type="text/javascript">
//从底部上升的遮罩效果开始
$(".playbox a").hover(function(){
	$(this).find(".txt").stop().animate({height:"360px"},200);
	$(this).find(".txt h3").stop().animate({paddingTop:"60px"},200);
},function(){
	$(this).find(".txt").stop().animate({height:"45px"},200);
	$(this).find(".txt h3").stop().animate({paddingTop:"0px"},200);
})
//从底部上升的遮罩效果结
</script>

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
