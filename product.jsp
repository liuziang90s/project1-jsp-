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
    <title>图片管理 |管理员中心</title>
    <script type="text/javascript" src="js/IE.js"></script>
    <script src="//cdn.bootcss.com/jquery/1.4.3/jquery.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" /><!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
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
			.cl-del,.editor{
				display:inline-block;
				width:4em;
				height:2em;
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
			<a class="active item" href="middle_servlet?query=pro&forpage=product"><i class="cloud icon"></i>已有图片</a>
			<a class="item" href="middle_servlet?query=lb&forpage=product-new"><i class="info icon"></i>新增图片</a>
			<a class="item" href="middle_servlet?query=lb&forpage=product-all"><i class="cloud icon"></i>图片批量上传</a>
		
		</div>
	</div>
</div>
<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<!--主体部分，插入请求数据-->
		<!--图片信息放置区域-->
      <div class="field">
		<div class="field">
		      <form action="product_servlet" action="post" class="uf-form">
                <div class="ui small icon input">
                    产品名：<input type="text" name="product" placeholder="请输入产品名" >
                    图片类别：<input type="text" name="lb"  placeholder="请输入产品类别" >
                    图片名：<input type="text" name="pic_name"  placeholder="请输入图片名" >
                    图片描述：<input type="text"  name="pic_meno" placeholder="请输入图片描述" >
                    报价：<input type="text"  name="price" placeholder="请输入报价" >
			        <input type="hidden" name="method" value="product_query">
                    <input type="hidden"  name="page"  value="product_only">
                    <input type="hidden"  name="currpage"  value="1">
                	<button class="ui small blue button search-p"  name="">开始搜索</button>
              </form> 
        </div>
        <br><br><br>
		<!--主页图片信息分页显示-->
				<div class="mainPage">
			<div class="tabel-mainImg">
				<table align="center" width="100%" class="hovertable">
					<tr>
						<td align="center" colspan="10">
							<h5>所有产品信息</h5>
						</td>
					</tr>
					<tr align="center">
						<td style="display:none;"><b>id</b></td>
						<td><b>图片</b></td>
						<td><b>产品名称</b></td>
						<td><b>图片类别</b></td>
						<td><b>图片名称</b></td>
						<td><b>图片描述</b></td>
						<td><b>查看级别</b></td>
						<td><b>时间</b></td>
						<td><b>收藏量</b></td>
						<td style="display:none;"><b>图片相对路径</b></td>
						<td><b>操作</b></td>
					</tr>
					<%
						//获取图片信息集合
						List<product>list=(List<product>)request.getAttribute("list_cp");
							//判断集合是否有效
							if(list==null || list.size()<1){
								out.print("没有数据");
							}else{
								//遍历集合中的数据
								for(product cp:list){
									%>
									<tr align="center" class="dl-tr">
										<td style="display:none;"><%=cp.getid()%></td>
										<td>
											<img name="img" id="img" width="60px;" height="60px;" align="center" style="margin-top: 5px; margin-bottom: 5px;" src="<%="img\\"+cp.getpath()+cp.getpic_name()%>"/>
										</td>
										<td><%=cp.getproduct()%></td>
										<td><%=cp.getlb()%></td>
										<td><%=cp.getpic_name()%></td>
										<td><%=cp.getpic_meno()%></td>
										<td><%=cp.getlooklevel()%></td>
										<td><%=cp.getdatetime()%></td>
										<td><%=cp.getcollection()%></td>
										<td style="display:none;"><%=cp.getpath()%></td>
										<td>
											<button class="cl-del">删除</button>
											<button class="editor">编辑</button>
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
						<div class="page_all"><a href="page_servlet?forpage=product&currpage=1">首页</a></div>
						<div class="page_all"><a href="page_servlet?forpage=product&currpage=<%=pageprev%>">上一页</a></div>
						<div class="one page_all"></div>
						<div class="page_all"><a href="page_servlet?forpage=product&currpage=<%=pagenext%>">下一页</a></div>
						<div class="page_all"><a href="page_servlet?forpage=product&currpage=<%=pages%>">末页</a></div>
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
							$(".one").append("<div class='page_all'><a href='page_servlet?forpage=product&currpage="+i+"'>"+i+"</a></div>");
						}
					}else{//否则则执行以下代码
						//如果总页数与当前页的差值大于或等于每页限制数
						if(num<=num_my){
								for (var i=1;i<=num_my;i++) {
									$(".one").append("<div class='page_all'><a href='page_servlet?forpage=product&currpage="+i+"'>"+i+"</a></div>");
								}
							
						}else{
								if(n4>=num_next){
									for(var i=n1;i <= n2;i++){
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=product&currpage="+i+"'>"+i+"</a></div>");
									}
								}else{
									for (var i=n1;i<=n3;i++) {
										$(".one").append("<div class='page_all'><a href='page_servlet?forpage=product&currpage="+i+"'>"+i+"</a></div>");
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
<!--//修改产品弹窗-->
<script>
    $(function(){
        $(".editor").click(function(){
        	$("#page").css("display","block");
            var clTd=$(this).parent().siblings();
            var cp_txt1=clTd.eq(0).text();//名称
            var cp_txt2=clTd.eq(1).text();//货号
            var cp_txt4=clTd.eq(3).text();//图片名称
            var cp_txt5=clTd.eq(4).text();//描述
            var cp_txt8=clTd.eq(5).text() - 1;
            $(".product").val(cp_txt1);
            $(".cp-num").val(cp_txt2);
            $(".cp-name").val(cp_txt4);
            $(".cp-dc").val(cp_txt5);
            $(".kf").eq(cp_txt8).attr("checked","checked");

        });
        $(".tc-close").click(function(){
    		$("div#page").css("display","none");
    	});
    })
</script>
<div class="page" id="page">
	<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="ui grid">
			<!--the vertical menu-->
			
			<!--the newDevice form-->
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large rocket icon"></i>
  							<div class="content">
    							修改图片信息
    							<div class="sub header"><h3 style="color:red">如需更换图片或图片类别，请删除产品重新添加</h3></div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="ui form fluid vertical segment">
				    
					<form name="form" action="product_servlet" method="post">
						<div class="two fields">
							<div class="field">
                                <label>图片名称</label>
                                <div class="ui small left icon input">
                                    <input type="text" class="cp-name" name="pic_name" placeholder="">
                                    <i class="cloud icon"></i>
                                </div>
                            </div>
                        </div>    
						<div class="two fields">
                        	<div class="field">
                            	<label>产品名称</label>
                                <div class="ui small left icon input">
                                	<input type="text" name="product" class="product" placeholder="给产品起个响亮的名字，不超过30个字符……">
                                    <i class="cloud icon"></i>
                                </div>
                            </div>
                        </div>
                            <input name="id" type="hidden" class="cp-num" placeholder="不超过30个字符……">
                            
                            <div class="field">
                                <label>数据开放权限</label>
                                <div class="ui small input">
                                    <span class="ui checkbox">
                                      <input type="radio" name="looklevel"  value="1" class="kf" id="kf1" >
                                      <label for="kf1">一级</label>
                                    </span>
                                    <span class="ui checkbox">
                                      <input type="radio" name="looklevel"  value="2" class="kf" id="kf2">
                                      <label for="kf2">二级</label>
                                    </span>
                                    <span class="ui checkbox">
                                      <input type="radio" name="looklevel"  value="3" class="kf" id="kf3" >
                                      <label for="kf3">三级</label>
                                    </span>
                                </div>
                            </div>
                        <div class="field">
                        	<label>图片描述</label>
                            <textarea name="pic_meno" class="cp-dc" placeholder="不超过150个字符……"></textarea>
                        </div>
                    <input class="ui small blue submit button" type="submit" value="修改">
                    <input class="ui small basic button" type="reset" value="清空"><br>
                    <input type="hidden"  name="page"  value="product">
			        <input type="hidden" name="method" value="product_mod">
					</form>
					<br>
					<button class="tc-close">关闭</button>
					<!--the form end-->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 新增产品结束 -->
<script type="text/javascript" src="js/javascript/jquery.min.js"></script>
<script type="text/javascript" src="js/javascript/framework.js"></script>
<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript">
	$('.ui.dropdown')
	.dropdown();
	$(function(){
		//清空输入框 
		var form=$("#form input");
		var reset=$("#reset");
		reset.click(function(){
			for (var i=0;i<form.length-4;i++ )
			{
				form.value="";
			}
		});
	});
</script>


		<div class="cont_info_log_sign_up">
		<div class="col_md_login">
          	<div class="cont_ba_opcitiy">
            	<h4>真的要删除吗？</h4>
            	<form action="product_servlet" class="myform" method="post">
            	<div class="cl-mydel"></div>
			        <input type="hidden" name="method" value="product_del">
			        <input type="hidden" name="currpage" class="" value="<%=currpage %>"/>
                    <input type="hidden"  name="page"  value="product">
            	    <button class="btn_sign_up" type="submit" name="123">删除</button>
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
					var num=$(this).parent().siblings().eq(0);
					var num1=$(this).parent().siblings().eq(4);
					var num2=$(this).parent().siblings().eq(12);
					var txt=num.text();
					var txt1=num1.text();
					var txt2=num2.text();
					$(".cl-mydel").append($("<input type='hidden' name='id' value='"+txt+"' />"));
					$(".cl-mydel").append($("<input type='hidden' name='pic_name' value='"+txt1+"' />"));
					$(".cl-mydel").append($("<input type='hidden' name='path' value='"+txt2+"' />"));
				
				});
				$(".cl-dl-form").click(function(){
					$(".cl-mydel").html("");
					$(".cont_info_log_sign_up").hide();
				});
			})
		</script>
</body>
</html>