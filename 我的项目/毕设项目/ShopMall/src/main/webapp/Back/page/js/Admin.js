var url="http://localhost:8080/ShopMall/BackAdminDisplay.do";
function BackAdminDisplay(url){
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
					tr+='<td>'
					tr+='<a href="javascript:void(0);" onclick="confirmDel('+admin.id+')"><img class="operation delban" src="http://localhost:8080/ShopMall/Back/page/img/delete.png"></img></a>'
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
   BackAdminDisplay(url);
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
   BackAdminDisplay(url);
   }
}

//删除普通管理员
function confirmDel(id){
	if(confirm("确定删除此条记录吗？")){
		window.location.href="http://localhost:8080/ShopMall/delAdmin.do?admin_id="+id;
	}else{
		return;
	}
}

//根据关键字搜索管理员
function searchAdmin(){
	var keywords = $("#keywords").val();
	$("#page").val(1);
	$("#currentPage").text(1);
    url="http://localhost:8080/ShopMall/searchAdmin.do?keywords="+encodeURI(encodeURI(keywords));
    BackAdminDisplay(url);
}