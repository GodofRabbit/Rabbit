$(function(){
		$("#login").click(function(){

			$("#count_msg").html("");
			$("#password_msg").html("");


			var count=$("#count").val();
			var password=$("#password").val();
				
			if(count==""){
					$("#count_msg").html("用户名不能为空");
			}else if(password==""){
					$("#password_msg").html("密码不能为空");
			}else{
				$.ajax({
				url:"login.go",
				data:{username:count,password:password},
				type:"post",
				resultType:"json",
				success:function(result){

					if(result.state==0){
						$("#count_msg").html(result.message);
					}else if(result.state==1){
						$("#password_msg").html(result.message);
					}else if(result.state==2){
						addCookie("uid",result.obj,2);
						addCookie("uname",count,2);
						window.location.href="edit.html";
					}

				}

			})
				
			}

		});

	})
