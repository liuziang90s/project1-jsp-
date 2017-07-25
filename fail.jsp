<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import="pro.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,minimum-scale=1.0">
    
<title>ERROR</title>
<style>
body{
	    background: #f0f1f3;
}
	.main{
		width: 100vw;
		height: 100vh;
		background: #fff;
		text-align:center;
	}
	.main > span{
		padding:5px;
		background: yellow;
	}
	.padding{
		margin: 0 auto ;
	}
	.title{
		height: 4em;
		border-bottom: 1px solid #708090;
		padding-top: 2em;
	}
	.title h1{
		display: inline-block;
		margin: 0 auto ;
		
	}
	#num{
		font-size: 1.4em;
		color: #EE82EE;
		font-weight: 900;
	}
	
</style>

</head>
<body onLoad="errorReturn();">




<div class="main">
	<div class="title padding">
		<h1>出错啦！！</h1>
		
	</div>
	<div class="contain padding">
		<p>
            <span id="num"></span>秒后<br/>自动返回前一页
		</p>
	</div>
		<span>
			<%
    String num =(String)request.getAttribute("num");
    if (num.equals("0")){
        out.println("error: 内部错误");
    }else if (num.equals("1")){	
        user_qt qt =(user_qt)request.getAttribute("qt");
        out.println("error: "+qt.geterr());
    }else if (num.equals("2")){	
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else if (num.equals("3")){	
        out.println("error: 非前后台用户");
    }else if (num.equals("4")){
        user_qt qt =(user_qt)request.getAttribute("qt");
        out.println("error: "+qt.geterr());
    }else if (num.equals("5")){
        user_qt qt =(user_qt)request.getAttribute("qt");
        out.println("error: "+qt.geterr());
    }else if (num.equals("6")){
        user_qt qt =(user_qt)request.getAttribute("qt");
        out.println("error: "+qt.geterr());
    }else if (num.equals("7")){
        user_qt qt =(user_qt)request.getAttribute("qt");
        out.println("error: "+qt.geterr());
    }else if (num.equals("8")){
        user_qt qt =(user_qt)request.getAttribute("qt");
        out.println("error: "+qt.geterr());
    }else if (num.equals("9")){
        user_clt clt =(user_clt)request.getAttribute("clt");
        out.println("error: "+clt.geterr());
    }else if (num.equals("10")){
        user_clt clt =(user_clt)request.getAttribute("clt");
        out.println("error: "+clt.geterr());
    }else if (num.equals("11")){
        user_clt clt =(user_clt)request.getAttribute("clt");
        out.println("error: "+clt.geterr());
    }else if (num.equals("12")){
        user_clt clt =(user_clt)request.getAttribute("clt");
        out.println("error: "+clt.geterr());
    }else if (num.equals("13")){
        user_clt clt =(user_clt)request.getAttribute("clt");
        out.println("error: "+clt.geterr());
    }else if (num.equals("14")){
        pro_lb lb =(pro_lb)request.getAttribute("lb");
        out.println("error: "+lb.geterr());
    }else if (num.equals("15")){
        pro_lb lb =(pro_lb)request.getAttribute("lb");
        out.println("error: "+lb.geterr());
    }else if (num.equals("16")){
        pro_lb lb =(pro_lb)request.getAttribute("lb");
        out.println("error: "+lb.geterr());
    }else if (num.equals("17")){
        pro_lb lb =(pro_lb)request.getAttribute("lb");
        out.println("error: "+lb.geterr());
    }else if (num.equals("18")){
        pro_lb lb =(pro_lb)request.getAttribute("lb");
        out.println("error: "+lb.geterr());
    }else if (num.equals("19")){
        product cp =(product)request.getAttribute("cp");
        out.println("error: "+cp.geterr());
    }else if (num.equals("20")){
        product cp =(product)request.getAttribute("cp");
        out.println("error: "+cp.geterr());
    }else if (num.equals("21")){
        product cp =(product)request.getAttribute("cp");
        out.println("error: "+cp.geterr());
    }else if (num.equals("22")){
        product cp =(product)request.getAttribute("cp");
        out.println("error: "+cp.geterr());
    }else if (num.equals("23")){
        product cp =(product)request.getAttribute("cp");
        out.println("error: "+cp.geterr());
    }else if (num.equals("24")){
        user_dd dd =(user_dd)request.getAttribute("dd");
        out.println("error: "+dd.geterr());
    }else if (num.equals("25")){
        user_dd dd =(user_dd)request.getAttribute("dd");
        out.println("error: "+dd.geterr());
    }else if (num.equals("26")){
        user_dd dd =(user_dd)request.getAttribute("dd");
        out.println("error: "+dd.geterr());
    }else if (num.equals("27")){
        user_dd dd =(user_dd)request.getAttribute("dd");
        out.println("error: "+dd.geterr());
    }else if (num.equals("28")){
        user_dd dd =(user_dd)request.getAttribute("dd");
        out.println("error: "+dd.geterr());
    }else if (num.equals("29")){
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else if (num.equals("30")){
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else if (num.equals("31")){
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else if (num.equals("32")){
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else if (num.equals("33")){
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else if (num.equals("34")){
        user_ht ht =(user_ht)request.getAttribute("ht");
        out.println("error: "+ht.geterr());
    }else{
        out.println("error : other ");
    };
%>
		</span>
	</div>
<script type="text/javascript">
	var num1=6;
	function errorReturn(){
		num1--;
		document.getElementById("num").innerHTML=num1;
		if(num1<0){
			document.getElementById("num").innerHTML=0;
			history.back();
		} 
		}
	setInterval("errorReturn()", 1000);
</script>
</body>
</html>