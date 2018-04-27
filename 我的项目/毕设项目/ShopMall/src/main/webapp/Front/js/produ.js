/**
 * Created by Administrator on 2017/5/13.
 */
//正则表达式获取地址栏参数：（ 强烈推荐，既实用又方便！）
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
//顶部导航
var navarr=['20px','130px','240px','350px','460px']
$('.headr-nav li').mouseover(function(){
    $('.headr-nav li a').eq($(this).index('li')).css('color','#4AB344')
    $('.spbottom:eq(0)').css('left',navarr[$(this).index()])
}).mouseout(function(){
	var id = GetQueryString("id");
    $('.headr-nav li a').eq($(this).index('li')).css('color','');
    $('.spbottom:eq(0)').css('left',id)
})

$('#shopcart').mouseover(function(){
    $(this).css('overflow','visible')
}).mouseout(function(){
    $(this).css('overflow','hidden')
})
//顶部导航结束
//切换菜单
$('.headr-nav li').click(function(){
    $('.headr-nav li a').removeClass('active')
    $('.bd1 ').eq($(this).index()).css('display','block')
    $('.headr-nav li a').eq($(this).index()).addClass('active')
})
//退出
function exit(){
    if(confirm("您确定退出吗？")){
     window.location.href="http://localhost:8080/ShopMall/logout.do";
  }else{
    return;
  }
     }
//加载produ页面
function loading(){
	var id = GetQueryString("id");
	$(".spbottom").css("left",id+"px");
	url="http://localhost:8080/ShopMall/allProdu.do";
	loadShop(url,id);
}
//ajax请求加载商品
function loadShop(url,id){
	$("#allProdu").html("");
	var page = $("#page").val();
	$.ajax({
		type:"post",
        resultType:"json",
        data:{page:page,id:id},
        url:url,
        success:function(result){
        	$.each(result.data,function(i,j){
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
            		div +='<div class="buy"><a class="second_mallBuy" href="findOne.do?goods_id='+j.id+'"><span style="color: white;">购买</span></a></div></div>'
            		div +='</div>';
            	var $div = $(div);
               	$("#allProdu").append($div);
        	})
        	$("#totalPage").text(result.state);
			$("#currentPage").text(page);
			var t = parseInt(result.state);
			for(;t>0;t--){
				var li ='<li><a id="active'+t+'" href="javascript:;" class="visited" onclick="displayByPage('+t+');">'+t+'</a></li>';
				var $li = $(li);
				$("#cat").prepend($li);
			}
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
	   $("#cat").html("");
	   $("#currentPage").text(page);
	   $("#page").val(page);
   loading();
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
	   $("#cat").html("");
	   $("#currentPage").text(page);
	   $("#page").val(page);
   loading();
   }
}
//根据页数显示
function displayByPage(page){
	$('#active'+page+'').attr("class","active");
	$("#cat").html("");
	$("#page").val(page);
	loading();
}
//联系我们
 function concat(){
	var concatname = $("#concatname").val().trim();
	var concatphone = $("#concatphone").val().trim();
	var concattime = $("#concattime").val().trim();
	var concattext = $("#concattext").val();
	$.ajax({
		type:"post",
		resultType:"json",
		data:{concatname:concatname,concatphone:concatphone,concattime:concattime,concattext:concattext},
		url:"http://localhost:8080/ShopMall/concat.do",
		success:function(result){
			alert(result.message);
		},
		error:function(){
			alert("抱歉,提交失败");
		}
	})
	
}