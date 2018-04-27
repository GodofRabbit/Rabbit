<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="神州租车，天天有新车，新用户得150元！全国1000+服务网点,100+车型,100%车险,无限里程!周租月租6折起,24小时服务,手续便捷,还能免费上门送取.Tel:400-616-6666">
	<meta name="keywords" content="租车,租车网,租车公司,汽车租赁">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	
<title>神州租车——全球租车领导品牌</title>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
     function displayIndex(){
       var user_id = "${cookie.user_id.value}";
       $.get("http://localhost:8080/RentCar/CouponFindAll.do?user_id="+user_id,function(result){        
         $.each(result.data,function(index,coupon){
           var li='<li>'
               li+='<a href="couponDetails.do?cid='+coupon.id+' " target="_blank">'            
                li+=' <img src="http://localhost:8080/RentCar/'+coupon.img+' " width="285" height="215">'                
                li+='</a>'           
                li+='<div class="pl10">'            
                li+='<h3>'+coupon.name+'</h3>'                                            
                li+='</div>'            
                li+='<a href="couponDetails.do?cid='+coupon.id+'" class="ma" target="_blank" >立即参与</a>'           
                li+='</li>';
                var $li = $(li);
				$("#couponList").append($li);             
         })
       
       },"json");
    }
 
</script>

<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/divided/som/entry/main@9737215007.css" /></head>
<body class="zc_index" onload="displayIndex();">
	
<input type = "hidden" id="sessionOrderProcess" value = ''>
<input type = "hidden" id="sessionOrderFirstorderNo" value = ''>
<input type = "hidden" id="sessionOrderFirstOrderId" value = ''>
<input type = "hidden" id="mebId" value = ''>
<form action="https://passport.zuche.com/memberManage/xtoploginMember.do" id="loginTopForm" target="_parent" method="post">
	<input type="hidden" id="act" name="act" value="loginSys"/>
	<input type="hidden" id="historyLocation" name="historyLocation" />
</form>
<div class="zc_head_bd">
    <div class="zc_main">
        <a href="<%=path %>/index.jsp" class="zc_logo" alt="神州租车"></a>
        <ul class="zc_menu">
            <li class="homecur" >
           	 	<a href="<%=path %>/index.jsp">首页</a>
            </li>
            <li  >
                <a href="https://order.zuche.com/smfw/index.do?flag=1">上门取送</a>
            </li>
            <li  >
            	<a href="https://order.zuche.com/smfw/index.do?flag=2" >到店取还</a>
            </li>
            <li  >
            	<a href="https://changzu.zuche.com" >长租</a>
            </li>
            <li>
            	<a href="https://huodong.zuche.com/" >活动</a>
            </li>
          
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
                 <h1 id="topLoginName">你好，${user.username }</h1>
                <div class="zc_index_my">
                    <a href="" class="top">我的神州<i class="zc_ordown"></i></a>
                    <div class="contmyszlist">
                        <div class="p-re">
                            <span class="y">◆</span>
                            <a href="<%=path %>/frontpage/personal_information.jsp"  >我的订单</a>
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
                <div class="zc_ga_phonebox"><img src="https://image.zuchecdn.com/newversion/news/common/zc_gaphone.png?v=20160516" alt="港澳台及海外电话861058209555"></div>
            </div>
        </div>
    </div>
</div>	
	
	<div id="zc_ban_bd" class="p-re">
	    <div class="zc-ban-wrap">
	        <div class="flexslider">
	            <ul class="slides" id="indexfocunsul"></ul>
	        </div>
	    </div>
	    <div class="zc_brand">
	        <div class="zc_main">
	            <ul>
	                <li>
	                    <i class="zc-yecx"></i>
	                    <p><b>100+</b>车型</p>
	                </li>
	                <li>
	                    <i class="zc-yewd"></i>
	                    <p><b>1000+</b>网点</p>
	                </li>
	                <li>
	                    <i class="zc-yecxn"></i>
	                    <p><b>100%</b>车险</p>
	                </li>
	                <li>
	                    <i class="zc-yelc"></i>
	                    <p>无限里程</p>
	                </li>
	            </ul>
	        </div>
	    </div>
	</div>
	
	
	<div class="zc-search">
    	<div class="zc_index_select">
    		<div>
    			<ul class="indexTabs">
	                <li class="cur" onclick="resetclickpositon('rent')">
	                	上门取送 <span class="tj">( 免费就是爽 )</span></li>
	                <li onclick="resetclickpositon('taocan')">
	                	到店取还 <span class="dz">( 24h放肆租 )</span></li>
	                <li style="margin-left:-1px;" onclick="resetclickpositon('search')">
	                	特价套餐 <span class="dz">( 低至6折 )</span></li>
	            </ul>
	             
<div class="indexContents cur" >
    <div class="zc_index_dz bhnew">
    	<input type="hidden" id="currentDate" name="currentDate" value="2017-12-19 11:35:23">
		<input type="hidden" id="firstStep" name="firstStep" value="1">
        <div class="h20 p-re zc-iptbox" id="search_short_tips"></div>
        <dl class="zc_item_cont fl outpre">
            <dt class="bhnewt10">
            	取车
            	<input type="hidden" id="smfwFlag" name="smfwFlag" value="0"/>
            	<input type="hidden" id="sessionSmfwFlag" name="sessionSmfwFlag" value=""/>
            	<input type="hidden" id="smfwFlagTab" name="smfwFlagTab" value=""/>
            	<input  type="hidden" id="sentType"   name="sentType"   value="0">
                <input  type="hidden" id="sentCarLng" name="sentCarLng" value="">
                <input  type="hidden" id="sentCarLat" name="sentCarLat" value="">
            </dt>
            <dd>
            	<input type="text" home-flag="true" value="太原" default-value="选择城市"
            		 class="inputSel bmnone citySD paircitySelection brnone smsmall" name="fromCityName" id="fromCityName" autocomplete="on" 
            		 link-input="fromCityId" maxlength="10">
            </dd>
            <dd>
            	<input type="hidden" id="fromCityId" name="fromCityId" value="30" >
                <input type="text" value="武宿机场店" default-value="请选择取车门店"
                class="inputSel smbig iptSe selectfromstore bluewords"  
                name="fromStoreName" id="fromStoreName" link-input="fromStoreId" style="display:inline"
                autocomplete="on" maxlength="30">

            	<input type="hidden" name="fromStoreId" id="fromStoreId" value="178">
            	<input type="hidden" id="fromIsMergeDept" name="fromIsMergeDept" value="0"/>
	            <input type="hidden" id="originalFromCityId" name="originalFromCityId" value="0"/>
            	<div class="areaSelection hide"></div>
                <input type="text" value="" default-value="请输入送车上门地址" class="inputTex smbig "
                     name="backCarAddress" id="backCarAddress" style="display:none" maxlength="100" readonly="readonly" defaultValue="">
            	<label id="shangmensongche_label" class="songchediv" >送车上门<span class="zc_switch_c icheckbox_polaris " id="shangmensongche"></span></label>
            </dd>
            <dd class="h15"></dd>
        </dl>
        <dl class="zc_item_cont fr bhmt15 outpre">
            <dt class="bhnewt10">
            	还车
				<input  type="hidden" id="returnType" name="returnType" value="0">
                <input  type="hidden" id="pickCarLng" name="pickCarLng" value="">
                <input  type="hidden" id="pickCarLat" name="pickCarLat" value="">
            </dt>
            <dd>
                <input type="text" home-flag="true" value="太原" default-value="选择城市"
                    class="inputSel bmnone zc_iptdown citySD paircitySelection brnone smsmall bluewords" 
                    name="toCityName" id="toCityName" link-input="toCityId" maxlength="10" autocomplete="on" >
            </dd>
            <dd>
            	<input type="hidden" id="toCityId" name="toCityId" value="30" >
                <input type="text" value="武宿机场店" default-value="请选择还车门店" 
                    class="inputSel smbig zc_iptdown iptSe selecttostore bluewords" 
                    name="toStoreName" id="toStoreName" link-input="toStoreId" style="display:inline;" maxlength="30" autocomplete="on" >

            	<input type="hidden" name="toStoreId" id="toStoreId" value="178">
            	<input type="hidden" id="toIsMergeDept" name="toIsMergeDept" value="0"/>
	            <input type="hidden" id="originalToCityId" name="originalToCityId" value="0"/>
            	<div class="areaSelection hide"></div>
                <input type="text" value="" default-value="请输入上门取车地址" class="inputTex smbig scdi graybde2 " 
                    name="returnCarAddress" id="returnCarAddress"  style="display:none;" maxlength="100" readonly="readonly" defaultValue="" autocomplete="on">
            	<label id="shangmequche_label" class="quchediv" >上门取车<span class="zc_switch_c icheckbox_polaris " id="shangmequche"></span></label>
            </dd>
            <dd class="h15"></dd>
        </dl>
        <div class="clear"></div>
        <dl class="zc_item_cont bhmt25 w459">
        	<dt class="bhnewt10 zq">租期</dt>
        	<dd class="p-re h76 ddfl">
                <input type="text" value="2017-12-20" class="inputDay bmnone zc_iptcalendar iptDate dt-left" 
                    name="fromDate" id="fromDate" readonly="readonly" autocomplete="on" >
            	<div class="indexjmhS fromdatetips">明天</div>
            	<input type="text" value="10:00" default-value="08:00-21:00" class="iwhtime iptSe inputSel zc_iptdown sz_chooseTime " 
            		name="fromHourMinute" id="fromHourMinute" readonly="readonly" autocomplete="on">
				
				<div class="sz_time" style="display: none;">
					<ol class="clearfix xbox">
						<li class="graybor"><div class="iptSeup areaup"></div></li><li class="bluebor">&nbsp;</li>
					</ol>
					<div class="sz_timeinfo clearfix fromtime"></div>
				</div>
				
            </dd>
            
            <dd class="arrowdd">
				<span class="smfw-arrow"></span>
			</dd>
            
            <dd class="p-re h76 ddfr">
                <input type="text" value="2017-12-22" class="inputDay bmnone zc_iptcalendar iptDate dt-right" 
                    name="toDate" id="toDate" readonly="readonly" autocomplete="on" >
            	<div class="indexdayS todatetips">2天</div>
            	<input type="text" value="10:00" default-value="08:00-21:00" class="inputSel zc_iptdown iwhtime sz_chooseTime" 
            		name="toHourMinute" id="toHourMinute" readonly="readonly" autocomplete="on" >
            	
				<div class="sz_time" style="display: none;">
					<ol class="clearfix xbox">
						<li class="graybor"><div class="iptSeup areaup"></div></li><li class="bluebor">&nbsp;</li>
					</ol>
					<div class="sz_timeinfo clearfix totime"></div>
				</div>
				
            </dd>
            
        </dl>
        <div class="h20 clear"></div>
        <div class="clear">
            <input type="button" value="立即选车" class="s_btn" title="立即选车" id="short_goselectcar" >
        </div>
    </div>
