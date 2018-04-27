<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <title>果然新鲜</title>
    <link rel="stylesheet" href="Front/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="Front/css/share.css" type="text/css"></link>
    <link rel="stylesheet" href="Front/css/public.css" type="text/css"></link>
    <script type="text/javascript" src="Front/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="Front/js/jquery.SuperSlide.2.1.1.js"></script>
    <style type="text/css">
        a:link {color: #000000}     /* 未访问的链接 */
		a:visited {color: black}  /* 已访问的链接 */
		a:hover {color: #d90a81}    /* 当有鼠标悬停在链接上 */
		a:active {color: #d90a81}   /* 被选择的链接 */
   </style>
</head>
<body onload="recommand();">
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
           
           <div id="cart_box" class="cart_box"  onmouseover="myCartShow();" onmouseout="myCartHide();">
                <a id="cart" class="cart_link" style="cursor: pointer" rel="nofollow">
                 <span class="text">我的购物车</span>
                    <img src="Front/images/shopping_icon.png" width="24" height="24" class="cart_gif">
                   
                    <!-- 购物车没有物品时，隐藏此num -->
                    <span id="shopcart_num" class="num"></span>
                </a>

                <div class="cart_content" id="cart_content">
                    <i class="cart-icons"></i>
                    <!-- 购物车没有物品时，显示cart_content_null、隐藏cart_content_all -->
                    <div class="cart_content_null" style="display: none;">购物车中还没有商品，<br>快去挑选心爱的商品吧！</div>
                    <div class="cart_content_all" style="display: block;">
                        <div class="cart_content_center">
                            
                          <!-- 循环部分 -->
                            
                        </div>
                        <div class="con_all">
                            <div class="price_whole"><span>共<span class="num_all"></span>件商品</span></div>
                            <div><span class="price_gongji">共计<em>￥</em><span class="total_price"></span></span><a href="<%=path%>/Front/page/cart.jsp" target="_blank" class="cart_btn" rel="nofollow">去购物车结算</a></div>
                        </div>
                    </div>
                </div>
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
    <div class="ban-boot clear">
        <div class="ban-zs">
            <img src="Front/images/ban-1.jpg" width="100%">
        </div>
        <div class="ban-zs">
            <img src="Front/images/ban-2.jpg" width="100%">
        </div>
        <div class="ban-zs">
            <img src="Front/images/ban-3.jpg" width="100%">
        </div>
    </div>
    <!--果园推荐开始-->
    <div class="recommand clear" id="showmore">
        <div class="rec-nav clear">
            <h2>果园推荐 <span>RECOMMAND</span></h2>
        </div>
        <div class="rec-cont clear">
            <div class="rec-left">
                <img src="Front/images/rc-1.jpg">
            </div>

            <div class="rec-right">

                  <!-- 循环部分 -->
                
                    </div>
                </div>   
    </div>   
          <input type="hidden" id="page" value="1">
          <div style="float: right"><font style="font-size: 20px"><a class="showmore" href="javascript:void(0);" onclick="showmore();"><font color="#FFD700">>>显示更多<<</font></a></font></div> 
   <!--果园推荐结束-->
   
</div>
<!--每日新品特卖-->
    <div class="rec-bottom clear">
        <div class="rbt-con">
                <div class="banner_1">
                    <img src="Front/images/rb-1.jpg"width="1424px">
                    <img src="Front/images/rb-2.jpg"width="1424px">
                </div>
        </div>
                <ul class="banner-bottom">

                </ul>
    </div>
<div class="content">
    <div class="new-nav clear">
        <div class="nwn-con">
            <div style="text-align: center;">
                <span style="">
                    <span style="font-size: 31px;">
                        <font style="color: rgb(33, 33, 33);" color="#212121">
                        <font style="color: rgb(231, 231, 231);" color="#e7e7e7">
                            ———————
                        </font>
                            <b>&nbsp; 每日新品特卖 &nbsp;</b>
                        </font></span></span>
                <span style="font-size: 31px;">
                <font style="color: rgb(231, 231, 231);" color="#e7e7e7">
                    ———————
                </font>
            </span>
            </div>
       <div style="text-align: center;">
                <font color="#353535" style="">
                    <span style="font-size: 16px;">
                            <font style= color:#888888>
                                新鲜水果每一天，健康生活每一刻
                            </font>
                    </span>
                </font></div>

        </div>


    </div>
    <div class="new-con clear">
        <div class="nec-lift">
            <div class="fk-editor simpleText  ">
                <font color="#4b4b4b">
                    <span style="">
                        <span style="line-height: 29px;">
                            <span style="color: rgb(75, 75, 75); font-size: 16px;">
                                有机生鲜
                            </span>
                            <div style="color: rgb(75, 75, 75);">
                                <span style="font-size: 20px;">
                                    天然无污染水果
                                </span>
                            </div>
                        </span>
                    </span>
                    <div style="color: rgb(75, 75, 75);">
                        <span style="font-size: 20px;">
                            <br>
                        </span>
                   	</div>
                    <div>
                        <font style="color: rgb(243, 151, 0);" color="#f39700">
                    <b>
                        <span style="font-size: 42px;">6.8</span>
                    </b><span style="font-size: 42px;">
                    <b>折</b>
                    <span style="font-size: 18px;">
                        <font style="color: rgb(53, 53, 53);" color="#353535">起</font>
                    </span></span></font></div>
                </font>
            </div>
            <div class="xiqing">
                <a  href="<%=path%>/adsf"style="color: white">查看详情 &gt;</a>
            </div>
        </div>
        <div class="nec-right">
            <img src="Front/images/nw-1.jpg">

        </div>

    </div>
    <div class="new-bottom clear">
        <div class="nw-b">
            <img src="Front/images/nw-2.jpg">
        </div>
        <div class="nw-b">
            <img src="Front/images/nw-3.jpg">
        </div>
        <div class="nw-b">
            <img src="Front/images/nw-4.jpg">
        </div>
        <div class="nw-b" style="margin:0">
            <img src="Front/images/nw-5.jpg">
        </div>
    </div>
    <!--每日新品特卖结束-->
    <!--蔬果资讯-->
    <div class="fruits">
        <div class="fru-nav">
            <div class="fk-editorb ">
                <font style="color: rgb(103, 141, 30);" color="#678d1e">蔬果资讯</font>
            </div>
            <font style="color: rgb(53, 53, 53);float: right" color="#353535">更多资讯</font>
        </div>
        <div class="fru-lift">
            <div class="frl-nav">
                <ul>
                    <li>品种</li>
                    <li>地区</li>
                    <li>价格</li>
                  <span>时间</span>
                </ul>
            </div>
            <div class="txtMarquee-top">
                <div class="bd">
                    <ul class="infoList">

                        <li><p>苹果</p>
                            <p>河南省济源市</p>
                            <p >5.5/kg</p>
                            04-09
                        </li>
                        <li><p> 西瓜</p>
                            <p>	内蒙古鄂尔多斯</p>
                            <p >10/kg</p>
                            04-09
                        </li>
                        <li><p>葡萄</p>
                            <p>新疆乌鲁木齐</p>
                            <p >19/kg</p>
                            04-09
                        </li>
                        <li><p>车厘子</p><p>河南省郑州市</p><p>	58.5/kg</p> 04-09</li>
                        <li><p>菜心	</p><p>河南省新乡市</p><p>	5.5/kg</p>	04-09</li>
                        <li><p>西兰花</p>	<p>河南省信阳市</p><p>	3.5/kg</p>	04-09</li>
                        <li><p>苹果	</p><p>河南省济源市</p><p>	5.5/kg	</p>04-09</li>
                        <li><p>西瓜	</p><p>内蒙古鄂尔多斯</p><p>10/kg</p>	04-09</li>
                        <li><p>葡萄	</p><p>新疆乌鲁木齐	</p><p>19/kg</p>	04-09</li>
                        <li><p>菜心	</p><p>河南省新乡市</p><p>	5.5/kg	</p>04-09</li>
                        <li><p>西兰花</p><p>	河南省信阳市</p><p>	3.5/kg	</p>04-09</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="fru-right">
            <div id="slideBox" class="slideBox">
                <div class="hd">
                    <!--<ul><li>蜜橘首发</li>-->
                        <!--<li>智利车厘子</li>-->
                        <!--<li>进口青苹果</li>-->
                    <!--</ul>-->
                    <ul><li>1</li><li>2</li><li>3</li></ul>
                </div>
                <div class="bd">
                    <ul>
                        <li><a href="#" target="_blank"><img src="Front/images/fr-1.jpg" /></a></li>
                        <li><a href="#" target="_blank"><img src="Front/images/fr-2.jpg" /></a></li>
                        <li><a href="#" target="_blank"><img src="Front/images/fr-3.jpg" /></a></li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
    <!--蔬果资讯结束-->
</div>
<!--主页内容结束-->
<!--底部-->
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="Front/images/fot-1.jpg">
        </div>
        <div class="ft-bo">
            <div class="ft-b">
                <h3>服务保障</h3>
                <p>正品保证</p>
                <p>7天无理由退换</p>
                <p>退货返运费</p>
                <p>7X15小时客户服务</p>

            </div>
            <div class="ft-b">
                <h3>支付方式</h3>
                <p>公司转账</p>
                <p>货到付款</p>
                <p>在线支付</p>
                <p>分期付款</p>

            </div>
            <div class="ft-b">
                <h3>商家服务</h3>
                <p>商家入驻</p>
                <p>培训中心</p>
                <p>广告服务</p>
                <p>服务市场</p>

            </div>
            <div class="ft-b">
                <h3>服务保障</h3>
                <p>免运费</p>
                <p>海外配送</p>
                <p>EMS</p>
                <p>211限时达</p>

            </div>

        </div>
        <div class="banq">
            <p>©2016 果然新鲜 版权所有</p>
        </div>

    </div>

</div>
</body>
<!-- 此js必须放在这里才会生效，因为得等页面加载完成 -->
<script type="text/javascript" src="Front/js/index.js"></script>
</html>
