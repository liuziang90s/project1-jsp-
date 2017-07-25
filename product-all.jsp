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
    <script type="text/javascript">

    //下面用于多图片上传预览功能

    function setImagePreviews(avalue) {

        var docObj = document.getElementById("doc");

        var dd = document.getElementById("dd");

        dd.innerHTML = "";

        var fileList = docObj.files;

        for (var i = 0; i < fileList.length; i++) {            



            dd.innerHTML += "<div style='float:left' > <img id='img" + i + "'  /> </div>";

            var imgObjPreview = document.getElementById("img"+i); 

            if (docObj.files && docObj.files[i]) {

                //火狐下，直接设img属性

                imgObjPreview.style.display = 'block';

                imgObjPreview.style.width = '150px';

                imgObjPreview.style.height = '180px';

                //imgObjPreview.src = docObj.files[0].getAsDataURL();

                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式

                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);

            }

            else {

                //IE下，使用滤镜

                docObj.select();

                var imgSrc = document.selection.createRange().text;

                alert(imgSrc)

                var localImagId = document.getElementById("img" + i);

                //必须设置初始大小

                localImagId.style.width = "150px";

                localImagId.style.height = "180px";

                //图片异常的捕捉，防止用户修改后缀来伪造图片

                try {

                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";

                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;

                }

                catch (e) {

                    alert("您上传的图片格式不正确，请重新选择!");

                    return false;

                }

                imgObjPreview.style.display = 'none';

                document.selection.empty();

            }

        }  



        return true;

    }



</script>
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
<% //if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
<% //if (username==null) request.getRequestDispatcher("index.jsp").forward(request, response); %>
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
			<a class="item" href="middle_servlet?query=lb&forpage=product-new"><i class="cloud icon"></i>新增图片</a>
			<a class="active item" href="middle_servlet?query=lb&forpage=product-all"><i class="cloud icon"></i>图片批量上传</a>
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
    							批量添加图片
    							<div class="sub header">请输入正确的图片信息</div>
  							</div>
						</h3>
					</div>
				</div>
				<div class="ui form fluid vertical segment">
                    <form action="picupall_servlet" name="picup" enctype="multipart/form-data" method="post">
                    <div class="field">
                            	<label>图片类别</label>
                                <div class="ui ">
                                      <div class="text"></div>
                                      <i class="dropdown icon"></i>
					                   <select name="lb">
					                        <% 	
					                        List<pro_lb> list=(List<pro_lb>)request.getAttribute("list_lb");											
					                        if(list==null || list.size()<1){
												out.print("<option value='1' >0-根级</option>");
											}else{	
					                            for(pro_lb lb:list){
											%>
					                        	<option value="<%=lb.getid()%>"><%=lb.getid()+"-"+lb.getname()%></option>
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
                            
                            <div style=""></div>
						<div style="margin :0px auto; width:990px;margin-top:2rem;">

								<input type="file"  name="file" id="doc" multiple="multiple"  style="width:150px;" onchange="javascript:setImagePreviews();" accept="image/*" />
								<br/>
								<div>
		                          	<button class="ui small blue submit button" type="submit">添加</button>
		                    		<input class="ui small basic button" id="reset" type="reset" value="取消">
		                        </div>
								<div id="dd" style=" width:990px;" class="dd"></div>
						</div>		
                        <div class="two fields">
                        
                    
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".submit").click(function(){
			var len=$(".dd").children("div").length;
			 if(len>20){
			 	alert("文件数不能超过20个，你选择了" + len + '个');
			 	$(".dd").children("div").remove();
			 	return false;
			 }else if(len==0){
				 alert("请选择图片再上传");
				 	return false;
			 }
		});
		 $("#reset").click(function(){
			 $(".dd").children("div").remove();
			 return false;
		 });
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