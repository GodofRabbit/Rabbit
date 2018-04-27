<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>修改密码--果然新鲜后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../../layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../../css/user.css" media="all" />
<script type="text/javascript" src="../../js/jquery.min.js"></script>
</head>
<body class="childrenBody" onload="cleanPswd();">
	<div class="layui-form changePwd">
		<div class="layui-form-item">
		    <label class="layui-form-label">用户名</label>
		    <div class="layui-input-block">
		    	<input type="text" value="<shiro:principal/>" disabled class="layui-input layui-disabled" id="username">
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">旧密码</label>
		    <div class="layui-input-block">
		    	<input type="password"  placeholder="请输入旧密码" lay-verify="required|oldPwd" class="layui-input pwd" id="oldPwd" onblur="checkOldPassword();">
		       <span style="color: red; display: none;" id="oldPassword">原密码错误</span>
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">新密码</label>
		    <div class="layui-input-block">
		    	<input type="password" placeholder="请输入新密码" lay-verify="required|newPwd" id="newPwd" class="layui-input pwd" onblur="cnfpwd();">
		        <span style="color: red; display: none;" id="nfPwd">密码长度最少4位</span>
		    </div>
		</div>
		<div class="layui-form-item">
		    <label class="layui-form-label">确认密码</label>
		    <div class="layui-input-block">
		    	<input type="password" placeholder="请确认密码" lay-verify="required|confirmPwd" class="layui-input pwd" id="okPwd" onblur="comparePwd();">
		        <span style="color: red; display: none;" id="comparePwd">两次密码不一致</span>
		    </div>
		</div>
		<div class="layui-form-item">
		    <div class="layui-input-block">
		    	<button class="layui-btn" lay-submit="" lay-filter="changePwd" id="changePwd">立即修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</div>
	<script type="text/javascript" src="../../layui/layui.js"></script>
	<script type="text/javascript" src="address.js"></script>
	<script type="text/javascript" src="../js/user.js"></script>
</body>
<script type="text/javascript">
$("#changePwd").off();
$("#changePwd").click(function(){
	if($("#comparePwd").is(":visible")||$("#oldPassword").is(":visible")){
		return;
	}
	if($("#comparePwd").is(":hidden")&&$("#oldPassword").is(":hidden")){
	  var username = $("#username").val();
	  var newPwd = $("#newPwd").val();
	  $.ajax({
		type:"post",
		data:{username:username,newPwd:newPwd},
		url:"http://localhost:8080/ShopMall/changePwd.do",
		success:function(data){
		    alert("密码修改成功,请重新登录");
			window.parent.location.href="http://localhost:8080/ShopMall/logout.do";
// 		    window.opener = null;
//             window.open("", "_self");
// 		    window.close();
		}
	})
	}
})
</script>
</html>