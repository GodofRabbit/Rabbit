<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String hid = request.getParameter("fid");
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>果然新鲜</title>
	<meta name="keywords" content="果然新鲜">
	<meta name="content" content="果然新鲜">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
</head>
<body class="login_bj" >
<div class="zhuce_body">
	
    <div class="zhuce_kong login_kuang">
    	<div class="zc">
        	<div class="bj_bai">
            <h3>登录</h3>
       	  	  <form action="<%=path%>/login.go?fid=<%=hid%>" method="post" id="form1">
                <input name="username" type="text" class="kuang_txt" placeholder="会员账号" value="${user.username}">
                <input name="password" type="password" class="kuang_txt" placeholder="密码">
                <div>
               		<a href="#">忘记密码？</a><input name="" type="checkbox" value="" checked><span>记住我</span> 
                </div>
                <a href="javascript:form1.submit();"><input name="登录" type="button" class="btn_zhuce" value="登录"></a>
                
                </form>
            </div>
        	<div class="bj_right">
            	<p>使用以下账号直接登录</p>
                <a href="#" class="zhuce_qq">QQ登录</a>
                <a href="#" class="zhuce_wb">微博登录</a>
                <a href="#" class="zhuce_wx">微信登录</a>
                <p>没有账号？<a href="<%=path%>/register.go">立即注册</a></p>
            
            </div>
        </div>
        
    </div>

</div>
<script type="text/javascript">
		var msg ="${message1}";
		if(msg!=""){
			alert(msg);
		}
</script>  
<script type="text/javascript">
		var msg ="${message}";
		if(msg!=""){
			alert(msg);
		}
</script>   
</body>
</html>