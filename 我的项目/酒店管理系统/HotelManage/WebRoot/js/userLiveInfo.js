function userLiveInfo(){
	 $("#boody_tr").html("");
	var page = $("#page").val();
	$.ajax({
		url:"userLiveInfo.do",
		type:"post",
		data:{page:page},
		success:function(data){
			$.each(data.data,function(index,user){
				var i=5*(parseInt(page)-1)+index+1;
				var tr = '<tr">'
					tr += '<th style="text-align: center;"><b>'+i+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.user_name+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.user_sex+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.room_number+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.user_type_name+'</b></th>'
//					tr += '<th style="text-align: center;"><b>'+user.personID+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.inTime+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.dayNum+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.outTime+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.charge+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.consume+'</b></th>'
					tr += '<th style="text-align: center;"><b>'+user.remark+'</b></th>'
					tr += '</tr>'
					var $tr = $(tr);
					$("#boody_tr").append($tr);
			});
			$("#totalPage").text(data.state);
			$("#totalRecord").text(data.message);
		}
	});
}
	function nextPage(){
	   var totalPage = parseInt($("#totalPage").text());
	   var page = parseInt($("#page").val())+1;
	   if(page<=totalPage){
		   $("#currentPage").text(page);
		    $("#page").val(page);
	    userLiveInfo();
	    }else{
	       alert("没有下一页了");
	    }
	}
function lastPage(){
	   var page = parseInt($("#page").val())-1;
	   var totalPage = parseInt($("#totalPage").text());
	   if(page<=0){
	     alert("没有上一页了");
	   }else{
	   $("#currentPage").text(page);
	$("#page").val(page);
	userLiveInfo();
	}
}
function nextPage1(){
	   var totalPage = parseInt($("#totalPage1").text());
	   var page = parseInt($("#page").val())+1;
	   if(page<=totalPage){
		   $("#currentPage1").text(page);
		    $("#page").val(page);
		    userInfo();
	    }else{
	       alert("没有下一页了");
	    }
	}
function lastPage1(){
	   var page = parseInt($("#page").val())-1;
	   var totalPage = parseInt($("#totalPage1").text());
	   if(page<=0){
	     alert("没有上一页了");
	   }else{
	   $("#currentPage1").text(page);
	$("#page").val(page);
	userInfo();
	}
}
function userInfo(){
	$("#boody_tr1").html("");
	var page = $("#page").val();
	$.ajax({
		url:"userInfo.do",
		type:"post",
		data:{page:page},
		success:function(data){
			$.each(data.data,function(index,user){
				var i=5*(parseInt(page)-1)+index+1;
				var tr = '<tr>'
				tr+='<th style="text-align: center;">'+i+'</th>'
				tr+='<th style="text-align: center;">'+user.user_id+'</th>'
				tr+='<th style="text-align: center;">'+user.user_name+'</th>'  
				tr+='<th style="text-align: center;">'+user.user_sex+'</th>'
				tr+='<th style="text-align: center;" width="120px">'+user.user_phone+'</th>'
				tr+='<th style="text-align: center;" width="180px">'+user.personID+'</th>'
				tr+='<th style="text-align: center;" width="100px">'+user.user_type_name+'</th>'
				tr+='</tr>'
				var $tr = $(tr);
				$("#boody_tr1").append($tr);
			});
			$("#totalPage1").text(data.state);
			$("#totalRecord1").text(data.message);
		}
	});
	
	
}