var url="http://localhost:8080/ShopMall/BackgoodsDisplay.do";
function BackgoodsDisplay(url){
	$("#boody_tr").html("");
	var page = $("#page").val();
	$.ajax({
		type:"post",
		data:{page:page},
		url:url,
		success:function(data){
			$.each(data.data,function(index,goods){
				var tr ='<tr height="40px">'
					tr+='<td>'+goods.goodsname+'</td>'
					tr+='<td>'+goods.goodsprice+'</td>'
					tr+='<td><img src="http://localhost:8080/ShopMall/Back/images/'+goods.goods_imageurl+'" width="130px" height="50px"/></td>'
					tr+='<td>'+goods.goodstime+'</td>'
					tr+='<td>'+goods.num+'</td>'
					tr+='<td>'+goods.state+'</td>'
					tr+='<td><a class="goodsbtn" href="http://localhost:8080/ShopMall/goodsInfo.do?goods_id='+goods.id+'"><img class="operation" src="http://localhost:8080/ShopMall/Back/page/img/update.png"></img></a>'
					tr+='<shiro:hasRole name="root">' 
					tr+='<a href="javascript:void(0);" onclick="confirmDel('+goods.id+')"><img class="operation delban" src="http://localhost:8080/ShopMall/Back/page/img/delete.png"></img></a>'
				    tr+='</shiro:hasRole>'
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
   BackgoodsDisplay(url);
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
   BackgoodsDisplay(url);
   }
}
//首页
function firstPage(url){
	$("#boody_tr").html("");
	$.ajax({
		type:"post",
		data:{page:1},
		url:url,
		success:function(data){
			$.each(data.data,function(index,goods){
				var tr ='<tr height="40px">'
					tr+='<td>'+goods.goodsname+'</td>'
					tr+='<td>'+goods.goodsprice+'</td>'
					tr+='<td><img src="http://localhost:8080/ShopMall/Back/images/'+goods.goods_imageurl+'" width="130px" height="50px"/></td>'
					tr+='<td>'+goods.goodstime+'</td>'
					tr+='<td>'+goods.num+'</td>'
					tr+='<td>'+goods.state+'</td>'
					tr+='<td><a class="goodsbtn" href="http://localhost:8080/ShopMall/goodsInfo.do?goods_id='+goods.id+'"><img class="operation" src="http://localhost:8080/ShopMall/Back/page/img/update.png"></img></a>'
					tr+='<shiro:hasRole name="root">' 
					tr+='<a href="javascript:void(0);" onclick="confirmDel('+goods.id+')"><img class="operation delban" src="http://localhost:8080/ShopMall/Back/page/img/delete.png"></img></a>'
				    tr+='</shiro:hasRole>'
					tr+='</td></tr>'
				var $tr = $(tr);
				$("#boody_tr").append($tr);
			});
			$("#totalPage").text(data.state);
			$("#totalRecord").text(data.message);
			$("#currentPage").text(1);
		    $("#page").val(1);
			},
		error:function(){
			alert("加载失败");
		}
		})
}
//尾页
function lastPage(url){
	$("#boody_tr").html("");
	var totalPage = $("#totalPage").text();
	$.ajax({
		type:"post",
		data:{page:totalPage},
		url:url,
		success:function(data){
			$.each(data.data,function(index,goods){
				var tr ='<tr height="40px">'
					tr+='<td>'+goods.goodsname+'</td>'
					tr+='<td>'+goods.goodsprice+'</td>'
					tr+='<td><img src="http://localhost:8080/ShopMall/Back/images/'+goods.goods_imageurl+'" width="130px" height="50px"/></td>'
					tr+='<td>'+goods.goodstime+'</td>'
					tr+='<td>'+goods.num+'</td>'
					tr+='<td>'+goods.state+'</td>'
					tr+='<td><a class="goodsbtn" href="http://localhost:8080/ShopMall/goodsInfo.do?goods_id='+goods.id+'"><img class="operation" src="http://localhost:8080/ShopMall/Back/page/img/update.png"></img></a>'
					tr+='<shiro:hasRole name="root">' 
					tr+='<a href="javascript:void(0);" onclick="confirmDel('+goods.id+')"><img class="operation delban" src="http://localhost:8080/ShopMall/Back/page/img/delete.png"></img></a>'
				    tr+='</shiro:hasRole>'
					tr+='</td></tr>'
				var $tr = $(tr);
				$("#boody_tr").append($tr);
			});
			$("#totalPage").text(data.state);
			$("#totalRecord").text(data.message);
			$("#currentPage").text(totalPage);
			$("#page").val(totalPage);
			},
		error:function(){
			alert("加载失败");
		}
		})
}
//跳转指定页
function jumpPage(){
    $("#boody_tr").html("");
	var page = $("#jump").val();
	$("#page").val(page);
	$.ajax({
		type:"post",
		data:{page:page},
		url:url,
		success:function(data){
			$.each(data.data,function(index,goods){
				var tr ='<tr height="40px">'
					tr+='<td>'+goods.goodsname+'</td>'
					tr+='<td>'+goods.goodsprice+'</td>'
					tr+='<td><img src="http://localhost:8080/ShopMall/Back/images/'+goods.goods_imageurl+'" width="130px" height="50px"/></td>'
					tr+='<td>'+goods.goodstime+'</td>'
					tr+='<td>'+goods.num+'</td>'
					tr+='<td>'+goods.state+'</td>'
					tr+='<td><a class="goodsbtn" href="http://localhost:8080/ShopMall/goodsInfo.do?goods_id='+goods.id+'"><img class="operation" src="http://localhost:8080/ShopMall/Back/page/img/update.png"></img></a>'
					tr+='<shiro:hasRole name="root">' 
					tr+='<a href="javascript:void(0);" onclick="confirmDel('+goods.id+')"><img class="operation delban" src="http://localhost:8080/ShopMall/Back/page/img/delete.png"></img></a>'
				    tr+='</shiro:hasRole>'
					tr+='</td></tr>'
				var $tr = $(tr);
				$("#boody_tr").append($tr);
			});
			$("#totalPage").text(data.state);
			$("#totalRecord").text(data.message);
			$("#currentPage").text(page);
			$("#jump").val("");
			},
		error:function(){
			alert("加载失败");
		}
		})
}
//删除商品
function confirmDel(id){
	if(confirm("确定下架该商品吗？")){
		window.location.href="http://localhost:8080/ShopMall/delgoods.do?goods_id="+id;
	}else{
		return;
	}
}

//根据关键字搜索商品
function searchGoods(){
	var keywords = $("#keywords").val();
	$("#page").val(1);
	$("#currentPage").text(1);
    url="http://localhost:8080/ShopMall/searchGoods.do?keywords="+encodeURI(encodeURI(keywords));
    BackgoodsDisplay(url);
}