</div>	            
	            
<div class="indexContents">
    <div class="zc_index_tc">
        <div class="h20"></div>
        <ul>
            <li>
            	<a href="https://order.zuche.com/longRent-workday.html">
                    <div class="tc-left">
                        <h3>工作日套餐</h3>
                        <h4>( 4天 )</h4>
                    </div>
	                <div class="tc-right">
                        <p class="h20"></p>
                        <div class="yuan dab">超值<br>优惠</div>
                        <p class="h20"></p>
                    </div>
                </a>
            </li>
            <li>
            	<a href="https://order.zuche.com/longRent-week.html">
                    <div class="tc-left">
    	                <h3>周租套餐</h3>
    	                <h4>( 7-27天 )</h4>
                    </div>
                    <div class="tc-right">
                        <p class="h20"></p>
    	                <div class="yuan">8折<span class="f14">起</span></div>
    	                <p class="h20"></p>
                    </div>
                </a>
            </li>
            <li>
            	<a href="https://order.zuche.com/longRent-month.html">
                    <div class="tc-left">
    	                <h3>月租套餐</h3>
    	                <h4>( 28+天 )</h4>
                    </div>
                    <div class="tc-right">
                        <p class="h20"></p>
    	                <div class="yuan">6折<span class="f14">起</span></div>
    	                <p class="h20"></p>
                    </div>
                </a>
            </li>
                        <li>
            	<a href="https://order.zuche.com/longRent-year.html">
                    <div class="tc-left">
    	                <h3>年租套餐</h3>
    	                <h4>( 365天 )</h4>
                    </div>
                    <div class="tc-right">
                        <p class="h20"></p>
    	                <div class="yuan dab">用车<br>新体验</span></div>
    	                <p class="h20"></p>
                    </div>
                </a>
            </li>
        </ul>
        <div class="zc_tc_infor"><span class="zc-retan"></span> 周租/月租套餐附加增值服务，GPS导航仪/不计免赔服务/儿童座椅，7天价格封顶。</div>
    </div>
</div>	            
            </div>
	    </div>
	</div>
	
	
	<div class="zc_i_serve z-graybg">
	    <div class="zc_main">
	        <ul>
	            <li>
	                <h2>短租自驾</h2>
	                <div class="zj"></div>
	                <p>24小时轻松取 / 还车</p>
	                <a href="https://order.zuche.com/smfw/index.do?flag=1" >我要租车</a>
	            </li>
	            <li class="ml20">
	                <h2>长租服务</h2>
	                <div class="cz"></div>
	                <p>长租一次告别常租</p>
	                <a href="https://changzu.zuche.com" >我要租车</a>
	            </li>
	            <li class="ml20">
	                <h2>企业租车</h2>
	                <div class="qy"></div>
	                <p>企业出行一步搞定</p>
	                <a href="https://carbusiness.zuche.com" >我要租车</a>
	            </li>
	            <li class="ml20">
	                <h2>顺风车站</h2>
	                <div class="sfc"></div>
	                <p>价格便宜就是任性</p>
	                <a href="https://easyride.zuche.com" >我要租车</a>
	            </li>
	        </ul>
	    </div>
	</div>
	
	
	<div class="guide">
		<div class="guide-shadow"></div>
		<div class="cover">
			<div class="content step-one">
				<div class="detail one"></div>
				<div class="know-btn"></div>
			</div>
		</div>
	</div>
	
	
	<div class="zc_i_sale_car">
		<div class="zc_main">
			
<div class="specialCarBlockTitle"></div>
<div class="sale-l sbox specialCarBlock"></div>
<script id="specialCarBlockTemplateTitle" type="text/x-jsrender">
	{{if isRecommend && isRecommend == 1}}	
		<p class="title-b tb-re">热门车型大搜罗</p>
		<p class="title-s ts-re">HOT车型，实时更新随看随租，值得您关注</p>
	{{else}}
		<p class="title-b tb-sale">优惠车型大搜罗</p>
		<p class="title-s ts-sale">每日特价，劲爆优惠天天推荐，值得您关注</p>
	{{/if}}
</script>
<script id="specialCarBlockTemplate" type="text/x-jsrender">
	<div class="s-top">
		{{if isRecommend && isRecommend == 1}}<i class="i-re">热门推荐</i>{{else}}<i class="i-sale">限时优惠</i>{{/if}}
		{{if (recommendDataList && recommendDataList.length > 0) || (morecityList && morecityList.length > 0)}}
			<ul class="city-t">					
				{{for recommendDataList}}
					<li href="javascript:;" id="{{>cityInfo.cityId}}" default-city="{{>cityInfo.cityId}}" class="{{if #index == 0}}cur{{else}} {{/if}}">{{>cityInfo.cityChName}}</li>
				{{/for}}
			</ul>
		{{/if}}
		
		{{if morecityList && morecityList.length > 0 && moreDataList}}
			<span class="mcity morebox">
				<a class="morel" >更多<em class="arrowd"></em></a>
				<div class="more-citybox s-top">
					<span class="arrow">
						◆<span class="arrow1">◆</span>
					</span>
					<ul class="city-tmore">
						{{for morecityList}}
							{{for cityList}}
								<li>
									<a href="javascript:;" id="{{>cityId}}" more-city="{{>cityId}}" >{{>cityChName }}</a>
								</li>
							{{/for}}
						{{/for}}
					</ul>
				</div>
			</span>
		{{/if}}
		<span class="citynow" style="display:none;float:right;font-size:14px;color:#fabe00;border-bottom:2px solid #fabe00;margin-right:10px;"></span>
	</div>
	{{if recommendDataList || recommendDataList.length != 0}}
		{{if isRecommend != 1}}	
			{{for recommendDataList}}
				<div class="salebox clist-con {{if #getIndex() == 0}}curr{{/if}}" id="default_citycar_{{>cityInfo.cityId }}">
					<ul class="leftul">
						{{for carListTo4Part}}
							<li>
								{{for carListLi}}
									<div class="cardiv">
										<a href="https://order.zuche.com/specialCar{{>key}}-2.html">
											<div class="txtbox">
												<div class="btitle">
													<i class="lighten"></i>
													<span class="bhdate">{{>beginDate}}</span>
													<span class="bhprice">¥{{>carPrice}}</span>
												</div>
												<div class="stitle">
													<span class="car-name">{{>carName}}</span>
													<span class="fs14 car-info">{{>shortName}}乘坐{{>seat}}人</span>
												</div>
												<div class="attach-info">
													<div class="carplace">
														<p>取/还车：{{>cityChName}} {{>departmentname}}</p>
													</div>
													<span class="arrow"></span>
												</div>	
											</div>
											<div class="picbox">
												<img class="bhmove" src="{{>picture}}" alt="{{>carName}}" width="320" height="180">
												<img class="car_mask" src="https://image.zuchecdn.com/newversion/news/common/car_mask.png" width="385" height="260">
											</div>			
										</a>	
									</div>
								{{/for}}
							</li>
						{{/for}}				
					</ul>
					<ol class="bhcir bhcirl"></ol>
				</div>
			{{/for}}
		{{else}}
			{{for recommendDataList}}
				<div class="salebox clist-con {{if #getIndex() == 0}}curr{{/if}}" id="default_citycar_{{>cityInfo.cityId }}">
	                  <ul class="leftul">
							{{for carListTo4Part}}
								<li>
									{{for carListLi}}
										<div class="cardiv">
											<a href="https://order.zuche.com/specialCar{{>key}}-1.html">
												<div class="txtbox">
													<div class="stitle zc_remnd">
														<span class="car-name zc_remnd">{{>carName}}</span>
														<span class="fs14 car-info zc_remnd">{{>shortName}}  乘坐{{>seat}}人</span>
													</div>
												</div>
												<div class="picbox">
													<img class="bhmove" src="{{>picture}}" alt="{{>carName}}" width="320" height="180">
													<img class="car_mask" src="https://image.zuchecdn.com/newversion/news/common/car_mask.png" width="385" height="260">
												</div>			
											</a>	
										</div>
									{{/for}}
								</li>
						{{/for}}
					</ul>
					<ol class="bhcir bhcirl"></ol>
				</div>
			{{/for}}
		{{/if}}
	{{/if}}
	<!-- 更多城市特价车 -->
	{{if morecityList && moreDataList}}
		{{for moreDataList}}
				<div class="salebox clist-con" id="default_citycar_{{>cityInfo.cityId }}">
					<ul class="leftul">
						{{for carListTo4Part}}
							<li>
								{{for carListLi}}
									<div class="cardiv">
										<a href="https://order.zuche.com/specialCar{{>key}}-2.html">
											<div class="txtbox">
												<div class="btitle">
													<i class="lighten"></i>
													<span class="bhdate">{{>beginDate}}</span>
													<span class="bhprice">¥{{>carPrice}}</span>
												</div>
												<div class="stitle">
													<span class="car-name">{{>carName}}</span>
													<span class="fs14 car-info">{{>shortName}}乘坐{{>seat}}人</span>
												</div>
												<div class="attach-info">
													<div class="carplace">
														<p>取/还车：{{>cityChName}} {{>departmentname}}</p>
													</div>
													<span class="arrow"></span>
												</div>	
											</div>
											<div class="picbox">
												<img class="bhmove" src="{{>picture}}" alt="{{>carName}}" width="320" height="180">
												<img class="car_mask" src="https://image.zuchecdn.com/newversion/news/common/car_mask.png" width="385" height="260">
											</div>			
										</a>	
									</div>
								{{/for}}
							</li>
						{{/for}}				
					</ul>
					<ol class="bhcir bhcirl"></ol>
				</div>
		{{/for}}
	{{/if}}
