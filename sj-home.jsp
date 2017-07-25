<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>  
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,minimum-scale=1.0">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title></title>
    <style>
        li{
            list-style:none;
        }
        .myimg{
            width: 100%;
            height: 100%;
        }
        .collection{
            float: right;
            height: 2rem;
            width: 2rem;
            background: url("img/like.ico") no-repeat;
            background-size:100% 100%;
        }
        nav{
            padding:1rem;
            margin: 1rem 0;
        }
        .inline{
            display: inline-block;
        }
        .select-span{
        	color: #fff;
        }
        select{
        		width: 12rem;
               height: 2.4rem;
               padding: 0.2rem 0.3rem 0.2rem 0.3rem;
               vertical-align: middle;
               border: 1px solid #e9e9e9;
               -moz-border-radius: 0.2em;
               -webkit-border-radius: 0.2em;
               border-radius: 0.2em;
               box-shadow: inset 0 0 3px #a0a0a0;
               /* sample image from the webinfocentral.com */
               /*background: url(http://webinfocentral.com/Images/favicon.ico) 95% / 10% no-repeat #fdfdfd;*/
               font-family: Arial,  Calibri, Tahoma, Verdana;
               font-size: 1.1em;
               color: #000099;
               cursor: pointer;
        }
        .select{
        	margin-bottom: 1rem;
        }
        .page_all{
            display: inline-block;
        }
        .home_page{
        	margin-top:2rem;
        }
        .main-pg{
        	border:1px solid #f0f8ff;
        	margin-bottom:1rem;
        	 word-wrap: break-word;
        }
        .cl-ft{
        	color:#778899;
        }
        .btn-info{
        	width:100%;
        	margin-top:10px;
        }
        .form-100{
        	width:100%;
        }
        .shopping{
			font-size: 12px;
		    padding: .2em 1em .22em;
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
<% String username=(String)session.getAttribute("username");%>
<%-- <% session.setAttribute("username",username);%> --%>
<%if (username==null) request.getRequestDispatcher("sjdl.jsp").forward(request, response); %>
<%int currpage=0;currpage=(int)request.getAttribute("currpage");if (currpage==0) currpage=1;%>
<%int pages=(int)request.getAttribute("pages");%>
<%int pageprev=currpage-1; if (currpage==1) pageprev++;%>
<%int pagenext=currpage+1; if (currpage==pages) pagenext--;%>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><%=username%></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    
      <form class="navbar-form navbar-left" action="product_servlet_wx">
      <p class="select-span">选择图片类型:</p>
        <div class="form-group form-100">
        	<div class="select">
        	   <!--	<span class="select-span">选择图片类型:</span>  -->
					                   <select name="lb" style="width:100%;padding:3px 0;">
					                        <% 	
					                        List<pro_lb> list=(List<pro_lb>)request.getSession().getAttribute("list_lb");											
					                        if(list==null || list.size()<1){
												out.print("<option>0-根级</option>");
											}else{	
					                            for(pro_lb lb:list){
											%>
					                        	<option value="<%=lb.getid()%>"><%=lb.getname()%></option>
					                        <%
					                            }
											}
					                        %>
                                        </select>
        	</div>
        	<p class="select-span">自定义搜索条件:</p>
          <input type="text" class="form-control" name="product" placeholder="图片搜索">
          <input type="hidden" name="product" value="<%=currpage%>">
        </div>
        <button type="submit" class="btn btn-info">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
            <li><a href="middle_servlet?query=clt&forpage=sj-sc&currpage=1">我的收藏</a></li>
          	<li><a href="middle_servlet?query=clt&forpage=sj-dd">我的订单</a></li>
          	<li role="separator" class="divider" style="border:1px solid red;"></li>
          	<li><a href="sjdl.jsp">注销登录</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div style="margin-top:20vh"></div>
<!--the main content begin-->
<div class="container" >
    <!--the content-->
    <div style="margin:0 auto">
        <!--the Devicelist-->
        <div class="row main">
        	<%  
						List<product>list2=(List<product>)request.getAttribute("list_cp");
							//判断集合是否有效
							if(list2==null || list2.size()<1){
								out.print("没有数据");
							}else{
								//遍历集合中的数据
								for(product p:list2){
									%>
            <div class="col-xs-6 main-pg img-click">
                <div class="main-pg-t click-pic">
					<img class="myimg" src="<%="img\\"+p.getpath()+p.getpic_name()%>">
                </div>
                <div class="main-pg-b">
                    <ul>
                        <li><span><%=p.getproduct()%></span></li>
                        <li><span class="cl-ft"><%=p.getlbname()%></span></li>
                        <li style="display: none"><span><%=username%></span></li>
                        <li>
                        	<span class="collection " ></span>
                        	<form action="user_clt_servlet_wx" method="post"class="gallery-li-bt" style="display:none;">
								<input type="hidden" name="id" class="" value="<%=p.getid()%>"/>
								<input type="hidden" name="method" class="" value="user_clt_add"/>
								<!-- 改动 -->
								<input type="hidden" name="currpage" class="" value="<%=currpage %>"/>
								<button type="submit" class="tj-col">点击收藏</button>
							</form>
                        </li>
                        <li>
                        	<form action="user_dd_servlet" method="post"class="gallery-li-bt">
								<input type="hidden" name="ids" class="" value="<%=p.getid()%>"/>
								<input type="hidden" name="method" class="" value="user_dd_add"/>
				                <input type="hidden"  name="page"  value="home">
								<input type="hidden" name="currpage" class="" value="<%=currpage %>"/>
								<input type="hidden" name="pic_names" class="" value="<%=p.getpic_name() %>"/>
								<button type="submit" class="shopping">直接下单</button><!--//js在index.js-->
							</form>
                        </li>
                    </ul>
                </div>
            </div>
			<%
								}
							}
							%>
			
        </div>
    </div>
</div>
<!--分页开始-->
<div class="home_page">
    <div class="page">
        <div align="center" class="my_page" id="my_page"><div class="mypage">
                <div class="page_all">
                    <div class="page_all">总共<span><%=pages%></span>页</div>
                    <div class="page_all">当前第<span><%=currpage%></span>页</div>
                    <div class="page_all"><a href="page_servlet?forpage=sj-home&currpage=1">首页</a></div>
                    <div class="page_all"><a href="page_servlet?forpage=sj-home&currpage=<%=pageprev%>">上一页</a></div>
                    <div class="page_all"><a href="page_servlet?forpage=sj-home&currpage=<%=pagenext%>">下一页</a></div>
                    <div class="page_all"><a href="page_servlet?forpage=sj-home&currpage=<%=pages%>">末页</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 模态框 -->
<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg mota hidden" data-toggle="modal" data-target="#myModal">
				  Launch demo modal
				</button>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog" role="document">
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">图片详情</h4>
					  </div>
					  <div class="modal-body">
						<img src="" alt="" class="img-mod" width="100%" />
					  </div>
					 
					</div>
				  </div>
				</div>


<script>
    $(function(){
    	//提交"取消收藏"表单
            $(".collection").click(function(){

                $(".tj-col").click();
            });
    	$(".remove").click(function(){

            $(".btn_sign_up").click();
        });
		$(".myimg").click(function(){
			var url=$(this).attr("src");
			console.log(url);
			$(".mota").click();

			$(".img-mod").attr("src",url);
		});
    })
</script>
</body>
</html>
