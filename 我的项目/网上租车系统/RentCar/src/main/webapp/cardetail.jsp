<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <title>MyHtml.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/extend.js"></script>
    <script type="text/javascript">
       $(function(){
            var cid=1;
            var bid=1;
            var tid=4; 
		    var  item1=null; 
            var  item2=null;    
		       $.ajax({
		          url:"findcar.do",
		          data:{cid:cid,bid:bid,tid:tid},
		          type:"post",
		          success:function(result){
		               $.each(result.data,function(i,item){
			               item1=item[0];
			               item2=item[1];
			               alert(item1.roz);
					  var   li='<p class="orderCarInfor-title"><b>当前位置：</b><a href="https://www.zuche.com" style="color:#61a1df;">神州租车 </a>&gt;<a href="https://order.zuche.com/order/OrderSecondControl.do" style="color:#61a1df;">短租自驾</a>&gt; <span>'+item1.carname+'/'+item1.displacement+'</span></p>'
						    li+='<div class="fl carInfor-left"><h1>'+item1.carname+'/'+item1.displacement+'</h1>'
						    li+='<div id="ifocus"><div id="ifocus_pic"><div id="ifocus_piclist" style="left:0; top:0;">'
						    li+='<ul><li><img src="https://image.zuchecdn.com/newversion/mode/833_a.jpg"></li>'
						    li+='<li><img src="https://image.zuchecdn.com/newversion/mode/833_b.jpg"></li>'
						    li+='<li><img src="https://image.zuchecdn.com/newversion/mode/833_c.jpg"></li>'
						    li+='<li><img src="https://image.zuchecdn.com/newversion/mode/833_d.jpg"></li></ul>'
						    li+='</div></div><div id="ifocus_btn">'
						    li+='<ul><li class="current"><img src="https://image.zuchecdn.com/newversion/mode/833_a.jpg"></li>'
							li+='<li class="normal"><img src="https://image.zuchecdn.com/newversion/mode/833_b.jpg"></li>'
							li+='<li class="normal"><img src="https://image.zuchecdn.com/newversion/mode/833_c.jpg"></li>'
							li+='<li class="normal"><img src="https://image.zuchecdn.com/newversion/mode/833_d.jpg"></li>'
							li+='</ul></div></div><h2><span>'+item1.carname+'</span>租车基本信息</h2>'
							li+='<ul class="carInfor-xj clearfix"><li><b class="pp">&nbsp;</b>品　　牌：<span>'+item2.brandName+'</span></li>'
							li+='<li><b class="cx">&nbsp;</b>车　　系：<span>'+item1.carname+'</span></li>'
							li+='<li class="nonebd"><b class="pzk">&nbsp;</b>配 置 款：<span>领先型</span></li></ul>'
							li+='<h2><span>'+item1.carname+'</span>租车配置信息</h2><ul class="carInfor-xj clearfix">'
							li+='<li><b class="zws">&nbsp;</b>座 位 数：<span>'+item1.seating+'</span></li>'
							li+='<li><b class="rllx">&nbsp;</b>燃料类型：<span>'+item1.fuelType+'</span></li>'
							li+='<li><b class="pl">&nbsp;</b>排　　量：<span>'+item1.displacement+'</span></li>'
							li+='<li><b class="rybh">&nbsp;</b>燃油标号：<span>'+item1.roz+'</span></li>'
							li+='<li><b class="yxrl">&nbsp;</b>油箱容量：<span>'+item1.fuelTank+'</span></li>'
							li+='<li class="nonebd"><b class="gps">&nbsp;</b>GPS导航：<span>'+item1.gps+'</span></li></ul>'
							li+='<div class="ac pt20"><input type="button" id="button" value="立即预订" class="btn_bluewauto f16 white toBok"></div><br >'
						    var $li=$(li);
						   $li.data("cid",item1.id);
						   $("#cardetail").append($li);  
		          })
		          
				        $.ajax({
			             url:"findsameprice.do",
			             data:{price:item1.price,id:item1.id},
			             type:"post",
			             resultType:"json",
			             success:function(result){
			                 if(result.data==null){
				                  li='<h2>同等级别车型推荐</h2><div class="carInfor-xj-a pl20">暂无数据</div> </div>';
			                 
			                 }else{
			                     $.each(result.data,function(i,car){
				                       li='<h2>同等级别车型推荐</h2><div class="carInfor-xj-a pl20">'
				                          li+='<ul><li><img src="https://image.zuchecdn.com/newversion/news/order/excelle.jpg"></li></ul></div></div>'
				                       var $li=$(li);
									   $li.data("cid",item1.id);
									   $("#cardetail").append($li);
			                     })
			                 }
			          
			             }
				       
				       
		               })
		       
		 
		    }   
		       
		       
       })
       
       
       
       $("#cardetail").on("click","button")
       
    })   
    </script>
  </head>
  
 <input type="hidden" id="currentDateStr" name="currentDateStr" value="2017-12-20 10:42">