</script>			
			
<div class="sale-r sbox">
	<div class="s-top">
		<i>顺风车</i>
		<span class="mcity"><a class="morer" href="https://easyride.zuche.com" >更多&ensp;></a></span>
	</div>
	<div class="salebox sfclist">
		<img class="sfc-empty" src="https://image.zuchecdn.com/newversion/news/common/sfc_null.jpg">
		<ul class="rotar" >
								<li class="rotarli">
					<div class="sfcdiv">
						<a  href="javascript:void(0);" onclick="javascript:window.location.href='https://easyride.zuche.com/order/convenienceInfo/295951.html';">
								<div class="sfctop">
									<div class="pricebox">
										<span class="pricebl">¥100</span>
										<span class="priceori">原价:￥1448</span>
									</div>
									<div class="picbox">
										<img class="bhmove" src="https://image.zuchecdn.com/newversion/news/order/Tiguan.jpg" alt="" width="320" height="180">
										<img class="car_mask" src="https://image.zuchecdn.com/newversion/news/common/car_mask.png" width="385" height="260">
									</div>
								</div>
								<div class="sfcbotm">
									<div class="distance">
										<div class="brdb">
											<div class="fl barea">
												<p class="fs20">太原</p>
												<p class="fs30">12-19</p>
												<p class="fs12">最早取车时间</p>
											</div>
											<div class="fl shapepic">
												<div class="pare">
													<span>限租2天</span>
													<img src="https://image.zuchecdn.com/newversion/news/common/shape.png">
												</div>
												
											</div>
											<div class="fl barea">
												<p class="fs20">郑州</p>
												<p class="fs30">12-22</p>
												<p class="fs12">最晚还车时间</p>
											</div>	
										</div>
										<div class="carinfo">
											<p>大众途观</p>
											<p class="fs14">大众途观/SUV/1.8T自动   乘坐5人</p>
										</div>							
									</div>
								</div>
							</a>
						</div>
					</li>
					<li class="rotarli">
					<div class="sfcdiv">
						<a  href="javascript:void(0);" onclick="javascript:window.location.href='https://easyride.zuche.com/order/convenienceInfo/295259.html';">
								<div class="sfctop">
									<div class="pricebox">
										<span class="pricebl">¥100</span>
										<span class="priceori">原价:￥4815</span>
									</div>
									<div class="picbox">
										<img class="bhmove" src="https://image.zuchecdn.com/newversion/news/order/gl8.jpg" alt="" width="320" height="180">
										<img class="car_mask" src="https://image.zuchecdn.com/newversion/news/common/car_mask.png" width="385" height="260">
									</div>
								</div>
								<div class="sfcbotm">
									<div class="distance">
										<div class="brdb">
											<div class="fl barea">
												<p class="fs20">太原</p>
												<p class="fs30">12-18</p>
												<p class="fs12">最早取车时间</p>
											</div>
											<div class="fl shapepic">
												<div class="pare">
													<span>限租5天</span>
													<img src="https://image.zuchecdn.com/newversion/news/common/shape.png">
												</div>
												
											</div>
											<div class="fl barea">
												<p class="fs20">广州</p>
												<p class="fs30">12-21</p>
												<p class="fs12">最晚还车时间</p>
											</div>	
										</div>
										<div class="carinfo">
											<p>别克GL8</p>
											<p class="fs14">别克GL8/7座/2.4自动   乘坐7人</p>
										</div>							
									</div>
								</div>
							</a>
						</div>
					</li>
					<li class="rotarli">
					<div class="sfcdiv">
						<a  href="javascript:void(0);" onclick="javascript:window.location.href='https://easyride.zuche.com/order/convenienceInfo/295495.html';">
								<div class="sfctop">
									<div class="pricebox">
										<span class="pricebl">¥100</span>
										<span class="priceori">原价:￥1608</span>
									</div>
									<div class="picbox">
										<img class="bhmove" src="https://image.zuchecdn.com/newversion/news/order/2014_G10.jpg" alt="" width="320" height="180">
										<img class="car_mask" src="https://image.zuchecdn.com/newversion/news/common/car_mask.png" width="385" height="260">
									</div>
								</div>
								<div class="sfcbotm">
									<div class="distance">
										<div class="brdb">
											<div class="fl barea">
												<p class="fs20">太原</p>
												<p class="fs30">12-17</p>
												<p class="fs12">最早取车时间</p>
											</div>
											<div class="fl shapepic">
												<div class="pare">
													<span>限租2天</span>
													<img src="https://image.zuchecdn.com/newversion/news/common/shape.png">
												</div>
												
											</div>
											<div class="fl barea">
												<p class="fs20">西安</p>
												<p class="fs30">12-20</p>
												<p class="fs12">最晚还车时间</p>
											</div>	
										</div>
										<div class="carinfo">
											<p>大通G10</p>
											<p class="fs14">上汽大通G10/7座/2.0T自动沪牌   乘坐7人</p>
										</div>							
									</div>
								</div>
							</a>
						</div>
					</li>
			</ul>		
		<ol class="bhcir cirbl bhcirr"></ol>
	</div>
</div>			
		</div>
	</div>
	
	
<div class="zc_i_sale_acy z-graybg">
    <div class="zc_main">
        <div>
            <h1>优惠活动，点亮生活趁现在</h1>
            <p class="ffftitle">多种租车模式想怎么租，就怎么租，时间与里程统统都忘掉</p>
            
            <div class="activityScroll">
            	
                <div class="hd">
                    <a class="next"></a>
                    <ul></ul>
                    <a class="prev"></a>
                    <span class="pageState"></span>
                </div>
                <div class="bd">
                    <ul class="picList" id="couponList">
                                  
                    </ul>
                </div>
            </div>
        </div>
        <div class="zc_but_box"><a href="https://huodong.zuche.com" target="_blank" class="moreabox" >更多优惠></a> </div>

    </div>
</div>	
	
<div class="zc_news">
    <div class="zc_main">
        <div class="zc_szkx">
            <p>神州快讯</p>
        </div>
        <ul>
        	        				<li>
			                <a href="https://news.zuche.com/gsdt/info1108.html" target="_blank">
			                    <img src="https://fimg.zuchecdn.com/upload/web/HomePage/ActivityList/2017/20170516BandR_list.jpg" alt="神州租车大数据解读“一带一路神州游”" width="285" height="215">
			                    <div class="news_title">
			                        <p title="神州租车大数据解读“一带一路神州游”">神州租车大数据解读“一带一路神州游”</p>
			                    </div>  
			                </a>
		           		</li>
        				<li>
			                <a href="https://news.zuche.com/gsdt/info1109.html" target="_blank">
			                    <img src="https://fimg.zuchecdn.com/upload/web/HomePage/ActivityList/2017/20170519news_list.jpg" alt="神州租车一季度客户数量同比增3成" width="285" height="215">
			                    <div class="news_title">
			                        <p title="神州租车一季度客户数量同比增3成">神州租车一季度客户数量同比增3成</p>
			                    </div>  
			                </a>
		           		</li>
        				<li>
			                <a href="https://news.zuche.com/gsdt/info1070.html" target="_blank">
			                    <img src="https://image.zuchecdn.com/newversion/news/huodong/20160905shangmen_pc.jpg" alt="神州租车“免费上门送取车”再树行业新标杆" width="285" height="215">
			                    <div class="news_title">
			                        <p title="神州租车“免费上门送取车”再树行业新标杆">神州租车“免费上门送取车”再树行业新标杆</p>
			                    </div>  
			                </a>
		           		</li>
        				<li>
			                <a href="https://news.zuche.com/gsdt/info1066.html" target="_blank">
			                    <img src="https://image.zuchecdn.com/newversion/news/huodong/20160726Carmarket_pc.jpg" alt="神州优车挂牌新三板首日市值超400亿元" width="285" height="215">
			                    <div class="news_title">
			                        <p title="神州优车挂牌新三板首日市值超400亿元">神州优车挂牌新三板首日市值超400亿元</p>
			                    </div>  
			                </a>
		           		</li>
        </ul>
        <a class="more_news_btn" href="https://news.zuche.com" target="_blank">更多快讯></a>
    </div>
