<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
	
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="神州租车，天天有新车，新用户得150元！全国1000+服务网点,100+车型,100%车险,无限里程!周租月租6折起,24小时服务,手续便捷,还能免费上门送取.Tel:400-616-6666">
	<meta name="keywords" content="租车,租车网,租车公司,汽车租赁">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit"><title>神州租车——全球租车领导品牌</title>

<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/divided/som/entry/service@67dd71912a.css" />
	
<style>
.close,.pc_stratum a,.pc_stratum a:hover{text-decoration:none}.businessDept,.businessMember{padding:0 10px;line-height:20px;display:inline-block;float:left;font-size:14px;font-weight:700;margin-top:27px}.orderFeeTotal{width:640px}.pc_stratum{border:2px solid #61a1df;position:absolute;margin-top:27px}.pc_stratum a{display:block;padding:8px 0;text-align:center;color:#c2c2c2;border:1px solid #fff;border-bottom:1px solid #e9f2fa;background:#fff}.pc_stratum a:hover{color:#333;border:1px solid #fdb811;background:#fff1d6}*{margin:0;padding:0}.zhezhao{display:none;background-image:url(https://image.zuchecdn.com/newversion/common/zhezhao_bg.png);position:fixed;left:0;top:0;width:100%;height:100%;opacity:.65;z-index:999}.close,.login{position:absolute}.login{width:600px;height:500px;top:50%;left:50%;background-color:#fff;display:none;margin-top:-250px;margin-left:-300px;z-index:1500}.content{margin-top:50px;color:red;line-height:200px;height:200px;text-align:center}.lg-title{width:100%;height:35px;line-height:35px;font-size:14px;color:#333;text-indent:1em;background-color:#E4E4E4}.lg-inputs{margin:30px 35px 5px;padding:5px 65px 10px 75px;line-height:40px;background-color:#fff;border-bottom:1px dotted #ccc}.lg-bottom{margin:0 20px;padding:0 80px 0 90px;line-height:40px}.lg-bottom p{margin:0 auto}.lg-bottom>li>label,.lg-inputs>li>label{font-family:MicroSoftYAHEI;display:inline-block;padding-right:5px;text-align:center;vertical-align:middle;width:72px;font-size:12px}input[type=text],input[type=password]{-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;vertical-align:middle;height:30px;line-height:30px;padding-left:5px;border:1px solid #e2e2e2}.lg-bottom li.rebwrong,.lg-inputs li.rebwrong{padding:0 0 1px 80px;line-height:0;width:220px;height:19px}.close{background:url(https://image.zuchecdn.com/newversion/common/close.png) left bottom no-repeat;width:34px;height:34px;display:block;right:0;top:0;z-index:9999}.btn_save>input{margin:8px 83px}
</style>

  </head>
  
  <body>
  
  
  <style>
.cffade{display:none;background:#000;position:fixed;left:0;top:0;z-index:1999999;width:100%;height:100%;opacity:.3;filter:alpha(opacity=30);}
.config-btn{position:absolute;top:10px;right:10px;z-index:10;display:inline-block;width:70px;height:24px;line-height:24px;background-color:#2b99ff;color:#fff;font-size:12px;border-radius:3px;cursor:pointer;}
.config-btn:hover{background-color:#609fe6;}
.configbox{display:none;width:600px;height:380px;position:absolute;z-index:2000009;top:50%;left:50%;margin-top:-190px;margin-left:-300px;background-color:#fff;}
.cftitle{position:relative;height:47px;line-height:47px;background-color:#f3f4f6;font-size:16px;color:#60606c;border-bottom:1px solid #e9ebee;}
.cftitle > span{display:block;padding-left:15px;}
.cfclose{cursor:pointer;display:inline-block;position:absolute;top:7px;right:7px;width:34px;height:34px;background:url(https://image.zuchecdn.com/newversion/common/close.png) no-repeat;z-index:2000019;}
.cflist{height:332px;overflow-y:auto;}
.cflist ul{width:560px;margin:0 auto;overflow:hidden;}
.cflist ul li{float:left;width:280px;border-bottom:1px dashed #e4e6e9;font-size:14px;height:39px;line-height:39px;color:#93939e;}
.cflist ul li span{color:#2f2f39;}
.cflist ul li b{ display:inline-block;width:20px;margin-right:5px; vertical-align:middle;}
.cflist ul li.nonebd{border-bottom:1px solid #fff;}
</style>
  <div class="cffade"></div>
<div class="configbox">
	<div class="cftitle">
		<span>
		雪佛兰科鲁兹<%-- ${ .name } --%>配置信息</span>
		<i class="cfclose"></i>
	</div>
	<div class="cflist">
		<ul>
			<li>
				<b class="zws">&nbsp;</b>座 位 数：
				<span>
						1<%-- ${ .seating } --%>
				</span>
			</li>
			<li>
				<b class="rllx">&nbsp;</b>燃料类型：
				<span>
						2<%-- ${ .fueltype } --%>
				</span>
			</li>
			<li>
				<b class="pl">&nbsp;</b>排　　量：
				<span>
					3<%-- ${ .displacement } --%>
				</span>
			</li>
			<li>
				<b class="rybh">&nbsp;</b>燃油标号：
				<span>
						4<%-- ${ .roz } --%>
				</span>
			</li>
			<li>
				<b class="yxrl">&nbsp;</b>油箱容量：
				<span>
						5<%-- ${ .fuelTank } --%>
				</span>
			</li>
			<li class="nonebd">
				<b class="gps">&nbsp;</b>GPS导航：
				<span>
						6<%-- ${ .gps } --%>
				</span>
			</li>
		</ul>
	</div>
</div>
<body class="f2f3f5">
	<input type="hidden" id="currentDateStr" name="currentDateStr" value="2017-12-20 10:05">
	<div class="orderDetails" style="width:auto;">
		
<div class="newpg-head">
	<div class="newpg-con">
		<a href="https://www.zuche.com" target="_blank" alt="神州租车" class="order-logo"></a>
		<div class="head-r">
			<div class="order-phonebox">
				<span class="phone-icon"></span>
				<div class="phone-shad">
					<img src="https://image.zuchecdn.com/newversion/news/common/zc_gaphone.png" alt="">
				</div>
			</div>
			<ul class="head-info">
				<li><a href="javascript:void(0)" id="memberName"></a></li>
				<li><a href="https://mycar.zuche.com/queryOrder/queryOrder.do">我的订单</a></li>
				<li class="nobrd"><a href="https://passport.zuche.com/memberManage/xtoploginMember.do?act=delsession">退出</a></li>
			</ul>
		</div>
	</div>
</div>		
		
			
			<div class="newpg-proce">
				<div class="newpg-con">
					<img src="https://image.zuchecdn.com/newversion/news/ordernew/order_proce.png" alt="" class="order-proce">
					<div class="car-info">
						<div class="ifl">
							<img src="https://image.zuchecdn.com/newversion/news/order/klz.jpg" alt=""  width="180" height="105">
							<div class="lin">
								<p class="lp1">雪佛兰科鲁兹<%-- ${ .name } --%></p>
								<p class="lp2">三厢/<%-- ${ .displacement } --%>自动 | 乘坐<%-- ${ .seating } --%>人</p>
								<div class="base-btn">
									<a href="javascript:void(0);" class="look-config">查看配置信息</a>
										<a href="https://order.zuche.com/order/OrderSecondControl.do" class="look-change">修改订单</a>
								</div>
							</div>
						</div>
						<ul class="ifr">
							<li class="bdr">
								<p class="le line1">
									<i class="ifr-qc"></i>
									<span>取车</span>
								</p>
								<p class="le line2">
									<i class="ifr-time"></i>
									<span>2017-12-21 10:00</span>
								</p>
								<p class="le line3">
									<i class="ifr-local"></i>
										<span>太原&nbsp;武宿机场店</span>
								</p>
							</li>
							<li>
								<p class="le line1">
									<i class="ifr-hc"></i>
									<span>还车</span>
								</p>
								<p class="le line2">
									<i class="ifr-time"></i>
									<span>2017-12-23 10:00</span>
								</p>
								<p class="le line3">
									<i class="ifr-local"></i>
										<span>太原&nbsp;武宿机场店</span>
								</p>											
							</li>
						</ul>
					</div>

						<div class="newbg-wxts">
							<i class="tan-icon"></i>
							<div class="tipdiv">
								<span class="wxleft">温馨提示：</span>
								<ul class="wxright">
											<li>还车结算时，可使用您账户中100元的新用户专享券。</li>
								</ul>
							</div>
						</div>
				</div>
			</div>
			
			<div class="newpg-conf">
				<div class="newpg-con">
					<input type="hidden" id="xmobile" name="xmobile" value='152***8554'   />

		   			
						
						
<style>.order-registerinfo li{height: 34px;}</style>
	<div class="memberInfo">
		<h3>租车人信息<span class="ifred">请认真填写一下信息，取车时需要现场核对！</span></h3>
		<ul class="h3h infoul">
			<li class="memberXname">
				<label><i>*</i>姓&emsp;&emsp;名</label>
				<input name="xname" id="xname" type="text" default-value="请输入您的姓名" value="" maxlength="50" onblur="checkMemberFormName();">
				<div class="order-errorbox order-erpos">
	                <span class="arout">◆<span class="arin">◆</span></span>
	                <span class="zc-retan"></span>
	                <i class="err-con" id="nameInfo"></i>
	                <span class="zc-close"></span>
	            </div>
			</li>
			<li>
				<label><i>*</i>证件类型</label>
				<input type="text" value="" class="downarr_ipt sz_papers zjtype" name="xcardtype" type-id="" default-value="请选择证件类型" value="" id="xcardtype" readonly="readonly">
				<div class="sz_papersTS d_none">
					<dl id="type">
						<dd data='10'>身份证</dd>
						<dd data='11'>台湾居民来往大陆通行证</dd>
						<dd data='12'>港澳居民来往内地通行证</dd>
						<dd data='13'>外籍护照</dd>
					</dl>
				</div>
				<div class="order-errorbox order-erpos">
	                <span class="arout">◆<span class="arin">◆</span></span>
	                <span class="zc-retan"></span>
	                <i class="err-con" id="xcardtypeInfo"></i>
	                <span class="zc-close"></span>
	            </div>
			</li>
			<li>
				<label><i>*</i>证件号码</label>
				<input type="text" value="请输入证件号码" name="xidentitycard" default-value="请输入证件号码" id='xidentitycard' maxlength="20">
				<div class="order-errorbox order-erpos">
	                <span class="arout">◆<span class="arin">◆</span></span>
	                <span class="zc-retan"></span>
	                <i class="err-con" id="identitycardInfo"></i>
	                <span class="zc-close"></span>
	            </div>
			</li>
				<li>
					<label><i class="none">*</i>邮&emsp;&emsp;箱</label>
					<input type="text" default-value="请输入邮箱" value="" id='memberEmail' name='xemail' onblur="checkMemberEmail();" maxlength="50" >
					<ul id="email_list" style="width: 203px;min-width:203px;z-index: 999999;">
					  <li style="width: 195px;min-width:195px;">请选择邮箱类型</li>
					  <li style="width: 195px;min-width:195px;"></li>
					  <li style="width: 195px;min-width:195px;">@sina.com</li>
					  <li style="width: 195px;min-width:195px;">@163.com</li>
					  <li style="width: 195px;min-width:195px;">@126.com</li>
					  <li style="width: 195px;min-width:195px;">@qq.com</li>
					  <li style="width: 195px;min-width:195px;">@yahoo.com.cn</li>
					  <li style="width: 195px;min-width:195px;">@gmail.com</li>
					  <li style="width: 195px;min-width:195px;">@sohu.com</li>
					  <li style="width: 195px;min-width:195px;">@hotmail.com</li>
					  <li style="width: 195px;min-width:195px;">@zuche.com</li>
					</ul>
					<div class="order-errorbox order-erpos300">
		                <span class="arout">◆<span class="arin">◆</span></span>
		                <span class="zc-retan"></span>
		                <i class="err-con" id="emailInfo"></i>
		                <span class="zc-close"></span>
		            </div>
		            <div class="zc-youhui">
		            	<i class="blue-yes curr"></i>
						<input type="checkbox" class="emailFlag" id="emailFlag" checked="checked">希望接收租车优惠信息
					</div>
				</li>
		</ul>
	</div>
	<div class="info-msg">
		<p>下单成功后，提醒信息会发送至手机 
          	<i id="mmid">152****8554<%-- ${ .phone } --%></i>
			<a href="javascript:void(0)" id="bt"  onClick="modClick('#login');">[修改]</a>
		 </p>
	</div>
						<div class="papers-tip">
					    	<p>取车时,出示以下证件的原件：本人二代身份证、本人国内有效驾驶证正副本、本人一张信用及可用额度均不低于3000元的国内有效信用卡，所有证件有效期须至少超过当次租期的两个月以上。</p>
					    </div>
						
						<div class="zhezhao" id="zhezhao"></div> 
					    <div class="modify-pass" id="login">
					        <div class="chtop">修改手机号<a class="mclose" id="btclose"></a></div>
					        <ul class="modiul">
								<li>
									<label>原手机号</label>
									<input type="text" value="" default-value="请输入原手机号" id="oldTelid" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
									<div class="order-errorboxred order-erpos">
						                <i class="err-con" id="moldTelid"></i>
						            </div>
								</li>
								<li>
									<label>新手机号</label>
									<input type="text" value="" id="newTelid" default-value="请输入新手机号" maxlength="11"  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" />
									<div class="order-errorboxred order-erpos">
						                <i class="err-con" id="mnewTelid"></i>
						            </div>
								</li>
								<li>
									<label>验证码</label> 
									<input type="text" value="" id="yzm" default-value="验证码" class="s"  onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
									<div class="yzm-pic">
										<img id="kaptchaImage" width="70" height="30"/> 
									</div>
									<span class="kanbuqing" id="changeYzmBT">看不清<br>换一张</span>
									<div class="order-errorboxred order-erpos">
						                <i class="err-con" id="myzm"></i>
						            </div>
								</li>
								<li>
									<label>手机验证码</label>
									<input type="text" value="" id="verifyid" default-value="手机验证码" class="s" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
									<input type="button" id="sendKeyid" class="getyzm" onclick="sendKey()" value="获取验证码">
									<div class="order-errorboxred order-erpos">
						                <i class="err-con" id="mverifyid"></i>
						            </div>
								</li>
								<li class="mtxt">修改成功后，请使用新手机号登录。</li>
					        </ul>   	
					        <input type="button" class="mod-save" id="saveid" value="保存" onclick="modifyTel()"/><br>      
						</div>
						
						
<style>
	.zcmficon{display:inline-block;margin-left:4px;width: 48px;height: 15px;padding-top: 16px;text-align: center;text-decoration: line-through;background-image: url(https://image.zuchecdn.com/newversion/common/yellowfree.png);background-repeat: no-repeat;clear: both;}
</style>
<div>
	<h3>费用明细</h3>
	
	<ul class="h3h feeul">
		<li>
			<span class="fee-txt">车辆租赁及门店服务费</span>
			<span class="fee-res"><i>&yen;</i>188</span>
			<span class="fee-pro">94x2</span>
			<div class="clear"></div>
		</li>
				<li style="position:relative;z-index:10;">
					<span class="fee-txt">基本保险费<i class="blue-ques">
						<div class="bx-bubble">
							<i class="litar-l"></i>
							<dl>
								<dd>必购产品：如车辆租赁期间出险，保险理赔范围内的损失，客户仅需承担1500元以内的车辆损失部分，不用承担其他损失。</dd>
								<dd>承保范围：车辆损失险（1500元以内的损失由客户方承担）；第三者责任险 20万元；车上人员责任险（驾驶员）5万元；全车盗抢险；玻璃单独爆裂险；自燃损失险。</dd>
								<dd>本服务按天计费，超时4小时以上按1天计费，超时4小时以内不另计费。 </dd>
							</dl>
						</div>
					</i></span>
					<span class="fee-res"><i>&yen;</i>80</span>
					<span class="fee-pro">40x2</span>
					<div class="clear"></div>
				</li>
		<li class="opcl">
			<span class="fee-txt">其他费用<i class="blue-downarr open"></i></span>
			<span class="fee-res"><i>&yen;</i><i id="otherPriceTotal" total="35">35</i></span>
			<span class="fee-pro">合计</span>
			<div class="clear"></div>
		</li>
		<li class="bluelist show">
			<ul class="otherul">
						<li class="serviceOption">
							<span class="fee-txt serviceName"  serviceName="不计免赔服务">不计免赔服务
	                   				<i class="blue-yes"></i>
	                   				<input type="checkbox" name="mpservice" class="oth-che unchecked radioItem" data="1900-50-0">
							</span>
							<span class="fee-res"><i>&yen;</i>
									100
							</span>
							<span class="fee-pro servicePrice" servicePrice="50">
									50x2
							</span>
								<i class="blue-ques">
									<div class="bx-bubble">
										<i class="litar-l"></i>
										<dl>
											<dd>如车辆租赁期间出险，客户无需承担保险理赔范围内的任何损失,以及轮胎损失。<br/>本服务按天计费，超时4小时以上按1天计费，超时4小时以内不另计费。</dd>
										</dl>
									</div>
								</i>
						</li>
					
							<li class="discount defaultFeeItem2000">
								<span class="fee-txt">手续费</span>
								<span class="fee-res"><i>&yen;</i>35</span>
								<div class="clear"></div>
							</li>
			</ul>
		</li>
		
	</ul>
		<ul class="h3h feeul">
		<li class="js_total_amount">
			<span class="fee-txt">基本费用合计</span>
			<span class="fee-res"><i>¥</i><i class="orderTotalPrice" style="font-size:24px;">303</i></span>
			<div class="clear"></div>
		</li>
		<li class="service_zhye">
			<label class="fee-txt serviceName">优先使用账户余额/储值卡/积分支付
       				<i class="blue-yes giftSelect curr"></i>
       				<input type="checkbox" name="mpservice" class="oth-che radiofirstItem" data="" checked="checked" >
			</label>
			<i class="blue-ques">
				<div class="bx-bubble">
					<i class="litar-l"></i>
					<dl>
						<dd>系统将自动使用您的账户余额，本人名下储值卡、本人可用积分抵扣租金。</dd>
					</dl>
				</div>
			</i>
			<div class="clear"></div>
		</li>
	</ul>
	
	
</div>

<div>
		<h3>发票类型</h3>
	<ul class="h3h btnul-invoice">
      	<li>
      		<label class="curr">
		      	
				<input type="radio" name="feetype" class="pay-radio need-recepit" checked="checked">
				<span>不开发票</span>
			</label>
		</li>
		<li>
			<label>
				
				<input type="radio" name="feetype" class="pay-radio need-recepit yes">
				<span>需要发票</span>
			</label>
		</li>
	</ul>
	<div class="invoice_titleinfo_wrap">
		<b class="tts"></b>
		<a href="javascript:;"  id="modify-invoice">[修改]</a>
	</div>

	
</div>
<input type="hidden" name="orderPrice" id="orderPrice" value="303"/>						
						
						
	<div class="gopay orderFeeTotal">
	    <div class="paydetail">
			<span class="ddzj">订单总价</span>
			<span class="ddall"><i>&yen;</i><i class="orderTotalPrice all">303</i></span>
		</div>
	  	<input type="submit" id="monitor_fourth_next" class="gopay-blue">提交订单</a>
	</div>
						
				</div>
			</div>
		<div class="newpg-tggz">
			<div class="newpg-con">
				<div class="top">退改规则</div>
				<dl>
							<dd>订单修改或取消：<br/>&nbsp;&nbsp;a)取车时间距当前时间≥2个工作小时，请提前致电400 616 6666：取车时间在门店的营业时间内，请提前2小时申请；取车时间在门店营业时间之外，请您尽早致电申请。<br/>&nbsp;&nbsp;b)取车时间距当前时间＜2个工作小时，不接受修改。</dd>
					<dd>（小贴士：如果您修改订单或取消订单重新预订，价格可能会发生变化。）</dd>
					<br><br>
							<dd>驾照认证授权：取车前，您可以通过租车APP、神州租车官网等网络渠道自行认证驾照，或到门店由工作人员协助认证驾照。您的驾照信息仅作为身份和驾驶资格认证。</dd>
				</dl>
			</div>
		</div>
		
	</div>
	<input type="hidden" name="rentDay" id="rentDay" value="2"/>
	<input type="hidden" name="orderType" id="orderType" value="1"/>
	<input type="hidden" name="selectedAdditionService" id="selectedAdditionService"/>
	<input type="hidden" name="selectedActivityCode" id="selectedActivityCode" value=""/>
	<input type="hidden" name="isTicket" id="isTicket" value="0"/>
	<input type="hidden"  id="chooseReceiptId" name="chooseReceiptId" value=''/>
	<input type="hidden"  id="isPersonal" name="isPersonal" value="1"/>
	<input type="hidden" id="memberId" name="member_id" value="21116958" />
	<input type="hidden" id="memberLevelVal" name="member_levelVal" value="1" />
	<input type="hidden" id="fromStoreChainFlag" name="fromStoreChainFlag" value="0" />
	<input type="hidden" id="payModeFlag" name="payModeFlag" value="" />
	<input type="hidden" id="applyStatusFlag" name="applyStatusFlag" value="" />
	<input type="hidden" id="applyStatusValue" name="applyStatusValue" value="" />
	<input type="hidden" id="payModeValue" name="payModeValue" value="1" />
	<input type="hidden" id="_form_uniq_id" name="_form_uniq_id" value="zGBegdfT0OKozhtPbBT8LjDtmxQkqFgk" />
	<input type="hidden" id="customerId" value=""/>
	<input type="hidden" id="isSendMoney" value="0"/>
	<input type="hidden" id='xlevel' name = 'xlevel' value="">
	<input type="hidden" id='showTotalPrice' name ='showTotalPrice' value="303"> 

	<input type="hidden" id="fromStoreName" name="fromStoreName" value="武宿机场店" />
	<input type="hidden" id="checkLevelPay" name="checkLevelPay" value="0" />
	<input type="hidden" id="fromCityId" name="fromCityId" value="30" />
	<input type="hidden" id="vehicleLevel" name="vehicleLevel" value="3" />
	<input type="hidden" id="currentDate" name="currentDate" value="2017-12-20" />
	<form id="orderForm" name="orderForm" method="post" action="">
		<input type="hidden" name="memberState" id="memberState" value="8"/>
		<input type="hidden" name="credit" id="credit" value="0"/>
		<input type="hidden" name="identitycloseday" id="identitycloseday" value=""/>
		<input type="hidden" name="identityCardType" id="identityCardType" value=""/>
		<input type="hidden" name="payType" id="payType" />
		<input type="hidden" name="payChannel" id="payChannel" value="0"/>
		<input type="hidden" value="shortRent" id="shortColor" name="shortColor"/>
		<input type="hidden" id='integral' name = 'integral' value="30">
		<input type="hidden" id='isAdminPay' name = 'isAdminPay' value="false">
	</form>
<div id="dialogLogin" class="d_none popup_block" mask-data="#?w=328" style="font-size: 1em;height:285px;">
	<div class="login_info" style="height:285px;">
	    <h2>欢迎登录</h2>
	    <ul>
	        <li>
	            <label>&nbsp;账&nbsp;号 </label>
	            <label><input name="loginName" id="loginName" value="15203438554" default-value='手机号/证件号' type="text" class="w220 t_val"></label>
	        </li>
	        <li>
	            <label>&nbsp;密&nbsp;码 </label>
	            <label>
	            	<input type="password" onblur="passwordBlur()" name="loginPassword" id="loginPassword" value="" type="text" class="w220 t_val" style="display: none;"><input  type="text" onfocus="textFocus()" value="请输入密码" class="w220" id="passwordtext">
	            </label>
	        </li>
	       	<li id="imageYzmLi" style="display:none">
	            <label>&nbsp;验证码 </label>
	            <label><input name="yzmVal" id="yzmVal" value='请输入右侧验证码' type="text" class="w220 t_val" style="width:105px" maxlength="6"></label>
	            <span class="pic-yzm fr"><img id="yzmImg" src="" width="108px" height="31px"></span>
	        </li>
	    </ul>
	    <div class="loginbut">
	        <div class="red f12 rebwrong_icon loginMsg">
	        </div>
	        <div class="pt20"><input onclick="gotologin()" type="button" value="登 录" class="btn_bluewauto loginipt" ></div>
	        <div class="pt10">
	            <input name="readpwd" id="readpwd" type="checkbox" value="1" onclick="setRemberPasswordState(this.checked)"  /> 自动登录         
	             | &nbsp;<a href="https://passport.zuche.com/member/loginandregist/getpassword.do">忘记密码？</a>
	             | &nbsp;<a href="javascript:register()" class="reg">免费注册</a>
	        </div>
	    </div>
	</div>
</div><div class="sz_footer">
	<p>
		<a title="关于我们" href="https://huodong.zuche.com/gywm/">关于我们</a>
		|&nbsp;<a title="投资者关系" target="_blank" href="https://ir.zuche.com">投资者关系</a>
		|&nbsp;<a rel="nofollow" target="_parent" title="新闻中心" href="https://news.zuche.com/">新闻中心</a>
		|&nbsp;<a title="加盟合作" target="_blank" href="https://jiameng.zuche.com">加盟合作</a>
		|&nbsp;<a title="隐私保护" target="_parent" href="https://huodong.zuche.com/ysbh/">隐私保护</a>
		|&nbsp;<a title="网站导航" target="_parent" href="https://help.zuche.com/sitemap/">网站导航</a>
		|&nbsp;<a title="联系我们" target="_parent" href="https://huodong.zuche.com/lxwm/">联系我们</a>
		|&nbsp;<a title="招贤纳士" target="_blank" href="http://hr.zuche.com/">招贤纳士</a>
	</p>
	<p class="p10">
		<a target="_blank" href="https://ss.knet.cn/verifyseal.dll?sn=2011091400100014977&amp;ct=df&amp;pa=294005" tabindex="-1" id="urlknet" class="sz_k">&nbsp;</a>
		<a target="_blank" id="___szfw_logo___" href="https://search.szfw.org/cert/l/CX20121016001772002081" title="诚信网站" class="sz_c">&nbsp;</a>
	</p>
	<p>Copyright©2008-2017 www.zuche.com All Rights Reserved. </p>
	<p>如果您对神州租车网站有任何意见,欢迎发送邮件到 web@zuche.com </p>
	<p>北京神州汽车租赁有限公司 京ICP备10005002号&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;京公网安备号 11010502026705</p>
</div>
  
  <script type="text/javascript">
	var carwrmURL='https://static.zuchecdn.com';
	var carwrmjsURL = 'https://js.zuchecdn.com';
	var carwrmimageURL = 'https://image.zuchecdn.com';
	var carwrmcssURL = 'https://css.zuchecdn.com';
	var carwlomURL = "https://changzu.zuche.com";
	var carwcmsURL='https://huodong.zuche.com';
	var carwdmURL = "https://service.zuche.com";
	var carwepmURL='https://carbusiness.zuche.com';
	var carwlmURL='https://passport.zuche.com';
	var carwmmURL = "https://mycar.zuche.com";
	var carwsomURL='https://www.zuche.com';
	var enURL='https://en.zuche.com';
	var orderURL='https://order.zuche.com';
	var leasingURL='https://leasing.zuche.com';
	var easyrideURL='https://easyride.zuche.com';
	var serviceURL='https://service.zuche.com';
	var carbusinessURL='';
	var driverURL='';
	var protocol='https://';
	var protocoldm='https://';
</script>
<script type="text/javascript" src="https://js.zuchecdn.com/divided/som/public/lib/sea/sea@68b90934d7.js"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/divided/som/public/lib/sea/plugin/seajs-preload@11b2cc155e.js"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/divided/som/seaconfig@c8a261554c.js"></script>
<!--[if lte IE 7]>
<script type="text/javascript" src="https://js.zuchecdn.com/js/divided/som/public/utils/json2@d223decfdb.js"></script>
<![endif]-->
<script type="text/javascript" >
	seajs.use(['divided/som/entry/jQ@a576d97fa6'],function(){
	    seajs.use([
			'divided/som/entry/lib@0e5c12d914',
			'divided/som/entry/common@e3fcd2ad84'
		]);
    });
</script>
	<script type="text/javascript">
		var isTicket = '0';
		var ticketId = '';
		var ticketAddressId = '';
		var ticketEmailId = '';
		var invoiceType='';
		var receiptAddress = '我们将邮寄发票到您所填写的地址';
		var saveTicket = 0;
		var receiptJsonList = '';
		var businessReceiptJson = '';
		var chooseId='';
		var isPersonal='1';
		var orderId='';
		var mobile='15203438554';
		var process='';
		var spdbactivity = '';
		var spdpayless = '';
		var yuebingtip = '';

		seajs.use(['divided/som/entry/jQ@a576d97fa6','divided/som/entry/lib@0e5c12d914'],function(){
			seajs.use('divided/som/entry/serviceEntry@41c657b350');
		});
	</script>
  
  </body>
</html>