<script type="text/javascript">
	/* var carwrmURL='https://static.zuchecdn.com'; */
	var carwrmjsURL = 'https://js.zuchecdn.com'; 
	/*var carwrmimageURL = 'https://image.zuchecdn.com'; */
	var carwrmcssURL = 'https://css.zuchecdn.com';
	var carwcmsURL='https://huodong.zuche.com';
	var carwdmURL = "https://service.zuche.com";
   /*  var carwlomURL = "https://changzu.zuche.com";
	var carwepmURL='https://carbusiness.zuche.com';
	var carwlmURL='https://passport.zuche.com';
	var carwmmURL = "https://mycar.zuche.com";
	var carwsomURL='https://www.zuche.com';
	var enURL='https://en.zuche.com';
	var orderURL='https://order.zuche.com';
	var leasingURL='https://leasing.zuche.com';
	var easyrideURL='https://easyride.zuche.com';
	var serviceURL='https://service.zuche.com';
	var protocol='https://';  */
</script><script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/seajs/sea.js?v=201409301800"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/seajs/seajs-preload.js?v=201409301800"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/seajs/seaconfig.js?v=2014093018001"></script><link href="https://css.zuchecdn.com/newversion/news/zc_global.css?v=201506301600" rel="stylesheet" type="text/css">
<input type = "hidden" id="sessionOrderProcess" value = ''>
<input type = "hidden" id="sessionOrderFirstorderNo" value = ''>
<input type = "hidden" id="sessionOrderFirstOrderId" value = ''>
<input type = "hidden" id="mebId" value = ''>
<script type="text/javascript">
	seajs.use(['jspath/som/common/exist_order_update','jspath/common/header']);	
</script>
<form action="https://passport.zuche.com/memberManage/xtoploginMember.do" id="loginTopForm" target="_parent" method="post">
	<input type="hidden" id="act" name="act" value="loginSys"/>
	<input type="hidden" id="historyLocation" name="historyLocation" />
</form>
<div class="zc_head_bd">
    <div class="zc_main">
        <a href="https://www.zuche.com" class="zc_logo" alt="神州租车"></a>
        <ul class="zc_menu">
            <li >
           	 	<a href="#" >首页</a>
            </li>
            <li >
            	<a href="#" >上门取送</a>
            </li>
            <li >
            	<a href="#" >到店取还</a>
            </li>
            <li >
            	<a href="h#" >长租</a>
            </li>
            <li >
           		<a href="#" >企业租车</a>
            </li>
            <li >
            	<a href="#" >顺风车</a>
            </li>
            <li >
            	<a href="#" >门店</a>
            </li>
            <li>
            	<a href="#" >活动</a>
            </li>
            <li >
           		<a href="#" >国际租车</a>
           	</li>
        </ul>
        <div class="zcindex_login" >
            <div class="wdl" id="notLogin">
                <a href="javascript:void(0);" class="colfabe00" id="loginBT" >登录</a>
                <b>/</b>
                <a href="#" class="colfabe00" >注册</a>
                <a href="#" class="colc8c8ce ml20" >我的神州</a>
            </div>
            <div class="ydl"  style="display: block;" id="alreadyLogin">
                <h1 id="topLoginName" ></h1>
                <div class="zc_index_my">
                    <a href="#" class="top">我的神州<i class="zc_ordown"></i></a>
                    <div class="contmyszlist">
                    <div class="p-re">
                            <span class="y">◆</span>
                            <a href="#" class="bhpr reddot"  >我的订单
                            </a>
                            <a href="#">我的资产</a>
                            <a href="#">我的账户</a>
                            <a href="#" >退出登录</a>
                        </div>
                    	</div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="zc_phone_bd">
            <div class="p-re zc_p_h">
                <span class="zc-tel"></span>
                <div class="zc_ga_phonebox"><img src="#" alt="港澳台及海外电话861058209555"></div>
            </div>
        </div>
    </div>