</div>	
	
<div class="zc_footmenu">
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
	<div class="zc_footer">
		<div class="zc_main">
			
<div class="zc_footer_city pr">
    <div class="title">城市快捷入口</div>
    <div class="city_list">
        <ul>
            <li class="rmtext cur"><a>热门</a></li>
            <li><a>A</a></li>
            <li><a>B</a></li>
            <li><a>C</a></li>
            <li><a>D</a></li>
            <li><a>E</a></li>
            <li><a>F</a></li>
            <li><a>G</a></li>
            <li><a>H</a></li>
            <li><a>I</a></li>
            <li><a>J</a></li>
            <li><a>K</a></li>
            <li><a>L</a></li>
            <li><a>M</a></li>
            <li><a>N</a></li>
            <li><a>O</a></li>
            <li><a>P</a></li>
            <li><a>Q</a></li>
            <li><a>R</a></li>
            <li><a>S</a></li>
            <li><a>T</a></li>
            <li><a>U</a></li>
            <li><a>V</a></li>
            <li><a>W</a></li>
            <li><a>X</a></li>
            <li><a>Y</a></li>
            <li><a>Z</a></li>
            <div style="clear:both"></div>
        </ul>
        
        <div class="city hot_city cur">
            <a href="https://beijing.zuche.com/" target="_blank">北京租车</a>
            <a href="https://shanghai.zuche.com/" target="_blank">上海租车</a>
            <a href="https://guangzhou.zuche.com/" target="_blank">广州租车</a>
            <a href="https://shenzhen.zuche.com/" target="_blank">深圳租车</a>
            <a href="https://chengdu.zuche.com/" target="_blank">成都租车</a>
            <a href="https://wuhan.zuche.com/" target="_blank">武汉租车</a>
            <a href="https://xian.zuche.com/" target="_blank">西安租车</a>
            <a href="https://hangzhou.zuche.com/" target="_blank">杭州租车</a>
            <a href="https://changsha.zuche.com/" target="_blank">长沙租车</a>
            <a href="https://kunming.zuche.com/" target="_blank">昆明租车</a>
            <a href="https://chongqing.zuche.com/" target="_blank">重庆租车</a>
            <a href="https://nanjing.zuche.com/" target="_blank">南京租车</a>
            <a href="https://shenyang.zuche.com/" target="_blank">沈阳租车</a>
            <a href="https://qingdao.zuche.com/" target="_blank">青岛租车</a>
            <a href="https://sanya.zuche.com/" target="_blank">三亚租车</a>
            <a href="https://dongguan.zuche.com/" target="_blank">东莞租车</a>
            <a href="https://xiamen.zuche.com/" target="_blank">厦门租车</a>
            <a href="https://dalian.zuche.com/" target="_blank">大连租车</a>
            <a href="https://tianjin.zuche.com/" target="_blank">天津租车</a>
            <a href="https://zhengzhou.zuche.com/" target="_blank">郑州租车</a>
            <a href="https://jinan.zuche.com" target="_blank">济南租车</a>
            <a href="https://guiyang.zuche.com/" target="_blank">贵阳租车</a>
            <a href="https://xining.zuche.com/" target="_blank">西宁租车</a>
            <a href="https://haerbin.zuche.com/" target="_blank">哈尔滨租车</a>
        </div>
        
        <div class="city">
            <a href="https://anshan.zuche.com/"  target="_blank">鞍山租车</a>
            <a href="https://anshun.zuche.com/"  target="_blank">安顺租车</a>
            <a href="https://ankang.zuche.com/"  target="_blank">安康租车</a>
            <a href="https://anqing.zuche.com/"  target="_blank">安庆租车</a>
            <a href="https://aershan.zuche.com/"  target="_blank">阿尔山租车</a>
        </div>
        <div class="city">
            <a href="https://beijing.zuche.com/"  target="_blank">北京租车</a>
            <a href="https://beihai.zuche.com/"  target="_blank">北海租车</a>
            <a href="https://baotou.zuche.com/"  target="_blank">包头租车</a>
            <a href="https://baoji.zuche.com/"  target="_blank">宝鸡租车</a>
            <a href="https://benxi.zuche.com/"  target="_blank">本溪租车</a>
            <a href="https://baoding.zuche.com/"  target="_blank">保定租车</a>
            <a href="https://binhai.zuche.com/"  target="_blank">滨海租车</a>
            <a href="https://baicheng.zuche.com/"  target="_blank">白城租车</a>
            <a href="https://bengbu.zuche.com/"  target="_blank">蚌埠租车</a>
        </div>
        <div class="city">
            <a href="https://chengdu.zuche.com/"  target="_blank">成都租车</a>
            <a href="https://changsha.zuche.com/"  target="_blank">长沙租车</a>
            <a href="https://chongqing.zuche.com/"  target="_blank">重庆租车</a>
            <a href="https://changchun.zuche.com/"  target="_blank">长春租车</a>
            <a href="https://changzhou.zuche.com/"  target="_blank">常州租车</a>
            <a href="https://chenzhou.zuche.com/"  target="_blank">郴州租车</a>
            <a href="https://chengde.zuche.com/"  target="_blank">承德租车</a>
            <a href="https://changbaishan.zuche.com/"  target="_blank">长白山租车</a>
            <a href="https://changzhi.zuche.com/"  target="_blank">长治租车</a>
            <a href="https://changji.zuche.com/"  target="_blank">昌吉租车</a>
            <a href="https://changde.zuche.com/"  target="_blank">常德租车</a>
            <a href="https://cangzhou.zuche.com/"  target="_blank">沧州租车</a>
            <a href="https://chifeng.zuche.com/"  target="_blank">赤峰租车</a>
            <a href="https://cangnan.zuche.com/"  target="_blank">苍南租车</a>
            <a href="https://chizhou.zuche.com/"  target="_blank">池州租车</a>
            <a href="https://chaozhou.zuche.com/"  target="_blank">潮州租车</a>
        </div>
        <div class="city">
            <a href="https://dalian.zuche.com/"  target="_blank">大连租车</a>
            <a href="https://dongguan.zuche.com/"  target="_blank">东莞租车</a>
            <a href="https://dujiangyan.zuche.com/"  target="_blank">都江堰租车</a>
            <a href="https://dali.zuche.com/"  target="_blank">大理租车</a>
            <a href="https://dezhou.zuche.com/"  target="_blank">德州租车</a>
            <a href="https://dandong.zuche.com/"  target="_blank">丹东租车</a>
            <a href="https://duyun.zuche.com/"  target="_blank">都匀租车</a>
            <a href="https://daqing.zuche.com/"  target="_blank">大庆租车</a>
            <a href="https://duolun.zuche.com/"  target="_blank">多伦租车</a>
            <a href="https://donggang.zuche.com/"  target="_blank">东港租车</a>
            <a href="https://dunhuang.zuche.com/"  target="_blank">敦煌租车</a>
            <a href="https://datong.zuche.com/"  target="_blank">大同租车</a>
            <a href="https://dangtu.zuche.com/"  target="_blank">当涂租车</a>
            <a href="https://dengzhou.zuche.com/"  target="_blank">邓州租车</a>
            <a href="https://deyang.zuche.com/"  target="_blank">德阳租车</a>
            <a href="https://dazu.zuche.com/"  target="_blank">大足租车</a>
            <a href="https://dunhua.zuche.com" target="_blank">敦化租车</a>
        </div>
        <div class="city">
            <a href="https://eerduosi.zuche.com/"  target="_blank">鄂尔多斯租车</a>
            <a href="https://enshi.zuche.com/"  target="_blank">恩施租车</a>
        </div>
        <div class="city">
            <a href="https://foshan.zuche.com/"  target="_blank">佛山租车</a>
            <a href="https://fushun.zuche.com/"  target="_blank">抚顺租车</a>
            <a href="https://fuzhou.zuche.com/"  target="_blank">福州租车</a>
            <a href="https://fuyang.zuche.com/"  target="_blank">富阳租车</a>
            <a href="https://fuyanganhui.zuche.com/"  target="_blank">阜阳租车</a>
            <a href="https://fuqing.zuche.com/"  target="_blank">福清租车</a>
            <a href="https://chongqing.zuche.com/"  target="_blank">涪陵租车</a>
        </div>
        <div class="city">
            <a href="https://guangzhou.zuche.com/"  target="_blank">广州租车</a>
            <a href="https://guilin.zuche.com/"  target="_blank">桂林租车</a>
            <a href="https://guiyang.zuche.com/"  target="_blank">贵阳租车</a>
            <a href="https://ganzhou.zuche.com/"  target="_blank">赣州租车</a>
        </div>
        <div class="city">
            <a href="https://hangzhou.zuche.com/"  target="_blank">杭州租车</a>
            <a href="https://haerbin.zuche.com/"  target="_blank">哈尔滨租车</a>
            <a href="https://haikou.zuche.com/"  target="_blank">海口租车</a>
            <a href="https://hefei.zuche.com/"  target="_blank">合肥租车</a>
            <a href="https://huhehaote.zuche.com/"  target="_blank">呼和浩特租车</a>
            <a href="https://huizhou.zuche.com/"  target="_blank">惠州租车</a>
            <a href="https://heyuan.zuche.com/"  target="_blank">河源租车</a>
            <a href="https://haining.zuche.com/"  target="_blank">海宁租车</a>
            <a href="https://huludao.zuche.com/"  target="_blank">葫芦岛租车</a>
            <a href="https://huaian.zuche.com/"  target="_blank">淮安租车</a>
            <a href="https://hengyang.zuche.com/"  target="_blank">衡阳租车</a>
            <a href="https://huaihua.zuche.com/"  target="_blank">怀化租车</a>
            <a href="https://hulunbeier.zuche.com/"  target="_blank">呼伦贝尔租车</a>
            <a href="https://hengshui.zuche.com/"  target="_blank">衡水租车</a>
            <a href="https://hanshan.zuche.com/"  target="_blank">含山租车</a>
            <a href="https://huainan.zuche.com/"  target="_blank">淮南租车</a>
            <a href="https://huangshan.zuche.com/"  target="_blank">黄山租车</a>
            <a href="https://helingeer.zuche.com/"  target="_blank">和林格尔租车</a>
            <a href="https://huangshi.zuche.com/"  target="_blank">黄石租车</a>
            <a href="https://hanzhong.zuche.com/"  target="_blank">汉中租车</a>
            <a href="https://handan.zuche.com/"  target="_blank">邯郸租车</a>
            <a href="https://houma.zuche.com/"  target="_blank">侯马租车</a>
            <a href="https://huzhou.zuche.com/"  target="_blank">湖州租车</a>
            <a href="https://hejin.zuche.com/"  target="_blank">河津租车</a>
        </div>
        <div class="city">
        </div>
        <div class="city">
            <a href="https://jiaxing.zuche.com/"  target="_blank">嘉兴租车</a>
            <a href="https://jinan.zuche.com/"  target="_blank">济南租车</a>
            <a href="https://jinjiang.zuche.com/"  target="_blank">晋江租车</a>
            <a href="https://jinzhou.zuche.com/"  target="_blank">锦州租车</a>
            <a href="https://jingmen.zuche.com/"  target="_blank">荆门租车</a>
            <a href="https://jiamusi.zuche.com/"  target="_blank">佳木斯租车</a>
            <a href="https://jiujiang.zuche.com/"  target="_blank">九江租车</a>
            <a href="https://jiayuguan.zuche.com/"  target="_blank">嘉峪关租车</a>
            <a href="https://jiangmen.zuche.com/"  target="_blank">江门租车</a>
            <a href="https://jinzhong.zuche.com/"  target="_blank">晋中租车</a>
            <a href="https://jianshui.zuche.com/"  target="_blank">建水租车</a>
            <a href="https://jilin.zuche.com/"  target="_blank">吉林租车</a>
            <a href="https://jieyang.zuche.com/"  target="_blank">揭阳租车</a>
            <a href="https://jian.zuche.com/"  target="_blank">吉安租车</a>
            <a href="https://jingzhou.zuche.com/"  target="_blank">荆州租车</a>
            <a href="https://jiuzhaigou.zuche.com/"  target="_blank">九寨沟租车</a>
            <a href="https://jianli.zuche.com/"  target="_blank">监利租车</a>
            <a href="https://jiangyin.zuche.com"  target="_blank">江阴租车</a>
        </div>
        <div class="city">
            <a href="https://kunming.zuche.com/"  target="_blank">昆明租车</a>
            <a href="https://kunshan.zuche.com/"  target="_blank">昆山租车</a>
            <a href="https://kuerle.zuche.com/"  target="_blank">库尔勒租车</a>
            <a href="https://kaili.zuche.com/"  target="_blank">凯里租车</a>
            <a href="https://kaifeng.zuche.com" target="_blank">开封租车</a>
        </div>
        <div class="city">
            <a href="https://langfanganci.zuche.com/"  target="_blank">廊坊安次租车</a>
            <a href="https://lanzhou.zuche.com/"  target="_blank">兰州租车</a>
            <a href="https://luoyang.zuche.com/"  target="_blank">洛阳租车</a>
            <a href="https://lijiang.zuche.com/"  target="_blank">丽江租车</a>
            <a href="https://liaoyang.zuche.com/"  target="_blank">辽阳租车</a>
            <a href="https://linghai.zuche.com/"  target="_blank">凌海租车</a>
            <a href="https://liuzhou.zuche.com/"  target="_blank">柳州租车</a>
            <a href="https://liuyang.zuche.com/"  target="_blank">浏阳租车</a>
            <a href="https://leshan.zuche.com/"  target="_blank">乐山租车</a>
            <a href="https://longhai.zuche.com/"  target="_blank">龙海租车</a>
            <a href="https://liaocheng.zuche.com/"  target="_blank">聊城租车</a>
            <a href="https://luohe.zuche.com/"  target="_blank">漯河租车</a>
            <a href="https://luzhou.zuche.com/"  target="_blank">泸州租车</a>
            <a href="https://lasa.zuche.com/"  target="_blank">拉萨租车</a>
            <a href="https://luan.zuche.com/"  target="_blank">六安租车</a>
            <a href="https://linyi.zuche.com/"  target="_blank">临沂租车</a>
            <a href="https://lvliang.zuche.com/"  target="_blank">吕梁租车</a>
            <a href="https://linfen.zuche.com/"  target="_blank">临汾租车</a>
            <a href="https://longyan.zuche.com/"  target="_blank">龙岩租车</a>
            <a href="https://lixian.zuche.com/"  target="_blank">澧县租车</a>
            <a href="https://linan.zuche.com/"  target="_blank">临安租车</a>
            <a href="https://lianyungang.zuche.com" target="_blank">连云港租车</a>
        </div>
        <div class="city">
            <a href="https://mianyang.zuche.com/"  target="_blank">绵阳租车</a>
            <a href="https://maanshan.zuche.com/"  target="_blank">马鞍山租车</a>
            <a href="https://manzhouli.zuche.com/"  target="_blank">满洲里租车</a>
            <a href="https://mudanjiang.zuche.com/"  target="_blank">牡丹江租车</a>
            <a href="https://meizhou.zuche.com/"  target="_blank">梅州租车</a>
            <a href="https://maoming.zuche.com/"  target="_blank">茂名租车</a>
            <a href="https://mangshi.zuche.com/"  target="_blank">芒市租车</a>
            <a href="https://meishan.zuche.com" target="_blank">眉山租车</a>
        </div>
        <div class="city">
            <a href="https://nanjing.zuche.com/"  target="_blank">南京租车</a>
            <a href="https://nanchang.zuche.com/"  target="_blank">南昌租车</a>
            <a href="https://nanning.zuche.com/"  target="_blank">南宁租车</a>
            <a href="https://nantong.zuche.com/"  target="_blank">南通租车</a>
            <a href="https://ningbo.zuche.com/"  target="_blank">宁波租车</a>
            <a href="https://nanchong.zuche.com/"  target="_blank">南充租车</a>
            <a href="https://nanyang.zuche.com/"  target="_blank">南阳租车</a>
        </div>
        <div class="city">
        </div>
        <div class="city">
            <a href="https://panjin.zuche.com/"  target="_blank">盘锦租车</a>
            <a href="https://pingliang.zuche.com/"  target="_blank">平凉租车</a>
            <a href="https://putian.zuche.com/"  target="_blank">莆田租车</a>
            <a href="https://puning.zuche.com/"  target="_blank">普宁租车</a>
        </div>
        <div class="city">
            <a href="https://qingdao.zuche.com/"  target="_blank">青岛租车</a>
            <a href="https://quanzhou.zuche.com/"  target="_blank">泉州租车</a>
            <a href="https://qianjiang.zuche.com/"  target="_blank">潜江租车</a>
            <a href="https://quangang.zuche.com/"  target="_blank">泉港租车</a>
            <a href="https://qinhuangdao.zuche.com/"  target="_blank">秦皇岛租车</a>
            <a href="https://quzhou.zuche.com/"  target="_blank">衢州租车</a>
            <a href="https://qiqihaer.zuche.com/"  target="_blank">齐齐哈尔租车</a>
            <a href="https://qufu.zuche.com/"  target="_blank">曲阜租车</a>
            <a href="https://qiandaohu.zuche.com/"  target="_blank">千岛湖租车</a>
            <a href="https://qichun.zuche.com/"  target="_blank">蕲春租车</a>
            <a href="https://qingyuan.zuche.com/"  target="_blank">清远租车</a>
            <a href="https://qujing.zuche.com/"  target="_blank">曲靖租车</a>
        </div>
        <div class="city">
            <a href="https://rongcheng.zuche.com/"  target="_blank">荣成租车</a>
            <a href="https://rizhao.zuche.com/"  target="_blank">日照租车</a>
            <a href="https://ruili.zuche.com" target="_blank">瑞丽租车</a>
        </div>
        <div class="city">
            <a href="https://shanghai.zuche.com/"  target="_blank">上海租车</a>
            <a href="https://shenzhen.zuche.com/"  target="_blank">深圳租车</a>
            <a href="https://shenyang.zuche.com/"  target="_blank">沈阳租车</a>
            <a href="https://sanya.zuche.com/"  target="_blank">三亚租车</a>
            <a href="https://shijiazhuang.zuche.com/"  target="_blank">石家庄租车</a>
            <a href="https://suzhou.zuche.com/"  target="_blank">苏州租车</a>
            <a href="https://shaoguan.zuche.com/"  target="_blank">韶关租车</a>
            <a href="https://shantou.zuche.com/"  target="_blank">汕头租车</a>
            <a href="https://shangqiu.zuche.com/"  target="_blank">商丘租车</a>
            <a href="https://shanwei.zuche.com/"  target="_blank">汕尾租车</a>
            <a href="https://suzhouanhui.zuche.com/"  target="_blank">宿州租车</a>
            <a href="https://suqian.zuche.com/"  target="_blank">宿迁租车</a>
            <a href="https://shaoyang.zuche.com/"  target="_blank">邵阳租车</a>
            <a href="https://shangcai.zuche.com/"  target="_blank">上蔡租车</a>
            <a href="https://songyuan.zuche.com/"  target="_blank">松原租车</a>
            <a href="https://suining.zuche.com/"  target="_blank">睢宁租车</a>
            <a href="https://shuozhou.zuche.com/"  target="_blank">朔州租车</a>
            <a href="https://shaoxing.zuche.com/"  target="_blank">绍兴租车</a>
            <a href="https://shizuishan.zuche.com/"  target="_blank">石嘴山租车</a>
            <a href="https://sanmenxia.zuche.com/"  target="_blank">三门峡租车</a>
            <a href="https://shangrao.zuche.com/"  target="_blank">上饶租车</a>
            <a href="https://suizhou.zuche.com/"  target="_blank">随州租车</a>
        </div>
        <div class="city">
            <a href="https://taiyuan.zuche.com/"  target="_blank">太原租车</a>
            <a href="https://tangshan.zuche.com/"  target="_blank">唐山租车</a>
            <a href="https://tianjin.zuche.com/"  target="_blank">天津租车</a>
            <a href="https://taizhou.zuche.com/"  target="_blank">台州租车</a>
            <a href="https://taicang.zuche.com/"  target="_blank">太仓租车</a>
            <a href="https://tongliao.zuche.com/"  target="_blank">通辽租车</a>
            <a href="https://tengchong.zuche.com/"  target="_blank">腾冲租车</a>
            <a href="https://taian.zuche.com/"  target="_blank">泰安租车</a>
            <a href="https://tongling.zuche.com/"  target="_blank">铜陵租车</a>
            <a href="https://tongren.zuche.com/"  target="_blank">铜仁租车</a>
            <a href="https://taigu.zuche.com/"  target="_blank">太谷租车</a>
            <a href="https://taizhoujiangsu.zuche.com/"  target="_blank">泰州租车</a>
            <a href="https://tianshui.zuche.com/"  target="_blank">天水租车</a>
        </div>
        <div class="city">
        </div>
        <div class="city">
            
        </div>
        <div class="city">
            <a href="https://wuhan.zuche.com/"  target="_blank">武汉租车</a>
            <a href="https://wenzhou.zuche.com/"  target="_blank">温州租车</a>
            <a href="https://wulumuqi.zuche.com/"  target="_blank">乌鲁木齐租车</a>
            <a href="https://wuxi.zuche.com/"  target="_blank">无锡租车</a>
            <a href="https://wuhu.zuche.com/"  target="_blank">芜湖租车</a>
            <a href="https://weifang.zuche.com/"  target="_blank">潍坊租车</a>
            <a href="https://weihai.zuche.com/"  target="_blank">威海租车</a>
            <a href="https://wuyishan.zuche.com/"  target="_blank">武夷山租车</a>
            <a href="https://wulanhaote.zuche.com/"  target="_blank">乌兰浩特租车</a>
            <a href="https://wuhai.zuche.com/"  target="_blank">乌海租车</a>
            <a href="https://wulanchabu.zuche.com/"  target="_blank">乌兰察布租车</a>
            <a href="https://wuyuan.zuche.com/"  target="_blank">婺源租车</a>
            <a href="https://wanning.zuche.com/"  target="_blank">万宁租车</a>
        </div>
        <div class="city">
            <a href="https://xiamen.zuche.com/"  target="_blank">厦门租车</a>
            <a href="https://xian.zuche.com/"  target="_blank">西安租车</a>
            <a href="https://xiangtan.zuche.com/"  target="_blank">湘潭租车</a>
            <a href="https://xining.zuche.com/"  target="_blank">西宁租车</a>
            <a href="https://xuzhou.zuche.com/"  target="_blank">徐州租车</a>
            <a href="https://xishuangbanna.zuche.com/"  target="_blank">西双版纳租车</a>
            <a href="https://xiantao.zuche.com/"  target="_blank">仙桃租车</a>
            <a href="https://xuancheng.zuche.com/"  target="_blank">宣城租车</a>
            <a href="https://xichang.zuche.com/"  target="_blank">西昌租车</a>
            <a href="https://xixia.zuche.com/"  target="_blank">西峡租车</a>
            <a href="https://xinzhou.zuche.com/"  target="_blank">忻州租车</a>
            <a href="https://xinyang.zuche.com/"  target="_blank">信阳租车</a>
            <a href="https://xianning.zuche.com/"  target="_blank">咸宁租车</a>
            <a href="https://xuchang.zuche.com/"  target="_blank">许昌租车</a>
            <a href="https://zhanjiang.zuche.com/"  target="_blank">徐闻租车</a>
            <a href="https://xinmi.zuche.com/"  target="_blank">新密租车</a>
            <a href="https://xinyu.zuche.com/"  target="_blank">新余租车</a>
            <a href="https://xingtai.zuche.com/"  target="_blank">邢台租车</a>
            <a href="https://xiangyang.zuche.com/"  target="_blank">襄阳租车</a>
            <a href="https://xianyang.zuche.com/"  target="_blank">咸阳租车</a>
            <a href="https://xilinhaote.zuche.com" target="_blank">锡林浩特租车</a>
        </div>
        <div class="city">
            <a href="https://yangzhou.zuche.com/"  target="_blank">扬州租车</a>
            <a href="https://yantai.zuche.com/"  target="_blank">烟台租车</a>
            <a href="https://yinchuan.zuche.com/"  target="_blank">银川租车</a>
            <a href="https://yiwu.zuche.com/"  target="_blank">义乌租车</a>
            <a href="https://yichun.zuche.com/"  target="_blank">伊春租车</a>
            <a href="https://yingkou.zuche.com/"  target="_blank">营口租车</a>
            <a href="https://yuncheng.zuche.com/"  target="_blank">运城租车</a>
            <a href="https://wenzhou.zuche.com/"  target="_blank">永嘉租车</a>
            <a href="https://yongchuan.zuche.com/"  target="_blank">永川租车</a>
            <a href="https://yakeshi.zuche.com/"  target="_blank">牙克石租车</a>
            <a href="https://yueqing.zuche.com/"  target="_blank">乐清租车</a>
            <a href="https://yancheng.zuche.com/"  target="_blank">盐城租车</a>
            <a href="https://yibin.zuche.com/"  target="_blank">宜宾租车</a>
            <a href="https://yueyang.zuche.com/"  target="_blank">岳阳租车</a>
            <a href="https://yichang.zuche.com/"  target="_blank">宜昌租车</a>
            <a href="https://ganzhou.zuche.com/"  target="_blank">于都租车</a>
            <a href="https://yangjiang.zuche.com/"  target="_blank">阳江租车</a>
            <a href="https://yixing.zuche.com/"  target="_blank">宜兴租车</a>
            <a href="https://yanan.zuche.com/"  target="_blank">延安租车</a>
            <a href="https://yulin.zuche.com/"  target="_blank">榆林租车</a>
            <a href="https://yili.zuche.com/"  target="_blank">伊犁租车</a>
            <a href="https://yanji.zuche.com" target="_blank">延吉租车</a>
            <a href="https://yiyang.zuche.com" target="_blank">益阳租车</a>
            <a href="https://yulinguangxi.zuche.com" target="_blank">玉林租车</a>
        </div>
        <div class="city">
            <a href="https://zhengzhou.zuche.com/"  target="_blank">郑州租车</a>
            <a href="https://zhongshan.zuche.com/"  target="_blank">中山租车</a>
            <a href="https://zhuhai.zuche.com/"  target="_blank">珠海租车</a>
            <a href="https://zhuzhou.zuche.com/"  target="_blank">株洲租车</a>
            <a href="https://zhangzhou.zuche.com/"  target="_blank">漳州租车</a>
            <a href="https://zhaoqing.zuche.com/"  target="_blank">肇庆租车</a>
            <a href="https://zhenjiang.zuche.com/"  target="_blank">镇江租车</a>
            <a href="https://zhalantun.zuche.com/"  target="_blank">扎兰屯租车</a>
            <a href="https://zunyi.zuche.com/"  target="_blank">遵义租车</a>
            <a href="https://zhangjiajie.zuche.com/"  target="_blank">张家界租车</a>
            <a href="https://zigong.zuche.com/"  target="_blank">自贡租车</a>
            <a href="https://zhoukou.zuche.com/"  target="_blank">周口租车</a>
            <a href="https://zhongwei.zuche.com/"  target="_blank">中卫租车</a>
            <a href="https://zhangjiakou.zuche.com/"  target="_blank">张家口租车</a>
            <a href="https://zhangpu.zuche.com/"  target="_blank">漳浦租车</a>
            <a href="https://zhuji.zuche.com/"  target="_blank">诸暨租车</a>
            <a href="https://zhumadian.zuche.com/"  target="_blank">驻马店租车</a>
            <a href="https://zaozhuang.zuche.com/"  target="_blank">枣庄租车</a>
            <a href="https://jingdezhen.zuche.com/"  target="_blank">景德镇租车</a>
            <a href="https://zibo.zuche.com/"  target="_blank">淄博租车</a>
            <a href="https://zhangye.zuche.com/"  target="_blank">张掖租车</a>
            <a href="https://zhongxiang.zuche.com/"  target="_blank">钟祥租车</a>
        </div>
    </div>
