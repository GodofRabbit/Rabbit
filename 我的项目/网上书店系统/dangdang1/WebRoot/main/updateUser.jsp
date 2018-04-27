<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		
		<script type="text/javascript">
		
		 
		 var txtNickNamey=false;
		 var txtPasswordy=false;
		 var txtPassword1y=false;
		
			$(function(){
				
				$("#txtNickName").blur(function(){
					$("#name\\.info").html("");
					var s=$(this).val();
					var rb=/^[0-9a-z\u4e00-\u9f5a]{4,20}$/;
					if(s==""){
						txtNickNamey=false;
						$("#name\\.info").text("昵称不可以为空");
						 $(".login_in").hide();
						return;
					}
					if(s.length<4||s.length>20){
								txtNickNamey=false;	
						$("#name\\.info").text("昵称不能小于4或则大于20");
							 $(".login_in").hide();
							return;
					}
					if(!s.match("^[0-9a-z\\u4e00-\\u9f5a]{4,20}$")){
								txtNickNamey=false;
						$("#name\\.info").text("输入的字符不是中文，小写字母，数字");
						return;
					}
					if(!rb.test(s.replace(/[\u4e00-\u9fa5]/g,'aa'))){
								txtNickNamey=false;
						$("#name\\.info").text("超过了位数");
						return;
					}
							txtNickNamey=true;
					$("#name\\.info").text("你输入昵称可以使用");
					 $(".login_in").show();
				});
			});
			$(function(){
				$("#txtPassword").blur(function(){
					
					var c=$("#txtPassword").val();
					if(c==""){
						txtPasswordy=false;
						$("#password\\.info").text("密码不能为空");
						return;
					}
					if(!c.match("^[0-9A-Za-z]{6,20}$")){
						txtPasswordy=false;
						$("#password\\.info").text("密码格式不对");
						return;
					}
					txtPasswordy=true;
					$("#password\\.info").text("密码正确");
						
				});
				
			});
			$(function(){
				
				$("#txtRepeatPass").blur(function(){
					
					var c=$(this).val();
					var c1=$("#txtPassword").val();
					if(c==""){
						txtPassword1y=false;
						$("#password1\\.info").text("不可以为空");
						return;
					}
					if(!c.match("^[0-9A-Za-z]{6,20}$")){
						txtPassword1y=false;
						$("#password1\\.info").text("密码格式不对");
						return;
					}
					if(c!=c1){
						txtPassword1y=false;
						$("#password1\\.info").text("两次密码不一样");
						return;
					}
					txtPassword1y=true;
					$("#password1\\.info").text("可以用");
				});
			});
		
	
  		$(function(){
  			
  			$("#f").submit(function(){
	
		  if(txtNickNamey==false){
			$("#name\\.info").text("昵称不正确");
			return false;
		 }
		  if(txtPasswordy==false){
			  $("#password\\.info").text("密码不正确");
			return false;
		  }
		  if(txtPassword1y==false){
			   $("#password1\\.info").text("验证密码不正确");
			return false;
		  }
		 
		  
		  return txtNickNamey&&txtPasswordy&&txtPassword1y;
  			});
  		});
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			修改
		</div>
		<div class="fill_message">
			<form name="ctl00" method="post" action="/dangdang/main/updateUser1.action" id="f">
				<h2>
					以下均为必填项
				</h2>
				<table class="tab_login" >
				<tr>
					<td valign="top" class="w1">
						ID:
					</td>
					<td>
					<input name="user.id" type="text" readonly="readonly" id="txtEmail" class="text_input" value="${user.id}"/>
					<p style="color: blue">不可以修改</p>
					</td>
				</tr>
					<tr>
						<td valign="top" class="w1">
							请填写您的Email地址：
						</td>
						<td>
							<input name="user.email" type="text"  value="${user.email}" readonly="readonly" id="txtEmail" class="text_input"/>
							<div class="text_left" id="emailValidMsg">
								<p>
									不可以修改
								</p>
									<span id="email.info" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置您在当当网的昵称：
						</td>
						<td>
							<input name="user.nickname" type="text" id="txtNickName" value="${user.nickname}" class="text_input" />
							<div class="text_left" id="nickNameValidMsg">
								<p>
									您的昵称可以由小写英文字母、中文、数字组成，
								</p>
								<p>
									长度4－20个字符，一个汉字为两个字符。
								</p>
								<span id="name.info" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置密码：
						</td>
						<td>
							<input name="user.password" type="password" id="txtPassword"
								class="text_input" />
							<div class="text_left" id="passwordValidMsg">
								<p>
									您的密码可以由大小写英文字母、数字组成，长度6－20位。
								</p>
								<span id="password.info" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							再次输入您设置的密码：
						</td>
						<td>
							<input name="password1" type="password" id="txtRepeatPass"
								class="text_input"/>
							<div class="text_left" id="repeatPassValidMsg">
							<span id="password1.info" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						
					</tr>
				</table>

				<div class="login_in">

					<input id="btnClientRegister" class="button_1" name="submit"  type="submit" value="修改"/>
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

