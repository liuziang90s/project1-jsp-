<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<%@ page import="java.util.*" %>
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
        .container{
        	margin-top: 18vh;
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
<% if (username==null) request.getRequestDispatcher("sjdl.jsp").forward(request, response); %>
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
      <a class="navbar-brand" href="#"><span><%=username%></span></a>
    </div>
    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="middle_servlet?query=prolb&forpage=sj-home">返回首页</a></li>
        <li><a href="middle_servlet?query=prolb&forpage=sj-sc">我的收藏</a></li>
        <li><a href="sjdl.jsp">注销登录</a></li>
      </ul>
	</div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- the main menu-->

<!--the main content begin-->
<div class="container" >
    <!--the content-->
    <div style="margin:0 auto">
        <!--the Devicelist-->

        <div class="row main">
            <%
            //获取图片信息集合
            List<user_clt>list=(List<user_clt>)request.getAttribute("list_clt");
            //判断集合是否有效
            if(list==null || list.size()<1){
            out.print("没有数据");
            }else{
            //遍历集合中的数据
            for(user_clt clt:list){
            %>
            <div class="col-xs-6 main-pg">
                <div class="main-pg-t">
                    <img class="myimg" src="<%="img\\"+clt.getpath()+clt.getpic_name()%>">
                </div>
                <div class="main-pg-b">
                    <ul>
                        <li><span><%=clt.getpic_name().substring(0,clt.getpic_name().indexOf("."))%></span></li>
                        <li><span class="cl-ft"><%=clt.getlbname()%></span></li>
                        <li>
                        	<button class="remove-dd" data-toggle="modal" data-target="#myModal">删除订单</button>
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

<!--模态框-->
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!--删除提交表单-->
            <form action="user_clt_servlet_wx"method="post" class="myform" style="display: none">
                <button class="btn_sign_up" type="submit">删除</button>
                <input type="hidden"  name="method" value="user_clt_del">
            </form>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">删除订单记录</h4>
            </div>
            <div class="modal-body">
                                点击“确认”后该订单将被彻底移除，不可恢复！
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary remove">确认</button>
            </div>
        </div>
    </div>
</div>
<script>
//提交"删除订单"表单
    $(function(){
    	$(".remove-dd").click(function(){
    		var txt=$(this).prev().text();
			$(".myform").append($("<input type='hidden' name='id' value='"+txt+"' />"));
			$(".remove").click(function(){
				
	            $(".btn_sign_up").click();
	        });
    	});
        
    })
</script>
</body>
</html>