</div>			
			
<div class="fri_link">
    <span>友情链接:</span>
    <div class="fr" style="width:1120px;">
    	<a href="http://www.maimaiche.com/cn/" target="_blank">神州买买车</a>
    	<a href="http://www.carbank.cn/" target="_blank">神州闪贷</a>
		<a href="http://bj.tuniu.com" target="_blank">北京旅游网</a>
		<a href="http://z.mafengwo.cn" target="_blank">旅游指南</a>
		<a href="http://www.ynet.com/" target="_blank">北青网</a>
		<a href="http://wan.cncn.com/" target="_blank">欣欣旅游商城</a>
		<a href="http://www.mianfeiwucan.org/" target="_blank">免费午餐网</a>
		<a href="http://www.city8.com" target="_blank">中国街景地图</a>
		<a href="http://www.ctcnn.com" target="_blank">劲旅网</a>
		<a href="http://www.fhlyou.com" target="_blank">凤凰古城</a>
		<a href="http://www.taoche.com" target="_blank">二手车交易</a>
		<a href="http://www.ilvping.com" target="_blank">旅评网</a>
		<a href="http://www.lavago.com" target="_blank">拉拉勾旅游网</a>
		<a href="http://www.caissa.com.cn" target="_blank">凯撒旅游网</a>
		<a href="http://www.17u.cn" target="_blank">同程网</a>
		<a href="http://travel.sina.com.cn" target="_blank">新浪旅游</a>
		<a href="http://www.ufenghuang.com" target="_blank">游凤凰网</a>
		<a href="http://www.cits.cn/" target="_blank">国旅在线</a>
		<a href="http://www.qyer.com/" target="_blank">穷游出境游</a>
		<a href="http://www.jdair.net/" target="_blank">首都航空</a>
    </div>            
