<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单</title>
<link href="<%=path %>/Front/css/public.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/Front/css/base.css"/>
<script type="text/javascript" src="<%=path %>/Front/js/jquery_cart.js"></script>  
<link rel="stylesheet" type="text/css" href="<%=path %>/Front/css/checkOut.css" />

</head>
        
<body onload="loadBalance();">
     <!--顶部Logo及搜索-->
    <div class="header_2013">
        <div class="w">
            <div class="logo_v2013">
                <a href="#">
                    <img class="border_r" src="<%=path %>/Front/images/logo.jpg" width="120" height="50" />
                </a>
            </div>
            
            <div id="cart_box" class="cart_box">
                <a id="cart" class="cart_link" href="cart.jsp" rel="nofollow">
                 <span class="text">去购物车结算</span>
                    <img src="<%=path %>/Front/images/shopping_icon.png" width="24" height="24" class="cart_gif" />
                   
                    <s class="icon_arrow_right"></s>
                </a>
            </div>
            <span class="clr"></span>
        </div>
    </div>
    <!--顶部Logo及搜索-->
   <div class="banner_red_top"> 
  </div>  
 <!--收货地址body部分开始-->  
 <div class="border_top_cart">
  <script type="text/javascript">
    var checkoutConfig={
        addressMatch:'common',
        addressMatchVarName:'data',
        hasPresales:false,
        hasBigTv:false,
        hasAir:false,
        hasScales:false,
        hasGiftcard:false,
        totalPrice:244.00,
        postage:10,//运费
        postFree:true,//活动是否免邮了
        bcPrice:150,//计算界值
        activityDiscountMoney:0.00,//活动优惠
        showCouponBox:0,
        invoice:{
            NA:"0",
            personal:"1",
            company:"2",
            electronic:"4"
        }
    };
    var miniCartDisable=true;
</script>
<div class="container">
    <div class="checkout-box">

            <div class="checkout-box-bd">
                    <!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
                <input type="hidden" name="Checkout[addressState]" id="addrState"   value="0">
                <!-- 收货地址 -->
                <div class="xm-box">
                    <div class="box-hd ">
    <h2 class="title">收货地址</h2>
    <!---->
</div>
<div class="box-bd">
    <div class="clearfix xm-address-list" id="checkoutAddrList">
  <span id="spq"></span>
                        <div class="item use-new-addr"  id="J_useNewAddr" data-state="off">
             <span class="iconfont icon-add"><img src="<%=path %>/Front/images/add_cart.png" /></span> 
            使用新地址
        </div>
            </div>
        <input type="hidden" name="newAddress[type]" id="newType" value="common">
    <input type="hidden" name="newAddress[consignee]" id="newConsignee">
    <input type="hidden" name="newAddress[province]" id="newProvince">
    <input type="hidden" name="newAddress[city]" id="newCity">
    <input type="hidden" name="newAddress[district]" id="newCounty">
    <input type="hidden" name="newAddress[address]" id="newStreet">
    <input type="hidden" name="newAddress[zipcode]" id="newZipcode">
    <input type="hidden" name="newAddress[tel]" id="newTel">
    <input type="hidden" name="newAddress[tag_name]" id="newTag">
    <!--点击弹出新增/收货地址界面start-->
    <div class="xm-edit-addr-box" id="J_editAddrBox">
        <div class="bd">
            <div class="item">
                <label>收货人姓名<span>*</span></label> 
                <input type="text" name="userAddress[consignee]" id="Consignee" class="input" placeholder="收货人姓名" maxlength="15" autocomplete='off'>
                <p class="tip-msg tipMsg"></p>
            </div>
            <div class="item">
                <label>联系电话<span>*</span></label> 
                <input type="text" name="userAddress[tel]" class="input" id="Telephone" placeholder="11位手机号" autocomplete='off'>
                <p class="tel-modify-tip" id="telModifyTip"></p>
                <p class="tip-msg tipMsg"></p>
            </div>
            <div class="item">
                <label>地址<span>*</span></label>
                <select name="userAddress[province]" id="Provinces" class="select-1">
                    <option>省份/自治区</option>
                </select>
                <select name="userAddress[city]"  id="Citys" class="select-2" disabled>
                    <option>城市/地区/自治州</option>
                </select>
                <select name="userAddress[county]"  id="Countys" class="select-3" disabled>
                    <option>区/县</option>
                </select>
                <textarea   name="userAddress[street]" class="input-area" id="Street" placeholder="路名或街道地址，门牌号"></textarea>
                <p class="tip-msg tipMsg"></p>
            </div>
            <div class="item">
                <label>邮政编码<span>*</span></label> 
                <input type="text" name="userAddress[zipcode]" id="Zipcode" class="input" placeholder="邮政编码"  autocomplete='off'>
                <p class="zipcode-tip" id="zipcodeTip"></p>
                <p class="tip-msg tipMsg"></p>
            </div>
            <div class="item">
                <label>地址标签<span>*</span></label> 
                <input type="text" name="userAddress[tag]" id="Tag" class="input" placeholder='地址标签：如"家"、"公司"。限5个字内'  >
                <p class="tip-msg tipMsg"></p>
            </div>
        </div>
        <div class="ft clearfix">
            <button  type="button"  class="btn btn-lineDake btn-small " id="J_editAddrCancel">取消</button>
             <button type="button" class="btn btn-primary  btn-small " id="J_editAddrOk" onclick="saveAddress();">保存</button>
        </div>
    </div>
    <!--点击弹出新增/收货地址界面end-->
    <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"></div>
