//加载顾客入住详细信息
       function userLiveDetail(){
    	   $("#boody_tr").html("");
    	   var page = $("#page").val();
    	   var personID = GetQueryString("personID");
    	   $("#personID").text(personID);
    	   $.ajax({
    		   type:"post",
    		   resultType:"json",
    		   data:{personID:personID,page:page},
    		   url:"userLiveDetail.do",
    		   success:function(data){
    			   $.each(data.data,function(index,user){
    				    //翻页让编号自增
    				    var i = 2*(parseInt(page)-1)+index+1;
//    				    var i=index+parseInt(page)+parseInt(page)-1;
 						var tr = '<tr>'
 						tr+='<th style="text-align: center;">'+i+'</th>'
 						tr+='<th style="text-align: center;">'+user.room_number+'</th>'  
 						tr+='<th style="text-align: center;">'+user.room_type_name+'</th>'
 						tr+='<th style="text-align: center;">'+user.inTime+'</th>'
 						tr+='<th style="text-align: center;">'+user.outTime+'</th>'
 						tr+='<th style="text-align: center;">'+user.dayNum+'</th>'
 						tr+='<th style="text-align: center;">'+user.charge+'</th>'
 						tr+='<th style="text-align: center;">'+user.consume+'</th>'
 						tr+='<th style="text-align: center;">'+user.remark+'</th>'
 						tr+='</tr>'
 						var $tr = $(tr);
 						$("#boody_tr").append($tr);
 						$("#user_name").text(user.user_name);
 						$("#user_sex").text(user.user_sex);
 						$("#user_type_name").text(user.user_type_name);
 						$("#user_phone").text(user.user_phone);
 					});
 					$("#totalPage").text(data.state);
					$("#totalRecord").text(data.message);
    		   }
    	   });
       }
       
       //采用正则表达式获取地址栏参数
       function GetQueryString(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)return  unescape(r[2]); return null;
        }
       
       //下一页
 		function nextPage(){
 		   var totalPage = parseInt($("#totalPage").text());
 		   var page = parseInt($("#page").val())+1;
 		   if(page<=totalPage){
 		   $("#currentPage").text(page);
 	       $("#page").val(page);
 	        userLiveDetail();
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
 	         userLiveDetail();
 	       }
 		}