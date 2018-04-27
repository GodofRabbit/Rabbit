 //点击让提示信息隐藏
     function conceal(){
       $(".ipt-err").css("display","none");
     }
      function reCheckcode() {  
        //后面跟一个随机数方便每次请求都是一个新的请求，刷新验证码，防止会在缓存中去验证码图片  
        $("#kaptchaImage").attr("src","http://localhost:8080/ShopMall/createYZM.do?"+Math.random());  
      }
      //手机号验证
       function checkPhone(){
			var str =$("#phone").val();
			if(!(/^[1][35678][0-9]{9}$/.test(str))){
			    $("#phone_err").text("请输入正确的手机号");
                $("#mobilecheck_tips").css("display","block");
			}else{
			    $("#mobilecheck_tips").css("display","none");
			    $.ajax({
			      type:"post",
                  resultType:"json",
                  url:"http://localhost:8080/ShopMall/checkPhone.do",
                  data:{phone:str},
                  success:function(result){
                	  if(result.message!=""){
                      $("#phone_err").text(result.message);
                      $("#mobilecheck_tips").css("display","block");
                	  }
                  }
			    });
			}
		}
       //账号验证
       function checkUsername(){
    	   var str =$("#username").val();
    	   if(!((/^[a-zA-Z0-9_-]{4,10}$/.test(str))||(/[\u4E00-\u9FA5]/.test(str)))){
			   $("#username_err").text("汉字或4-10位字母、数字、下划线组合");
               $("#namecheck_tips").css("display","block");
			}else{
			    $("#namecheck_tips").css("display","none");
			    $.ajax({
			      type:"post",
                 resultType:"json",
                 url:"http://localhost:8080/ShopMall/checkUsername.do",
                 data:{username:str},
                 success:function(result){
               	  if(result.message!=""){
                     $("#username_err").text(result.message);
                     $("#namecheck_tips").css("display","block");
               	  }
                 }
			    });
			}
       }
	   //密码长度验证
	   function checkPassword(){
		 $("#eye").css("display","none");
	     var password = $("#xpassword").val().trim();
         if(password.length==0){
        	 $("#password_err").text("建议6-18位数字、字母、符号的组合");
             $("#passwordcheck_tips").css("display","block");
         }else if(password.length<6){
	         $("#password_err").text("密码长度小于6位");
	         $("#passwordcheck_tips").css("display","block");
         }else{
             $("#passwordcheck_tips").css("display","none");
         }
	   }
	   //让密码框小眼睛显示
	   function displayEye(){
		   $("#eye").css("display","inline");
	   }
	   //鼠标在小眼睛上方让密码显示
	   function displayPassword(){
		  $("#eye").attr("class","zc-secret zc-peyes bhide");
		  var password = $("#xpassword").val();
		  $("#xpassword2").val(password);
		  $("#xpassword").css("display","none");
		  $("#xpassword2").css("display","block");
	   }
	   function hidePassword(){
		   $("#eye").attr("class","zc-secret zc-peyeh bhide");
		   var password = $("#xpassword2").val();
		   $("#xpassword").val(password);
		   $("#xpassword").css("display","block");
		   $("#xpassword2").css("display","none"); 
	   }
      //输入框不能为空判定
      function register(){
      var realname = $("#realname").val().trim();
      var username = $("#username").val().trim();
      var phone = $("#phone").val().trim();
      var code = $("#xyzm").val().trim();
      var password = $("#xpassword").val().trim();
      var password1 = $("#xpassword1").val().trim();
      if(realname==""){
         $("#realname_err").text("真实姓名不能为空");
         $("#realnamecheck_tips").css("display","block");
      }else if(phone==""){
         $("#namecheck_tips").css("display","none");
         $("#phone_err").text("手机号码不能为空");
         $("#mobilecheck_tips").css("display","block");
      }else if(code==""){
         $("#mobilecheck_tips").css("display","none");
         $("#codeError").text("验证码不能为空");
         $("#codecheck_tips").css("display","block");
      }else if(username==""){
          $("#username_err").text("账号不能为空");
          $("#namecheck_tips").css("display","block");
       }else if(password==""){
         $("#codecheck_tips").css("display","none");
         $("#password_err").text("密码不能为空");
         $("#passwordcheck_tips").css("display","block");
      }else if(password1==""){
         $("#passwordcheck_tips").css("display","none");
         $("#password_err1").text("确认密码不能为空");
         $("#passwordcheck_tips1").css("display","block");
      }else if(password!=password1){
         $("#password_err1").text("两次密码不一致");
         $("#passwordcheck_tips1").css("display","block");
      }else{
         $("#myform").submit();
      }
      
   }
      //密码强度，input发生改变就会触发事件
      function passwordIntension(){    
    	           var $test1 = /^(?:\d+|[a-zA-Z]+|[!@#$%^&*]+){6,12}$/;   //  弱：纯数字，纯字母，纯特殊字符
    	           var $test2 = /^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/;   //中：字母+数字，字母+特殊字符，数字+特殊字符
    	           var $test3 = /^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)(?![a-zA-z\d]+$)(?![a-zA-z!@#$%^&*]+$)(?![\d!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/;   //强：字母+数字+特殊字符
    	           if($test1.test($('#xpassword').val())){    //必须先要满足第一个if才能进行下一个if    满足  弱  条件表示为红色
	               console.log($('#xpassword').val());
	               if($test2.test($('#xpassword').val())){    //必须先要满足  弱  条件  才能进行这个if    满足  中  条件表示为黄色
	                   $('.password_border1').css('background-color','#ccc');
	                   $('.password_border2').css('background-color','yellow');
	               if($test3.test($('#xpassword').val())){   //必须先要满足  中  条件才能进行这个if    满足  强  条件表示为绿色
	                     $('.safe_1').css('background-color','#ccc')
	                      $('.safe_2').css('background-color','#ccc')
	                      $('.safe_3').css('background-color','green')
	               }else{         //没满足  强  条件   但满足了  中条件   就显示   黄色
	                      $('.safe_1').css('background-color','#ccc')
	                      $('.safe_2').css('background-color','yellow')
	                      $('.safe_3').css('background-color','#ccc')
	                  };
	               }else{//没满足  中  条件就依旧显示红色
	                  $('.safe_1').css('background-color','red')
	                  $('.safe_2').css('background-color','#ccc')
	                  $('.safe_3').css('background-color','#ccc')
	               };
    	           }else{//没满足  弱  条件就依旧显示红色
    	              $('.safe_1').css('background-color','red')
    	              $('.safe_2').css('background-color','#ccc')
    	              $('.safe_3').css('background-color','#ccc')
    	          }
    	      }

