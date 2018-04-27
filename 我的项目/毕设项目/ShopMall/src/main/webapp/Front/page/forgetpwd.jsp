<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>忘记密码 - 果然新鲜</title>
		<link rel="stylesheet" href="../css/forgetpwd.css" type="text/css"></link>
	    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
	</head>
	<body>
		<%@include file="../page/head.jsp"%>
		<div class="login_step">
			重置密码步骤:
			<span class="red_bold">1.身份验证</span> > 2.邮箱验证 > 3.设置新密码> 4.完成
		</div>
		<div class="fill_message">
				<h2>
					以下均为必填项
				</h2>
				<table class="tab_login" >
				    <tr>
						<td valign="top" class="w1">
							请填写您的注册账号：
						</td>
						<td>
							<input name="username" type="text" id="username" class="text_input"/>
						    <div class="text_left">
								<span id="usernameMsg" style="display:none;color:red;">
								    不能为空
								</span>
							</div>
						</td>
						</tr>
					<tr>
						<td valign="top" class="w1">
							请填写注册的手机号码：
						</td>
						<td>
							<input type="text" name="phone" id="phone" class="text_input"/>
							<div class="text_left">
								<span id="phoneMsg" style="display:none;color:red;">
									请填写有效的手机号码（必须是注册账号时填写的手机号码）。
								</span>
							</div>
						</td>
						</tr>
			  </table>
<br/>
				<div class="login_in">
					<input class="button_1"  type="button" value="验证" onclick="first();"/>
				</div>
		</div>
		
	</body>
	<script type="text/javascript">
		//验证
	     function first(){
	         var username = $("#username").val().trim();
	         var phone = $("#phone").val().trim();
	        if(username==""){
	            $("#usernameMsg").css("display","block");  
	        }else if(phone==""){
	            $("#phoneMsg").css("display","block");
	        }else if(!(/^[1][35678][0-9]{9}$/.test(phone))){
                $("#phoneMsg").css("display","block");
			}else{
			    $("#usernameMsg").css("display","none"); 
			    $("#phoneMsg").css("display","none");
			    $.ajax({
			      type:"post",
                  resultType:"json",
                  url:"http://localhost:8080/ShopMall/checkInfo.do",
                  data:{"username":username,"phone":phone},
                  success:function(result){
                	  if(result!=""){
                	    window.location.href="verify_email.jsp";
                	  }else{
                	    alert("请填写正确的信息进行验证");
                	  }
                  }
			    });
			}
	     }
	</script>
</html>

