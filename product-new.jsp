<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pro.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta name="author" content="刘兹昂, liuziang90s@163.com"> 	
    <title>新增图片 |管理员中心</title>
    <script src="js/jquery-1.7.2.min.js" type=text/javascript></script>
    <script type="text/javascript" src="js/IE.js"></script>
    <link type="text/css" rel="stylesheet" href="css/resource/css/framework.css" />
    <!--此处为管理员界面样式表链接，如需修改请删除该出整个css文件-->
    <link type="text/css" rel="stylesheet" href="css/resource/css/main.css" />
    <style>
    	.qt-p-field field >input{
			width:14em !important;
			}
		.state1{
                color:#aaa;
            }
            .state2{
                color:#000;
            }
            .state3{
                color:red;
            }
            .state4{
                color:green;
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
			<a class="item" href="middle_servlet?query=pro&forpage=product"><i class="sitemap icon"></i>已有图片</a>
			<a class="active item" href="middle_servlet?query=lb&forpage=product-new"><i class="cloud icon"></i>新增图片</a>
			<a class="item" href="middle_servlet?query=lb&forpage=product-all"><i class="cloud icon"></i>图片批量上传</a>
		</div>
	</div>
</div>
<script type="text/javascript">  
var flag = 0;  
/** 
 * 校验表单 
 */  
function checkForm(){  
    var idcard =document.getElementById("servertypename").value;  
    var fileName = $('#uploadPath').val();  
    var check_flag = false;  
    if(idcard==""){  
        alert("类型名称不能为空！");  
    }else if(fileName==""){  
        alert("请上传图标！");  
    }else {  
        if(flag==1)  
            alert("您只能输入BMP,PNG,JPG,JPEG格式的文件");  
        else if(flag==2)  
            alert("请上传尺寸为400*400的图片！");  
        else  
            check_flag = true;  
    }  
    return check_flag;  
};  
/** 
 * 预览图片 
 */  
function previewImage(file, url) {  
    var MAXWIDTH = 400;  
    var MAXHEIGHT = 400;  
    if (file.files && file.files[0]) {  
        var img = document.getElementById(url);  
        img.onload = function() {  
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);  
            img.width = rect.width;  
            img.height = rect.height;  
            img.style.marginTop = rect.top + 'px';  
        };  
        var reader = new FileReader();  
        reader.onload = function(evt) {  
            img.src = evt.target.result;  
        };  
        reader.readAsDataURL(file.files[0]);  
    } else {  
        file.select();  
    }  
    getImageSize(document.getElementById("uploadPath"));  
}; 
function getImageSize(obj) {  
    var _file = document.getElementById("uploadPath");  
    var i = _file.value.lastIndexOf('.');  
    var len = _file.value.length;  
    var extEndName = _file.value.substring(i + 1, len);  
    var extName = "GIF,BMP,PNG,JPG,JPEG";  
    if (extName.indexOf(extEndName.toUpperCase()) == -1) {  
        alert("您只能输入" + extName + "格式的文件");  
        flag = 1;  
    } else {  
        var url, image;  
        if (obj.files) {  
            if (window.navigator.userAgent.indexOf("MSIE") >= 1) {  
                obj.select();  
                url = document.selection.createRange().text;  
            }  
            url = window.URL.createObjectURL(obj.files[0]);  
        } else {  
            url = obj.value;  
            url = "file:///" + url;  
        }  
        
    }  
};  
</script> 
<!--the main content begin-->
	<div class="container">
	<!--the content-->
		<div class="ui grid">
			<!--the vertical menu-->
			<div class="four wide column">
				<div class="verticalMenu">
					<div class="ui vertical pointing menu fluid">
  						<a class="active teal item" href="#">
							<i class="rocket icon"></i> 添加新图片
  						</a>
  						<a class="item" href="middle_servlet?query=pro&forpage=product">
    						<i class="cloud icon"></i> 已有图片
  						</a>
					</div>
				</div>
			</div>
			<!--the newDevice form-->
			<div class="twelve wide column">
				<div class="pageHeader">
					<div class="segment">
						<h3 class="ui dividing header">
  							<i class="large rocket icon"></i>
  							<div class="content">
    							添加新图片
    							<div class="sub header">请输入正确的图片信息</div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="ui form fluid vertical segment">
					<div class="field">
                        <form action="picup_servlet" name="picup" enctype="multipart/form-data" method="post">
                        	<label>上传图片</label>
                        	<img src="" name="img" id="img" width="60px;" height="60px;" align="center" style="margin-top: 5px; margin-bottom: 5px;"/>
				    		<input type="file" class="file" id="uploadPath" name="path" required="required" accept="image/gif,image/png,image/bmp,image/jpeg" onchange="previewImage(this,'img')" />
				    		<button type="submit" onclick="javascript:return checkForm();">上传</button>
				    	</form>	
				    </div>
					<form name="form" id="product-form" action="product_servlet"  method="post">
						<div class="two fields">
                        	<div class="field">
                            	<label>图片名称</label>
                                <div class="ui small left icon input">
                                <%String picname =(String)request.getAttribute("picname"); if (picname==null) picname=""; %>
                                	<input type="text" name="picname" value="<%=picname %>" disabled="disabled">
                                	<input type="hidden" name="pic_name" value="<%=picname %>" >
                                </div>
                            </div>
                        </div>
						<div class="two fields">
                        	<div class="field">
                            	<label>产品名称</label>
                                <div class="ui small left icon input">
                                	<input type="text" name="product" required="required" value="<%=picname %>">
                                    <i class="cloud icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                            	<label>图片类别</label>
                                <div class="ui ">
                                      <div class="text"></div>
                                      <i class="dropdown icon"></i>
					                   <select name="lb">
					                        <% 	
					                        List<pro_lb> list=(List<pro_lb>)request.getAttribute("list_lb");											
					                        if(list==null || list.size()<1){
												out.print("<option>0-根级</option>");
											}else{	
					                            for(pro_lb lb:list){
											%>
					                        	<option><%=lb.getid()+"-"+lb.getname()%></option>
					                        <%
					                            }
											}
					                        %>
					                    </select>
                                </div>
                            </div>
                        </div>
                            <div class="field">
                                <label>数据开放权限</label>
                                <div class="ui small input">
                                    <span class="ui checkbox">
                                      <input type="radio" name="looklevel" value="1" id="kf1" checked="checked" >
                                      <label for="kf1">一级</label>
                                    </span>
                                    <span class="ui checkbox">
                                      <input type="radio" name="looklevel" value="2" id="kf2">
                                      <label for="kf2">二级</label>
                                    </span>
                                    <span class="ui checkbox">
                                      <input type="radio" name="looklevel" value="3" id="kf3">
                                      <label for="kf3">三级</label>
                                    </span>
                                </div>
                            </div>
                        <div class="field">
                        	<label>图片描述</label>
                            <textarea name="pic_meno" placeholder="不超过150个字符……"></textarea>
                        </div>
                    <button class="ui small blue submit button" type="submit">添加</button>
                    <input class="ui small basic button" id="reset" type="reset" value="取消">
			        <input type="hidden" name="method" value="product_add">
                    <input type="hidden"  name="page"  value="product">
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('input[name="time"]').focus(function(){
            $(this).next().text('填写数字，至少1个字符，至多8个字符').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().search(/^[1-9]\d*$/) != -1){
                $(this).next().text('个月').removeClass('state1').removeClass('state3').addClass('state4');
                
            }else{
                $(this).next().text('填写数字，至少1个字符，至多8个字符').removeClass('state1').removeClass('state4').addClass('state3');
               	alert("填写数字!");
            }
             
        });
	})
</script>
<script type="text/javascript" src="js/javascript/jquery.min.js"></script>
<script type="text/javascript" src="js/javascript/framework.js"></script>
<script type="text/javascript" src="js/javascript/jquery.zclip.min.js"></script>
<script type="text/javascript">
$('.ui.dropdown')
	.dropdown();
	$(function(){
		var reset=$("#reset");
		reset.click(function(){
			var form=$("#product-form").find("input");
		
			for (var i=0;i<form.length-3;i++ )
			{
				form[i].value="";
			}
		});
	
	});


</script>
</body>
</html>