</div><link href="https://css.zuchecdn.com/newversion/global.css?v=201506301600" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/newversion/order.css?v=201506301600"/>
<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/newversion/cityport_blue.css?v=201506301600"/>
<style>
	input[type="text"]#loginName,
	input[type="text"]#passwordtext, 
	input[type="password"]#loginPassword{
		width:201px;
		padding:0 10px;
	}
	.loginbut{
		padding-left:45px;
	}
</style>


<div class="orderDetails" style="padding-bottom:35px;" id="cardetail">
	<!-- <p class="orderCarInfor-title"><b>当前位置：</b><a href="#" style="color:#61a1df;">神州租车 </a>&gt;<a href="#" style="color:#61a1df;">短租自驾</a>&gt; <span>
			2016别克昂科拉/SUV/1.4T自动</span></p>
	
	<div class="fl carInfor-left">
		<h1>
		<input type="button" value="立即预订" class="btn_bluewauto f16 fr white toBok" style="margin-top:12px;">
		2016别克昂科拉/SUV/1.4T自动</h1>
		<div id="ifocus">
		 <div id="ifocus_pic">
		  <div id="ifocus_piclist" style="left:0; top:0;">
		   <ul>
		   <li><img src="https://image.zuchecdn.com/newversion/mode/833_a.jpg"></li>
			<li><img src="https://image.zuchecdn.com/newversion/mode/833_b.jpg"></li>
			<li><img src="https://image.zuchecdn.com/newversion/mode/833_c.jpg"></li>
			<li><img src="https://image.zuchecdn.com/newversion/mode/833_d.jpg"></li>
		   </ul>
		  </div>
		 </div>
		 <div id="ifocus_btn">
		  <ul>
			<li class="current"><img src="https://image.zuchecdn.com/newversion/mode/833_a.jpg"></li>
		   <li class="normal"><img src="https://image.zuchecdn.com/newversion/mode/833_b.jpg"></li>
		   <li class="normal"><img src="https://image.zuchecdn.com/newversion/mode/833_c.jpg"></li>
		   <li class="normal"><img src="https://image.zuchecdn.com/newversion/mode/833_d.jpg"></li>
		  </ul>
		 </div>
		</div>
		<h2><span>
		昂科拉</span>租车基本信息</h2>
		<ul class="carInfor-xj clearfix">
			<li><b class="pp">&nbsp;</b>品　　牌：<span>
			别克</span></li>
			<li><b class="cx">&nbsp;</b>车　　系：<span>
				昂科拉</span></li>
			<li class="nonebd"><b class="ndk">&nbsp;</b>年 代 款：<span>
			2016</span></li>
			<li class="nonebd"><b class="pzk">&nbsp;</b>配 置 款：<span>
				领先型</span></li>
		</ul>
		<h2><span>昂科拉</span>租车配置信息</h2>
		<ul class="carInfor-xj clearfix">
			<li><b class="zws">&nbsp;</b>座 位 数：<span>
				5</span></li>
			<li><b class="cms">&nbsp;</b>车 门 数：<span>
						5</span></li>
			<li><b class="rllx">&nbsp;</b>燃料类型：<span>
			汽油</span></li>
			<li><b class="bsxlx">&nbsp;</b>变速箱类型：<span>
				AT</span></li>
			<li><b class="pl">&nbsp;</b>排　　量：<span>1372</span></li>
			<li><b class="rybh">&nbsp;</b>燃油标号：<span>
				92-93汽油</span></li>
			<li><b class="qdfs">&nbsp;</b>驱动方式：<span>
				前驱</span></li>
			<li><b class="fdjjqxs">&nbsp;</b>发动机进气形式：<span>
				涡轮增压</span></li>
			<li><b class="tc">&nbsp;</b>天　　窗：<span>
				单天窗</span></li>
			<li><b class="yxrl">&nbsp;</b>油箱容量：<span>
				53</span></li>
			<li><b class="yx">&nbsp;</b>音　　箱：<span>
				7</span></li>
			<li><b class="zy">&nbsp;</b>座　　椅：<span>
				织物座椅</span></li>
			<li><b class="tc">&nbsp;</b>倒车雷达：<span>
				无</span></li>
			<li><b class="qin">&nbsp;</b>气　　囊：<span>
			4</span></li>
			<li class="nonebd"><b class="dvd">&nbsp;</b>DVD / CD：<span>
				CD</span></li>
			<li class="nonebd"><b class="gps">&nbsp;</b>GPS导航：<span>
				无</span></li>
			</ul>
		<div class="ac pt20"><input type="button"  value="立即预订" class="btn_bluewauto f16 white toBok"></div>
		<h2>同等级别车型推荐</h2>
			<div class="carInfor-xj-a pl20">
				暂无数据
				<tr>
				   <td><img  src="https://image.zuchecdn.com/newversion/mode/833_a.jpg" id="button"></td>
				   <td><img  src="https://image.zuchecdn.com/newversion/mode/833_a.jpg" id="button"></td>
				</tr>
			</div> -->
		<!--  </div> -->
	
	<div class="fr" style="width:301px">



		

	<!-- 	<div class="orderBoxBlue m20_0">
		
			
            <ul class="clearfix">
                <li class="f16" style="height:auto;padding-left:16px; line-height:46px;color:#333;">
               		 特价专区
               		<input type="text" value="" name="pickupcity" id="pickupcity" class="w198 citySD citySelection graybde2 bluewords" style="width:253px;height:18px;" link-input="deptCityId">
            		<input type="hidden" id="deptCityId" value=""/>
                </li>
            </ul>
            
            
            
				<ul class="hdCar clearfix tjzq tjzqLeft" id="specileCarListUl">
				</ul>
				
				<div class="ac p10_0"><a style="display:block;" id='specileMoreA' href="javascript:void(0);"><img src="https://image.zuchecdn.com/newversion/common/activenotcar.jpg"></a></div>
				
          </div> -->
          
          

