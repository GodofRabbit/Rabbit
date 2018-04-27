
$(function(){
		$("#tologin").click(function(){
			var count=$("#count").val();
			var password=$("#password").val();
				
			if(count==""){
					$("#count").attr("placeholder","用户名不能为空");
			}else if(password==""){
					$("#password").attr("placeholder","密码不能为空");
			}else{
				$.ajax({
				url:"checkAdmin.do",
				data:{adminName:count,adminPassword:password},
				type:"post",
				resultType:"json",
				success:function(result){

					if(result.state==0){
						$("#count").val("");
						$("#password").val("");
						$("#count").attr("placeholder",result.message);
					}else if(result.state==1){
						$("#password").val("");
						$("#password").attr("placeholder",result.message);
					}else if(result.state==2){
						addCookie("aid",result.data,2);
						addCookie("aname",result.message,2);
						window.location.href="index.html";
					}

				}

			})
				
			}

		});

	})
