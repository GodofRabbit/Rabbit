<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>我的购物车</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/carts.css">
<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <title>果然新鲜</title>
    <link href="<%=path%>/css/index.css"rel="stylesheet">
    <link href="<%=path%>/css/share.css"rel="stylesheet">
    <script src="<%=path%>/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="<%=path%>/js/jquery.min.js"></script>
    <script src="<%=path%>/js/carts.js"></script>
  
    <script type="text/javascript">
        function delShop(gid){
             if(confirm("您确定移除吗？")){
              window.location.href="<%=path%>/delShop.go?gid="+gid;
            }else{
              return;
            }
              
        }
    
  </script>
  <script type="text/javascript">
		var msg ="${s}";
		if(msg!=""){
			alert(msg);
		}
</script> 
<script type="text/javascript">
		var msg ="${information}";
		if(msg!=""){
			alert(msg);
		}
</script>
<!-- <script type="text/javascript">  -->
<!--     var time = 5; //时间,秒 -->
<!-- var timelong = 0; -->
<!-- function diplaytime(){ //时间递减 -->
<!-- document.all.his.innerHTML = time -timelong ; -->
<!-- timelong ++; -->
<!-- } -->
<!-- function redirect(){ //跳转页 -->
<!-- //history.back(); -->
<!-- window.location.href="<%=path%>/shopCartServlet?flag=userCartList&user_id=${findUser.id}";//指定要跳转到的目标页面 -->
<!-- } -->
<!-- timer=setInterval('diplaytime()', 1000);//显示时间 -->
<!-- timer=setTimeout('redirect()',time * 1000); //跳转 -->
<!-- </script> -->
</head>
<body>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path%>/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="<%=path%>/index.jsp"style="color: #4AB344"><span style="color: #4AB344">首页</span></a> </li>
                <li><a href="<%=path%>/hot.jsp">蔬果热卖</a> </li>
                <li><a href="<%=path%>/goods.go">全部产品</a> </li>
                <li><a href="<%=path%>/consult.jsp">最新资讯</a></li>
                <li><a href="<%=path%>/touch.jsp">联系我们</a> </li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom"  >
                </div>
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束-->
<section class="cartMain">
	<div class="cartMain_hd">
		<ul class="order_lists cartTop">
			<li class="list_chk">
				<!--所有商品全选-->
				<input type="checkbox" id="all" class="whole_check">
				<label for="all"></label>
				全选
			</li>
			<li class="list_con">商品信息</li>
			<li class="list_price">单价</li>
			<li class="list_amount">数量</li>
			<li class="list_sum">金额</li>
			<li class="list_op">操作</li>
		</ul>
	</div>
<c:forEach items="${allCar}" var="list">
		<c:forEach var="a" items="${list.goods}">
	<div class="cartBox">
		<div class="order_content">
			<ul class="order_lists">
				<li class="list_chk">
					<input type="checkbox" id="checkbox_2" class="son_check">
					<label for="checkbox_2"></label>
				</li>
				<li class="list_con">
					<div class="list_img"><a href="javascript:;"><img src="<%=path %>/images/${a.key.goods_imageurl}" alt=""></a></div>
					<div class="list_text"><a href="javascript:;"><br><br>${a.key.goodsname}</a></div>
				</li>
				<li class="list_price">
					<p class="price"><br><br>￥${a.key.goodsprice}</p>
				</li>
				<li class="list_amount">
					<br><br><div class="amount_box">
						<span>${a.value}</span>
					</div>
				</li>
				<li class="list_sum">
					<br><br><p class="sum_price">${a.key.goodsprice*a.value}</p>
				</li>
				<li class="list_op">
					<br><br><p class="del"><a onclick="delShop(${a.key.id});" href="javascript:void(0);">移除商品</a></p>
				</li>
			</ul>
			
		</div>
	</div>



	<!--底部-->
	<div class="bar-wrapper">
		<div class="bar-right">
			<div class="calBtn"><a href="<%=path%>/balance.go?user_id=${list.user_id}">结算</a></div>
		</div>
	</div>
	</c:forEach>
</c:forEach>
</section>
<section class="model_bg"></section>

</body>
</html>
