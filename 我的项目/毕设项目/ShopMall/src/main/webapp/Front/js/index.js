/**
 * Created by Administrator on 2017/5/11.
 */
//顶部导航
var navarr=['20px','130px','240px','350px','460px']
$('.headr-nav li').mouseover(function(){
    $('.headr-nav li a').eq($(this).index('li')).css('color','#4AB344')
    $('.spbottom:eq(0)').css('left',navarr[$(this).index()])
}).mouseout(function(){
    $('.headr-nav li a').eq($(this).index('li')).css('color','')
    $('.spbottom:eq(0)').css('left','20px')
})

$('#shopcart').mouseover(function(){
    $(this).css('overflow','visible')
}).mouseout(function(){
    $(this).css('overflow','hidden')
})
//顶部导航结束
//果园推荐开始
$('.rcr-top').mousemove(function(){
    $('.rcr-top').eq($(this).index('.rcr-top')).css('margin-left','0')

}).mouseout(function(){
    $('.rcr-top').eq($(this).index('.rcr-top')).css('margin-left','10px')

})
//果园推荐结束
//每日新品特卖轮播
var banner=document.getElementsByClassName('banner_1')[0]
var site=['0px','-1424px']
var bon = document.getElementsByClassName('banner-bottom')[0]
var ali = bon.getElementsByTagName('li')
var len = site.length
var num  = 0
for(i=0;i<len;i++){
    bon.innerHTML += '<li>'+(i+1)+'</li>'
}
ali[0].className = 'active'
for(i=0;i<len;i++){
    ali[i].index = i
    ali[i].onmouseover = function () {
        num = this.index
        picshow()
    }
}
function picshow(){
    for(j=0;j<len;j++){
        ali[j].className = ''
    }
    ali[num].className ='active'
    banner.style.marginLeft = site[num]
}
var time = null
function pp() {
    time = setInterval(function () {
        num++
        if (num >= len) {

            num=0
        }
        picshow()
    }, 5000)
}
pp()
banner.onmouseover = function () {
    clearInterval(time)
}
banner.onmouseout = function () {
    clearInterval(time)
    pp()
}
//每日新品特卖轮播结束
$('.nw-b').mousemove(function(){
    $('.nw-b img').eq($(this).index('.nw-b')).css('margin-left','-8px')

}).mouseout(function(){
    $('.nw-b img').eq($(this).index('.nw-b')).css('margin-left','0px')

})

$(".txtMarquee-top").slide({mainCell:".bd ul",autoPlay:true,effect:"topMarquee",vis:5,interTime:50,trigger:"click"});
$(".slideBox").slide({mainCell:".bd ul",autoPlay:true,trigger:"click"});

//退出
function exit(){
    if(confirm("您确定退出吗？")){
     window.location.href="http://localhost:8080/ShopMall/logout.do";
  }else{
    return;
  }
     }

//果园推荐
function recommand(){
	var username = $("#dearUser").text();
	$.ajax({
		type:"post",
        resultType:"json",
        data:{username:username},
        url:"http://localhost:8080/ShopMall/recommand.do",
        success:function(result){
        	//我的购物车展示
   		    if(result.obj!=null){
          		$("#shopcart_num").text(result.obj.length);
          		$(".num_all").text(result.obj.length);
          		var totalPrice = 0;
              	$.each(result.obj,function(i,j){
              		var div='<div class="cart_con_single">'
              			div +='<div class="single_pic">'
              			div +='<a href="#" target="_blank" alt="'+j.goodsname+'">'
              			div +='<img src="Front/images/'+j.goods_imageurl+'" />'
              			div +='</a>'
              			div +='</div>'
              			div +='<div class="single_info">'
              			div +='<a href="http://localhost:8080/ShopMall/findOne.do?goods_id='+j.goods_id+'" target="_blank" alt="'+j.goodsname+'" class="name">'+j.goodsname+'</a>'
              			div +='<span class="price">￥'+j.goodsprice+'</span>'
              			div +='<span class="price_plus"> x </span>'
              			div +='<span class="price_num">'+j.goods_num+'</span>'
              			div +='</div></div>'
              		totalPrice += j.goodsprice*j.goods_num;		
              		var $div = $(div);
                    $(".cart_content_center").append($div);
                    $(".cart_content_null").css("display","none");
              		$(".cart_content_all").css("display","block");
              	});
              	$(".total_price").text(totalPrice);
          	}else{
          		$("#shopcart_num").text("0");
          		$(".cart_content_null").css("display","block");
          		$(".cart_content_all").css("display","none");
          		$(".cart_content_all").html("");
          	}
        	$.each(result.data,function(i,j){
        		//首页
            	var div = '<div class="rcr">'
            		div +='<div class="rcr-top">'
            		div +='<a href="findOne.do?goods_id='+j.id+'"><img src="Front/images/'+j.goods_imageurl+'" width="100%">'
            		div +='</a></div>'
            		div +='<div class="rcr-bot">'
            		div +='<div class="rb-top">'
            		div +='<h>'+j.goodsname+'</h>'
            		div +='</div>'
            		div +='<div class="second_P">'
            		div +='<span class="fk-prop">￥</span>'
            		div +='<span class="fk-prop-price">'+j.goodsprice+'</span>'
            		div +='<span class="second_Marketprice">￥0.00</span>'
            		div +='</div>'
            		div +='</div>'
            		div +='</div>';
            	var $div = $(div);
               	$(".rec-right").append($div);
        	})
        }
	})
}

