<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>管理员添加--果然新鲜后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="css/css.css" />
	<link rel="stylesheet" href="<%=path%>/layui/css/layui.css" media="all" />
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>
	<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
  $(function(){
  var  no="${admin.id}";
 if(no!=""){
  $("#input1").attr('type','text');
  $("#input2").hide();
    }
})

</script>
</head>
<body>

<div>
<a href="#" onclick="javascript:history.go(-1);"> <img src="<%=path%>/page/user/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
<a href="#" onclick="javascript:history.go(1);"> <img src="<%=path%>/page/user/timg2.jpg" height="22px" width="22px"/></a>
</div>
	<form class="layui-form" style="width:40%;" action="<%=path%>/adminServlet?flag=editAdmin&id=${admin.id}" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">管理员账号</label>
			<div class="layui-input-block">
				<input name="managername" type="text" class="layui-input userName" lay-verify="required" placeholder="请输入管理员账号" value="${admin.managername}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">管理员密码</label>
			<div class="layui-input-block">
				<input id="input1" name="managerpassword" type="password" class="layui-input userName" lay-verify="required" placeholder="请输入管理员密码" value="${admin.managerpassword}">
			</div>
		</div>
		<div class="layui-form-item"  id="input2">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" class="layui-input userName" lay-verify="required" placeholder="请再次输入密码">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">真实姓名</label>
			<div class="layui-input-block">
				<input name="realname" type="text" class="layui-input userName" lay-verify="required" placeholder="请输入真实姓名" value="${admin.realname}">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
			    <label class="layui-form-label">性别</label>
			    <div class="layui-input-block userSex">
			      	<input type="radio" name="sex" value="男" title="男" checked>
			      	<input type="radio" name="sex" value="女" title="女">
			    </div>
		    </div>
		    <div class="layui-inline">
			    <label class="layui-form-label">管理等级</label>
				<div class="layui-input-block">
					<select name="role" class="userGrade" lay-filter="userGrade">
						<option value="2">普通管理员</option>
						<option value="1">超级管理员</option>
				    </select>
				</div>
		    </div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" type="submit">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=path%>/layui/layui.js"></script>
	<script type="text/javascript" src="<%=path%>/page/user/addUser.js"></script>
</body>
</html>