</div>			
		</div>
		
<div class="zc_footcopyright">
    <div class="zc_main">
        <div class="ainfor">
            <a title="关于我们" href="https://huodong.zuche.com/gywm/" rel="nofollow">关于我们</a>
            <a title="投资者关系" target="_blank" href="https://ir.zuche.com" rel="nofollow">投资者关系</a>
            <a target="_parent" title="新闻中心" href="https://news.zuche.com/">新闻中心</a>
            <a title="加盟合作" target="_blank" href="https://jiameng.zuche.com">加盟合作</a>
            <a title="隐私保护" target="_parent" href="https://huodong.zuche.com/ysbh/" rel="nofollow">隐私保护</a>
            <a title="网站导航" target="_parent" href="https://help.zuche.com/sitemap/">网站导航</a>
            <a title="联系我们" target="_parent" href="https://huodong.zuche.com/lxwm/" rel="nofollow">联系我们</a>
            <a title="招贤纳士" target="_blank" href="http://hr.zuche.com/" rel="nofollow">招贤纳士</a>
            <a target="_blank" href="https://en.zuche.com" class="eng_wz">English<i class="eng_icon"></i></a>
        </div>
        <div class="zc_copyright">
            <p class="fl">Copyright©2008-2017 www.zuche.com All Rights Reserved.　北京神州汽车租赁有限公司 京ICP备10005002号   京公网安备号 11010502026705</p>
            <p class="fr">如果您对神州租车网站有任何意见，欢迎发送邮件到 <a href="Mailto:web@zuche.com" class="yellowmailt">web@zuche.com</a></p>
            <p class="clear pt10">
                <a target="_blank" href="https://ss.knet.cn/verifyseal.dll?sn=2011091400100014977&amp;ct=df&amp;pa=294005" rel="nofollow" tabindex="-1" id="urlknet" class="sz_k"></a>
                <a target="_blank" id="___szfw_logo___" href="https://search.szfw.org/cert/l/CX20121016001772002081" rel="nofollow" title="诚信网站" class="sz_c"></a>
            </p>
        </div>
    </div>
