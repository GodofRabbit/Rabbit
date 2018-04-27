 function startClock()
        {
            setInterval(getTime, 1000);
            
            var room_number = GetQueryString("room_number");
            var room_price = GetQueryString("room_type_price");
            var room_name =decodeURI(GetQueryString("room_type_name"));
            $("#price").val(room_price);
            $("#roomNum").text(room_number);
            $("#room_type").text(room_name);
            
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
        
        
        //采用正则表达式获取地址栏参数
        function GetQueryString(name){
             var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
             var r = window.location.search.substr(1).match(reg);
             if(r!=null)return  unescape(r[2]); return null;
         }
          
          function addDaysAndPrice(){
              var days = document.getElementById('days').innerText;
              var price = $("#price").val();
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
              var price = $("#price").val();
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
  			var inquiry_id = $("#inpuiry_id").val();
  			var inquiry_name = $("#inpuiry_name").val();
  			var inquiry_phone = $("#inpuiry_phone").val();
  			var inquiry_number = $("#inquiry_number").val();
  			var page = $("#page").val();
  			$.ajax({
  				url:"inquiryList.do",
  				data:{inquiry_name:inquiry_name,inquiry_id:inquiry_id,inquiry_number:inquiry_number,inquiry_phone:inquiry_phone,page:page},
  				type:"post",
  				success:function(data){
  					$.each(data.data,function(index,inquiry){
  						var tr = '<tr>'
  						tr+='<th style="text-align: center;">'+inquiry.inquiry_id+'</th>'
  						tr+='<th style="text-align: center;">'+inquiry.inquiry_name+'</th>'  
  						tr+='<th style="text-align: center;">'+inquiry.inquiry_sex+'</th>'
  						tr+='<th style="text-align: center;" width="120px">'+inquiry.inquiry_phone+'</th>'
  						tr+='<th style="text-align: center;" width="120px">'+inquiry.inquiry_sum+'</th>'
  						tr+='<th style="text-align: center;" width="180px">'+inquiry.inquiry_number+'</th>'
  						tr+='<th style="text-align: center;" width="100px">'+inquiry.inquiry_vipgrade+'</th>'
  						tr+='<th style="text-align: center;">编辑</th>'
  						tr+='<th style="text-align: center;">删除</th>'
  						tr+='<th style="text-align: center;"><input type="button" onclick=""value="入住登记" class="buttom"/></th>'
  						tr+='</tr>'
  						var $tr = $(tr);
  						$tr.data("inquiry_id",inquiry.inquiry_id);
  						$("#boody_tr").append($tr);
  					});
  				}
  			});
  		}
          
        function changeRemark1(){
        	var remark = $("#remark").text("");
        }
        function changeRemark2(){
        	var remark = $.trim($("#remark").text());
        	if(remark==""){
        		$("#remark").text("暂无");
        	}
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