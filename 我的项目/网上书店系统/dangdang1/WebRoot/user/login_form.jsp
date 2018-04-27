<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>登录 - 在线购物系统</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script>
			function checkUser(){
				var email=$("#txtUsername").val();
				var password=$("#txtPassword").val();
				var xwj="email="+email+"&password="+password;
				if(!email|!password){
					$("#errorMsg").text("邮箱和密码不能为空");
					return false;
				}
				if(!email.match(/^\w+@{1}\w+([.]{1}[a-zA-Z]{2,3})+$/)){
					$("#errorMsg").text("邮箱格式错误");
					return false;
				}
				if(!password.match(/^\w{6,20}$/)){
					$("#errorMsg").text("密码格式错误");
					return false;
				}
				var result=$.ajax({type:"post",url:"checkLogin?"+xwj,dataType:"json",async:false}).responseText;
				if(result=="true"){
					return true
				}else{
					$("#errorMsg").text("邮箱或密码错误");
					return false;
				}
				
			}
			function clearText(){
				$("#errorMsg").text("");
			}
		</script>
	</head>
	<body>


		<%@include file="../common/head1.jsp"%>

		<div class="enter_part">

			<%@include file="../common/introduce.jsp"%>

			<div class="enter_in">
				<div class="bj_top"></div>
				<div class="center">
					<div style="height: 30px; padding: 5px; color: red" id="divErrorMssage">
					 <table  width="100%">
					 	<tr><td align="center" valign="middle"><span id="errorMsg"></span>
					 	</td></tr>
					 </table>
					</div>
					<div class="main">
						<h3>
							登录在线购物系统
						</h3>
						<form method="post" action="login" id="ctl00" onsubmit="return checkUser();">
							<ul>
								<li>
									<span>请输入Email地址：</span>
									<input type="text" name="email" id="txtUsername" class="textbox" onfocus="clearText();" />
								</li>
								<li>
									<span class="blank">密码：</span>
									<input onfocus="clearText();" type="password" name="password" id="txtPassword"
										class="textbox"/>
								</li>
								<li>
									<div style="float:right;"><input id="autoLogin" type="checkbox" name="autoLogin" value="yes"/>
									<span class="blank"></span>
									<label for="autoLogin">下次自动登录</label>
									</div>								
								</li>
								<li>
									<input type="submit" id="btnSignCheck" class="button_enter" 
										value="登 录" />


								</li>
							</ul>
							<input type="hidden" name="uri" value="${uri}" />
						</form>
					</div>
					<div class="user_new">
						<p>
							您还不是在线购物系统用户？
						</p>
						<p class="set_up">
							<a href="register_form.jsp">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../common/foot1.jsp"%>

	</body>
</html>

