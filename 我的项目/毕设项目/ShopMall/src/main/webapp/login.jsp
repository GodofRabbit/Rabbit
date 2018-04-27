<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%=path%>/Back/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="<%=path%>/Front/css/login.css" type="text/css" media="all"></link>
    <script type="text/javascript" src="Front/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
		var msg ="${info}";
		if(msg!=""){
			alert(msg);
		}
</script>
</head>
<body class="login_bj" >
<video  preload="auto" autoplay="autoplay" loop="loop" data-height="1080" data-width="1920" height="100%" width="100%">
	    <source src="Back/page/login/login.mp4" type="video/mp4">
	    <!-- 此视频文件为支付宝所有，在此仅供样式参考，如用到商业用途，请自行更换为其他视频或图片，否则造成的任何问题使用者本人承担，谢谢 -->
</video>
<div class="video_mask"></div>
<div class="zhuce_body">
    <div class="zhuce_kong login_kuang">
    	<div class="zc">
        	<div class="bj_bai">
            <h3>果然新鲜</h3>
       	  	  <form action="<%=path%>/login.do" method="post" id="loginfo">
       	  	  <input type="hidden"  name="li_url" value=" <%=request.getHeader("Referer")%>">  
                <input id="account" name="account" type="text" class="kuang_txt" placeholder="账号" value="${username}">
                <input id="password" name="password" type="password" class="kuang_txt" placeholder="密码">
           		<div>
               		<a href="Front/page/forgetpwd.jsp">忘记密码？</a><label><input id="autoLogin" name="rememberMe" type="checkbox" value="true" checked><span>记住我</span></label>
                </div>
                <a href="javascript:void(0);" onclick="logon();"><input type="button" class="btn_zhuce" value="登录"></a>
<!--                 <input type="hidden" name="autoLogin" id="remember"  value="rememberMe"></input> -->
                </form>
            </div>
        	<div class="bj_right">
<!--             	<p>使用以下账号直接登录</p> -->
<!--                 <a href="#" class="zhuce_qq">QQ登录</a> -->
<!--                 <a href="#" class="zhuce_wb">微博登录</a> -->
<!--                 <a href="#" class="zhuce_wx">微信登录</a> -->
                <img src="Front/images/5788ae3f68ecf.jpg" height="150px" width="150px" style="margin-top: 30px"></img>
                <p>没有账号？<a href="Front/page/register.jsp">立即注册</a></p>
            </div>
        </div>
    </div>
 </div>
</body>
<script type="text/javascript" src="<%=path%>/Back/layui/layui.js"></script>
<script type="text/javascript" src="<%=path%>/Back/page/login/login.js"></script>
<script type="text/javascript">
    //30天自动登录选择事件
//      $("#autoLogin").click(function(){
//       if($(this).checked==true){
//            $("#remember").val("rememberMe");
//       }else{
//           $("#remember").val("");
//       }
//        })
    //登录非空验证
    function logon(){
       var account = $("#account").val();
       var password = $("#password").val();
       if(account==""){
           alert("请输入账号");
       }else if(password==""){
           alert("请输入密码");
       }else{
          $("#loginfo").submit();
       }
    }
       
</script>
</html>