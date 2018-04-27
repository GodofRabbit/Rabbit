<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>果然新鲜</title>
    <link rel="stylesheet" href="Front/css/orange.css" type="text/css"></link> 
    <link href="Front/css/share.css" rel="stylesheet">
    <link rel="stylesheet" href="Front/css/layui.css" type="text/css"></link>
    <script src="Front/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="Front/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="Front/js/YMDClass.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style type="text/css">
        a:link {color: #000000}     /* 未访问的链接 */
		a:visited {color: black}  /* 已访问的链接 */
		a:hover {color: #d90a81}    /* 当有鼠标悬停在链接上 */
		a:active {color: #d90a81}   /* 被选择的链接 */
   </style>	
<script type="text/javascript"> 
   function reset()
{
    var t=$("#num");
    var allnum=$("#allnum").text();
    if(parseInt(t.val())>allnum){
        $("#num").val(allnum);
     setTotal();
     alert("亲，注意已达到库存上限！");
    }else if(parseInt(t.val())<1){
      $("#num").val(1);
      setTotal();
      alert("亲，数量不能为负哦！");
    }
    else{
        setTotal();
    }
} 

    function setTotal(){
    var s=0;
      s+=parseInt($("#num").val())*parseFloat($("#price").text());
    $("#total").html(s.toFixed(2));//toFixed() 方法可把 Number 四舍五入为指定小数位数的数字。
  }
  setTotal();
</script>
	
<script type="text/javascript">
$(function(){
  $("#jia").click(function(){
    var t=$("#num");
    var allnum=$("#allnum").text();
    if(parseInt(t.val())<allnum){
       t.val(parseInt(t.val())+1);
       setTotal();
    }
    if(parseInt(t.val())==allnum){
       setTotal();
       alert("亲，没有更多了哦!");
    }
  })
  $("#jian").click(function(){
    var t=$("#num");
    t.val(parseInt(t.val())-1);
    if(parseInt(t.val())<1){
      t.val(1);
    }
    setTotal();
  })
  
  function setTotal(){
    var s=0;
      s+=parseInt($("#num").val())*parseFloat($("#price").text());
    $("#total").html(s.toFixed(2));//toFixed() 方法可把 Number 四舍五入为指定小数位数的数字。
  }
  setTotal();
});
</script>

<!-- <script type="text/javascript"> -->
<!-- 		var msg ="${message}"; -->
<!-- 		if(msg!=""){ -->
<!-- 			alert(msg); -->
<!-- 		} -->
<!-- </script> -->
<script type="text/javascript">
$(function(){
        $("#inserts").click(function(){
          var user = "${cookie.rememberMe}";
            if(user!=""){
                 var num=$("#num").val();
                 var tid=${goods.id};
                 var username = $("#dearUser").text();
                 $.ajax({
                    type: "post",
					url:"http://localhost:8080/ShopMall/shopcart.do",
					data:{"id":tid,"num":num,"username":username},
					success:function(){
					alert("添加成功");
					},
					error:function(text){alert("添加失败，请重试")},
				});
            }else{
                 $(this).attr("href","<%=path%>/login.jsp");
            }
                 
			});
		})
</script>

<script type="text/javascript">
$(function(){
        $("#buy").click(function(){
          var user = "${cookie.rememberMe}";
            if(user!=""){
                 $(this).attr("href","<%=path%>/Front/page/cart.jsp"); 
            }else{
                 $(this).attr("href","<%=path%>/login.jsp");
            }
                 
			});
		})
</script>
<script type="text/javascript">
    var goods_id = "${goods.id}";
    var allnum = "${allnum}";
	//上一个
	function last(){
	     var last = parseInt(goods_id)-1;
	     if(last<1){
	        alert("亲,前面没有了");
	     }else{
		 $("#last").attr("href","findOne.do?goods_id="+last);
		 }
	}
	//下一个
	function next(){
	     var next = parseInt(goods_id)+1;
	     if(next>parseInt(allnum)){
	        alert("亲,已经是最后一个了");
	     }else{
		 $("#next").attr("href","findOne.do?goods_id="+next);
	     }
	}
	function noshop(){
	    var state = "${goods.state}";
	    if(parseInt(state)==2){
	        $(".buttn").css("background-color","#FF5151");
	        $("#inserts").unbind( "click" );
	        $("#inserts").click(function(){
	           alert("抱歉,该商品已下架");
	        });
	        $("#buy").unbind( "click" );
	        $("#buy").click(function(){
	           alert("抱歉,该商品已下架");
	        });
	    }
	}
</script>
<link rel="stylesheet" href="Front/css/index.css" type="text/css"></link></head>
 <body onload="noshop();">
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="Front/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav"><br>
            <ul>
                <li><a href="<%=path %>/index.jsp"style="color: #4AB344"><span style="color: #4AB344">首页</span></a> </li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=130">蔬果热卖</a> </li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=240">全部产品</a> </li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=350">最新资讯</a></li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=460">联系我们</a> </li>
            </ul> 
            <div class="sptopfoot">
                <div class="spbottom" >
                </div>
            </div>
        </div>
        <shiro:user><a href="javascript:vopid(0);" onclick="exit();"><div class="headr-right">退出</div></a></shiro:user>
        <c:if test="${empty cookie.rememberMe}"><shiro:notAuthenticated><a href="Front/page/register.jsp"> <div class="headr-right"><span id="logo">注册</span></div></a></shiro:notAuthenticated></c:if>
        <c:if test="${empty cookie.rememberMe}"><shiro:notAuthenticated><a href="login.jsp"> <div class="headr-right"><span id="logo">登录</span></div></a></shiro:notAuthenticated></c:if>
        <shiro:user><div class="headr-right"><a href="<%=path %>/loadMyOrder.do"><font color="blue" id="dearUser"><shiro:principal/></font>的个人中心</a></div></shiro:user>
        <br><br><br><br>
        <div class="headr-right" id="shopcart">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            <a href="<%=path %>/Front/page/cart.jsp" id="look" onclick="myCart();">我的购物车 ∨</a>
            
        </div>
    </div>
</div>
<!--顶部导航结束-->
<!--banner图片-->
<div class="her-banner">
</div>
<!--banner图片结束-->
<!--主页内容-->
<div class="content">
    <div class="cont-top">
        <div class="cont-left">
            <div class="ctl-img">
                <img src="Front/images/${goods.goods_imageurl}">
            </div>
            <div class="collect">
<!--                 <div class="coll"> -->
<!--                     <i class="iconfont">&#xe641;</i> -->
<!--                     收藏 -->
<!--                 </div> -->
<!--                 <div class="coll"> -->
<!--                     <i class="iconfont">&#xe617;</i> -->
<!--                     分享 -->
<!--                     <div class="share"> -->

<!--                     </div> -->
<!--                 </div> -->
            </div>
            <div class="next">
                <div class="nt">
                   <a href="javascript:void(0);" onclick="last();" id="last"> 上一个</a>
                </div>
                <div class="nt ntp">
                   <a href="javascript:void(0);" onclick="next();" id="next">  下一个</a>
                </div>
            </div>


        </div>
        <div class="cont-right">
            <div class="J_productTitle title g_minor">
                <span>${goods.goodsname}</span>
                <span id="productQrCode" class="webSiteQrCode">&nbsp;
                <div class="code">
                    <img src="Front/images/qrCode (1).gif">
                    <p>扫描二微码</p>
                </div>
                </span>
            </div>
           <div class="pic">
               <span class="ppi">价格:</span>
               <span class="f-mallUnit">￥</span>
               <span class="pcc"><span id="price">${goods.goodsprice}</span></span>
           </div>
            <div class="pict">
                <div class="f-proSatifySumWrap">
                    <div class="f-satifyDetail">
                        <span class="g_minor  salesVolume">评论：</span><span class="J_commNum">999+</span>
                    </div>
                    <div class="J_pdDetailBorder f-pdDetailBorder"></div>
                    <div class="f-satifyDetail">
                        <span class="g_minor  salesVolume">库存:</span><span id="allnum">${goods.num}</span>
                    </div>
                </div>
            </div>
            <div class="pict"><br>
              上架时间:${goods.goodstime}<br><br>商品状态:<b>&nbsp;&nbsp;<span id="goods_state">${goods.state}</span></b>&nbsp&nbsp&nbsp(商品状态:1.上架;2.下架)
            </div>
            <div class="fk-pd5MallCartCount">
                <div class="f-cartbuyCountWrap">
                    <span class="f-propName g_minor" style="width:75px;min-width:75px;max-width: 75px;">购买数量：</span>
                    <button id="jian" class="layui-btn layui-btn-primary layui-btn-small"><b><</b></button>
                    <input  id="num" type="text"  value="1" class="g_itext cartBuyCount f-cartBuyCount" onmouseout="reset()">
                    <button id="jia" class="layui-btn layui-btn-primary layui-btn-small"><b>></b></button>
                </div>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                          总价:<font size="7" color="#FFD700" id="total">${goods.goodsprice}0</font>
            </div>
            <div class="fk-pd5MallActBtns">
            <a href="javascript:void(0);" id="inserts">
                <div class="buttn">
                    加入购物车
                </div></a>
     <a href="javascript:void(0);" id="buy">
                <div class="buttn butto">
                    立即结算
                </div>
     </a>    
            </div>

        </div>
    </div>

</div>
<!--主页内容结束-->
</body>
<script src="Front/js/orange.js"></script>
</html>
