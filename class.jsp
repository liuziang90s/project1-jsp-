<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*"%>
<%@page import="java.util.*"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="author" content="刘兹昂, liuziang90s@163.com">
    <title>类名管理 |管理员中心</title>
    <script type="text/javascript" src="js/IE.js"></script> 
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" /><!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
    <style>
          .cl-ed-div{
            position: fixed;
            display: none;
            top: 50%;
            left: 50%;
            margin-top: -100px;
            margin-left: -25vw;
            width: 50vw;
            height: 200px;
            background-color: rgba(10, 10, 10, 0.8);
            z-index: 1000;
            /*zoom: 1000;*/
        }
        .confirm-cl-ed{
            text-align: center;
        }
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
			.input-line,.input-line div{
				display:inline-block;
			}
			.submit{
			width:10em;
			height:3em;
			position:absolute;
			left:50%;
			margin-left:-5em;
			margin-bottom:2em;
			}
			.add_class{
				width: 40em;
				position: absolute;
				left: 50%;
				margin-left: -20em;
				margin-top:5em;
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
<% String username=(String)session.getAttribute("username");%>
<% if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
<div class="page">
    <!--header begin-->
    <header>
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
                <a class="active item" href="middle_servlet?query=lb&forpage=class""><i class="cloud icon"></i>类名管理</a>
            </div>
        </div>
    </div>
    <!--the main content begin-->
    <div class="container">
        <!--the content-->
        <!--主体部分，插入请求数据-->
        <div class="main">
            <div class="field">
		      <form action="pro_lb_servlet" method="post">
                 类名：<input type="text" name="name" placeholder="请输入类别名称" >
	             有效性：<select name="valid">
				             <option value="2">全部</option>
				             <option value="0">有效</option> 
				             <option value="1">无效</option>
	                    </select>
                <button class="ui small blue button search-p"  name="">开始搜索</button>
                <input type="hidden"  name="method" id="method" value="pro_lb_query">
               </form> 
           </div>
           <br/>
            <!--图片类名信息分页显示-->
            <div class="mainPage">
                <div class="mainPage">
							<div class="tabel-mainImg">
								<table align="center" width="100%" class="hovertable">
									<tr>
										<td align="center" colspan="12">
											<h5>所有收藏信息</h5>
										</td>
									</tr>
									<tr align="center">
										<td><b>产品类id</b></td>
										<td><b>类别名称</b></td>
										<td ><b>父级类名</b></td>
										<td><b>时间</b></td>
										<td><b>有效性</b></td>
										<td><b>操作</b></td>
									</tr>
									<%
										List<pro_lb> list=(List<pro_lb>)request.getAttribute("list_lb");
											//判断集合是否有效
											if(list==null || list.size()<1){
												out.print("没有数据");
											}else{
												//遍历集合中的数据
												for(pro_lb lb:list){
													%>
													<tr align="center">
														<td><%=lb.getid()%></td>
														<td><%=lb.getname()%></td>
														<td><%=lb.getname_a()%></td>
														<td><%=lb.getdatetime()%></td>
														<td><%=lb.getisvalid()%></td>
														<td><button class="cl-ed">编辑</button></td>														
													</tr>
													<%
												}
											}
											%>
											<tr>
											<td align="center" colspan="7">
												<%=request.getAttribute("bar") %>
												</td>
											</tr>	
								</table>
								
							</div>
						  
						   </div>
            </div>
            
            <!--类名修改弹出框-->
            <div class="cl-ed-div">
                <button class="close">关闭</button><br><br>
                <!--修改新类别-->
                <form action="pro_lb_servlet"method="post">
                <div class="field2">
                    &nbsp&nbsp&nbsp&nbsp<label style="color:#fff">类别id</label>
                    <div class="ui small  icon input " >
                        <input type="text" disabled="disabled"  class="cl-id">
                        <input type="hidden" name="id"  class="cl-id">
                        <i class="text file outline icon"></i>
                    </div>
                    &nbsp&nbsp&nbsp&nbsp<label style="color:#fff">类别名称</label>
                    <div class="ui small  icon input">
                        <input type="text" class="cl-name" value="" placeholder="请输入类名" required="required" name="name">
                        <i class="text file outline icon"></i>
                    </div><br/><br/>
                    <div class="ui input-line">
                        &nbsp&nbsp&nbsp&nbsp<div class="text" style="color:#fff">请选择父ID</div>
                        <select name="lbid_a">
                        <% 		                        
                        if(list==null || list.size()<1){
							out.print("<option>0-根级</option>");
						}else{	
							out.print("<option>0-根级</option>");
                            for(pro_lb lb:list){
						%>
                        	<option><%=lb.getid()+"-"+lb.getname()%></option>
                        <%
                            } 
						}
                        %>
                        </select>
                    </div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <div class="ui input-line">
                        <div class="text" style="color:#fff">选择有效性</div>
                        <select name="valid">
							<option value="1">有效</option>
							<option value="0">无效</option>
                       
                        </select>
                    </div>

                </div>
                <br/><br/>
                    <input type="hidden" name="method" value="pro_lb_mod" >
                    <button type="submit" class="submit">确认修改</button>	
                </form>
                <br/><br/>
            </div>
        </div>
    </div>
</div>

<div class="footer_add">
	<!--添加新类别-->	     
            <div class="add_class">
             <form action="pro_lb_servlet"method="post">
                类别名称<input type="text" placeholder="请输入类名" name="name" required="required">
                
                <input type="hidden" name="method" value="pro_lb_add" >
                    请选择父ID:<select name="lbid_a">
                        <% 												
                        if(list==null || list.size()<1){
							out.print("<option>0-根级</option>");
						}else{	
							out.print("<option>0-根级</option>");
                            for(pro_lb lb:list){
						%>
                        	<option><%=lb.getid()+"-"+lb.getname()%></option>
                        <%
                            }
						}
                        %>
                    </select>
                <button class="ui mini blue button add_class_button" href="./add.html" title="">添加新类别</button>
              </form> 
            </div>
</div>

<script type="text/javascript">
    $(function(){
        $(".cl-ed").click(function(){
            $(".cl-ed-div").show();
            var num1=$(this).parent().siblings().eq(0);
			var num2=$(this).parent().siblings().eq(1);
			var txt1=num1.text();
			var txt2=num2.text();
			$(".cl-id").val(txt1);
            $(".cl-name").val(txt2);
        });
        $(".close").click(function(){
            $(".cl-ed-div").hide();
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
