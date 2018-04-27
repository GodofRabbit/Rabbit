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
          
          function addDaysAndPrice(){
              var days = document.getElementById('days').innerText;
              var price = $("#roomType option:selected").val(); 
              $("#allPrice").html(price*parseInt(days));
              var now = new Date();
              now.setDate(now.getDate()+parseInt(days));
              document.getElementById('end').innerHTML=now.getFullYear()
                                             + "-" + (now.getMonth() + 1)
                                             + "-" + (now.getDate())
                                             + " " + now.getHours()
                                             + ":" + now.getMinutes()
                                             + ":" + now.getSeconds();
                                             setInterval(addDays, 1000);
          }
          
          function reset1(){
        	  var days = document.getElementById('days').innerText;
              var price = $("#roomType option:selected").val(); 
              $("#allPrice").html(price*parseInt(days));
          }
          
          function addUserRecord(){
              var userName = $.trim($("#userName").text());
              var personID = $.trim($("#personID").text());
              var phone = $.trim($("#phone").text());
              var userSex =$.trim($("#userSex").val());
              var roomNum =$.trim($("#roomNum").text());
              var inTime = $.trim($("#clock").text());
              var dayNum = $.trim($("#days").text());
              var outTime = $.trim($("#end").text());
              var userRole = $.trim($("#userRole").val());
              var charge = $.trim($("#cash").text());
              var consume = $.trim($("#allPrice").text());
              var remark = $.trim($("#remark").text());
              $.ajax({
                  type:"post",
                  resultType:"json",
                  url:"addUserRecord.do",
                  data:{userName:userName,personID:personID,phone:phone,userSex:userSex,roomNum:roomNum,inTime:inTime,dayNum:dayNum,outTime:outTime,userRole:userRole,charge:charge,consume:consume,remark:remark},
                  success:function(result){
                       alert(result.message);
                       window.location.reload();
                  },
                  error:function(){
                      alert("提交失败");
                  }
              });
          }
          
          
          function selectUser(){
  			$("#boody_tr").html("");
  			var user_id = $("#user_id").val();
  			var user_name = $("#user_name").val();
  			var user_phone = $("#user_phone").val();
  			var personID = $("#personID").val();
  			var page = $("#page").val();
  			$.ajax({
  				url:"selectUser.do",
  				data:{user_name:user_name,user_id:user_id,personID:personID,user_phone:user_phone,page:page},
  				type:"post",
  				success:function(data){
  					$.each(data.data,function(index,user){
  					    //翻页让编号自增
  						var i = 5*(parseInt(page)-1)+index+1;
  						var tr = '<tr>'
  						tr+='<th style="text-align: center;">'+i+'</th>'
  						tr+='<th style="text-align: center;">'+user.user_id+'</th>'
  						tr+='<th style="text-align: center;">'+user.user_name+'</th>'  
  						tr+='<th style="text-align: center;">'+user.user_sex+'</th>'
  						tr+='<th style="text-align: center;" width="120px">'+user.user_phone+'</th>'
  						tr+='<th style="text-align: center;" width="120px">'+user.user_allSpend+'</th>'
  						tr+='<th style="text-align: center;" width="180px">'+user.personID+'</th>'
  						tr+='<th style="text-align: center;" width="100px">'+user.user_type_name+'</th>'
//  						tr+='<th style="text-align: center;">编辑</th>'
//  						tr+='<th style="text-align: center;">删除</th>'
  						tr+='<th style="text-align: center;"><a><input type="button" value="入住详情" class="buttom"/></a></th>'
  						tr+='</tr>'
  						var $tr = $(tr);
  						$tr.data("personID",user.personID);
  						$("#boody_tr").append($tr);
  					});
  					$("#totalPage").text(data.state);
					$("#totalRecord").text(data.message);
  				}
  			});
  		}
          
        //下一页
  		function nextPage(){
  		   var totalPage = parseInt($("#totalPage").text());
  		   var page = parseInt($("#page").val())+1;
  		   if(page<=totalPage){
  		   $("#currentPage").text(page);
  	       $("#page").val(page);
//  	       if(user_id!=""||user_name!=""||user_phone!=""||personID!=""){
//				$("#page").val(1);
//				$("#currentPage").text(1);
//			 }
  	         selectUser();
  	       }else{
  	          alert("亲，已经是最后一页了");
  	       }
  		}
  		//上一页
  		function lastPage(){
  		   var page = parseInt($("#page").val())-1;
  		   var totalPage = parseInt($("#totalPage").text());
  		   if(page<=0){
  		     alert("亲，已经是第一页了");
  		   }else{
  		   $("#currentPage").text(page);
  	       $("#page").val(page);
  	          selectUser();
  	       }
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
        //点击入住详情
       function displayDetail(){
    	   $("#boody_tr a").removeClass("checked");
		   $(this).addClass("checked");
		   var personID =$("#boody_tr a.checked").parent("th").parent("tr").data("personID");
		   window.location.href="UserLiveDetail.html?personID="+personID;
       }
       
       //身份证验证
       function checkPersonID(){
			var pattern = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
			var str =$("#personID").text();
			if(!pattern.test(str)){
				$("#personID").html("身份证格式错误").css("color","red");
			}
		}
       //改变颜色
       function changePersonIDColor(){
			$("#personID").html("").css("color","black");
		}
       //手机号验证
       function checkPhone(){
			var pattern =  /^1[34578]\d{9}$/;
			var str =$("#phone").text();
			if(!pattern.test(str)){
				$("#phone").html("手机号格式错误").css("color","red");
			}
		}
       function changePhoneColor(){
			$("#phone").html("").css("color","black");
		}
       //验证后提交
       function checkAfterAddUserRecord(){
			var userName = $("#userName").text();
			var personID = $("#personID").text();
			var phone = $("#phone").text();
			var roomNum = $("#roomNum").text();
			var days = $("#days").text();
			var cash = $("#cash").text();
			if(userName.trim()==""){
				alert("请完善信息");
			}else if (personID.trim()=="") {
				alert("请完善信息");
			}else if (phone.trim()=="") {
				alert("请完善信息");
			}else if (roomNum.trim()=="") {
				alert("请完善信息");
			}else if (days.trim()=="") {
				alert("请完善信息");
			}else if (cash.trim()=="") {
				alert("请完善信息");
			}else{
				addUserRecord();
			}
		}