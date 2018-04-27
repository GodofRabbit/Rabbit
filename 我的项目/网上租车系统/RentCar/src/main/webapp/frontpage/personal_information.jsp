<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>神州租车——全球租车领导品牌</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="租车,租车网,租车公司,汽车租赁">
    <meta name="description" content="神州租车，天天有新车，新用户得150元！全国1000+服务网点,100+车型,100%车险,无限里程!周租月租6折起,24小时服务,手续便捷,还能免费上门送取.Tel:400-616-6666">
<!-- 新版所用css文件 -->
<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/divided/mm/entry/main@6c6b12e1fd.css" />	
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="../js/personal_information.js"></script>

<style type="text/css">
	.zc_fontbox_bd{min-height: 603px;padding: 0px 30px 60px 30px;position: relative;background-color: #fff;-webkit-box-shadow: 0 0 5px rgba(228, 230, 233, 1);-moz-box-shadow: 0 0 5px rgba(228, 230, 233, 1);box-shadow: 0 0 5px rgba(228, 230, 233, 1);}
	.zc_fontbox_bd h2{text-align:center;line-height:80px;font-size: 18px;color: #60606c;font-weight: normal;border-bottom:1px solid #e9ebee;}
	.zc_fontbox_bd h3{font-size:16px;color: #60606c;font-weight: normal;padding-top:30px;line-height:32px;}
	.zc_fontbox_bd p{font-size:12px;color:#93939e;line-height:24px;}
	.zc_fontbox_bd p b{display:block;font-weight:normal;font-size:14px;color: #60606c;line-height:30px;}
</style>

<script type="text/javascript">

// 	var user_id = "${cookie.user_id.value}";

	$(function(){
		
		//进入自驾订单页面
		$("#orderTitle,#top_order").click(to_order);
		
		//进入我的积分页面
		$("#leftAssertCount1,#top_assert,#rentcoinNum1").click(to_bonus_points);
		
		//进入优惠券页面
		$("#leftAssertCount2,#couponNum1").click(to_coupon);
		
		//我的信息
		$("#left_my_information,#top_account").click(to_information);
		
		//我的等级
		$("#left_my_rank,#showLevelDesc1,#showNumber41,#mm_jb1,#showNumber31").click(to_rank);
		
		//登录密码
		$("#left_my_password").click(to_password);
		
		//会员章程
		$("#left_member_rules").click(to_rules);
		
		//会员细则
		$("#left_member_bylaws").click(to_bylaws);
	});
	
	function to_jsp(){
	var user_id = "${cookie.user_id.value}";
	$.ajax({
		url:"http://localhost:8080/RentCar/getInformation.do",
		data:{user_id:user_id},
		type:"post",
		resultType:"json",
		success:function(result){
//			$("#jsp_name").html(result.data.realname);
			$("#topLoginName").text("你好，"+result.data.username);
		}
	});
	to_order();
}
</script>
</head>
<body class="bodycolor zc_cft" onload="to_jsp();">
<!--head start -->

<input type = "hidden" id="mebId" value = '21116296'> 

<form action="https://passport.zuche.com/memberManage/xtoploginMember.do" id="loginTopForm" target="_parent" method="post">
	<input type="hidden" id="act" name="act" value="loginSys"/>
	<input type="hidden" id="historyLocation" name="historyLocation" />
</form>
<div class="zc_head_bd">
    <div class="zc_main">
        <a href="<%=path %>/index.jsp" class="zc_logo" alt="神州租车"></a>
        <ul class="zc_menu">
            <li><a href="<%=path %>/index.jsp">首页</a></li>
           	<li><a href="https://order.zuche.com/smfw/index.do?flag=1">上门取送</a></li>
            <li><a href="https://order.zuche.com/smfw/index.do?flag=2">到店取还</a></li>
            <li><a href="https://changzu.zuche.com">长租</a></li>
            <li><a href="https://carbusiness.zuche.com">企业租车</a></li>
            <li><a href="https://easyride.zuche.com">顺风车</a></li>
            <li><a href="https://service.zuche.com">门店</a></li>
            <li><a href="https://huodong.zuche.com">活动</a></li>
            <li><a href="https://international.zuche.com">国际租车</a></li>
        </ul>
          <div class="zcindex_login" >
            <div class="wdl" id="notLogin">
            <c:if test="${empty cookie.user_id.value }">
                <a href="<%=path%>/frontpage/login.jsp" class="colfabe00" id="loginBT" >登录</a>
                <b>/</b>
                <a href="<%=path%>/frontpage/register.jsp" class="colfabe00" >注册</a>
                
            </c:if>
            </div>
             <c:if test="${not empty cookie.user_id.value }"> 
            <div class="ydl"  style="display: block;" >
                 <h1 id="topLoginName"></h1>
                <div class="zc_index_my">
                    <a href="" class="top">我的神州<i class="zc_ordown"></i></a>
                    <div class="contmyszlist">
                        <div class="p-re">
                            <span class="y">◆</span>
                            <a href="<%=path %>/frontpage/personal_information.jsp">我的订单</a>
                            <a href="<%=path %>/frontpage/personal_information.jsp">我的资产</a>
                            <a href="<%=path %>/frontpage/personal_information.jsp">我的账户</a>
                            <a href="<%=path %>/logout.do" >退出登录</a>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
             </c:if> 
        </div>
        <div class="zc_phone_bd">
            <div class="p-re zc_p_h">
                <span class="zc-tel"></span>
                <div class="zc_ga_phonebox"><img src="https://image.zuchecdn.com/newversion/news/common/zc_gaphone.png" alt="港澳台及海外电话861058209555"></div>
            </div>
        </div>
    </div>
</div><!--head end -->
<!--myhead start -->

<input type="hidden" value="2" id="isBusinessMemberInfo">
<div class="zc_myhead">
    <div class="zc_main">
        <div class="fl my_weather">
            <h2><i class="sssd"></i></h2>
<!--             <div class="weatherinfo"> -->
<!--             	<ul id="weathermobile"></ul> -->
<!--             </div> -->
        </div>
        <div class="fl my_member">
				<div class="mm_hpicon" id="hpicon">
	                    <i class="ordinary_m_icon"></i>
	            </div>
            	<p>
					<span class="mm_name" id="jsp_name">
					</span>&#12288;
	                <span class="mm_jb" id="mm_jb1">普通卡</span>
            	</p>
					<a href="https://mycar.zuche.com/member/getMemberLevel.do">
					<div class="progressbar">
						<div class="wbg"></div>
						<div class="number">
				           	<span id="showNumber1">0</span>/<span id="showNumber2">50</span>
						</div>
					</div>
					</a>
					<input type="hidden" id="percent" value="0"/>
					<input type="hidden" id="couponred" value="true"/>
					
						<div class="fs">我的累计积分: <span class="cor pointer" id="showNumber31" >0</span>，
							<span class="cor pointer" id="showNumber41">+50</span>就能成为
							<span class="cbl pointer" id="showLevelDesc1">银卡</span>会员！</div>
		</div>
        <div class="fl my_infor">
                <ul class="privateinvestor">
                    <li id="rentcoinNum1">
                        <a  class="gojf">
                            <b id="point">0<em> 分</em></b>
                        </a>
                        <span>
	                        	<a >可用积分</a>
	                        	<i id="rentcoinRedPoint"></i>
<!-- 	                        	<div class="integral-sc"> -->
<!-- 	                        		<img src="https://image.zuchecdn.com/newversion/news/common/integralsc.png"> -->
<!-- 	                        		<i><a href="https://mycar.zuche.com/scoreshop/getGoodsList.do" class="or">积分换专车券</a></i> -->
<!-- 	                        	</div> -->
	                        </span>
                    </li>
                    <li id="couponNum1">
                        <a  class="goyhq">
                            <b id="couponCount">1<em> 张</em></b>
                            <span>优惠券<i id="couponRedPoint"></i></span>
                        </a>
                    </li>
                    
                    
                </ul>
        </div>
        <div class="clear"></div>
    </div>
</div><!--myhead end -->
<!--my main start -->
<div class="zc_main zc_mycon">

<div class="zc_myleft fl">
        <dl class="meberlist">
          <dt>我的订单</dt>
          <dd id="orderTitle"><a href="javascript:void(0);" >自驾订单
              <span id="leftOrderCount1">(0)</span></a></dd>
      </dl>
      <dl class="meberlist" id="assertTitle">
          <dt id="assertTitle">我的资产</dt>
          <dd><a id="leftAssertCount1">我的积分<span >(0分)</span></a></dd>
          <dd><a id="leftAssertCount2">优惠券<span >(1张)</span></a></dd>
      </dl>
      <dl class="meberlist" id="accountTitle">
          <dt id="accountTitle">我的账户</dt>
            <dd class="ma1"><a id="left_my_information">我的信息</a></dd>
               <dd class="ma5"><a id="left_my_rank">我的等级</a></dd>
            <dd class="ma6"><a id="left_my_password">登录密码</a></dd>
      </dl>
      <dl class="meberlist">
          <dt>会员条款</dt>
          <dd id="mebnotcTitle"><a id="left_member_rules">会员章程</a></dd>
          <dd id="mebruleTitle"><a id="left_member_bylaws">会员细则</a></dd>
      </dl>
</div>    
<!-- 右边的框开始 -->
		<div class="zc_myright fr" >


<!-- 我的订单开始 -->
    	<!-- 订单列表开始了 -->
    	<div  id="orderlist_rent_car" style="display: none">
        <div class="orderlist_bd" >
            <h2>
                    自驾订单
            </h2>
            <div class="zc_query-condition_bd">
                <div class="zc_box">
<!--                     <div class="fr" id="timeClear" style="display:none"><input type="button" value="清除" class="zc_blue_sub"></div> -->
<!--                     <div class="fr pl15"><input id="searchBtn" type="button" value="查询" class="zc_gray_sub" style="width:86px;min-width:auto;"></div> -->
                    <div class="fr">-</div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="h20"></div>
            <div class="subbox_m"></div>
            <div class="subbox">
                <a  class="cura" href="javascript:void(0);" status='0'>全部</a>
                <a   href="javascript:void(0);" status='1'>处理中</a>
                <a   href="javascript:void(0);" status='4'>等待付款
                <i class="zc_newsinfo" style="display:none"></i></a>
                <a   href="javascript:void(0);" status='2'>预订成功</a>
                <a   href="javascript:void(0);" status='5'>租赁中</a>
                <a   href="javascript:void(0);" status='6'>已完成</a>
                <a   href="javascript:void(0);" status='7'>已取消</a>
                <div class="clear"></div>
            </div>
            <div class="zc_myorder_info">
                    <div class="zc_notinfo_bd">
                        <img src="https://image.zuchecdn.com/newversion/news/common/grayben.png" width="120" height="120">
                        <p>还没租过车？  速速来体验吧</p>
                        <a  href="https://order.zuche.com" class="zc_orange_sub">立即租车</a>
                    </div>
                    <div style="background: #F5F5F5;" id="zc_horder">
                    	<table id="allorder">
                    	
                    	
                    	
                    </table>
                    	
                    </div>
            </div>
            <div class="sz_page_box">
                <div class="sz_page">
                    <!--分页开始 -->
<div class="sz_page">
    </div>  					<!--分页结束 -->
                </div>
            </div>
        </div>
        <div class="orderstate_bd">
            <h3>订单状态说明</h3>
            <ul>
                <li>
                    <span class="s-green">预订成功</span>
                    <p>订单已确认，尚未提车</p>
                </li>
                <li>
                    <span class="s-orange">等待付款</span>
                    <p>订单尚未付款，请在1小时内完成支付</p>
                </li>
                <li>
                    <span class="s-blue">处理中</span>
                    <p>您的订单已提交，正在处理中</p>
                </li>
                <li>
                    <span class="s-blue">租赁中</span>
                    <p>车辆正在租赁过程中</p>
                </li>
                <li>
                    <span class="s-orange">待评价</span>
                    <p>订单完成48小时内，可对我们做出评价</p>
                </li>
                <li>
                    <span class="s-yellow">已完成</span>
                    <p>已还车，订单结算完毕</p>
                </li>
                <li>
                    <span class="s-gray">已取消</span>
                    <p>订单已经取消</p>
                </li>
            </ul>
        </div>
        <div class="notice_bd">
            <h3>注意事项</h3>
            <p>1. 修改或取消订单，请您尽早致电400 616 6666申请，送车上门或服务点订单请至少在我们的工作时间内（08:00-20:00）提前2小时修改；</p>
            <p>2. 预付订单，逾时不履行或取消的，退还您预付款中的基本保险、手续费及可选服务费款项，已付费用将作为违约金恕不退还；</p>
            <p>3. 系统将为您保留一年之内的订单，如需查询更早的订单，请致电24小时热线。</p>
        </div>
        </div>
<!-- 我的订单结束 -->   
        
        
        
<!-- 我的资产开始 --> 
<!-- 我的积分开始 -->
		<div id="my_bonus_points" style="display: none">
		<div class="zc_myassets_bd" >
			
		    <div class="h2">
			    <div class="fl">
			    	<span class="title">我的积分</span>
			        <span class="titletwo"><em class="orff8650">0分</em></span>
			        
			    </div>
			    <div class="fr">   
			        <span class="menu_regulation">
			            <a class="clickpdf" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz15" target="_blank">查看积分说明及用途</a>
			        </span>
			    </div>
			    <div class="clear" style="height:0px;line-height:0px;font-size:0px;"></div>
		    </div>
		    <div class="h20"></div>
		    <div class="zc_remind">
		    	<span class="trumpeticon fl"></span>
            	<span class="remind-txt fr">2016年5月26日起，新积分取代神州币，您的神州币已经转换为等价值的新可用积分，冲抵租车消费或兑换礼品更灵活，转换详情可查看积分获取记录。</span>
		    </div>
		    <div class="p-re my_kyjfinfo">
		    	积分变更明细
                <div class="zc_query-condition_bd" style="top:11px;">
	                <div class="zc_box" style="padding-right:10px;">
	                    <div class="fr" id="timeClear" style="display:none"><input type="button" value="清除" class="zc_blue_sub"></div>
	                    <div class="fr pl15"><input id="searchBtn" type="button" value="查询" class="zc_gray_sub" style="width:86px;min-width:auto;"></div>
	                    <div class="fr">-</div>
	                    <div class="clear"></div>
	                </div>
	            </div>
		    </div>
                <div class="zc_notinfo_bd">
                    <img src="https://image.zuchecdn.com/newversion/news/common/grayintegral.png" width="120" height="120">
                    <p>会员积分不能再低啦，多多租车就能翻身！</p>
                    <a href="https://order.zuche.com" target="_blank" class="zc_orange_sub">立即租车</a>
                </div>

		    <div><a href="https://mycar.zuche.com/scoreshop/getGoodsList.do"><img src="https://image.zuchecdn.com/newversion/news/common/conversionzczcq.jpg" width="860" height="90"></a></div>
		    <div class="h20"></div>
		</div>
		</div>
<!-- 我的积分结束 -->
<!-- 优惠券开始 -->
		<div id="my_coupon" style="display: none">
			<div class="zc_myassets_bd" >
			<div class="h2">
			   <span class="title">我的优惠券</span>
			   <div class="clear"></div>
			</div>
			<div class="zc_query-condition_bd">
			   <form action="" method="post" name="queryForm" id="queryForm">
			   <div class="couponsubbox">
				   <a class="cura" href="javascript:void(0);"  id="coupon_0" value="0">全部</a>
				   <a href="javascript:void(0);"  id="coupon_1" value="1" >未使用</a>
				   <a href="javascript:void(0);"  id="coupon_2" value="2">已使用</a>
				   <a href="javascript:void(0);"  id="coupon_3" value="3">已过期</a>
				   <div class="clear"></div>
			   </div>
			   </form>
			</div>
			<div class="h20"></div>
				<div class="zc_query-condition_list p-re">
					<ul style="width:882px;">
							<li
								class="coupon-ok"
															
							>
							<div class="amount"
								>
										<span class="moneyamount"><em>¥</em>100</span>
								<div class="logo"></div>
								<div class="state"></div>
							</div>

							<div class="time"  >
							<i class="zc_time_icon"></i>&#12288;有效期 : 2017.12.19-2018.06.17
								<div class="gbyhqexplain">
									<div class="p-re">
										<a href="javascript:void(0);" class="adow">详细说明<i class=""></i></a>
									</div>
								</div>
							</div>
								<div class="i-e-info">
									<div class="p-re">
										<div class="h3">详细说明 </div>
										<a href="javascript:void(0);" class="close"></a>
										<div class="f12">
												<b>新用户专享券</b>
												<b>使用时间</b>2016年4月1日-2018年1月31日期间注册的客户,注册日起6个月内首次租车并还车结算有效;
												<b>使用规则</b>1.实际租期2天及以上的订单可用，优惠券平日、周末、法定节假日均可使用;<br>2.不与顺风车、预付特价、其他优惠活动、优惠类电子券同享;<br>3.此优惠仅限每人享受1次,每单限用1张，限本人使用;<br>4.代金券不可转让、不开发票、不找零、不兑换现金；
												<b>使用范围</b>全国各城市直营门店、不限制车型;
										</div>
									</div>
								</div>
							</li>
					</ul>
				<div class="clear"></div>
			</div>
			   <div class="sz_page_box" style="margin-top: -20px;">
			   <div class="sz_page_box">
					<!--分页开始 -->
						<div class="sz_page">
						                <a href="/queryCoupon/queryCoupon.do?page=1"
						             class="on" >1
						            </a>
						</div>					
					<!--分页结束 -->
			   </div>
		    </div>
		</div>
			
		</div>
	<!-- 优惠券结束 -->
<!-- 我的资产结束 --> 

<!-- 我的账户开始 -->
	<!-- 我的信息开始 -->
		<div id="my_information" style="display: none">
			<div class="zc_ipttitle_bd zc_coltdinfo" >
            <h2>我的信息</h2>
            <div id="originalDiv">
                <ul>
                    <li>
                    	<div class="p-re" id="errorTip1" style="z-index:20"></div>
                    	<div class="p-re" id="verifyCardErrorTip" style="z-index:20"></div>
                        <label class="fl">姓名</label>
                        <span class="fl">
                            <input type="hidden" id="isModifyMemName" value="1"/>
                            <input class="zc-ipt" type="text" id='memberNameInput'  maxlength="30" value="张鑫" />
                        </span>
                        <div class="fr">真实姓名，方便租车时核对身份</div>
                        <div class="clear"></div>
                    </li>
                    <!-- 证件号输入后 -->
                        <!-- 证件号输入前 -->
                        <li class="cards_info_be">
                            <label class="fl">证件</label>
                            <span class="fl">
                                <select class="w320selectipt" id="cardTypeSelect" type-id="">
                                    <option data=''>请选择证件类型</option>
                                    <option data='10'>身份证</option>
                                    <option data='11'>台湾居民来往大陆通行证</option>
                                    <option data='12'>港澳居民来往大陆通行证</option>
                                    <option data='13'>外籍护照</option>
                                </select>

                                <input type="hidden" id="isModifyIDcard" value="1"/>
                                <input class="zc-ipt" id="identityCard" type="text" value="输入证件号码" maxlength="20">
                            </span>
                            <div class="fr">有效证件，方便租车时核对身份</div>
                            <div class="clear"></div>
                        </li>
                    <li>
                        <label class="fl">手机号码</label>
                        <span class="fl fc_c6" id="xmobile">178****7149</span>
                        <div class="fr" id="modifyToggle" ><a href="javascript:void(0)">修改</a></div>
                        <div class="clear"></div>
                    </li>
                    <li class="modify_no" id="modifyDiv" style="display:none">
                    	<div class="p-re" id="errorTip2" style="z-index:20"></div>
                        <label class="fl">手机号码</label>
                        <span class="fl">
                            <input type="hidden" id="modifyMobileFlag" value="1" >  
                            <input class="zc-ipt p-re old_telno" type="text" id="oldTelid" value="原手机号">
                            <input class="zc-ipt p-re old_telno" type="hidden" id="oldTelidHidden">
                            <input class="zc-ipt p-re new_telno" type="text" id="newTelid" value="新手机号">
                            <input class="zc-ipt p-re new_telno" type="hidden" id="newTelidHidden">
                            <div class="dy_code">
                                <a href="javascript:void(0)" class="get_code" id="getYzmBtn" >获取手机动态码</a>
                                <input class="zc-ipt" type="text" id="validateCode" value="手机动态码" style="width:170px;" maxlength="6">
                            </div>
                        </span>
                        <div class="clear"></div>
                    </li>
                    <li>
                    	<div class="p-re" id="errorTip3" style="z-index:20"></div>
                        <label class="fl">电子邮箱</label>
                        <span class="fl">

                            <input class="zc-ipt" type="text" id="xemail" value="输入常用邮箱" maxlength="50"/>
                            <input type="hidden" id="originEmail" value='' />
                        </span>
                            <div class="fr" id="yzemail"><a href="javascript:void(0)">验证</a></div>
                        <div class="clear"></div>
                    </li>
                </ul>
                <div class="graybutbox">
                    <a href="javascript:void(0);" class="zc_orange_bigsub" id="zcsave">保存</a>
                </div>
                <div class="h20"></div>
              
		</div>
		<div class="zc_mysucceed_bd" id="modifySuccess" style="display:none">
            <p class="rok-lcongra pb0"><span class="zc-gryes"></span>您已经成功修改个人信息，请妥善保管</p>
            <p class="ac gray16">如需任何帮助，欢迎致电神州租车24小时全国客服中心 400-616-6666.</p>
            <p class="ac"><a class="zc_orange_bigsub" href="https://mycar.zuche.com/member/person/personinfo.do">返回</a></p>
        </div>
      </div>
			
		</div>
	<!-- 我的信息结束 -->
	
	
	<!-- 我的等级开始 -->
		<div id="my_rank" style="display: none">
			<div class="zc_myassets_bd" name="mdszb" id="mdszb">
            <div class="h2">
                <span class="title">会员等级</span>
                <span class="titlef12">会员成长体系包含5个会员等级，会员等级由“<sapn class="orff8650">累计积分</sapn>”决定，累计积分越高，会员等级越高。</span>
                <div class="clear"></div>
            </div>
            <div class="h20"></div>
            <div>
                <div class="tabsubbox_m"></div>
                <ul class="tabsubbox">
                    <li class="cur" onclick="window.location.href='https://mycar.zuche.com/member/getMemberLevel.do'">我的等级</li>
                </ul>
                <div class="tabsubContents cur">
                    <div class="hierarchy-show">
                        <div class="cardbox">
                                <span class="ordinary_card"><i class="tel"></i></span>
                        </div>
                        <div class="progressbar">
                            <div class="bar">
                                <div class="graybg"></div>
                                <div class="bbox p-re fl">
                                    <div class="orw fl"></div>
                                    <div class="fl kwbox"></div>
                                    <div class="number">
                                        <div class="x">
							           		<p>0/50</p>
                                            <input type="hidden" id="percent" value="0"/>
                                            <div class="z">◆</div>
                                            <div class="y">◆</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="img"></div>
                            </div>
                            <ul>
                                            <li class="first">普卡<br>0</li>
                                            <li>银卡<br>50</li>
                                            <li>金卡<br>150</li>
                                            <li>白金卡<br>450</li>
                                            <li class="last">钻石卡<br>1000</li>
                            </ul>
                        </div>
                        <div class="explain">
                            <h3>会员分级</h3>
                            <p>神州租车会员级别分为5个等级，分别为：普卡会员、银卡会员、金卡会员、白金卡会员、钻石卡会员。会员级别的调整均由神州租车根据会员累计积分自动处理，无需会员申请。</p>
                            <p>会员级别由累计积分决定，累计积分越高会员等级越高，享受到的会员权益越大。 <a href="#wljjf">什么是累计积分？</a></p>
                            <h4>会员级别规则如下：</h4>
                            <table width="100%" border="0" class="wztable">
                                <tr>
                                    <th width="105">项目</th>
                                    <th width="105">普卡会员</th>
                                    <th width="140">银卡会员</th>
                                    <th width="140">金卡会员</th>
                                    <th width="140">白金卡会员</th>
                                    <th>钻石卡会员</th>
                                </tr>
                                <tr>
                                    <td class="gray">加入方式</td>
                                    <td>免费加入</td>
                                    <td colspan="4">累计积分升级</td>
                                </tr>
                                <tr>
                                    <td class="gray">有效期</td>
                                    <td>永久</td>
                                    <td>自定级之日起1年有效，有效期结束后扣除30累计积分，根据剩余累计积分重新定级</td>
                                    <td>自定级之日起1年有效，有效期结束后扣除100累计积分，根据剩余累计积分重新定级</td>
                                    <td>自定级之日起1年有效，有效期结束后扣除300累计积分，根据剩余累计积分重新定级</td>
                                    <td>自定级之日起1年有效，有效期结束后扣除550累计积分，根据剩余累计积分重新定级</td>
                                </tr>
                                <tr>
                                    <td class="gray">升/保级条件</td>
                                    <td>无</td>
                                    <td>累计积分满50分</td>
                                    <td>累计积分满150分</td>
                                    <td>累计积分满450分</td>
                                    <td>累计积分满1000分</td>
                                </tr>
                                <tr>
                                    <td class="gray">升级方式</td>
                                    <td>无</td>
                                    <td colspan="4">会员有效期内，满足升级标准即可自动升级，升级后会员有效期顺延一年</td>
                                </tr>
                                <tr>
                                    <td class="gray">降级方式</td>
                                    <td>无</td>
                                    <td colspan="4">会员有效期结束后，如不满足升级、保级条件，按剩余累计积分对应的会员级别重新定级</td>
                                </tr>
                            </table>
                            <h4><br>示例：</h4>
                            <p>普卡会员王先生2015年3月7日租车消费获得50累计积分，达到银卡会员所需升级标准，则从普卡会员升级到银卡会员。（有效期至2016年3月7日）</p>
                            <p>银卡会员王先生又于2015年6月12日租车消费获得100累计积分，达到金卡会员所需升级标准，从银卡升级为金卡（有效期至2016年6月12日），此后王先生无消费、未产生累计积分。2016年6月13日，王先生金卡会员到期，扣除冲抵金卡资格的累计积分后，剩余累计积分不足保级条件，降为银卡会员。</p>
                            <h3 name="wljjf" id="wljjf">累计积分</h3>
                            <p>累计积分是神州租车会员，根据会员级别、订单类型，按有效消费金额的一定比例所获得的，累计积分决定会员级别。会员级别越高，积分返比越大。</p>
                            <h5>1、用途：	</h5>
                            <p class="pl20">会员升级。升级时不抵扣对应分数，会员级别到期时抵扣。 </p>
                            <h5>2、有效期：</h5>
                            <p class="pl20">长期有效，还车结算次日计入会员名下 </p>
                            <h5>3、获取方式：</h5>
                            <p class="pl20"><span class="orff8650">积分=租车有效消费金额*返送比例</span>，每个订单可返积分最高不超过1000分</p>
                            <dl class="fontinfor">
                                <dt>◆  租车有效消费金额：指参与返送积分的订单及收费项目</dt>
                                <dd>◇  参与返送积分的收费项目：车辆租赁费&门店服务费、基本保险费、超里程服务费、超时服务费、异店还车服务费、异地还车服务费、儿童座椅服务费、送车上门服务费、GPS服务费、加油服务费、不计免赔服务费、手续费、上门取车服务费、夜间服务费</dd>
                                <dd>◇  说明：以上项目以外的其他收费项目，均不参与返积分；使用代金券、积分抵现、大客户预付/后付等方式结算的金额，不返积分。</dd>
                                <dt class="pt10">◆  返送比例：</dt>
                                <dd>◇  返积分所对应的会员级别，按照还车结算日的会员级别返积分比例。</dd>
                                <dd>◇  会员等级对应积分返比如下：</dd>
                                <dd><br>
                                    <table width="730" class="wztable">
                                        <tr>
                                            <th class="ac">普卡会员</th>
                                            <th class="ac">银卡会员</th>
                                            <th class="ac">金卡会员</th>
                                            <th class="ac">白金卡会员</th>
                                            <th class="ac">钻石卡会员</th>
                                        </tr>
                                        <tr>
                                            <td class="ac">10%</td>
                                            <td class="ac">12%</td>
                                            <td class="ac">15%</td>
                                            <td class="ac">20%</td>
                                            <td class="ac">25%</td>
                                        </tr>
                                    </table>
                                </dd>
                            </dl>
                            <br>
                            <p>*加盟门店租车不能返赠积分，已获得积分在加盟店租车不可冲抵租车消费、兑换礼品</p>
                            <div class="h20 p20"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
			
		</div>
	<!-- 我的等级结束 -->
	
	<!-- 登录密码开始 -->
		<div id="my_password" style="display: none">
			<div class="zc_ipttitle_bd" >
            <h2>修改密码</h2>
            <div id="modifyPassword">
                <div class="p-re" id="zcprompt_pre" style="z-index:20"></div>
                <ul>
                    <li>
                        <label class="fl">原密码</label>
                        <span class="fl">
                            <input class="zc-ipt ipt-passwordS" type="password" id="oldpasswordS"  placeholder="请输入原来密码">
                            <span class="zc-secret zc-peyeh" id="oldeye"></span>
                        </span>
                        <div class="fr">核对身份后，才可修改密码</div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <label class="fl">新密码</label>
                        <span class="fl">
                            <input class="zc-ipt ipt-passwordH" type="password" id="newpasswordH" placeholder="建议6-18位数字、字母、符号的组合密码" >
                            <span class="zc-secret zc-peyeh" id="neweye"></span>
                        </span>
                        <div class="fr">请牢记新密码</div>
                        <div class="clear"></div>
                    </li>
                    <li>
                        <label class="fl">确认密码</label>
                        <span class="fl">
                            <input class="zc-ipt ipt-passwordH" type="password" id="passwordAgainH"  placeholder="再次输入密码" >
                            <span class="zc-secret zc-peyeh" id="neweyeAgain"></span>
                        </span>
                        <div class="fr">再次输入新密码</div>
                        <div class="clear"></div>
                    </li>
                </ul>
                <div class="graybutbox">
                    <a href="javascript:void(0);" class="zc_orange_bigsub" id="zcsave">保存</a>
                </div>
            </div>

            <div class="zc_mysucceed_bd" id="modifySuccess" style="display:none">
                <p class="rok-lcongra"><span class="zc-gryes"></span>恭喜您，密码修改成功！请牢记您的新密码。</p>
                <p class="ac"><a class="zc_orange_bigsub" href="#">马上租车</a></p>
            </div>
        </div>

			
		</div>
	<!-- 登录密码结束 -->
<!-- 我的账户结束 -->

<!-- 会员条款开始 -->
	<div id="member_rules" style="display: none">
		<div class="zc_fontbox_bd">
            <h2>会员章程</h2>
			<div>
				<h3>第一章 总则</h3>
				<p>
					神州租车以"Any One、Any Time、Any Car、Any Where"为核心服务理念，竭诚为客户提供简单、安全、省钱的租车服务。为明确会员的权利和义务，特制定本章程。
				</p>
				<h3>第二章 会员资格 </h3>
				<p>
					凡年龄在18周岁（含）以上、持有有效证件的客户，均可申请入会。
				</p>
				<h3>第三章 会员级别说明</h3>
				<p>
					<b>3.1 普卡会员</b>
                    3.1.1 会员有效期，自注册之日起永久有效。<br>
					<b>3.2 银卡、金卡、白金卡和钻石卡会员</b>
				3.2.1 会员积分满一定分值（具体分值详见当年公布的《会员体系执行细则》），自动获得相应的银卡、金卡、白金卡或钻石卡会员资格；<br>
				3.2.2 会员有效期为一年（自定级/升级之日起）。</p>
				<h3>第四章 会员待遇</h3>
				<p>
					<b>4.1 不限里程</b> 
					所有级别会员，短租自驾租车均不限行驶里程（有固定里程限制的产品除外）。<br>  
					<b>4.2 积分返还</b>
                    各级别会员短租自驾消费后，按会员级别不同，享受不同比例的积分返还（不返还积分的特殊产品除外），各级别会员的积分返还比例，详见当年公布的《会员体系执行细则》。</p>
				<h3>第五章 会员积分 </h3>
				<p>
					<b>5.1 积分类型</b>
					5.1.1 积分根据用途，分为可用积分、累计积分。<br>  
					5.1.2 可用积分仅限用于抵扣租车消费和礼品兑换，有效期三年。<br>
					5.1.3 累计积分仅限用于会员定级，长期有效。<br>
					<b>5.2 积分获取</b>
					5.2.1 会员每成功短租自驾消费，均按有效消费金额、对应的会员级别返送比例获取积分（含可用积分、累计积分）；<br>
					5.2.2 会员还车结算后的次日内，积分计入会员名下。<br>
					<b>5.3 积分定级</b>
					5.3.1 神州租车为累计积分分值符合升级条件的会员，自动执行升级，升级时不扣除累计积分，会员有效期期满时，方扣除此前升级所用的会员积分。<br>
					5.3.2 会员有效期期满、扣除累计积分时，神州租车将按会员剩余累计积分分值重新为会员定级。<br>
					5.3.3定级当日起，会员按新的会员级别享受会员待遇。<br>
					5.3.4 对于有不良预订或消费记录的会员，神州租车在积分定级时，有权对会员资格进行再认定。<br></p>
				<h3>第六章 会员权利与义务 </h3>
				<p>
					会员资格仅限会员本人使用。  
					<b>6.1 会员权利 </b> 
					会员享有使用神州租车产品和服务的权益。 
					<b>6.2 会员义务 </b> 
					6.2.1 会员租车时需遵守神州租车的产品和服务规定；<br>  
					6.2.2 会员的资料发生变更（如工作变动、住址迁移、联系方式变动或单位名称变更、单位迁址等信息等）时，应及时通知神州租车；<br>
					<strong>6.2.3 会员授权神州租车存储会员所提交的个人信息（使用用途为会员与神州租车之间的汽车租赁业务），并授权神州租车可能为提供服务及提升服务质量的目的，从商业合作伙伴处获取信息作为补充。神州租车承诺仅在上述用途中使用获取的补充信息。</strong>
				</p>
				<h3>第七章 附则 </h3>
				<p>
					7.1 《会员体系执行细则》是本章程的有效补充部分。</br>
				  	7.2 神州租车有权在任何时候更改神州租车会员服务计划的任何规定或终止当年会员服务计划，即使计划的修改或终止会影响会员积分累计或返还的权利，且不承担事先通知的义务。</br>
				  	7.3 本章程由神州租车制定，神州租车拥有最终解释权。</br>
				</p>
			</div>
		</div>
		
	</div>
	
	<div id="member_bylaws" style="display: none">
		<div class="zc_fontbox_bd">
            <h2>会员体系执行细则</h2>
			<div>
				<h3>会员分级</h3>
				<p class="f14 pt10">神州租车会员分为以下五个等级。</p>
				<table width="100%" align="center" class="zcbilltable" border="1" cellpadding="0" cellspacing="0" >
					<tr>
						<th width="100" class="al">项目</th>
						<th width="100" class="al">普卡会员</th>
						<th width="143" class="al">银卡会员</th>
						<th width="151" class="al">金卡会员</th>
                        <th width="151" class="al">白金卡会员</th>
                        <th width="159" class="al">钻石卡会员</th>
					</tr>
					<tr>
						<th class="al">加入方式</th>
						<th class="al">免费加入</th>
						<th colspan="4" class="al">累计积分升级</th>
					</tr>
                    <tr>
						<th class="al">有效期</th>
						<th class="al">永久</th>
						<th align="left" class="al">自定级之日起1年有效，有效期结束后扣除30累计积分，根据剩余累计积分重新定级</th>
						<th align="left" class="al">自定级之日起1年有效，有效期结束后扣除100累计积分，根据剩余累计积分重新定级</th>
                        <th align="left" class="al">自定级之日起1年有效，有效期结束后扣除300累计积分，根据剩余累计积分重新定级</th>
                        <th align="left" class="al">自定级之日起1年有效，有效期结束后扣除550累计积分，根据剩余累计积分重新定级</th>
					</tr>
                    <tr>
						<th class="al">升/保级条件</th>
						<th class="al">无</th>
						<th align="left" class="al">累计积分满50分</th>
						<th align="left" class="al">累计积分满150分</th>
                        <th align="left" class="al">累计积分满450分</th>
                        <th align="left" class="al">累计积分满1000分</th>
					</tr>
                    <tr>
						<th class="al">升级方式</th>
						<th class="al">无</th>
						<th colspan="4" align="left" class="al">会员有效期内，满足升级标准即可自动升级，升级后会员有效期顺延一年</th>				
					</tr>
<tr>
						<th class="al">降级方式</th>
			<th class="al">无</th>
						<th colspan="4" align="left" class="al">会员有效期结束后，如不满足升级、保级条件，按剩余累计积分对应的会员级别重新定级</th>						  </tr>			</table>
<p class="f14 pt10">示例：</p>
<p class="f14 pt10">普卡会员王先生2015年3月7日租车消费获得50累计积分，达到银卡会员所需升级标准，则从普卡会员升级到银卡会员。（有效期至2016年3月7日）</p>
<p class="f14 pt10">银卡会员王先生又于2015年6月12日租车消费获得100累计积分，达到金卡会员所需升级标准，从银卡升级为金卡（有效期至2016年6月12日），此后王先生无消费、未产生累计积分。2016年6月13日，王先生金卡会员到期，扣除冲抵金卡资格的累计积分后，剩余累计积分不足保级条件，降为银卡会员。</p>

				<h3>会员积分</h3>
				<p class="f14 pt10">
	1．可用积分<br />
	&#12288;&nbsp;(1) 用途：冲抵租车消费、兑换礼品，10可用积分=1元<br />
    &#12288;&nbsp;(2) 有效期：还车结算次日计入会员名下，有效期自计入之日起三年有效，到期自动清零；<br />
    &#12288;&nbsp;(3) 获取方式：<br />   
    &#12288;&#12288;&#12288;&#12288;可用积分=租车有效消费金额*返送比例，每个订单可返积分最高不超过1000分<br />
&#12288;&#12288;&#12288;&#12288;租车有效消费金额：指参与返送积分的订单及收费项目<br />
&#12288;&#12288;&#12288;&#12288;参与返送积分的收费项目：车辆租赁费&amp;门店服务费、基本保险费、超里程服务费、超时服务费、异店还车服务费、异地还车服务费、儿童座椅服务费、送车上门服务费、GPS服务费、加油服务费、不计免赔服务费、手续费、上门取车服务费、夜间服务费<br />
&#12288;&#12288;&#12288;&#12288;&#12288;&nbsp;说明：<br />
&#12288;&#12288;&#12288;&#12288;&#12288;&nbsp;以上项目以外的其他收费项目，均不参与积分返还；<br />
&#12288;&#12288;&#12288;&#12288;&#12288;&nbsp;使用代金券、积分抵现、大客户预付/后付等方式结算的金额，不参加积分返还。<br />
    &#12288;&nbsp;积分返送比例：<br />
    &#12288;&nbsp;	按还车当日对应的会员级别，返送积分：<br />
<table width="100%" border="1" align="center" class="zcbilltable" cellpadding="0" cellspacing="0" >
					<tr>
						<td bgcolor="559ed7" width="100" height="35"></td>
						<td bgcolor="559ed7" width="100" height="35">普卡会员</td>
						<td bgcolor="559ed7" width="100" height="35">银卡会员</td>
						<td bgcolor="559ed7" width="100" height="35">金卡会员</td>
                        <td bgcolor="559ed7" width="100" height="35">白金卡会员</td>
                        <td bgcolor="559ed7" width="100" height="35">钻石卡会员</td>
		  </tr>
					<tr>
						<td>积分返比</td>
						<td>10%</td>
						<td>12%</td>
						<td>15%</td>
                        <td>20%</td>
                        <td>25%</td>
					</tr>
			  </table>
<br />
<p class="f14 pt10">
&#12288;&nbsp;(4) 使用说明<br />
&#12288;&#12288;&#12288;&#12288;可用积分可在还车时抵扣租车费用、兑换商品<br />
&#12288;&#12288;&#12288;&#12288;可用积分仅限会员本人使用，不可转让<br />
&#12288;&#12288;&#12288;&#12288;可用积分不能兑换现金，不开发票，不找零<br />
&#12288;&#12288;&#12288;&#12288;可用积分成功抵扣租车费用或兑换商品后，不支持申请退回<br />
2．累计积分<br />
&#12288;&nbsp;(1) 用途：会员升级。升级时不抵扣对应分数，会员级别到期时抵扣。<br />
&#12288;&nbsp;(2) 有效期：长期有效，还车结算次日计入会员名下<br />
&#12288;&nbsp;(3) 获取方式：同可用积分。<br /><br />
*加盟门店租车不能返赠积分，已获得积分在加盟店租车不可冲抵租车消费、兑换礼品
</p>
			</div>
		</div>
		
	</div>
<!-- 会员条款结束 -->

    </div>
<!-- 右边的框结束 -->

    
    <div class="clear"></div>
    <input id='self_order_success' type="hidden" value="预订成功">
	<input id='self_wating_payment' type="hidden" value="等待付款">
	<input id='self_handling' type="hidden" value="处理中">
	<input id='self_leasing' type="hidden" value="租赁中">
	<input id='self_cancel' type="hidden" value="已取消">
	<input id='self_prove_fail' type="hidden" value="审核未通过">
	<input id='memName' type="hidden" value="张鑫">
</div>
<input type="hidden" id="source" name="source" value="">
<input type="hidden" id="calendar" />
<input type="hidden" id="datepicker" />
<input type="hidden" id="showTimeClear" value="">
<input type="hidden" id="referCount" value="0">
<!--my main end -->
<!--footmenu start -->
<div class="zc_righttool">
	<div class="zc_tool">
    <ul class="ulbox">
        <li class="libox p-re" id="rtoolphone">
            <a href="https://shouji.zuche.com" target="_blank" class="abox"><span class="zc_phone_i"></span>手<br>机<br>版</a>
            <div class="zc_tool_phone" style="display:none ">
                <div class="p-re">
                    <div class="rightsj">◆<span class="arrowicon">◆</span></div>
                    <div class="rtoolphone">
                        <img src="https://image.zuchecdn.com/newversion/news/common/indexqcode.png" width="120" height="120" class="qcode">
                        <p>扫描二维码下载</p><p>神州租车手机版</p>
                        <a href="https://itunes.apple.com/cn/app/id454685734?mt=8" rel="nofollow" target="_blank" class="rtooldownbut">iPhone 版下载</a>
                        <a href="https://static.zuchecdn.com/download/SZZC.apk" rel="nofollow" target="_blank"  class="rtooldownbut">Android 版下载</a>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    </div>
</div>
<div class="zc_foottool">
    <ul>
        <li>
            <a href="javascript:void(0);" onclick="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=1401017&userId=3812987',
            		'newwindow','toolbar=no,scrollbars=yes,resizable=no,top=50%,left=50%,width=800,height=600');">
            <span class="zc_service_i"></span></a>
            <div class="zc_foottooltipe">
                <div class="p-re"><div class="rightsj">◆</div>在线客服</div>
            </div>
        </li>
        <li>
            <a href="https://help.zuche.com/" target="_blank"><span class="zc_help_i"></span></a>
            <div class="zc_foottooltipe">
                <div class="p-re"><div class="rightsj">◆</div>帮助中心</div>
            </div>
        </li>
        <li>
            <a href="#" ><span class="zc_top_i"></span></a>
            <div class="zc_foottooltipe">
                <div class="p-re"><div class="rightsj">◆</div>返回顶部</div>
            </div>
        </li>
    </ul>
</div>
<script type='text/javascript' id='bdshare_js' data='type=tools' ></script>
<script type='text/javascript' id='bdshell_js'></script><div class="zc_footmenu">
    <div class="zc_main">
        <dl class="wyd">
            <dt><a href="https://www.zuche.com">租车</a>预订说明</dt>
            <dd>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz1">服务时间</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz03">待租车况</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz05">服务预订</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz02">短租产品</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz04">租车资格</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz06">取还车说明</a>
            </dd>
        </dl>
        <dl class="why">
            <dt>会员管理</dt>
            <dd>
                <a target="_blank" href="https://mycar.zuche.com/member/person/personinfo/memberNotify.do">会员章程</a>
                <a target="_blank" href="https://mycar.zuche.com/member/person/personinfo/memberRule.do">会员细则</a>
                <a target="_blank" href="https://mycar.zuche.com/member/getMemberLevel.do">定级积分</a>
            </dd>
        </dl>
        <dl class="wsj">
            <dt>紧急事务处理</dt>
            <dd>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz07">保险责任</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz08">理赔说明</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz09">事故处理</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz10" style="clear:both;">救援及备用车</a>
            </dd>
        </dl>
        <dl class="wfy">
            <dt><a href="https://www.zuche.com">租车</a>费用及结算</dt>
            <dd>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz11">价格说明</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz13">结算流程</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz14">储值卡</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz15">积分</a>
            </dd>
        </dl>
        <dl class="wbz">
            <dt>帮助中心</dt>
            <dd>
                <a target="_blank" href="https://help.zuche.com/cjwt/">常见问题</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/xssl.jsp">新手上路</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp">服务规则 </a>
            </dd>
        </dl>
    </div>
</div>
<!--footmenu end -->
<!--footcopyright start -->
<div class="zc_footcopyright">
    <div class="zc_main">
        <div class="ainfor">
            <a title="关于我们" href="https://huodong.zuche.com/gywm/">关于我们</a>
            <a title="投资者关系" target="_blank" href="https://ir.zuche.com">投资者关系</a>
            <a target="_parent" title="新闻中心" href="https://news.zuche.com">新闻中心</a>
            <a title="加盟合作" target="_blank" href="https://jiameng.zuche.com">加盟合作</a>
            <a title="隐私保护" target="_parent" href="https://huodong.zuche.com/ysbh/">隐私保护</a>
            <a title="网站导航" target="_parent" href="https://help.zuche.com/sitemap/">网站导航</a>
            <a title="联系我们" target="_parent" href="https://huodong.zuche.com/lxwm/">联系我们</a>
            <a title="招贤纳士" target="_blank" href="http://hr.zuche.com">招贤纳士</a>
            <a target="_blank" href="https://en.zuche.com" class="eng_wz">English<i class="eng_icon"></i></a>
        </div>
        <div class="zc_copyright">
            <p class="fl">Copyright©2008-2017 www.zuche.com All Rights Reserved.&#12288;北京神州汽车租赁有限公司 京ICP备10005002号   京公网安备号 11010502026705</p>
            <p class="fr">如果您对神州租车网站有任何意见，欢迎发送邮件到 <a href="Mailto:web@zuche.com" class="yellowmailt">web@zuche.com</a></p>
            <p class="clear pt10">
                <a target="_blank" href="https://ss.knet.cn/verifyseal.dll?sn=2011091400100014977&amp;ct=df&amp;pa=294005" tabindex="-1" id="urlknet" class="sz_k"></a>
                <a target="_blank" id="___szfw_logo___" href="https://search.szfw.org/cert/l/CX20121016001772002081" title="诚信网站" class="sz_c"></a>
            </p>
        </div>
    </div>
</div><!--footcopyright end -->
<!-- 制定顺风车短信 -->
<input type="hidden" id="serDate" value=""/>
<form id="sms_form">
	<div id="smsDialog" class="feeMsg popup_block htjcs" mask-data="#?w=572">  	
	    <h3 class="f18h1 pl85" style="position: static;">顺风车 免费短信通知</h3>
	    <div class="pl85 m10_0">
	    	<div class="height20"></div>
	        <div class="sz_item">
	            <label class="pr10">取车城市</label>
	            <input type="text" value="取车城市" class="iptSe wCity t_val fl" maxlength="10" link-input="smsFromCityId" name="smsFromCity" id="smsFromCity" >
	            <input type="hidden" id="smsFromCityId" name="smsFromCityId"/>
	            <label style="padding: 0 5px;"><img src="https://image.zuchecdn.com/newversion/common/arrow.png" class="d_block"></label>
	            <label class="pr10">还车城市</label>
	            <input type="text" value="还车城市" class="iptSe wCity t_val fl" maxlength="10" link-input="smsToCityId" name="smsToCity" id="smsToCity" >
	            <input type="hidden" id="smsToCityId" name="smsToCityId"/>
	        </div>
	        <div class="sz_item">
	        	<label class="p20_0">取车日期<span class="gray">（该时间段内有顺风车将短信通知）</span></label>
	        </div>
	        <div class="sz_item">
	            <label class="pr10">从</label>
	            <input type="text" value="" readonly="true" class="wdate iptDate t_val fl" name="fromDate_sms" id="fromDate_sms"/>
	            <label class="p0_10">到</label>
	            <input type="text" value="" readonly="true" class="wdate iptDate t_val fl" name="toDate_sms" id="toDate_sms"/>
	        </div>
	        <div class="height13"></div>
	        <div class="sz_item">
	            <label class="pr10 gray">发送至</label>
	            <label class=" pl20 pr20 bold">张鑫</label>
	            <input type="hidden" id="memberName" name="memberName" value="张鑫"/>
	            <input type="hidden" id="memberSex" name="memberSex" value="男"/>
	            <label class="pl20 gray" style="padding-left:13px;">手机号码：</label>
	            <input type="text" style="color:#61a1df;" value="17803477149" class="wdate fl" name="memberMobile" id="memberMobile"  >
	        </div>
	        <div class="ac m10_0 pt20 pb10"><input name="" onclick="saveSMS()" type="button" value="完成设定" class="btn_orgwauto white f16 WSelect100"></div>
	    </div>
	</div>
</form>

<!-- 制定短信成功 -->
<div id="sms_success" class="Payment pb10 bg_white popup_block htjcs"  mask-data="#?w=572" style="display:none;">
    <h1 class="payment_title">
        <ul>
            <li class="LogonSUS_title_text bold white">顺风车——免费短信通知</li>
        </ul>
        <div class="clear"></div>
    </h1>
    <table width="430" align="center" cellpadding="0" cellspacing="0" class="m0_auto">
        <tr>
            <td colspan="3" class="pb10 ac bold" style="font-size:24px; color:#346635;">
                <img src="https://image.zuchecdn.com/order/orderPic5.jpg" style="vertical-align: top;" /> 短信设定成功
            </td>
        </tr>
        <tr>
            <td class="yellow_f bold f14 ar fromCity" height="50"></td>
            <td width="130" class="ac" height="50"><img src="https://image.zuchecdn.com/newversion/common/arrow.png"></td>
            <td class="yellow_f bold f14 al toCity" height="50"></td>
        </tr>
        <tr>
            <td colspan="3" style="padding-left:90px;">
                <p class="gray_666 pb10 f12 pt20"><span class="f14 bold">取车时间段</span> （该时间段内有顺风车将短信通知）</p>

                <p class="pb10 gray_666">
                    <span class="f14 bold">从</span>&nbsp;&nbsp;<span class="start bold"> </span>&nbsp;&nbsp;<span
                        class="f14 bold">到</span>&nbsp;&nbsp;<span class="end bold"></span></p>

                <p class="f14 pb10">
                    <span class="bold gray_666">发送至</span>&nbsp;&nbsp;<span class="gray_6B0B3B2 bold sms_name"></span>
                    <span class="bold gray_666 pl20">手机号码：</span><span class="gray_6B0B3B2 bold sms_mobile"></span></p>
            </td>
        </tr>
        <tr><td colspan="3" class="ar pb20 pr20"><a href="https://mycar.zuche.com/queryOrder/queryOrder.do?source=sf" class="f12">查看我的顺风车短信设定></a></td></tr>
    </table>
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
	var carwsztoneURL="https://carbusiness.zuche.com";
	var remarkimgURL="https://remarkimg.zuche.com";
	var internationalURL="https://international.zuche.com";
</script>
<script type="text/javascript" src="https://js.zuchecdn.com/divided/mm/public/lib/sea/sea@68b90934d7.js"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/divided/mm/public/lib/sea/plugin/seajs-preload@11b2cc155e.js"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/divided/mm/seaconfig@6ecc8d0dfe.js"></script>

<script type="text/javascript">
	seajs.use(['divided/mm/entry/jQ@a576d97fa6'],function(){
	    seajs.use([
			'divided/mm/entry/lib@3b38d9541c',
			'divided/mm/entry/common@8b9e21f5c5'
		]);
    });
</script><script type="text/javascript">
    seajs.use(['divided/mm/entry/jQ@a576d97fa6','divided/mm/entry/lib@3b38d9541c'],function(){
            seajs.use(['divided/mm/entry/ordermanage/selfDrivingOrder@120398e1c8']); //引入js
        });
</script>
<script id="orderHistoryTpl" type="text/x-jsrender">
<table class="zc_trace_table">
  <tbody>
  {{for historyOrderList}}
  <tr>
   <td width="125" class="pl20">{{>oper_time}}</td>
   <td width="200">
   {{if pickup_dep && pickup_dep.length}}
      {{>fromCity}} - {{>pickup_dep}}       
      <p>{{>estimate_pickup_time}}</p>
   {{/if}}
   </td>
   <td width="200">
    {{if return_dep && return_dep.length}}
       {{>toCity}} - {{>return_dep}}    
       <p>{{>estimate_return_time}}</p>
    {{/if}}
  </td>
  <td width="150">
    {{if short_name && short_name.length}}
    <p>{{>short_name_1}}</p>
    <p>{{>short_name_2}} | 乘坐{{>seat}}人 </p>
    {{/if}}
  </td>
  <td>
   {{if historyStateName eq SELF_ORDER_SUCCESS}}
       <span class="s-green">{{>historyStateName}} </span>
       {{else historyStateName eq SELF_WATING_PAYMENT}}
       <span class="s-orange">{{>historyStateName}} </span>
        {{else historyStateName eq SELF_HANDLING || historyStateName eq SELF_LEASING}}
       <span class="s-blue">{{>historyStateName}} </span>
       {{else historyStateName eq SELF_COMPLETE}}
       <span class="s-yellow">已完成</span>
        {{else}}
       <span class="s-gray">{{>historyStateName}}</span>
  {{/if}}
  </td>
  </tr>
 {{/for}}
</tbody>
</table>
</script>
</body>
</html>       