</div>		
	</div>
	
<div id="presentloginbox" class="popup_block">
    <div class="presentlogin_bd">
        <div class="zc_login_box">
            <ul class="tabl">
                <li id="normallogin" class="cur">登录</li>
                <li id="mobilelogin">手机动态码登录</li>
                <input type="hidden" id="logintype" value="normal">
            </ul>
            <div class="tabcontents cur">
            <div class="zc_l_error" id="error_tips"></div>
                <ul>
                    <li><label class="icon_wz"><span class="zc-iuser "></span></label>
                        <input type="text" class="wipt t_val" id="normal_id" value="请输入手机号/证件号" maxlength="18">
                        <input type="text" class="wipt t_val" id="phone_id" value="请输入注册手机号" maxlength="18" style="display:none">
                    </li>
                    <li class="pass_switchover"><label class="icon_wz"><span class="zc-ipsw "></span></label>
                        <input type="text" class="wipt"  value="请输入密码" id="xpasstext" >
                        <input type="password" class="wipt"  value="" id="xpassword" >
                    </li>
                    <li class="clearfix" id="imageYzmLi" style="display:none">
                        <label class="icon_wz"><span class="zc-iyzm"></span></label>
                        <span class="fl"><input class="zc-iptsht t_val" type="text" id="yzmVal" value="请输入右侧验证码" maxlength="6"></span>
                        <span class="pic-yzm fr"><img id="yzmImg" src="" width="108px" height="36px"><i id="yzmrefresh" class="zc-fresh"></i></span>
                    </li>
                    <li class="clearfix" id="phoneYzmLi" style="display:none">
                        <label class="icon_wz"><span class="zc-idtm"></span></label>
                        <span class="fl"><input id="idtmVal" class="zc-iptsht t_val" type="text" maxlength="6" value="请输入动态验证码"></span>
                        <span class="fr"><input id="getidtm" class="btn-dtm btn-getdtm" type="button" value="获取手机动态码">
                        <input id="idtmcount" class="btn-dtm btn-dtmdao" type="button" value="60秒后可重发" style="display: none;"></span>
                        <input type="hidden" id="smsOverTime">
                    </li>
                    <li class="zc_list_che">
                        <label class="fl"><span class="zc-blyes"></span><span class="zc_blyes_kong"></span>
                        <input id="autoLogin" type="checkbox" checked class="login_checkbox">30天内自动登陆</label>
                        <a href="https://passport.zuche.com/member/loginandregist/getpassword.do" class="fr">忘记密码？</a>
                        <div class="clear"></div>
                    </li>
                </ul>
                <ul class="login_sub" id="login_sub">
                	<li><input type="submit" class="zc-btn btn-login" value="登录" id="loginBt" ></li>
                	<li><div class="zc_login_rbox">还不是会员？<a href="https://passport.zuche.com/member/loginandregist/regist.do" rel="nofollow">立即注册</a> </div></li>
            	</ul>
                <input type="hidden" id="autoLogin" name="autoLogin"></input>
            </div>
            <div class="tabcontents" id="imgYzmDiv">
				<div class="zc_l_error" id="error_tips_float"></div>
                <ul>
					<li><i class="zc_blue_yandown"></i> 请先输入以下验证码，获取手机动态码</li>
                    <li class="clearfix">
                        <label class="icon_wz"><span class="zc-iyzm"></span></label>
                        <span class="fl"><input id="yzm_float" class="zc-iptsht t_val" type="text" value="输入验证码" maxlength="6"></span>
                        <span class="pic-yzm fr"><img id="yzmImg_float" src="" width="108px" height="36px"><i id="fresh_float" class="zc-fresh"></i></span>
                    </li>
                </ul>
				<ul class="login_sub">
					<li class="pt5"><input type="submit" class="zc-btn btn-login" value="确认" id="yzmconfirm"></li>
					<li><div class="zc_login_rbox" id="yzmcancel">取消</div></li>
				</ul>
            </div>
        </div>
    </div>
</div>	
	
