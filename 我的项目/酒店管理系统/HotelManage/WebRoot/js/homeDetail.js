function selectHomeDetail(){
	var room_id = GetQueryString("room_id");
	$.ajax({
        type:"post",
        resultType:"json",
        url:"selectHomeDetail.do",
        data:{room_id:room_id},
        success:function(result){
        	    $("#user_name").text(result.data.user_name);
				$("#user_sex").text(result.data.user_sex);
				$("#user_type_name").text(result.data.user_type_name);
				$("#user_phone").text(result.data.user_phone);
				$("#room_number").text(result.data.room_number);
				$("#room_type_name").text(result.data.room_type_name);
				$("#personID").text(result.data.personID);
				$("#inTime").text(result.data.inTime);
				$("#dayNum").text(result.data.dayNum);
				$("#charge").text(result.data.charge);
				$("#outTime").text(result.data.outTime);
				$("#remark").text(result.data.remark);
        },
        error:function(){
            alert("加载失败");
        }
    });
}


//采用正则表达式获取地址栏参数
function GetQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
 }