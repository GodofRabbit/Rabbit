var url="http://localhost:8080/ShopMall/BackOrderDisplay.do";
function BackOrderDisplay(url){
	$("#boody_tr").html("");
	var page = $("#page").val();
	$.ajax({
		type:"post",
		data:{page:page},
		url:url,
		success:function(data){
			$.each(data.data,function(index,order){
				var order_state = parseInt(order.order_state);
				var state = '';
				if(order_state==1){
					state='<font color="red">未支付</font>';
				}
				if(order_state==2){
					state='<font color="orange">已支付（待发货）</font>';
				}
				if(order_state==3){
					state='<font color="blue">已发货（待收货）</font>';
				}
				if(order_state==4){
					state='<font color="green">交易完成（收货）</font>';
				}
				var td='<td>'+state+'</td>'
				var tr ='<tr height="40px">'
					tr+='<td>'+order.orderseq+'</td>'
					tr+='<td>'+order.conname+'</td>'
					tr+='<td>'+order.conphone+'</td>'
					tr+='<td>'+order.provinces+','+order.citys+','+order.countys+','+order.street+'</td>'
					tr+='<td>'+order.order_time+'</td>'
					tr+='<td>'+order.delivery_time+'</td>'
					tr+= td
					tr+='<td>'
					tr+='<a href="http://localhost:8080/ShopMall/orderDatail.do?order_id='+order.order_id+'" style="cursor:hand; text-decoration:underline;"><img class="operation" src="http://localhost:8080/ShopMall/Back/page/img/update.png"></img></a>'
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
   BackOrderDisplay(url);
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
   BackOrderDisplay(url);
   }
}

//根据关键字搜索订单
function searchOrder(){
	var keywords = $("#keywords").val();
	$("#page").val(1);
	$("#currentPage").text(1);
    url="http://localhost:8080/ShopMall/searchOrder.do?keywords="+encodeURI(encodeURI(keywords));
    BackOrderDisplay(url);
}