<div class="zc_righttool"></div>
<div class="zc_tool">
	<ul class="ulbox">
                    <li class="libox p-re" id="rtoolasset">
                <a href="https://mycar.zuche.com/queryPoint/queryAllPoint.do" class="abox"><span class="zc_asset_i"></span>资<br>产<span id="couponRedPoint"></span></a>
                <div class="zc_tool_asset" style="display:none;">
                    <div class="a_notlogin" id="rightMemberInfoNl">
                        <div class="rightsj">◆<span class="arrowicon">◆</span></div>
                        <div>哎呀，您还真是未登录呢！<br>登录后便可查看资产信息</div>
                        <div class="pt15"><a href="javascript:void(0);" class="zc_yell_w80">登录</a></div>
                    </div>
                    <div class="a_login" style="display:none;" id="rightMemberInfoL">
                        <div class="rightsj">◆<span class="arrowicon">◆</span></div>
                        <div class="coupon-box">
                            <div class="tbox"></div>
                            <div class="cenbox" onclick="javascript:void(0);" id="couponNum">
                                <ul>
                                    <li class="line"><span>您有</span></li>
                                    <li class="number"><span id="couponCount"></span>张</li>
                                    <li class="f14">租车券在召唤您使用 ></li>
                                </ul>
                            </div>
                            <div class="bbox"></div>
                        </div>
                        <div class="jfczk-box">
                            <a href="javascript:void(0);" style="border-left:none;" id="rentcoinNum">
                                <b id="point"></b>
                                <span>可用积分 <i id="rentcoinRedPoint"></i></span>
                            </a>
                            <a href="https://mycar.zuche.com/queryAccount/queryAccount_detail.do">
                                <b id="giftcardCount"></b>
                                <span>储值卡</span>
                            </a>
                        </div>
                    </div>
                </div>
            </li>
        <li class="libox p-re" id="rtoolorder" >
            <a href="https://mycar.zuche.com/queryOrder/queryOrder.do" target="_Blank" class="abox" ><span class="zc_record_i"></span>订<br>单<span class="zc_nont_ory"></span><span class="zc_has_ory" style="display:none;"></span></a>
            <div class="zc_tool_order" style="display: none;">
                <div class="p-re" id="orderQueryResult">
				
                </div>
            </div>
        </li>
        <li class="libox p-re" id="rtoolphone">
            <a href="https://shouji.zuche.com/" target="_blank" class="abox"><span class="zc_phone_i" ></span>手<br>机<br>版</a>
            <div class="zc_tool_phone" style="display:none ">
                <div class="p-re">
                    <div class="rightsj">◆<span class="arrowicon">◆</span></div>
                    <div class="rtoolphone">
                        <img src="https://image.zuchecdn.com/newversion/news/common/indexqcode.png" width="120" height="120" class="qcode">
                        <p>扫描二维码下载</p><p>神州租车手机版</p>
                        <a href="https://itunes.apple.com/cn/app/id454685734?mt=8" rel="nofollow" target="_blank" class="rtooldownbut">iPhone 版下载</a>
                        <a href="https://static.zuchecdn.com/download/SZZC.apk" rel="nofollow" target="_blank" class="rtooldownbut">Android 版下载</a>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</div>
<script id="order_detailInfo" type="text/x-jsrender">
<div class="rightsj">◆<span class="arrowicon">◆</span></div>
    <dl>
        <dt><p>{{:vehicleModeName}}</p><div class="frr">订单状态：<span style="color:{{:orderStateColor}};">{{:orderStatusName}}</span></div></dt>
        <dd class="carimg">
            <img src="{{:imgUrl}}" width="132" height="76">
        </dd>
        <dd class="carinfor" style="cursor:pointer;" title="查看订单详情" id="carinfor">
            <div class="p-re">
                <span class="zc_qu_i">取</span>
                <p>{{:leaseCityName}} - {{:leaseDeptName}}</p>
                <p class="time">{{:leaseDate}}</p>
            </div>
            <div class="p-re mt5">
                <span class="zc_huan_i">还</span>
                <p>{{:returnCityName}} - {{:returnDeptName}}</p>
                <p class="time">{{:returnDate}}</p>
            </div>
        </dd>
        <dd class="but_box"><a href="https://mycar.zuche.com/queryOrder/queryOrder.do" target="_Blank">查看更多</a> </dd>
    </dl>
</script>
<script id="order_notLogin" type="text/x-jsrender">
<div class="rightsj">◆<span class="arrowicon">◆</span></div>
<div class="zc_tool_notlogin">
    <div>哎呀，您还未登录呢！<br>登录后便可查看进行中订单状态</div>
    <div class="pt15" id="firstpage_login"><a href="javascript:void(0);" class="zc_yell_w80" >登录</a></div>
</div>
</script>
<script id="order_emptyList" type="text/x-jsrender">
<div class="rightsj">◆<span class="arrowicon">◆</span></div>
<div class="zc_tool_zuche">
    <div>哎哟，来都来了，不租辆车吗？</div>
    <div class="pt15"><a href="https://order.zuche.com" class="zc_yell_w80" >立即租车</a></div>
</div>
</script>

<div class="zc_foottool">
    <ul>
        <li>
            <a href="javascript:void(0);" onclick="javascript:window.open('http://p.qiao.baidu.com/cps/chat?siteId=1401017&userId=3812987','newwindow','toolbar=no,scrollbars=yes,resizable=no,top=50%,left=50%,width=800,height=600');">
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
<script type='text/javascript' id='bdshell_js'></script> 	
<div id='doorDiv' class="door d_none popup_block" mask-data="#?w=860">
	<div class="door-title" style=""><span id="doorTitleSpan">送车上门地址</span>
	    <a id="btclose" style="cursor: pointer;" class="close maskclose"></a>
	</div>
	<div class="door-intro">
		<p id="doorIntroP">
			</p>
	</div>
	<div class="door-address">
		<div class="door-search">
		    <div class="search-con">
		    	    <input type="button" class="btn-search btn-srch" value="">
		    		<input id="searchTextShowVal" type="text" class="btn-text btn-srch"  defalutValue="">
		    		<input id="searchText" type="hidden" value="输入地址搜索周边门店">
		    		<input type="button" class="btn-delete btn-srch" value="" id="deleteTextBtn">
		    		<div class="white_close">×</div>
		    	<a href="javascript:" class="collect" id="collect"> 常用地址<i class="down"></i></a>
		    	<div class="down-icon"></div>
		    </div>
		    <div class="address-con" id="search-part">
		    </div>
		    <div class="address-con" id="collect-part" style="display:none">
		    </div>
		     <div class="address-con no-scroll" id="collect-none" style="display:none">
		    	<div class="btn-empty"></div>
		    	<p class="null_text">您还没有使用过的取/送车地址，或自己设定的<br>常用地址。</p>
		    </div>
		</div>
		<div class="door-map" id="map_div2">
		</div>
	</div>
	<input type="hidden" id="sentOrPickType">
	<input type="hidden" id="defalutDepAddress">
	<input type="hidden" id="defalutCityId">
	<input type="hidden" id="pickAddressDetail">
    <textarea id="J_gaodemapLoad" style="display:none;">
        <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=e085d5bf9b27a540a2d6ab8ce64c9365"></script>
    </textarea>
</div>
<script id="poisTemplate" type="text/x-jsrender">
<ul id="loca_ul_favorites">
	{{for poisList}}
		{{if isSel}}
					<li lng="{{>location.getLng()}}" lat="{{>location.getLat()}}" address='{{>address}}' name='{{>name}}' class="current">
		    			<i class="loca"></i>
		    			<div class="item-con">
		    				<div class="title">
		    					{{>name}}<i class="star{{if starFlag && (starFlag == 'hasStar')}} star-on{{/if}}"></i>
		    				</div>
		    				<p class="addr-detail">{{>address}}</p>
		    				<a href="javascript:void(0);" class="btn-submit" style='text-decoration:none;'>确认地址</a>
		    			</div>
		    		</li>
		{{else}}
					<li lng="{{>location.getLng()}}" lat="{{>location.getLat()}}" address='{{>address}}' name='{{>name}}'>
		    			<i class="loca"></i>
		    			<div class="item-con">
		    				<div class="title">
		    					{{>name}}<i class="star{{if starFlag && (starFlag == 'hasStar')}} star-on{{/if}}"></i>
		    				</div>
		    				<p class="addr-detail">{{>address}}</p>
		    				<a href="javascript:void(0);" class="btn-submit" style='text-decoration:none;'>确认地址</a>
		    			</div>
		    		</li>
		{{/if}}
	{{/for}}
</ul>
</script>
<script id="poisFavoritesTemplate" type="text/x-jsrender">
<ul id="loca_ul">
	{{for poisFavoritesList}}
		<li lng="{{>location.getLng()}}" lat="{{>location.getLat()}}" address='{{>address}}' name='{{>name}}'>
			<i class="loca"></i>
		    <div class="item-con">
		    	<div class="title">
		    			{{>name}}<i class="star star-on"></i>
		    	</div>
		    	<p class="addr-detail">{{>address}}</p>
		    	<a href="javascript:void(0);" class="btn-submit" style='text-decoration:none;'>确认地址</a>
			</div>
		</li>
	{{/for}}
</ul>
</script>
	
	<div id="indexmovePopularize" class="indexmovePopularize d_none">
		<div class="popularizeimg">
			<div class="p-box">
				<a href="https://shouji.zuche.com/" target="_blank" class="popularizeurl">&nbsp;</a>
				<a href="javascript:fun_close();" class="popularizeclose">&nbsp;</a>
			</div>
		</div>
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
</script>	<script>
		var __currentdatetime = '2017-12-19 11:35:23';
		var pageSystemDate='2017-12-19 11:35:23';
		var __nextdatetime = '2017-12-20';
		var __next2datetime = '2017-12-22';
		var priceLevel='1';//动态加载上门取车价格用
		//长租城市名称，id
		var quCheCityName = "";
			var quCheCityId = "";
		
		seajs.use(['divided/som/entry/jQ@a576d97fa6','divided/som/entry/lib@0e5c12d914'],function(){
			seajs.use('divided/som/entry/index@8da523285f');
		});
		function resetclickpositon(position){
			$("#clickpositon").val(position);
		}
</script>
</body>
</html>