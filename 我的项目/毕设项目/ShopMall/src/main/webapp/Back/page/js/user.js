//会员管理页面加载
var url="http://localhost:8080/ShopMall/BackUserDisplay.do";
function BackUserDisplay(url){
	$("#boody_tr").html("");
	var page = $("#page").val();
	$.ajax({
		type:"post",
		data:{page:page},
		url:url,
		success:function(data){
			$.each(data.data,function(index,admin){
				var tr ='<tr height="40px">'
					tr+='<td>'+admin.username+'</td>'
					tr+='<td>'+admin.realname+'</td>'
					tr+='<td>'+admin.phone+'</td>'
					tr+='<td>'+admin.jointime+'</td>'
//					tr+='<td><a class="goodsbtn" href="http://localhost:8080/ShopMall/addressInfo.do?user_id='+admin.id+'"><img class="operation" src="http://localhost:8080/ShopMall/Back/page/img/update.png"></img></a>'
					tr+='</td></tr>'
				var $tr = $(tr);
				$("#boody_tr").append($tr);
			});
			$("#totalPage").text(data.state);
			$("#totalRecord").text(data.message);
			$("#currentPage").text(page);
			},
		error:function(){
			alert("加载失败");
		}
		})
}

//下一页
function nextPage(){
   var totalPage = parseInt($("#totalPage").text());
   var page = parseInt($("#page").val())+1;
   if(page<=totalPage){
   $("#currentPage").text(page);
   $("#page").val(page);
   BackUserDisplay(url);
   }else{
      alert("亲，已经是最后一页了");
   }
}
//上一页
function prePage(){
   var page = parseInt($("#page").val())-1;
   var totalPage = parseInt($("#totalPage").text());
   if(page<=0){
     alert("亲，已经是第一页了");
   }else{
   $("#currentPage").text(page);
   $("#page").val(page);
   BackUserDisplay(url);
   }
}

//根据关键字搜索会员
function searchUser(){
	var keywords = $("#keywords").val();
	$("#page").val(1);
	$("#currentPage").text(1);
    url="http://localhost:8080/ShopMall/searchUser.do?keywords="+encodeURI(encodeURI(keywords));
    BackUserDisplay(url);
}

//原密码验证
function checkOldPassword(){
	var username = $("#username").val();
	var oldPwd = $("#oldPwd").val();
	$.ajax({
		type:"post",
		data:{username:username,oldPwd:oldPwd},
		url:"http://localhost:8080/ShopMall/checkOldPassword.do",
		success:function(data){
			if(data.state==2){
				$("#oldPassword").css("display","block");
			}
			if(data.state==1){
				$("#oldPassword").css("display","none");
			}
		}
	})
}
//新密码长度验证
function cnfpwd(){
	var newPwd = $("#newPwd").val();
	if(newPwd.length<4){
		$("#nfPwd").css("display","block");
	}
	if(newPwd.length>=4){
		$("#nfPwd").css("display","none");
	}
}
//确认密码是否相同
function comparePwd(){
	var newPwd = $("#newPwd").val()
	var okPwd = $("#okPwd").val();
	if(newPwd!=okPwd){
		$("#comparePwd").css("display","block");
	}else{
		$("#comparePwd").css("display","none");
	}
}
//修改密码页面一经加载就清空旧密码框内容
function cleanPswd(){
	$("#oldPwd").val("");
}
