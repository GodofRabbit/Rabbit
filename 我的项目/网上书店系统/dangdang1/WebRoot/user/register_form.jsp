<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>用户注册 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script>
		var chinese=new Array();
		chinese["email"]="邮箱";
		chinese["name"]="昵称";
		chinese["password"]="密码";
		chinese["password1"]="确认密码";
		chinese["number"]="验证码";
		var flag=new Array();
		flag["email"]=false;
		flag["name"]=false;
		flag["password"]=false;
		flag["password1"]=false;
		flag["number"]=false;
		function checkNull(element){
			var value=$(element).val();
			return value;
			
		}
		$(function(){
			$("input").focus(function(){
				var name=$(this).attr("id");
				if(!flag[name]){
					$("#"+name+"Info").text("");
					$("#"+name+"Msg").css("display","block");
				}
			});
		})
		$(function(){
			$("input").blur(function(){
				var name=$(this).attr("id");
				$("#"+name+"Msg").css("display","none");
				check(this);
			});
		});
		function check(element){
			var name=$(element).attr("id");
			var messageSpan=$("#"+name+"Info");
			if(!checkNull(element)){
				messageSpan.html("<img src='../images/minus.jpg'/>"+chinese[name]+"不能为空");
				flag[name]=false;
				return;
			}
			if(name=="email"){
				checkEmail();
				return;
			}
			if(name=="name"){
				checkName();
			}
			if(name=="password"){
				checkPassword();
				return;
			}
			if(name=="password1"){
				checkPassword1();
				return;
			}
			if(name=="number"){
				checkCode();
				return;
			}
		}
		function checkEmail(){
			var email=$("#email").val();
			if(!email.match(/^\w+@{1}\w+([.]{1}[a-zA-Z]{2,3})+$/)){
				$("#emailInfo").html("<img src='../images/minus.jpg'/>"+"邮箱格式错误");
				flag["email"]=false;
				return;
			}
			var result=$.ajax({type:"post",url:"checkEmail?email="+email,dataType:"json",
			async:false}).responseText;
			if(!(result=="true")){
				$("#emailInfo").html("<img src='../images/minus.jpg'/>"+"该邮箱已被占用");
				flag["email"]=false;
				return;
			}else{
				$("#emailInfo").html("<img src='../images/bg_right.jpg'/>");
				flag["email"]=true;
			}
			
		}
		function checkName(){
			var name=$("#name").val();
			if(!name.match(/^\w{4,20}$/)){
				$("#nameInfo").html("<img src='../images/minus.jpg'/>"+"密码格式错误")
				flag["name"]=false;
				return;
			}else{
				$("#nameInfo").html("<img src='../images/bg_right.jpg'/>");
				flag["name"]=true;
				
			}
			
		}
		function checkPassword(){
			var password=$("#password").val();
			if(!password.match(/^\w{6,20}$/)){
				$("#passwordInfo").html("<img src='../images/minus.jpg'/>"+"密码格式错误")
				flag["password"]=false;
				return;
			}
			$("#passwordInfo").html("<img src='../images/bg_right.jpg'/>");
			flag["password"]=true;
		}
		function checkPassword1(){
			var password1=$("#password1").val();
			if(!password1.match(/^\w{6,20}$/)){
				$("#password1Info").html("<img src='../images/minus.jpg'/>"+"密码格式错误")
				flag["password1"]=false;
				return;
			}
			if(!(password1==$("#password").val())){
				$("#password1Info").html("<img src='../images/minus.jpg'/>"+"密码不一致");
				flag["password1"]=false;
				return;
			}
			$("#password1Info").html("<img src='../images/bg_right.jpg'/>");
			flag["password1"]=true;
		}
		function checkCode(){
			var code=$("#number").val();
			var result=$.ajax({type:"post",url:"checkCode?code="+code,dataType:"json",
			async:false}).responseText;
			if(!(result=="true")){
				$("#numberInfo").html("<img src='../images/minus.jpg'/>"+"验证码错误");
				flag["number"]=false;
				return;
			}else{
				$("#numberInfo").html("<img src='../images/bg_right.jpg'/>");
				flag["number"]=true;
				
			}
			
		}
		function checkAll(){
			for(x in flag){
				check($("#"+x)[0]);
				if(flag[x]==false){
					return false;
				}
			}
			for(x in flag){
				if(flag[x]==false){
				alert(flag[x]);
					return false;
				}
			}
			return true;
		
		}	
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			注册步骤:
			<span class="red_bold">1.填写信息</span> > 2.验证邮箱 > 3.注册成功
		</div>
		<div class="fill_message">
			<form name="ctl00" method="post" action="register" id="f" onsubmit="return checkAll();">
				<h2>
					以下均为必填项
				</h2>
				<table class="tab_login" >
					<tr>
						<td valign="top" class="w1">
							请填写您的Email地址：
						</td>
						<td>
							<input name="user.email" type="text" id="email" class="text_input"/>
							<div class="text_left" id="emailValidMsg">
								<span id="emailMsg" style="display:none;">
									请填写有效的Email地址，在下一步中您将用此邮箱接收验证邮件。
								</span>
									<span id="emailInfo" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置您在在线购物系统的昵称：
						</td>
						<td>
							<input name="user.nickName" type="text" id="name" class="text_input" />
							<div class="text_left" id="nickNameValidMsg">
								<span id="nameMsg" style="display:none;">
									您的昵称可以由小写英文字母、中文、数字组成，<br/>
									长度4－20个字符，一个汉字为两个字符。
								</span>
								<span id="nameInfo" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							设置密码：
						</td>
						<td>
							<input name="user.password" type="password" id="password"
								class="text_input" />
							<div class="text_left" id="passwordValidMsg">
								<span id="passwordMsg" style="display:none;">
									您的密码可以由大小写英文字母、数字组成，长度6－20位。
								</span>
								<span id="passwordInfo" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							再次输入您设置的密码：
						</td>
						<td>
							<input name="password1" type="password" id="password1"
								class="text_input"/>
							<div class="text_left" id="repeatPassValidMsg">
							<span id="password1Msg" style="display:none;">请输入确认密码,必须与密码相同</span>
							<span id="password1Info" style="color:red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							验证码：
						</td>
						<td>
							<img class="yzm_img" id='imgVcode' src="code" />
							<input name="number" type="text" id="number"
								class="yzm_input"/>
							<div class="text_left t1">
								<p class="t1">
									<span id="numberMsg" style="display:none;">请输入图片中的四个字母。</span>
									
									<span id="numberInfo" style="color:red"></span>
									<a href="javascript:;" onclick="document.getElementById('imgVcode').src='code?a='+new Date().getTime();" >看不清楚？换个图片</a>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">

					<input id="btnClientRegister" class="button_1" name="submit"  type="submit" value="注 册"/>
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

