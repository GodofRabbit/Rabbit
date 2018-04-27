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
			重置密码步骤:1.身份验证> 2.邮箱验证 >
			<span class="red_bold">3.设置新密码 </span>  > 4.完成
		</div>
			<div class="validate_email">
				<h2>
					现请按以下步骤完成密码重置!
				</h2>
				<div class="look_email">
					<h4>
						第一步：输入新密码
					</h4>
					<div class="mess" >
					   <input type="password" id="newPwd" class="yzm_text"  style="width:200px;height:25px" onfocus="prompt();" onblur="test1();"/>
						<span id="errorMsg1" class="no_right" style="display: none;"></span>
					</div>
					<br/>
					<h4>
						第二步：再次确认密码
					</h4>
					<div class="mess">
						<input name="code" type="password" id="secPwd" class="yzm_text" style="width:200px;height:25px" onblur="test2();"/>
						<span id="errorMsg2" class="no_right" style="display: none;"></span>
					</div>
				</div>
				<div style="margin:-10px 200px;">
				<input type="button" value="确定" onclick="updatePwd()();" style="width:100px;height:25px"/></div>
			</div>
			
	</body>
	<script type="text/javascript">
	      function prompt(){
	      var newPwd = $("#newPwd").val().trim();
	         if(newPwd.length==0){
	        	 $("#errorMsg1").text("建议6-18位数字、字母、符号的组合");
	             $("#errorMsg1").css("display","block");
	         }
	      }
	      function test1(){
	      var newPwd = $("#newPwd").val().trim();
	          if(newPwd.length<6){
		         $("#errorMsg1").text("密码长度小于6位");
		         $("#errorMsg1").css("display","block");
	         }else{
	             $("#errorMsg1").css("display","none");
	         }
	      }
	      function test2(){
	         var newPwd = $("#newPwd").val().trim();
	         var secPwd = $("#secPwd").val().trim();
	         if(newPwd!=secPwd){
	            $("#errorMsg2").text("两次密码不一致");
                $("#errorMsg2").css("display","block");
	         }else{
	            $("#errorMsg2").css("display","none");
	         }
	      }
	      function updatePwd(){
	        if($("#errorMsg1").is(":visible")||$("#errorMsg2").is(":visible")){
	          return;
	        }
	        if($("#errorMsg1").is(":hidden")&&$("#errorMsg2").is(":hidden")){
	           var newPwd = $("#newPwd").val().trim();
	           $.ajax({
			     type:"post",
                 resultType:"json",
                 url:"http://localhost:8080/ShopMall/updatePwd.do",
                 data:{"newPwd":newPwd},
                 success:function(result){
               	    window.location.href="setPwd_ok.jsp";
                 },
                 error:function(){
                     alert("密码重置失败，请重试");
                 }
			    });
	      }
	      }
	</script>
</html>

