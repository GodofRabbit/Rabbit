       //身份证验证
       function quitHomeSelect(){
			var str =$.trim($("#room_number").text());
			if(str==""){
				$("#room_number").html("房间号不能为空").css("color","red");
				 $("#room_type_name").text("");
	           	 $("#user_name").text("");
	           	 $("#personID").text("");
	           	 $("#user_type_name").text("");
	           	 $("#inTime").text("");
	           	 $("#charge").text("");
	           	 $("#outTime").text("");
	           	 $("#user_name").text("");
			}else{
				$.ajax({
                     type:"post",
                     resultType:"json",
                     data:{room_number:str},
                     url:"quitHomeSelect.do",
                     success:function(result){
                    	 var u=result.data;
                    	 if(u==null){
                    		 alert("该房间未入住");
                    		 $("#room_type_name").text("");
            	           	 $("#user_name").text("");
            	           	 $("#personID").text("");
            	           	 $("#user_type_name").text("");
            	           	 $("#inTime").text("");
            	           	 $("#charge").text("");
            	           	 $("#outTime").text("");
            	           	 $("#user_name").text("");
                    	 }else{
                    	 $("#room_type_name").text(u.room_type_name);
                    	 $("#user_name").text(u.user_name);
                    	 $("#personID").text(u.personID);
                    	 $("#user_type_name").text(u.user_type_name);
                    	 $("#inTime").text(u.inTime);
                    	 $("#charge").text(u.charge);
                    	 $("#outTime").text(u.outTime);
                    	 $("#user_name").text(u.user_name);
                    	 }
                     },
                     error:function(){
                    	 alert("查询失败");
                     }
				});
			}
		}
       //改变颜色
       function changeRoomNumber(){
    		   $("#room_number").html("").css("color","black"); 
		}
       
       //填写完信息后提交
       function okQuit(){
			var consume = $.trim($("#consume").text());
			var factDay = $.trim($("#factDay").text());
			if(consume==""){
				alert("请完善信息");
			}else if (factDay=="") {
				alert("请完善信息");
			}else{
				updateUserRecord();
			}
		}
       
       function updateUserRecord(){
    	   var room_number = $.trim($("#room_number").text());
    	   var factDay = $.trim($("#factDay").text());
    	   var clock = $.trim($("#clock").text());
    	   var consume = $.trim($("#consume").text());
    	   var inTime =$.trim($("#inTime").text());
    	   $.ajax({
               type:"post",
               resultType:"json",
               data:{factDay:factDay,clock:clock,consume:consume,room_number:room_number,inTime:inTime},
               url:"updateUserRecord.do",
               success:function(result){
              	 alert(result.message);
              	 window.location.reload();
               },
               error:function(){
            	   alert("退房失败");
               }
			});
       }
       
       
       function startClock()
       {
           setInterval(getTime, 1000);
       }
       function getTime()
       {
           var now = new Date();
           document.getElementById('clock').innerHTML = now.getFullYear()
                                            + "-" + (now.getMonth() + 1)
                                            + "-" + now.getDate()
                                            + " " + now.getHours()
                                            + ":" + now.getMinutes()
                                            + ":" + now.getSeconds();
       }
       
       //备注信息框得到和失去焦点事件 
       function changeRemark1(){
       	var remark = $("#remark").text("");
       }
       function changeRemark2(){
       	var remark = $.trim($("#remark").text());
       	if(remark==""){
       		$("#remark").text("暂无");
       	}
       }