</div>                </div>
                <!-- 收货地址 END-->
                <div id="checkoutPayment">
                    <!-- 支付方式 -->
                                <div class="xm-box">
                <div class="box-hd ">
                    <h2 class="title">支付方式</h2>
                </div>
                <div class="box-bd">
                    <ul id="checkoutPaymentList" class="checkout-option-list clearfix J_optionList">
                                                <li class="item selected">
                            <input type="radio" name="Checkout[pay_id]" checked="checked" value="1">
                            <p>
                                在线支付                                <span></span>
                            </p>
                        </li>
                                            </ul>
                </div>
            </div>
            <!-- 支付方式 END-->
            <div class="xm-box">
                <div class="box-hd ">
                    <h2 class="title">配送方式</h2>
                </div>
                <div class="box-bd">
                    <ul id="checkoutShipmentList" class="checkout-option-list clearfix J_optionList">
                                                <li class="item selected">
                            <input type="radio" data-price="0" name="Checkout[shipment_id]" checked="checked" value="1">
                            <p>
                                快递配送（免运费）                                <span></span>
                            </p>
                        </li>
                                            </ul>
                </div>
            </div>
            <!-- 配送方式 END-->                    <!-- 配送方式 END-->
                </div>
                <!-- 送货时间 -->
                <div class="xm-box">
                    <div class="box-hd">
                        <h2 class="title">送货时间</h2>
                    </div>
                    <div class="box-bd" id="delivery_time">
                        <ul class="checkout-option-list clearfix J_optionList">
                                                        <li class="item selected"><input type="radio" checked="checked" name="Checkout[best_time]" value="1"><p>不限送货时间<span>周一至周日</span></p></li><li class="item "><input type="radio"  name="Checkout[best_time]" value="2"><p>工作日送货<span>周一至周五</span></p></li><li class="item "><input type="radio"  name="Checkout[best_time]" value="3"><p>双休日、假日送货<span>周六至周日</span></p></li>                        </ul>
                    </div>
                </div>
                <!-- 送货时间 END-->
                
            </div>
            <div class="checkout-box-ft">
                 <!-- 商品清单 -->
                <div id="checkoutGoodsList" class="checkout-goods-box">
                                    <div class="xm-box">
                    <div class="box-hd">
                        <h2 class="title">确认订单信息</h2>
                    </div>
                    <div class="box-bd">
                        <dl class="checkout-goods-list">
                            <dt class="clearfix">
                                <span class="col col-1">商品名称</span>
                                <span class="col col-2">购买价格</span>
                                <span class="col col-3">购买数量</span>
                                <span class="col col-4">小计（元）</span>
                            </dt>
                            <span id="sp"></span>
                <!-- 循环部分 -->                                                                                                
                                                    </dl>
                        <div class="checkout-count clearfix">
                            <div class="checkout-count-extend xm-add-buy">
                                <h3 class="title">会员留言</h2></br>
                                <input type="text" id="order_message"/>

                            </div>
                            <!-- checkout-count-extend -->
                            <div class="checkout-price">
                                <ul>

                                    <li>
                                       订单总额：<span id="tt"></span>
                                    </li>
                                    <li>
                                        活动优惠：<span>-0元</span>
                                        <script type="text/javascript">
                                            checkoutConfig.activityDiscountMoney=0;
                                            checkoutConfig.totalPrice=244.00;
                                        </script>
                                    </li>
                                    <li>
                                        运费：<span id="postageDesc">0元</span>
                                    </li>
                                </ul>
                                <p class="checkout-total">应付总额：<span><strong id="ts"></strong>元</span></p>
                            </div>
                            <!--  -->
                        </div>
                    </div>
                </div>
    
    <!--S 保障计划 产品选择弹框 -->
    
    
                </div>
                <!-- 商品清单 END -->
                <input type="hidden"  id="couponType" name="Checkout[couponsType]">
                <input type="hidden" id="couponValue" name="Checkout[couponsValue]">
                <div class="checkout-confirm">
                    
                     <a href="cart.jsp" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
                     <input type="button" class="btn btn-primary" value="立即下单" onclick="checkoutOrder();"/>
                                     </div>
            </div>
        </div>

