<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
     <title>果然新鲜</title>
    <link href="<%=path%>/css/orange.css"rel="stylesheet">
    <link href="<%=path%>/css/share.css"rel="stylesheet">
    <link rel="stylesheet" href="css/layui.css" type="text/css"></link>
    <script src="<%=path%>/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="<%=path %>/js/YMDClass.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
$(function(){
        $("#look").click(function(){
          var user = "${findUser.id}";
            if(user!=""){
                 $(this).attr("href","<%=path%>/carList.go?user_id="+user); 
             return true;
            }else{
               alert("亲，请先登录！");
               return false;
            }
                 
			});
		})
</script>	
<script type="text/javascript"> 
   function reset()
{
    var t=$("#num");
    var allnum=$("#allnum").text();
    if(parseInt(t.val())>allnum){
        $("#num").val(allnum);
     setTotal();
     alert("亲，注意已达到库存上限！");
    }else{
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

<script type="text/javascript">
		var msg ="${message}";
		if(msg!=""){
			alert(msg);
		}
</script>
<script type="text/javascript">
$(function(){
        $("#inserts").click(function(){
          var user = "${findUser.id}";
            if(user!=""){
                 var num=$("#num").val();
                 var tid=${goods.id};
                 $.ajax({
                    type: "post",
					url:"<%=path%>/carServletList.go",
					data:{"id":tid,"num":num},
					async: false,
					success:function(){
					alert("添加成功");
					},
					error:function(text){alert(text)},
				});
            }else{
                 $(this).attr("href","<%=path%>/log.go?fid=${goods.id}");
            }
                 
			});
		})
</script>

<script type="text/javascript">
$(function(){
        $("#buy").click(function(){
          var user = "${findUser.id}";
            if(user!=""){
                 $(this).attr("href","<%=path%>/carList.go?user_id="+user); 
            }else{
                 $(this).attr("href","<%=path%>/login.go?fid=${goods.id}");
            }
                 
			});
		})
</script>
  </head>
 <body>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path%>/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="<%=path%>/index.jsp"><span>首页</span></a> </li>
                <li><a href="<%=path%>/hot.jsp">蔬果热卖</a> </li>
                <li><a href="<%=path%>/goodsServlet?flag=goodsList">全部产品</a> </li>
                <li><a href="<%=path%>/consult.jsp">最新资讯</a></li>
                <li><a href="<%=path%>/touch.jsp">联系我们</a> </li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom"  >
                </div>
            </div>
        </div>
        <div class="headr-right">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            <a href="<%=path%>/cart.jsp" id="look">我的购物车 ∨</a>
        </div>
    </div>
</div>
<!--顶部导航结束-->
<!--主页内容-->
<div class="content">
    <div class="cont-top">
        <div class="cont-left">
            <div class="ctl-img">
                <img src="<%=path%>/images/${goods.goods_imageurl}">
            </div>
            <div class="collect">
                <div class="coll">
                    <i class="iconfont">&#xe641;</i>
                    收藏
                </div>
                <div class="coll">
                    <i class="iconfont">&#xe617;</i>
                    分享
                    <div class="share">

                    </div>
                </div>
            </div>
            <div class="next">
                <div class="nt">
                    上一个
                </div>
                <div class="nt ntp">
                    下一个
                </div>
            </div>


        </div>
        <div class="cont-right">
            <div class="J_productTitle title g_minor">
                <span>${goods.goodsname}</span>
                <span id="productQrCode" class="webSiteQrCode">&nbsp;
                <div class="code">
                    <img src="<%=path%>/images/qrCode%20(1).gif">
                    <p>扫描二微码</p>
                </div>
                </span>
            </div>
           <div class="pic">
               <span class="ppi">价格:</span>
               <span class="f-mallUnit">￥</span>
               <span class="pcc"><span id="price">${goods.goodsprice}0</span></span>
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
              上架时间:<fmt:formatDate pattern="yyyy-MM-dd E"  value="${goods.goodstime}" /><br><br>商品状态:<b>&nbsp&nbsp${goods.state}</b>&nbsp&nbsp&nbsp(商品状态:1.上架;2.下架)
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
<script src="<%=path%>/js/orange.js"></script>
</html>
