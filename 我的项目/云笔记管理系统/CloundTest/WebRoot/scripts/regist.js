$(function(){
	
		$("#regist_button").click(function(){
			$("#warning_1 span").html("");
			$("#warning_2 span").html("");
			$("#warning_3 span").html("");
		

			var username=$("#regist_username").val();
			var nickname=$("#nickname").val();
			var password=$("#regist_password").val();
			var final_password=$("#final_password").val();

				if(username==""){
					$("#warning_1 span").html("�û�������Ϊ��");
					$("#warning_1").show();
				}else if(username.length<6||username.length>20){
					$("#warning_1 span").html("�û������ȹ���");
					$("#warning_1").show();
				}else if(password==""){
					$("#warning_2 span").html("���벻��Ϊ��");
					$("#warning_2").show();

				}else if(password.length<6){
					$("#warning_2 span").html("���볤�ȹ���");
					$("#warning_2").show();
				}else if(password!=final_password){
					$("#warning_3 span").html("�������벻ͬ");
					$("#warning_3").show();
				}else{
					$.ajax({

					url:"regist.go",
					data:{username:username,password:password,nickname:nickname},
					type:"post",
					resultType:"json",
					success:function(result){
						if(result.state==1){
							$("#warning_1 span").html(result.message);
						}else{
							$("#success_id").html(result.message+",������ת����¼ҳ��");
							setTimeout(function(){
								$("#back").click();
							},2000)
							
							
						}
						
						
					}
					})

				}

			



		})


	})
	