//显示更多
function showmore(){
	var page = parseInt($("#page").val())+1;
	$("#page").val(page);
		$.ajax({
    		type:"post",
    		data:{"page":page},
            resultType:"json",
            url:"http://localhost:8080/ShopMall/showmore.do",
            success:function(result){
            	if(result==""){
            		alert("亲，没有更多了!");
            		$(".showmore").html("<font color='#FFD700' id='simple'>>>收起更多<<</font>");
            		$("#page").val(1);
            		$("#simple").on("click",function(){
            			$(".showmore").html("<font color='#FFD700'>>>显示更多<<</font>");
            			$("div.rcr:gt(5)").hide();
            		})
            	}
            	$.each(result,function(i,j){
                	var div = '<div class="rcr">'
                		div +='<div class="rcr-top">'
                		div +='<a href="findOne.do?goods_id='+j.id+'"><img src="Front/images/'+j.goods_imageurl+'" width="100%">'
                		div +='</a></div>'
                		div +='<div class="rcr-bot">'
                		div +='<div class="rb-top">'
                		div +='<h>'+j.goodsname+'</h>'
                		div +='</div>'
                		div +='<div class="second_P">'
                		div +='<span class="fk-prop">￥</span>'
                		div +='<span class="fk-prop-price">'+j.goodsprice+'</span>'
                		div +='<span class="second_Marketprice">￥0.00</span>'
                		div +='</div>'
                		div +='</div>'
                		div +='</div>';
                	var $div = $(div);
                   	$("#showmore").append($div);
            })
         }
		})
}
//我的购物车
function myCartShow(){
		$("#cart_content").css("display","block");
}
function myCartHide(){
    $("#cart_content").css("display","none");
}
//加载购物车页面
function loadCart(){
	var user_name = $("#dearUser").text();
	$("#ssss").html("");
	$.ajax({
		type:"post",
		data:{"user_name":user_name},
        resultType:"json",
        url:"http://localhost:8080/ShopMall/loadCart.do",
        success:function(result){
        	var totalPrice = 0;
        	$.each(result.data,function(i,j){
        		var div = '	<div class="line itemLine0 J_saleTabItem_1 goodsInfoLine "  id="'+j.goods_id+'">'
        	        div+='<table class="lineBody" cellspacing="0" cellpadding="0">'
        		    div+='<tbody><tr>'
        			div+='<td class="itemCk" style="position:relative;">'
        			div+='<div class="saleItemCk" style="">'
        			div+='</div><input id="cartbox'+i+'" onclick="cartbox(this);" class="cartbox" checked="checked" style="margin:0px;" type="checkbox"></td><td class="itemName"><div class="itemPic"><img alt="'+j.goodsname+'" title="" style="width:60px;height:60px;" src="http://localhost:8080/ShopMall/Front/images/'+j.goods_imageurl+'"></div>'
        			div+='<div class="itemProName"><a hidefocus="true" href="http://localhost:8080/ShopMall/findOne.do?goods_id='+j.goods_id+'" target="_blank" title="'+j.goodsname+'">'+j.goodsname+'</a></div></td>'
        			div+='<td class="itemPrice">'
        			div+='<div class="itemSalePrice J_itemPrice_0">￥<span class="itemPriceText">'+j.goodsprice+'</span>   </div>   <br><div class="saleProSignHover J_saleMemOrRedPrice_0"></div></td>'
        			div+='<td class="itemAmount"><div>'+j.goods_num+''
        			div+='</div></div></td>'
        			div+='<td class="itemTotal goodsTotalMoney mCart_color">'
        			div+='￥<span class="itemTotalText">'+j.goodsprice*j.goods_num+'</span></td>'
        			div+='<td class="itemOpt">'
        			div+='<a href="javascript:;" onclick="delShopCart('+j.user_id+','+j.goods_id+','+i+');">删除</a>'
        			div+='</td>'
        			div+='</tr>'
        			div+='</tbody></table>'
        			div+='</div>'
			var $div = $(div);
           	$("#ssss").append($div);
           	totalPrice += j.goodsprice*j.goods_num;
           	$(".countTotalText").text(totalPrice);
           	$("#qqqq").text(totalPrice);
           	$("#us").val(j.user_id);
            })
        },
        error:function(){alert("加载失败");}
        })
}
//购物车删除操作
function delShopCart(uid,gid,i){
	$.ajax({
		type:"post",
		data:{"uid":uid,"gid":gid},
        resultType:"json",
        url:"http://localhost:8080/ShopMall/delShopCart.do",
        success:function(result){
        	loadCart();
        },
        error:function(){alert("删除失败，请重试");}
	})
}
//购物车商品选中操作
function cartbox(obj){
	var id = $(obj).parents("div").attr("id");
	var totalPrice= parseFloat($(".countTotalText").text());
	var jian = parseFloat($("#"+id).find(".itemTotalText").text());
	var currentPrice = 0;
	if($(obj).not(':checked')){
		 currentPrice = totalPrice-jian;
	}
	if($(obj).is(':checked')){
		 currentPrice = totalPrice+jian;
	}
	$(".countTotalText").text(currentPrice);
	$("#qqqq").text(currentPrice);
}
//购物车全选操作
function allChecked(){
	var currentPrice = 0;
	if($("#selectAll").not(':checked')){
		$("#ssss").find("input").removeProp("checked");
		currentPrice = 0;
		$(".countTotalText").text(currentPrice);
		$("#qqqq").text(currentPrice);
	}
	if($("#selectAll").is(':checked')){
		loadCart();
	}
}
//结算订单
function consult(){
	var user_id = $("#us").val();
		obj = document.getElementsByClassName("cartbox");
	    check_val = [];
	    for(k in obj){
	        if(obj[k].checked)
	            check_val.push($(obj[k]).parents("div").attr("id"));
	    }
        	window.location.href="balance.jsp?goods_id="+check_val+"&user_id="+user_id;
        	
}
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
//订单页面购物清单加载
function loadBalance(){
	var goods_id = GetQueryString("goods_id");
	var user_id = GetQueryString("user_id");
	$.ajax({
		type:"post",
		data:{"uid":user_id,"gid":goods_id},
        resultType:"json",
        url:"http://localhost:8080/ShopMall/loadBalance.do",
        success:function(result){
        	if(result.obj!=null){
        		$.each(result.obj,function(i,j){
        			var dl='<dl class="item" id="dl'+i+'" onclick="selecteddl(dl'+i+');">';
        			if(i==0){
        				dl='<dl class="item selected" id="dl'+i+'" onclick="selecteddl(dl'+i+');">';
        			}
                    dl+='<dt><strong class="itemConsignee">'+j.conname+'</strong>'
                    dl+='<span class="itemTag tag">'+j.address_type+'</span></dt><dd>'
                    dl+='<p class="tel itemTel">'+j.conphone+'</p>'
                    dl+='<p class="itemRegion">'+j.provinces+' '+j.citys+' '+j.countys+'</p>'
                    dl+='<p class="itemStreet">'+j.street+'('+j.postalcode+')</p>'
//                    dl+='<span class="edit-btn J_editAddr" onclick="editbtn();">编辑</span></dd>'
                    dl+='<dd style="display:none">'
                    dl+='<input type="radio" name="Checkout[address]" class="addressId"  value="10140916720030323">'
                    dl+='</dd>'
                    dl+='</dl>'
                var $dl = $(dl);
                $("#spq").append($dl);
        		})
        	}
        	var totalPrice = 0;
        	$.each(result.data,function(i,j){
        	var dd ='<dd class="item clearfix">'
                dd+='<div class="item-row">'
                dd+='<div class="col col-1">'
                dd+=' <div class="g-pic">'
                dd+='<img src="http://localhost:8080/ShopMall/Front/images/'+j.goods_imageurl+'" srcset="http://localhost:8080/ShopMall/Front/images/'+j.goods_imageurl+'" width="40" height="40" />'
                dd+=' </div>'
                dd+=' <div class="g-info">'
                dd+=' <a href="http://localhost:8080/ShopMall/findOne.do?goods_id='+j.goods_id+'" target="_blank">'
				dd+=''+j.goodsname+'</a>'
				dd+='</div>'
				dd+='</div>'
        		dd+=' <div class="col col-2">'+j.goodsprice+'元</div>'
        		dd+='<div class="col col-3">'+j.goods_num+'</div>'
        		dd+='<div class="col col-4">'+j.goodsprice*j.goods_num+'元</div>'
       			dd+='</div></dd>'
       		var $dd = $(dd);
           	$("#sp").append($dd);
           	totalPrice += j.goodsprice*j.goods_num;
           	$("#tt").text(totalPrice);
           	$("#ts").text(totalPrice);
           })
        },
        error:function(){alert("加载失败，请重试");}
	})
}
//地址信息保存
function saveAddress(){
	var user_id = GetQueryString("user_id");
	var Consignee = $("#Consignee").val();
	var Telephone = $("#Telephone").val();
	var Provinces = $("#Provinces option:selected").text();
	var Citys = $("#Citys option:selected").text();
	var Countys = $("#Countys option:selected").text();
	var Street = $("#Street").val();
	var Zipcode = $("#Zipcode").val();
	var Tag = $("#Tag").val();

	$.ajax({
		type:"post",
		data:{"user_id":user_id,"Consignee":Consignee,"Telephone":Telephone,"Provinces":Provinces,"Citys":Citys,"Countys":Countys,"Street":Street,"Zipcode":Zipcode,"Tag":Tag},
        resultType:"json",
        url:"http://localhost:8080/ShopMall/saveAddress.do",
        success:function(){
        	$("#J_editAddrBox").css("display","none");
        	window.location.reload();
        },
        error:function(){
        	alert("地址保存失败,请重试");
        }
	})
}
//选中地址框
function selecteddl(obj){
	$("#spq").find("dl").attr("class","item");
	$(obj).attr("class","item selected");
}
//点击立即下单让确认框显示
function checkoutOrder(){
	$("#yushouTip").css("display","block");
}
//点击立即下单让确认框隐藏
function outOrder(){
	$("#yushouTip").css("display","none");
}
//继续下单
function createOrder(){
	var user_id = GetQueryString("user_id");
	var conphone = $("#spq .selected").find(".itemTel").text();
	var delivery_time = $("#delivery_time").find(".selected").text();
	var goods_id = GetQueryString("goods_id");
	var order_message = $("#order_message").val();
	$.ajax({
		type:"post",
		data:{"user_id":user_id,"goods_id":goods_id,"conphone":conphone,"delivery_time":delivery_time,"order_message":order_message},
        resultType:"json",
        url:"http://localhost:8080/ShopMall/createOrder.do",
        success:function(){
        	window.location.href="orderSubmit.jsp";
        },
        error:function(){
        	alert("下单失败,请重试");
        }
	})
}
//我的订单
function loadMyOrder(){
	var user_name = $("#dearUser").text();
	$("#ssss").html("");
	$.ajax({
		type:"post",
		data:{"user_name":user_name},
        resultType:"json",
        url:"http://localhost:8080/ShopMall/loadMyOrder.do",
        success:function(result){
        	$.each(result.data,function(i,j){
        		var state = parseInt(j.order_state);
        		var div = '	<div class="line itemLine0 J_saleTabItem_1 goodsInfoLine "  id="'+j.order_id+'">'
        	        div+='<table class="lineBody" cellspacing="0" cellpadding="0">'
        		    div+='<tbody><tr>'
        			div+='</div><td class="itemAmount">'
        			div+=''+j.orderseq+'</td>'
        			div+='<td class="itemAmount">'
        			div+='<div class="itemSalePrice J_itemPrice_0"><span class="itemPriceText">'+j.conname+'</span>   </div>   <br><div class="saleProSignHover J_saleMemOrRedPrice_0"></div></td>'
        			div+='<td class="itemAmount"><div>'+j.conphone+''
        			div+='</div></div></td>'
        			div+='<td class="itemTotal goodsTotalMoney mCart_color">'
        			div+='<span class="itemTotalText">'+j.order_time+'</span></td>'
        			div+='<td class="itemOpt">'
        			div+='<span class="itemTotalText">'+j.provinces+''+j.citys+','+j.countys+''+j.street+'</span></td>'
        			div+='</td>'
    				div+='<td class="itemOpt">'
            		div+='<span class="itemTotalText">'
            		div+='<c:if test="${'+state+'==1}">未支付</c:if>'
            		div+='<c:if test="${'+state+'==2}">已支付（待发货）</c:if>'
            		div+='<c:if test="${'+state+'==3}">已发货（待收货）</c:if>'
            		div+='<c:if test="${'+state+'==4}">交易完成（收货）</c:if>'
            		div+='</span></td>'
            		div+='</td>'
        			div+='</tr>'
        			div+='</tbody></table>'
        			div+='</div>'
			var $div = $(div);
           	$("#ssss").append($div);
            })
        },
        error:function(){alert("加载失败");}
        })
}