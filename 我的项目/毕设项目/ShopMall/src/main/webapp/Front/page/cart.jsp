<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	
    <title>我的购物车</title>
    <link rel="stylesheet" href="<%=path %>/Front/css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=path %>/Front/css/share.css" type="text/css"></link>
    <script type="text/javascript" src="<%=path %>/Front/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="<%=path %>/Front/js/jquery.SuperSlide.2.1.1.js"></script>
    <style type="text/css">
        a:link {color: #000000}     /* 未访问的链接 */
		a:visited {color: black}  /* 已访问的链接 */
		a:hover {color: #d90a81}    /* 当有鼠标悬停在链接上 */
		a:active {color: #d90a81}   /* 被选择的链接 */
   </style>
    </head>
 <body onload="loadCart();">
<input type="hidden" id="us">
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path %>/Front/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
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
         <br>
        <shiro:user><a href="javascript:vopid(0);" onclick="exit();"><div class="headr-right">退出</div></a></shiro:user>
        <c:if test="${empty cookie.rememberMe}"><shiro:notAuthenticated><a href="Front/page/register.jsp"> <div class="headr-right"><span id="logo">注册</span></div></a></shiro:notAuthenticated></c:if>
        <c:if test="${empty cookie.rememberMe}"><shiro:notAuthenticated><a href="login.jsp"> <div class="headr-right"><span id="logo">登录</span></div></a></shiro:notAuthenticated></c:if>
       <shiro:user><div class="headr-right"><a href="<%=path %>/loadMyOrder.do"><font color="blue" id="dearUser"><shiro:principal/></font>的个人中心</a></div></shiro:user>

        
    </div>
</div>
<!--顶部导航结束-->

<!--banner图片-->
<div class="her-banner">
</div>
<!--banner图片结束-->
<div class="content">
 <div class="ban-boot clear">
        <div class="ban-zs">
            <img src="<%=path %>/Front/images/ban-1.jpg" width="100%">
        </div>
        <div class="ban-zs">
            <img src="<%=path %>/Front/images/ban-2.jpg" width="100%">
        </div>
        <div class="ban-zs">
            <img src="<%=path %>/Front/images/ban-3.jpg" width="100%">
        </div>
    </div>

<table id="webContainerTable" class="webContainerTable" cellspacing="0" cellpadding="0">
			<tbody><tr>
				<td align="center">
					<div id="webContainer" class="webContainer">
						<div id="container" class="container">
	<table class="containerTop" cellspacing="0" cellpadding="0">
		<tbody><tr valign="top">
			<td class="left"></td>
			<td class="center"></td>
			<td class="right"></td>
		</tr>
	</tbody></table>

	<table class="containerMiddle" cellspacing="0" cellpadding="0">
		<tbody><tr valign="top">
			<td id="containerMiddleLeft" class="containerMiddleLeft">
					
					
					
					
			</td>

			<td class="containerMiddleCenter">
				<div id="containerMiddleCenterTop" class="containerMiddleCenterTop">
					
				</div>

				<div id="containerForms" class="containerForms">
					<div id="topForms" class="column forms mainForms topForms" style="display:none">
						
					</div>

					<table class="containerFormsMiddle" cellspacing="0" cellpadding="0">
						<tbody><tr>
							<td id="containerFormsLeft" class="containerFormsLeft" style="display:none" valign="top">
								<div class="containerFormsLeftTop">
								</div>
								<div id="leftForms" class="column forms sideForms leftForms">
									
								</div>
								<div class="containerFormsLeftBottom">
								</div>
							</td>

							<td id="containerFormsCenter" class="containerFormsCenter" valign="top">
					
								<div id="centerTopForms" class="column forms mainForms centerTopForms">
									<div id="module23" _indexclass="formIndex1" _moduletype="23" _modulestyle="57" _moduleid="23" class="form form23 formIndex1 formStyle57 jz-moduleSide" title="" _sys="0" _banid="" style="" _side="0" _intab="0" _inmulmcol="0" _infullmeasure="0" _inpack="0" _inpopupzone="0" _autoheight="1" _global="false" _independent="false"><table class="formTop formTop23" cellspacing="0" cellpadding="0"><tbody><tr><td class="left"></td><td class="center"></td><td class="right"></td></tr></tbody></table>
<table class="formBanner formBanner23" style="" cellspacing="0" cellpadding="0"><tbody><tr>
<td class="left left23"></td>
<td class="center center23" valign="top">
<table class="formBannerTitle formBannerTitle23" cellspacing="0" cellpadding="0"><tbody><tr>
<td class="titleLeft titleLeft23" valign="top">
</td>
<td class="titleCenter titleCenter23" valign="top">
<div class="titleText titleText23"><span class="bannerNormalTitle fk_mainTitle mainTitle mainTitle23">购物车</span></div>
</td>
<td class="titleRight titleRight23" valign="top">
</td>
</tr></tbody></table>
</td>
<td class="right right23"></td>
</tr></tbody></table>
<table class="formMiddle formMiddle23 jz-moduleSide-content" style="" cellspacing="0" cellpadding="0"><tbody><tr>
<td class="formMiddleLeft formMiddleLeft23"></td>
<td class="formMiddleCenter formMiddleCenter23 " valign="top">
<div class="formMiddleContent formMiddleContent23 fk-formContentOtherPadding" tabstyle="0">
<div class="mallCart J_mallCart mallCartNew"><div class="cartMsg mstl_tips" style="display:none">
</div>
<div class="itemList goodsTheadWrap J_saleTabRemove_1 " style="margin-top:10px;">
<div class="line ">
<table class="lineBody" cellspacing="0" cellpadding="0">
<tbody><tr>
<td class="itemName">名称</td>
<td class="itemPrice">价格</td>
<td class="itemAmount">数量</td>
<td class="itemTotal">小计</td>
<td class="itemOpt">操作</td>
</tr>
</tbody></table>
</div>
</div>
<div id="ssss" class="itemList itemListcount J_saleRemove_0  itemList_0" lineno="0" style="border-top-width:0px;">

<!-- 循环部分 -->

</div>
<br>
<div class="cartTotal">
<div style="float: left;"><label><input style="vertical-align:-2px;" checked="checked" id="selectAll" onclick="allChecked();" type="checkbox">&nbsp;&nbsp;全选</label></div>
<span class="J_countTotal countTotal">商品总金额：￥<span class="countTotalText"></span></span>
<span class="J_countSave countSave">&nbsp;&nbsp;&nbsp;优惠金额：<span class="countSaveText">￥0.00</span></span>
</div>
<div class="cartTotal J_countNeedPay countNeedPay"><span class="cartTotalName">应付金额：</span><span class="cartTotalValue mCart_color" choicecurrencyval="￥" leveldiscount="100" levelname=""><span class="currencyValText">￥</span><span id="qqqq"></span></span></div>
<div class="cartOpt">
<a hidefocus="true" href="<%=path %>/Front/page/produ.jsp?id=240" class="cartBuy">继续购物</a>
<input onclick="consult();" class=" cartSettle mCart_bg" value="结算订单" type="button">
</div>
</div></div>
</td>
<td class="formMiddleRight formMiddleRight23"></td>
</tr></tbody></table>
<table class="formBottom formBottom23" cellspacing="0" cellpadding="0"><tbody><tr><td class="left left23"></td><td class="center center23"></td><td class="right right23"></td></tr></tbody></table>
<div class="clearfloat clearfloat23"></div>






</div>


								</div>
								<div class="containerFormsCenterMiddle J_containerFormsCenterMiddle">
									<div id="middleLeftForms" class="column forms mainForms middleLeftForms" style="display:none">
									
									</div>
									<div id="middleRightForms" class="column forms mainForms middleRightForms" style="display:none">
									
									</div>	
									<div class="clearfloat"></div>
								</div>
								<div id="centerBottomForms" class="column forms mainForms centerBottomForms" style="display:none">
									
								</div>
							</td>

							<td id="containerFormsRight" class="containerFormsRight" style="display:none" valign="top">
								<div class="containerFormsRightTop">
								</div>
								<div id="rightForms" class="column forms sideForms rightForms">
									
								</div>
								<div class="containerFormsRightBottom">
								</div>
							</td>
						</tr>
					</tbody></table>

					<div id="bottomForms" class="column forms mainForms bottomForms" style="display:none">
						
					</div>

					<div id="containerPlaceholder" class="containerPlaceholder" style="height: 0px;"></div>
					
				</div>

				<div id="containerMiddleCenterBottom" class="containerMiddleCenterBottom">
				</div>

			</td>

			<td id="containerMiddleRight" class="containerMiddleRight"></td>
		</tr>
	</tbody></table>
	
	<table class="containerBottom" cellspacing="0" cellpadding="0">
		<tbody><tr valign="top">
			<td class="left"></td>
			<td class="center"></td>
			<td class="right"></td>
		</tr>
	</tbody></table>
</div>


					</div>
				</td>
			</tr>
		</tbody></table>
		
</div>
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="<%=path %>/Front/images/fot-1.jpg">
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
<script type="text/javascript" src="<%=path %>/Front/js/index.js"></script>

</html>