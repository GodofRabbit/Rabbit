<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤: 1.填写信息 > 2.验证邮箱 >
			<span class="red_bold">3.注册成功</span>
		</div>


		<div class="login_success">
			<div class="login_bj">
				<div class="succ">
					<img src="../images/login_success.jpg" />
				</div>
				<h5>
					${user.nickName}，欢迎加入在线购物系统
				</h5>
				<h6>
					请牢记您的登录邮件地址：${user.email} 
				</h6>

				<ul>
					<li class="nobj">
						您现在可以：
					</li>
					<li>
						进入“
						<a href="../main/main.jsp">在线购物系统</a>”查看并管理您的个人信息
					</li>
					<li>
						<a href="../main/main.jsp">浏览并选购商品</a>
					</li>
				</ul>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

