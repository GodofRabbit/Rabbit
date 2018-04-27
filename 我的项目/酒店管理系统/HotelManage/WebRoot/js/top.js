 function quit() {
           if(confirm("您确定退出系统吗？")){
           	delCookie("aid");
           	parent.location.href="OPLogin.html";
           	}else{
           	 return;
           	}
        }
 
 
 function logoff(){
     if(confirm("您确定注销当前账号吗？")){
         delCookie("aid");
    	    parent.location.href="OPLogin.html";
     }else{
       return;
     }
    }
 
 
 function changeAdmin(){
     if(confirm("您确定切换用户吗？")){
     	delCookie("aid");
     	parent.location.href="OPLogin.html";
     	}else{
     	 return;
     	}
     }
 
 function addImage(){  
	 if(confirm("您要更换新的头像吗？")){
		 $("#image").click(); 
	 }else{
		 return;
	 }
 }  

 //文件选择后触发
 function fileUpload(){
	 $.ajax({
		 type:"post",
		 resultType:"json",
		 cache: false,
		 data:new FormData($("#uploadForm")[0]),
		 processData: false,  
	     contentType: false,  
		 url:"upload.do",
		 success:function(data){
			 alert(data.message);
			 $("#updateImg").attr("src","http://localhost:8080/HotelManage/upload/"+data.data);
		 },
		 error:function(){
			 alert("头像上传失败");
		 }
	 });
 }
 
 //页面一加载就去数据库查头像
 function dispalyImg(){
     var aid = getCookie("aid");
     $.ajax({
          resultType:"json",
			url:"dispalyImg.do",
			data:{admin_id:aid},
			type:"post",
			success:function(data){
				$("#updateImg").attr("src","http://localhost:8080/HotelManage/upload/"+data.data);
			}
  });
}