<script id="specileCarListTemplate" type="text/x-jsrender">
	{{if specialCarList}}
		{{for specialCarList}}
			{{if #index < 5}}
				<li class="fl">
			    	<a href="https://order.zuche.com/specialCar{{>key}}.html">
				    	<img src="{{>picture}}" alt="{{>name}}" class="fl">
					    <div class="activelistcarinfor">
					    	<p class="f14w line_h24 ar d_block">{{>name}}</p>
					        <p class="ar d_block clearfix" style="height:30px;">
				            	<span class="sz_priceOrange fr">
				                	<em class="rmb">¥</em>
				                    <em class="num">{{>carPrice}}</em>
				            	</span>
				         	</p>
					        <p class="f14w ar d_block">{{>formatBeginDate}}</p>
					 	</div>
					</a>
				</li>
			{{/if}}
		{{/for}}
	{{/if}}
</script>


</div>	
<div class="clear"></div>
</div>
<input type="hidden" id='shortModeId' value='840'>
<input type="hidden" id='shortModeName' value='2016别克昂科拉/SUV/1.4T自动'>
<input type="hidden" id='levelId' value=''>
<input type="hidden" id='bookCity' value="30">
<input type="hidden" id='fromUrl' value="carList">
<input type="hidden" id='convenienceId' value="">
<input type="hidden" id='lowestPriceFlag' value="0">
<input type="hidden" id='stockFlag' value="1">
<input type="hidden" id='limit' value="">


<form name="orderForm" id="orderForm" method="post">
	<input type="hidden" name="brandId" id="brandId" value="0"/>
	<input type="hidden" name="vehicleTypeId" id="vehicleTypeId" value="0"/>
	<input type="hidden" name="maxPrice" id="maxPrice" value="0"/>
	<input type="hidden" name="sortField" id="sortField" value="standAvePrice"/>
	<input type="hidden" name="sortType" id="sortType" value="ASC"/>
	<input type="hidden" name="memberId" id="memberId" value=""/>
	<input type="hidden" name="memberLevel" id="memberLevelVal" value=""/>
	<input type="hidden" name="memberState" id="memberState" value=""/>
	<input type="hidden" name="credit" id="credit" value=""/>
	<input type="hidden" name="identitycloseday" id="identitycloseday" value=""/>
	<input type="hidden" name="identityCardType" id="identityCardType" value=""/>
	<input type="hidden" id="senttype" name="senttype" value="0"/>
	<input type="hidden" id="picktype" name="picktype" value="0"/>
	<input type="hidden" id="fromCityId" name="fromCityId" value="30"/>
	<input type="hidden" id="toCityId" name="toCityId" value="30"/>
	<input type="hidden" id="fromTime" name="fromTime" value="2017-12-21 10:00"/>
	<input type="hidden" id="fromEndTime" name="fromEndTime" value=""/>
	<input type="hidden" id="fromDate" name="fromDate" value="2017-12-21"/>
	<input type="hidden" id="fromHour" name="fromHour" value="10"/>
	<input type="hidden" id="fromMinute" name="fromMinute" value="00"/>
	<input type="hidden" id="rentDay" name="rentDay" value="2"/>
	
	<input type="hidden" id="toTime" name="toTime" value="2017-12-23 10:00"/>
	<input type="hidden" id="toDate" name="toDate" value="2017-12-23"/>
	<input type="hidden" id="toHour" name="toHour" value="10"/>
	<input type="hidden" id="toMinute" name="toMinute" value="00"/>
				
	
	<input type="hidden" id="fromStoreId" name="fromStoreId" value="178"/>
	<input type="hidden" id="fromStoreName" name="fromStoreName" value="武宿机场店"/>
	
	<input type="hidden" id="toStoreId" name="toStoreId" value="178"/>
	<input type="hidden" id="toStoreName" name="toStoreName" value="武宿机场店"/>
	
	<input type="hidden" id="toStockStoreId" name="toStockStoreId" value="178"/>
	<input type="hidden" id="fromStockStoreId" name="fromStockStoreId" value="178"/>
	<input type="hidden" id="subleaseDeptId" name="subleaseDeptId" value=""/>
	<input type="hidden" id="subreturnDeptId" name="subreturnDeptId" value=""/>
	<input type="hidden" id="pickAddress" name="pickAddress" value=""/>
	<input type="hidden" id="sentAddress" name="sentAddress" value=""/>
	<input type="hidden" id="priceLevel" name="priceLevel" value="1"/>
	<input type="hidden" id="fromIndexPackage" name="fromIndexPackage" value=""/>
	
	
	<input type="hidden" id="modeId" name="modeId" value=""/>
	<input type="hidden" id="modeName" name="modeName" value=""/>
	<input type="hidden" id="isSendMoney" name="isSendMoney" value=""/>
	<input type="hidden" id="vehicleLevel" name="vehicleLevel" value=""/>
	<input type="hidden" id="isLevelOrder" name="isLevelOrder" value=""/>
	<input type="hidden" id="isLevelChangeDep" name="isLevelChangeDep" value=""/>
	
	<input type="hidden" id="workdayPackage_notify" name="workdayPackage_notify" value=""/>
	<input type="hidden" id="isLongRent" name="isLongRent" value="0"/>
		<input type="hidden" name="checkMemberId" id="checkMemberId" value=""/>
</form>


<div id="dialogLogin" class="d_none popup_block" mask-data="#?w=328" style="font-size: 1em;height:285px;">
	<div class="login_info" style="height:285px;">
	    <h2>欢迎登录</h2>
	    <ul>
	        <li>
	            <label>账&#12288;号 </label>
	            <label><input name="loginName" id="loginName" value="手机号/证件号" default-value='手机号/证件号' type="text" class="w220 t_val"></label>
	        </li>
	        <li>
	            <label>密&#12288;码 </label>
	            <label>
	            	<input type="password" onblur="passwordBlur()" name="loginPassword" id="loginPassword" value="" type="text" class="w220 t_val" style="display: none;"><input  type="text" onfocus="textFocus()" value="请输入密码" class="w220" id="passwordtext">
	            </label>
	        </li>
	       	<li id="imageYzmLi" style="display:none">
	            <label>验证码 </label>
	            <label><input name="yzmVal" id="yzmVal" value='请输入右侧验证码' type="text" class="w220 t_val" style="width:111px;padding:0px 5px" maxlength="6"></label>
	            <span class="pic-yzm" style="width:91px;height:31px;"><img id="yzmImg" src="" width="90px" height="31px"></span>
	        </li>
	    </ul>
	    <div class="loginbut">
	        <div class="red f12 rebwrong_icon loginMsg">
	        </div>
	        <div class="pt20"><input onclick="gotologin()" type="button" value="登 录" class="btn_bluewauto loginipt" ></div>
	        <div class="pt10">
	            <input name="readpwd" id="readpwd" type="checkbox" value="1" onclick="setRemberPasswordState(this.checked)"  checked="checked"  > 自动登录         
	             | &nbsp;<a href="https://passport.zuche.com/member/loginandregist/getpassword.do">忘记密码？</a>
	             | &nbsp;<a href="javascript:register()" class="reg">免费注册</a>
	        </div>
	    </div>
	</div>
</div>
<script>
 	seajs.use(['jspath/cms/about_us/loginDialog']);
 </script><div class="zc_footmenu bgf">
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


<div class="zc_footcopyright clfoot">
    <div class="zc_main">
        <div class="ainfor">
            <a title="关于我们" href="https://huodong.zuche.com/gywm/">关于我们</a>
            <a title="投资者关系" target="_blank" href="https://ir.zuche.com">投资者关系</a>
            <a target="_parent" title="新闻中心" href="https://news.zuche.com/">新闻中心</a>
            <a title="加盟合作" target="_blank" href="https://jiameng.zuche.com">加盟合作</a>
            <a title="隐私保护" target="_parent" href="https://huodong.zuche.com/ysbh/">隐私保护</a>
            <a title="网站导航" target="_parent" href="https://help.zuche.com/sitemap/">网站导航</a>
            <a title="联系我们" target="_parent" href="https://huodong.zuche.com/lxwm/">联系我们</a>
            <a title="招贤纳士" target="_blank" href="http://hr.zuche.com/">招贤纳士</a>
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
</div>
 <script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/common/bdshare.js?v=201409301800" ></script><script type="text/javascript">
	var pageSystemDate='2017-12-20 10:42';
	var minDate = '2017-12-20';
	var maxDate = '2018-02-18';
	var currentDate = '2017-12-20';
	seajs.use(['jspath/jquery/jquery.cityport','jspath/jquery/jquery.hoverdelay','jspath/common/jsrender',
	           'jspath/som/order/ordercommon','jspath/som/order/carimgexhibition','jspath/som/order/car_list_records',
	           'jspath/som/order/car_special_price','jspath/som/order/car_info_detail']);
</script>
</body>
</html>
