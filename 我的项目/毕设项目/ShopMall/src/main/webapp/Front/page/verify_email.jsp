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
			重置密码步骤:1.身份验证>
			<span class="red_bold"> 2.邮箱验证 </span> > 3.设置新密码> 4.完成
		</div>
			<div class="validate_email">
				<h2>
					现请按以下步骤完成邮箱验证!
				</h2>
				<div class="look_email">
					<h4>
						第一步：输入您的电子邮箱，我们将为您发送验证邮件
					</h4>
					<div class="mess">
					   <input type="text" id="email" class="yzm_text"  style="width:150px;"/>
						<input class="finsh" type="button" value="点击发送" onclick="sendEmail();"/>
						<span id="errorMsg1" class="no_right" style="display: none;"></span>
					</div>
					<br/>
					<h4>
						第二步：输入您收到邮件中的验证码
					</h4>
					<div class="mess">
						<input name="code" type="text" id="validatecode" class="yzm_text"/>
						<input class="finsh" type="button" value="确定" onclick="checkVerify();"/>
						<span id="errorMsg2" class="no_right" style="display: none;"></span>
					</div>
				</div>
			</div>
	</body>
	<script type="text/javascript">
		//邮箱验证
	     function sendEmail(){
	         var email = $("#email").val().trim();
	        if(email==""){
	            $("#errorMsg1").text("不能为空");
	            $("#errorMsg1").css("display","block");  
	        }else if(!(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){
                $("#errorMsg1").text("邮箱格式有误");
	            $("#errorMsg1").css("display","block");
			}else{
			    $("#errorMsg1").css("display","none");
			    $.ajax({
			      type:"post",
                  resultType:"json",
                  url:"http://localhost:8080/ShopMall/sendEmail.do",
                  data:{"email":email},
                  success:function(result){
                	 alert(result.message);
                  }
			    });
			}
	     }
	     //验证码检验
	     function checkVerify(){
	         var verify = $("#validatecode").val().trim();
	         if(verify==""){
	            $("#errorMsg2").text("不能为空");
	            $("#errorMsg2").css("display","block");  
	        }else{
	            $("#errorMsg2").css("display","none");
	            $.ajax({
	              type:"post",
                  resultType:"json",
                  url:"http://localhost:8080/ShopMall/checkVerify.do",
                  data:{"verify":verify},
                  success:function(result){
                     if(result.state==1){
                         window.location.href="setNewPwd.jsp";
                     }else{
                        $("#errorMsg2").text("验证码错误，请重新输入");
	                    $("#errorMsg2").css("display","block");   
                     }
                  }
	            })
	        }
	     }
	</script>
</html>