</div>

<!-- 预售提示 S-->
    <div class="modal hide yushou-modal" id="yushouTip">
        <div class="modal-body">
            <h2>请确认收货地址及发货时间</h2>
            <ul class="list">
                <li>
                    <strong>请确认配送地址，提交后不可变更：</strong>
                    <p id="yushouAddr"> </p>
                    <span class="icon-common icon-1"></span>
                </li>
                <li>
                    <strong>支付后发货</strong>
                    <p>如您随预售商品一起购买的商品，将与预售商品一起发货</p>
                    <span class="icon-common icon-2"></span>
                </li>
                <li>
                    <strong>以支付价格为准</strong>
                    <p>如预售产品发生调价，已支付订单价格将不受影响。</p>
                    <span class="icon-common icon-3"></span>
                </li>
            </ul>
        </div>
        <div class="modal-footer">
                <span class="btn btn-lineDakeLight" data-dismiss="modal" onclick="outOrder();">返回修改地址</span>    
                <span class="btn btn-primary" id="yushouCheckout" onclick="createOrder();">继续下单</span>
                
            </div>
    </div>
<!--  预售提示 E-->

<script id="newAddrTemplate" type="text/x-dot-template">
        <dl class="item selected" data-isnew="true" data-consignee="{{=it.consignee}}" data-tel="{{=it.tel}}" data-province="{{=it.province}}" data-provincename="{{=it.provinceName}}" data-city="{{=it.city}}" data-cityname="{{=it.cityName}}" data-county="{{=it.county}}" data-countyname="{{=it.countyName}}" data-zipcode="{{=it.zipcode}}" data-street="{{=it.street}}" data-tag="{{=it.tag}}">
            <dt>
                <strong class="itemConsignee">{{=it.consignee}}</strong>
                {{? it.tag }}
                    <span  class="itemTag tag">{{=it.tag}}</span>
                {{?}}
            </dt>
            <dd>
                <p class="tel itemTel">{{=it.tel}}</p>
                <p  class="itemRegion">{{=it.provinceName}} {{=it.cityName}} {{=it.countyName}}</p>
                <p  class="itemStreet">{{=it.street}} ({{=it.zipcode}})</p>
                <span class="edit-btn J_editAddr">编辑</span>
            </dd>
        </dl>
</script>


<!-- 保险弹窗 -->
<!-- 保险弹窗 -->


        

    <script src="<%=path %>/Front/js/base.min.js"></script>

        <script type="text/javascript" src="<%=path %>/Front/js/address_all.js"></script>
<script type="text/javascript" src="<%=path %>/Front/js/checkout.min.js"></script> 
</div>
 
 <!--收货地址body部分结束-->
    
    
    
    <!-- 底部 -->
    <div class="footer_v2013 bottom-about">
        <div class="w">
			<h3><pre>©2016 果然新鲜 版权所有</pre></h3>
        </div>
    </div>
    <!-- 底部 -->
    <div class="fixed-buttons">
        <ul>
            <li><img id="imgBtn-to-top" src="<%=path %>/Front/images/back_top.png" /></li>
        </ul>
    </div>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="<%=path %>/Front/js/unslider.min.js"></script>
    <script type="text/javascript" src="<%=path %>/Front/js/index2.js"></script>
    <script type="text/javascript" src="<%=path %>/Front/js/index.js"></script>
</body>
</html>
