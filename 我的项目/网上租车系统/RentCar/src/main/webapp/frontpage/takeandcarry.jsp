<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>短租自驾，短期租车，自驾预订—神州租车——全球租车领导品牌</title>
<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/divided/som/entry/main@9737215007.css" />
     <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
     <script type="text/javascript" src="../js/carlist.js"></script>
     <script type="text/javascript">
     	$(function(){
     		
     		//取车搜素
     		$("#sent_Address").click(function(){
     			$("#city_tips_info").empty();
     			$("#city_down_tips").attr("style","left: 373px; top: 120px; min-width: 212px; display: none;")
     			$("#city_down_tips").show();   			
     		});
     		$("#sent_Address").blur(function(){
     			$("#city_tips_info").empty();
     			$("#city_down_tips").hide();
     		});    		   		

     		$("#sent_Address").keydown(function(event){
     			var search = $("#sent_Address").val();
     			var code = event.keyCode;
     			if(code==13){
     				$("#city_tips_info").empty();
     				$.ajax({
     					url:"http://localhost:8080/RentCar/address.do",
     					dataType:"json",
     					method:"post",
     					data:{address:search},
     					success:function(result){
     				if(result.state==1){
     					var list = result.data;
     				    $.each(list,function(i,item){
     				    $("#a_error_info").html('名称/地址含"'+search+'"的门店');
     	   var li='<li t_id="1" deptype="300" code="214" ismergedept="0" ischain="0">'
     		   li+='<div class="f-left">'+item.address+'</div><div class="f-right"></div></li>'
     		   $li=$(li);
     		   $("#city_tips_info").append($li);
     				})
     				                   }else{
     				                   	var list = result.data;
     				    $.each(list,function(i,item){
     				    $("#a_error_info").html("很抱歉没有收到对应门店");
     	   var li='<li t_id="1" deptype="300" code="214" ismergedept="0" ischain="0">'
     		   li+='<div class="f-left">'+item.address+'</div><div class="f-right"></div></li>'
     		   $li=$(li);
     		   $("#city_tips_info").append($li);
     				                   });
     					}

     				}
     				
     			});

     		}
     	});





     		//还车搜索
     		$("#get_Address").click(function(){
     			$("#city_tips_info").empty();
     			$("#city_down_tips").attr("style","left: 373px; top: 170px; min-width: 212px; display: none;")
     			$("#city_down_tips").show();
     		});
     		$("#get_Address").blur(function(){
     			$("#city_tips_info").empty();
     			$("#city_down_tips").hide();
     		});
     		$("#get_Address").keydown(function(event){
     			var search = $("#get_Address").val();
     			var code = event.keyCode;
     			if(code==13){
     				$("#city_tips_info").empty();

     				$.ajax({
     					url:"http://localhost:8080/RentCar/address.do",
     					dataType:"json",
     					method:"post",
     					data:{address:search},
     					success:function(result){
     				if(result.state==1){  
     					var list = result.data;
     				    $.each(list,function(i,item){
     				    $("#a_error_info").html('名称/地址含"'+search+'"的门店');
     	   var li='<li t_id="1" deptype="300" code="214" ismergedept="0" ischain="0">'
     		   li+='<div class="f-left">'+item.address+'</div><div class="f-right"></div></li>'
     		   $li=$(li);
     		   $("#city_tips_info").append($li);
     				})
     				                   }else{
     				                   	var list = result.data;
     				    $.each(list,function(i,item){
     				    $("#a_error_info").html("很抱歉没有收到对应门店");
     	   var li='<li t_id="1" deptype="300" code="214" ismergedept="0" ischain="0">'
     		   li+='<div class="f-left">'+item.address+'</div><div class="f-right"></div></li>'
     		   $li=$(li);
     		   $("#city_tips_info").append($li);

     				                   });
     					}

     				}
     				
     			});

     		}
     	});


     		//搜索车

     		
     		


     		     //根据车型搜索车
     		$(".chexing li a:gt(0)").click(function(){
     			var flag=true;
     			$("#first").attr("class","");
     			if($(this).hasClass("checked")){
     				$(this).attr("class","");
     			}else{
     		            $(this).addClass("checked");
     	              }
     	        if($(".chexing li a:gt(0)").hasClass("checked")){
     	        	flag=false;
     	        }
     	        if(flag){
     	        	$("#first").addClass("checked");
     	        }
     		//发送ajax
     		$(".carList").empty() 
     		loadCar();



     		 			
     		});
//不限类型
     		$("#first").click(function(){
     			$(".chexing li a:gt(0)").attr("class","");
     			$(this).addClass("checked");

     		//发送ajax
     		$(".carList").empty() 
     		loadCar();
     		});

//根据价格搜索车

     		$(".pri_range li a:gt(0)").click(function(){
     			var flag=true;
     			$("#no_need").removeClass("checked");
     		$("#search_price").removeClass("price1")
     			if($(this).hasClass("checked")){
     				$("#search_price").removeClass("price"+(parseInt($(this).attr("data"))+1));
     				$(this).removeClass("checked")
     			}else{
     			$("#search_price").addClass("price"+(parseInt($(this).attr("data"))+1));
     			$(this).addClass("checked");
     		}
     		if($(".pri_range li a:gt(0)").hasClass("checked")){
     	        	flag=false;
     	        }
     	     if(flag){
     	     	$("#no_need").addClass("checked");
     		$("#search_price").addClass("price1");

     	     }   



     		//发送ajax
     		$(".carList").empty() 
     		loadCar();
     		
    		 			
     		});

     		
//不限价格
     		$("#first_price").click(function(){
     			$(".pri_range li a:gt(0)").removeClass("checked");
     			$("#search_price").attr("class","cl-lbox bdbtm orderRent price1");
     			$(this).addClass("checked");

     		//发送ajax
     		$(".carList").empty() 
     		loadCar();


     		});




//根据品牌搜索车

     		$(".car_brand li a:gt(0)").click(function(){
     			var flag=true;
     			$("#search_title").removeClass("checked");
     			if($(this).hasClass("checked")){
     				$(this).removeClass("checked");
     			}else{
     				$(this).addClass("checked");
     			}

     			if($(".car_brand li a:gt(0)").hasClass("checked")){
     	        	flag=false;
     	        }
     	        if(flag){
     	        	$("#search_title").addClass("checked");

     	        }



     		//发送ajax
     		$(".carList").empty() 
     		loadCar();
     		})


//不限品牌
     		$("#search_title").click(function(){    		
     			$(".car_brand li a:gt(0)").removeClass("checked");
     			$(this).addClass("checked");      		     		
            //发送ajax
            $(".carList").empty() 
     		loadCar();


     		});    		
     	});

    //跳转到详情页
   function carDetailFn(id,normal){
   	alert(id);
   }





     </script>




</head>
<body class="bodycolor">
<body class="bodycolor">
	<input type="hidden" id="currentDateStr" name="currentDateStr" value="2017-12-19 10:45">
	
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
        <a href="https://www.zuche.com" class="zc_logo" alt="神州租车"></a>
        <ul class="zc_menu">
            <li  >
           	 	<a href="https://www.zuche.com">首页</a>
            </li>
            <li class="cur" >
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
                <a href="javascript:void(0);" class="colfabe00" id="loginBT" >登录</a>
                <b>/</b>
                <a href="https://passport.zuche.com/memberManage/xtoploginMember.do?act=registerSys" class="colfabe00" >注册</a>
                <a href="https://passport.zuche.com/memberManage/xtoploginMember.do?act=loginSys&flag=order" class="colc8c8ce ml20" >我的神州</a>
            </div>
            <div class="ydl"  style="display: block;" id="alreadyLogin">
                <h1 id="topLoginName" ></h1>
                <div class="zc_index_my">
                    <a href="https://mycar.zuche.com" class="top">我的神州<i class="zc_ordown"></i></a>
                    <div class="contmyszlist">
                        <div class="p-re">
                            <span class="y">◆</span>
                            <a href="https://mycar.zuche.com/queryOrder/queryOrder.do" class="bhpr reddot"  >我的订单
                            
                            </a>
                            <a href="https://mycar.zuche.com/myAssetsController/myAsset.do">我的资产</a>
                            <a href="https://mycar.zuche.com/member/person/personinfo.do">我的账户</a>
                            <a href="https://passport.zuche.com/memberManage/xtoploginMember.do?act=delsession" >退出登录</a>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="zc_phone_bd">
            <div class="p-re zc_p_h">
                <span class="zc-tel"></span>
                <div class="zc_ga_phonebox"><img src="https://image.zuchecdn.com/newversion/news/common/zc_gaphone.png?v=20160516" alt="港澳台及海外电话861058209555"></div>
            </div>
        </div>
    </div>
</div>	
	
<div class="zc_headlist zc_boxshd">
	<form id="firstOrderInfo" style="height: auto;">
	    <div class="dz_conbox zc_main">
	    	<div class="fl">
	    		    		<div class="choose_ul" >
	        		<div class="ch_box">
	        			<label class="c_car">取车</label>
	        			<input type="text" home-flag="true" value="太原" maxlength="10" default-value="选择城市" link-input="fromCityId" class="iptcity citySD paircitySelection" name="fromCity" id="fromCity">
	        			<input type="hidden" id="fromCityId" name="fromCityId" value="30"/>
	                    <input type="text" value="武宿机场店" maxlength="30" default-value="请选择取车门店" class="iptSe iptst" link-input="fromStoreId" name="fromStoreName" id="fromStoreName">
	                    

	                    <input type="hidden" value="178" name="fromStoreId" id="fromStoreId">
	                    <input type="hidden" id="fromIsMergeDept" name="fromIsMergeDept" value="0"/>
	                    <input type="hidden" id="originalFromCityId" name="originalFromCityId" value="0"/>
	                    <div class="areaSelection d_none">





	                    </div>
	                    <input type="text" value="" class="iptSe iptst" placeholder="搜索取车门店" name="sentAddress" id="sent_Address" maxlength="50"   defaultValue="">
	                    
	                    
						<div class="floatBox sendCarTips d_none" style="left:167px;top:50px;">
							<span class="arrow"></span> <span class="content">送车范围：加载中...</span><br />
							<span class="price">上门送车费：加载中...</span> 
							<a href="javascript:void(0);" class="iknow">我知道了</a>
						</div>
						<div class="btn index_smsc" >
	                    	                   		              
	                    </div>
						<div class="clear"></div>
	        		</div>
	        		<div class="ch_box cardate" style="z-index:3;">
	                    <label class="c_date">取车时间
							<div class="indexjmhS fromdatetips dayS fromDateWeek">周三</div>
	                    </label>
	                    <div class="ch_box divin">
	                        <input type="text" value="2017-12-26" class="iptdate zc_iptcalendar" name="fromDate" id="fromDate" readonly="readonly" autocomplete="on">
	                    </div>
	                    <div class="cartime ch_box divin">
	                        <input type="text" value="10:00" default-value="08:00-21:00" class="ipttime iwhtime iptSe inputSel zc_iptdown sz_chooseTime"  name="fromHourMinute" id="fromHourMinute">
	                    	
							<div class="sz_time d_none">
								<ol class="clearfix xbox">
									<li class="graybor"><div class="iptSeup areaup"></div></li><li class="bluebor">&nbsp;</li>q
								</ol>
								<div class="sz_timeinfo clearfix fromtime"></div>
							</div>
							
	                    </div>
	                    <div class="clear"></div>
	                </div>
	                <div class="ch_box mt10 p-re w544">
	                    <label class="c_car">还车</label>
	                    <input type="text" home-flag="true" value="太原" maxlength="10" default-value="选择城市" class="iptcity citySD citySelection" link-input="toCityId" name="toCityName" id="toCityName" >
	                    <input type="hidden" id="toCityId" name="toCityId" value="30"/>
	                    <input type="text" value="武宿机场店" maxlength="30" default-value="请选择还车门店" class="iptSe iptst" link-input="toStoreId" name="toStoreName" id="toStoreName" >
	                    <input type="hidden" id="toStoreId" name="toStoreId" value="178" />
	                    <input type="hidden" id="toIsMergeDept" name="toIsMergeDept" value="0"/>
	                    <input type="hidden" id="originalToCityId" name="originalToCityId" value="0"/>
						<div class="areaSelection d_none"></div>
						<input type="text" value="" class="iptSe iptst" placeholder="搜索还车门店" name="get_Address" id="get_Address" maxlength="50"   defaultValue="">
	                    <div class="btn index_smsc" >
	                    	                   		              
	                    </div>
	                    <div class="clear"></div>
	                </div>
	                <div class="ch_box cardate mt10 p-re">
		                <label class="c_date">还车时间
							<div class="indexjmhS fromdatetips dayS toDateWeek">2天</div>
						</label>
	                    <div class="ch_box">
	                    	<input type="text" value="2017-12-22" class="wdate iptDate iptdate zc_iptcalendar" readonly="readonly" name="toDate" id="toDate" >
	                    </div>
	                    <div class="ch_box">
	                    	<input type="text"  value="10:00" readonly="readonly"  class="ipttime iwhtime iptSe inputSel zc_iptdown sz_chooseTime" name="toHourMinute" id="toHourMinute">
							
							<div class="sz_time d_none">
								<ol class="clearfix xbox">
									<li class="graybor"><div class="iptSeup areaup"></div></li><li class="bluebor">&nbsp;</li>
								</ol>
								<div class="sz_timeinfo clearfix totime"></div>
							</div>
							
	                    </div>
	                    <div class="clear"></div>
	                </div>
	        	</div>
	    		
				<div class="ipt-err ipt-tip tip3 nightServiceTips fromTimeTips" style="width:350px;right:92px;">
	                <span class="arrowbox">◆<span class="arrow">◆</span></span>
	                <span class="zc-retan"></span>
	                <i>21:00后-8:00前收取夜间服务费¥50/每次</i>
	                <span class="iknow">我知道了</span>
	            </div>
	            
                <div class="ipt-err ipt-tip tip1 diffCityFee" style="width:346px;">
	                <span class="arrowbox" style="margin-left:-54px;">◆<span class="arrow">◆</span></span>
	                <span class="zc-retan"></span>
	                <i>温馨提示: 选择异地还车将收取一定费用</i>
	                <span class="iknow">我知道了</span>
	            </div>
	            
	            <div class="ipt-err ipt-tip tip1 storeTips diffStoreFee" style="width:332px;left:146px;">
	                <span class="arrowbox">◆<span class="arrow">◆</span></span>
	                <span class="zc-retan"></span>
	                <i>温馨提示: 选择异店还车将收取服务费</i>
	                <span class="iknow">我知道了</span>
	            </div>
	            
	            <div class="ipt-err ipt-tip tip1 storeTips chainStoreReturn" style="width:318px;left:154px;">
	                <span class="arrowbox">◆<span class="arrow">◆</span></span>
	                <span class="zc-retan"></span>
	                <i>温馨提示: 加盟店暂不支持异店还车</i>
	                <span class="iknow">我知道了</span>
	            </div>
	            
				<div class="ipt-err ipt-tip tip3 nightServiceTips toTimeTips"  style="width:350px;right:92px;">
	                <span class="arrowbox">◆<span class="arrow">◆</span></span>
	                <span class="zc-retan"></span>
	                <i>21:00后-8:00前收取夜间服务费¥50/每次</i>
	                <span class="iknow">我知道了</span>
	            </div>
	            
				<div class="ipt-err ipt-tip  otherServiceTips"  style="width:350px;right:92px;display: none;">
	                <span class="arrowbox">◆<span class="arrow">◆</span></span>
	                <span class="zc-retan"></span>
	                <i id="otherTips"></i>
	                <span class="iknow">我知道了</span>
	            </div>
	    	</div>
	    	<div class="choose_div">
	    			<i>租期: <em class="bred toDateWeek" id="limit_time">2天</em>，不限里程</i>
	    		<a href="javascript:orderSubmitIndex('step2');" class="search_btn zc_bbtn" >立即选车</a>
	    	</div>
	        <div class="clear"></div>
	    </div>
		<input type="hidden" id="senttype" name="senttype" value="0" />
		<input type="hidden" id="sentCarLng" name="sentCarLng" value="">
		<input type="hidden" id="sentCarLat" name="sentCarLat" value="">
		
		<input type="hidden" id="picktype" name="picktype" value="0"/>
		<input type="hidden" id="pickCarLng" name="pickCarLng" value="">
		<input type="hidden" id="pickCarLat" name="pickCarLat" value="">
	
		<input type="hidden" id="fromHour" name="fromHour" />
		<input type="hidden" id="fromMinute" name="fromMinute" />
		<input type="hidden" id="toHour" name="toHour" />
		<input type="hidden" id="toMinute" name="toMinute" />
		
		<input type="hidden" id="fromTime" name="fromTime" />
		<input type="hidden" id="toTime" name="toTime" />
		<input type="hidden" id="rentDay" name="rentDay" value="2"/>
		<input type="hidden" id="fromHourData" name="fromHourData" value="10" />
		<input type="hidden" id="orderType" name="orderType" value="1" />
		<input type="hidden" id="firstFlag" name="firstFlag" value="" />
		
		<input type="hidden" id="memberLevel" name="memberLevel" value="" />
		<input type="hidden" id="selectedActivityCode" name="selectedActivityCode" value="" />
		<input type="hidden" name="checkMemberId" id="checkMemberId" value=""/>
		<input type="hidden" value="shortRent" id="shortColor" name="shortColor"/>
		<input type="hidden" id="_form_uniq_id" name="_form_uniq_id" value="E5zQA4VEFKqW75kWkxSkUdLvXY9E5CoA" />
		<input type="hidden" id="firstStep_carList" name="firstStep_carList" value="first_carList" />
		<input type="hidden" id="fromStoreNameTip" name="fromStoreNameTip" value="武宿机场店" />
		<input type="hidden" id="changeRentDay" name="changeRentDay" value="0" />
		<input type="hidden" id="smfwFlag" name="smfwFlag" value="1" />

		<input type="hidden" id="toStoreType" name="toStoreType" value=""/>
		<input type="hidden" id="fromStoreType" name="fromStoreType" value=""/>
	</form>
</div>
<div class="zc_placeh"></div>
<div class="zc_shrink zc_boxshd">
   <ul class="shrink_ul zc_main" id="topSelectInfor"></ul>
</div>
<div class="zc_city_ad d_none orderlist_activity">
    <div class="zc_main">
        <span class="gift_red fl"></span>
        <div class="gifttxt">
        	<span id="imageTips" style="display:none;"></span>
        	<span id="activeDesc" style="display:none;"></span>
        	<a href="javascript:void(0)" id="tipsUrl"  target="_blank" style="display:none;">详情点击</a>
        </div>
        
        <i class="close_ora"></i>
        <div class="clear"></div>
    </div>
    <div class="fade_clist"></div>
    <div class="zc_activity" id="topTipsPage" style="display: none"></div>
</div>
<input type="hidden" id="sessionSmfwFlag" name="sessionSmfwFlag" value=""/>
<script id="topTipsPageTempleate" type="text/x-jsrender">
	<div class="ac_inbox">
	<p class="title">{{>huodongtitle}}</p>
	<dl>
		{{if ruleDesc}}
       		{{for ruleDesc}}
       			<dt>{{>title}}</dt>
       			<dd>{{:desc}}</dd>
       		{{/for}}
   		{{/if}}
   		{{if content}}
			<dd>{{:content}}</dd>
		{{/if}}
		</dl>
	<a class="iknow_btn zc_bbtn">我知道了</a>
	</div>
</script>	
	
	<div class="zc_main zc_carcon">
		<div class="zc_leftlist fl">
			<div class="zc_boxshd lchoose_box">
				<div class="cl-lbox bdbtm orderLevel">
	                <p class="zc_left_title">车型</p>
	                <ul class="chexing">
	                    <li class="orderlevelcheck filter_level all">
	                    	<a class="checked cxdefault" id="first" >
	                    		<i class="zc_cx_bx"></i>
	                        	<i class="cartxt">不限</i>
	                    	</a>
	                    </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="1">
			            	 	 	 	<i class="zc_cx_sdjc"></i>
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			                         	<i class="cartxt">手动紧凑型</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="2">
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_jj"></i>
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			                         	<i class="cartxt">经济型</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="3">
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_sw"></i>
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			                         	<i class="cartxt">商务型</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="4">
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_hh"></i>
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			                         	<i class="cartxt">豪华型</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="5">
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_suv"></i>
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			                         	<i class="cartxt">SUV</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="6">
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_zsw"></i>
			            	 	 	 	
			            	 	 	 	
			                         	<i class="cartxt">6至15座商务</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="7">
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_gx"></i>
			            	 	 	 	
			                         	<i class="cartxt">个性车</i>
			            	 	 	 </a>
		                    	 </li>
	                    		<li class="orderlevelcheck filter_level brandname">
			            	 	 	 <a href="javascript:void(0);" data="8">
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	
			            	 	 	 	<i class="zc_cx_dd"></i>
			                         	<i class="cartxt">电动车</i>
			            	 	 	 </a>
		                    	 </li>
	                </ul>
	            </div>
	            <div class="cl-lbox bdbtm orderRent price1" id="search_price">
	                <p class="zc_left_title">价格 <span class="sma12">(元)</span></p>
               			<ul class="pri_range">
		                    <li class="bar1 orderlevelcheck filter_rent_money all" id="first_price"><a class="checked jgdefault" id="no_need"><span class="w40"></span></a></li>
		                    <li class="bar2 prli orderlevelcheck filter_rent_money"><a href="javascript:void(0);" data="1"><span class="w40"></span></a></li>
		                    <li class="bar3 prli orderlevelcheck filter_rent_money"><a href="javascript:void(0);" data="2"><span class="w40"></span></a></li>
		                    <li class="bar4 prli orderlevelcheck filter_rent_money"><a href="javascript:void(0);" data="3"><span class="w40"></span></a></li>
		                    <li class="bar5 prli orderlevelcheck filter_rent_money"><a href="javascript:void(0);" data="4"><span class="w70"></span></a></li>
		                </ul>
		                <ul class="pri_num">
		        			<li class="pri1 w37 checked jgdefault">不限</li>
		                    <li class="pri2 w35 numli">0</li>
		                    <li class="pri3 w42 numli">150</li>
		                    <li class="pri4 w42 numli">300</li>
		                    <li class="pri5 w37 numli">500</li>
		                    <li class="pri6 w44 numli">500+</li>
		                </ul>
	            </div>
	            <div class="cl-lbox bdbtm orderBrand">
	               	<p class="zc_left_title">品牌</p>
	               	<ul class="car_brand">
	        <li class="orderlevelcheck filter_brand all"><a class="checked ppdefault" id="search_title">不限</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="1">奥迪</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="2">宝马</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="3">奔驰</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="4">本田</a></li>	    	                   		                   
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="5">长城</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="6">大众</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="7">丰田</a></li>
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="8">福特</a></li>	                   	                  		                   		                   	
	                   	<li class="orderlevelcheck filter_brand brandname"><a href="javascript:void(0);" data="4">雪佛兰</a></li>
	                   	
	               </ul>
	           	</div>
			</div>
			<div class="empty_choose"></div>

	<div class="zc_boxshd cl-lbox mt10 lmap_box">
		<p class="zc_left_title f14">太原&nbsp;武宿机场店</p>
    	<div class="newmap">
    		<iframe id="storeMap" width="268px" height="198px"  scrolling="no" frameborder="0" lazyLoad="https://service.zuche.com/taiyuan/mapinclude/178?mapHeight=198&mapWidth=268&fromPage=som"></iframe>
	    	<div class="shad">
	    		<a href="javascript:showBigMap('taiyuan','178');" class="mapb">查看大图</a>
	    	</div>
    	</div>
    	<dl class="storedl">
				<dt>门店地址: </dt>
				<dd>太原市小店区太榆路195号（地标建筑：山西省棉麻公司仓储中心）导航请使用高德导航：神州租车（武宿机场店），其他导航暂时无法导航至门店，请务必使用高德地图。<a id="monitor_right_transInfo" href="https://taiyuan.zuche.com/location/178" target="_blank">线路查询</a></dd>
						<dt>接送机位置: </dt>
					<dd>武宿机场T2航站楼国际港澳台出发口（营业时间8:00-21:00），到达后致电接机电话等候接机联系电话：18636972515，夜间21:00-8:00时段取车请先拨打门店电话。</dd>
					<dt>还车地址: </dt><dd>还车请使用高德导航：神州租车（武宿机场店），其他导航暂时无法导航至门店，请务必使用高德地图。</dd>
			<dt class="oline">营业时间: 
					<span class="yel">24小时服务
				</span>
	    	</dt>
	    		<dt class="oline">门店电话:
	    				<span>15834123480
        			</span>
        		</dt>
    		
    		<dd id="commentInfoDiv"></dd>
    		
    	</dl>
	</div>	


<script id="commentInfoTemplate" type="text/x-jsrender">
    {{if deptInfoDetail }}
		<i class="khpj">客户评价: 
		{{if deptInfoDetail.deptCommentScores == 0.5}}
             	<span class="zc_stars0_half"> </span>
		{{else deptInfoDetail.deptCommentScores == 1 }}
             	<span class="zc_stars1"> </span>
		{{else deptInfoDetail.deptCommentScores == 1.5 }}
             	<span class="zc_stars1_half"> </span>
		{{else deptInfoDetail.deptCommentScores == 2 }}
             	<span class="zc_stars2"> </span>
		{{else deptInfoDetail.deptCommentScores == 2.5 }}
             	<span class="zc_stars2_half"> </span>
		{{else deptInfoDetail.deptCommentScores == 3 }}
             	<span class="zc_stars3"> </span>
		{{else deptInfoDetail.deptCommentScores == 3.5 }}
             	<span class="zc_stars3_half"> </span>
		{{else deptInfoDetail.deptCommentScores == 4 }}
             	<span class="zc_stars4"> </span>
		{{else deptInfoDetail.deptCommentScores == 4.5 }}
             	<span class="zc_stars4_half"> </span>
		{{else deptInfoDetail.deptCommentScores == 5 }}
             	<span class="zc_stars5"> </span>
		{{/if}}</i>
        {{if deptInfoDetail.commentCount > 0 }}
          	<a href="https://taiyuan.zuche.com/listremarks-178-1-1-2" target="_blank" class="comment">{{>deptInfoDetail.commentCount }}条评论<i class="argray"></i></a>
        {{/if}}
    {{/if}}

</script>
		</div>
		
		<div class="zc_rightlist fr">
	        <div class="zc_boxshd minhght">
	            <ul class="right_tab">
	       			<li class="tab w120 cur" onclick="changeOrderType('short');"><a>短租自驾</a></li>
	       			<li class="tab w142 " onclick="changeOrderType('workday');"><a>工作日套餐<i>(4天)</i></a></li>
	                <li class="tab w142 " onclick="changeOrderType('week');"><a title="周租套餐附加增值服务，GPS导航仪、儿童座椅，不计免赔服务7天价格封顶。" >周租套餐<i>(7-27天)</i></a></li>
	                <li class="tab w142 " onclick="changeOrderType('month');"><a title="月租套餐附加增值服务，GPS导航仪、儿童座椅，不计免赔服务7天价格封顶。" >月租套餐<i>(28天+)</i></a></li>
	                <li class="tab w142 " onclick="changeOrderType('year');" >
	                	<a>年租套餐<i>(365天)</i><img class="zc_new" src="https://image.zuchecdn.com/newversion/yearrent/new.png"/></a>
	                </li>
	                <li>
	                    <a href="javascript:void(0);" class="seq sort_by_price" data="desc"><i class="arblue_top"></i><span>租金由低到高</span></a>
	                    <a href="javascript:void(0);" class="seq sort_by_price" data="asc" style="display: none;"><i class="arblue_btm"></i><span>租金由高到低</span></a>
	                </li>
	                <li class="clear"></li>
	            </ul>
	            <p class="ac searchLoading d_none newwait">
					<img src="https://image.zuchecdn.com/newversion/common/loading.gif" width="30" height="30" style="display:block;margin:0 auto">
					载入中，请稍等...
				</p>
				
	            <div class="clist_ct ">
	            	<table class="clist_tb" cellpadding="0" cellspacing="0" border="0">
	            		<tbody class="carList">

	            			




	            		</tbody>
	            	</table>                
	            </div>
	        </div>
	    </div>
		
		<div class="clear"></div>
		<div class="bottom_box">
	        <div class="zc_boxshd cl-lbox szb_box">
	            <p class="zc_left_title f14">积分返还规则 <span class="sma12">(10可用积分＝1元)</span></p>
	            <ul class="point_rule">
	                <li>
	                    <i class="bhpoint point_pk"></i>
	                    <div class="ptxt">
	                        <p class="mh1">普卡会员</p>
	                        <p class="mh2">租车有效消费金额的 <span class="ora">10%</span></p>
	                    </div>
	                </li>
	                <li>
	                    <i class="bhpoint point_yk"></i>
	                    <div class="ptxt">
	                        <p class="mh1">银卡会员</p>
	                        <p class="mh2">租车有效消费金额的 <span class="ora">12%</span></p>
	                    </div>
	                </li>
	                <li>
	                    <i class="bhpoint point_jk"></i>
	                    <div class="ptxt">
	                        <p class="mh1">金卡会员</p>
	                        <p class="mh2">租车有效消费金额的 <span class="ora">15%</span></p>
	                    </div>
	                </li>
	                <li>
	                    <i class="bhpoint point_bjk"></i>
	                    <div class="ptxt">
	                        <p class="mh1">白金卡会员</p>
	                        <p class="mh2">租车有效消费金额的 <span class="ora">20%</span></p>
	                    </div>
	                </li>
	                <li>
	                    <i class="bhpoint point_zsk"></i>
	                    <div class="ptxt">
	                        <p class="mh1">钻石卡会员</p>
	                        <p class="mh2">租车有效消费金额的 <span class="ora">25%</span></p>
	                    </div>
	                </li>
	            </ul>
	            <p class="point_word">积分将在还车结算后次日计入您的名下<a href="https://mycar.zuche.com/member/getMemberLevel.do" target="_blank" class="point_xxgz">详细</a></p>
	        </div>
	        <div class="cr_boxdown">
	            <div class="zc_boxshd box_down box_record">
	                <p class="b_title"><span class="record_count"></span><a href="javascript:selected_record.clearRecordList();" class="clear_rcd">清除全部</a></p>
	                <ul class="record_con" id="browsingHistory"></ul>
	                <div class="holder" id="page_navigation"></div>
	                <div class="no-record" style="display: none;"><p>您目前还没有选车记录！</p></div>
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
<script type='text/javascript' id='bdshell_js'></script> 	
	
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
	
    <div class="zc_footmenu bgf">
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
	
<script id="carListTemplate" type="text/x-jsrender"> 
	{{for models}}
		<tr class="clist_tr carLi carInfo{{>id}} {{if stockCount == 5}}od_none{{/if}}{{if #parent.parent.data.currentModelId == id && carfromflag}}spe_gotop{{/if}}" name="car{{>id}}" id="car{{>id}}"  mode-name="{{>fullName}}" price-flag="{{>hasCheapPrice}}" 
			data="{{>stockCount}}-{{if fromIndexPackage == 3 || fromIndexPackage == 4 || fromIndexPackage == 5 || fromIndexPackage==6}}{{>longRentTotalPrice}}{{else}}{{>lowestAvgPrice}}{{/if}}-{{>levelId}}-{{>brandId}}-{{>forgift}}-{{>insurance}}-{{>specialCarType}}-{{>hotFlag}}-{{>seat}}-{{>modePic}}-{{>styleName}}-{{>name}}">
           <td class="pic">
               <!-- 喜欢置顶 <span class="ora_icon ora_heart"></span> -->
               <!-- 限时置顶 <span class="ora_icon ora_time"></span> -->
               <!-- 热门置顶 -->
			   {{if #parent.parent.data.currentModelId == id && carfromflag}}    
					<span class="ora_icon {{if carfromflag == 1}}ora_hot{{else}}ora_time{{/if}}"></span>
			   {{/if}}
               {{if fromIndexPackage == 6}}    
					<img src="{{>modePic}}" alt="租{{>fullName}}" onclick='zuche.carDetailFn({{>id}}, "year");' width="230" height="130">
				{{else}}
					<img src="{{>modePic}}" alt="租{{>fullName}}" onclick='zuche.carDetailFn({{>id}}, "{{>lowestPriceFlag}}");' width="230" height="130">
			    {{/if}}
           </td>
           <td class="info">
               <p class="name">{{>name}}</p>
               <p class="oth">{{>styleName}} | {{if id == 469 || id == 759}}乘坐5名成人，2名儿童{{else}}乘坐{{>seat}}人{{/if}}
 					{{if name.indexOf("沪牌") > 0 || styleName.indexOf("沪牌") > 0}}
						| <span>沪牌</span>
					{{/if}}
			   </p>
               <div class="alltips">
               	    {{if hotFlag == 1}}
               	    	<i class="tip bh_remen">热门车</i>
               	    {{/if}}
				    {{if specialCarType == 1}}
				    	<i class="tip bh_tejia">特价车</i>
				    {{/if}}
				    {{if newCarTypeFlag==1 }}
						<i class="tip bh_xin">新车型</i>
					{{/if}}
					{{if levelId == 12}}
						<i class="tip bh_xin">电动车</i>
					{{/if}}
					{{if specificActivity}}
						<i class="tip bh_xin">{{>specificActivity}}</i>
					{{/if}}
					{{for listPrompt ~parentId=id}}
						{{if activityCode == 'self_take_return'}}
						<i class="tip bn_selfhelp" title="{{>huodongtitle}}" mod_qh_tip="{{>activeTips}}">部分车辆自助取还</i>
						{{/if}}
					{{/for}}
					<div class="clear"></div>
               </div>
				<div class="bh_sale"> 
					{{for listPrompt  ~parentId=id}}
						{{if activityCode != 'self_take_return'}}
							{{if imageFlag == 1}}
								<a class="hui" data="{{:~parentId}}-{{:#getIndex()+1}}" url="{{:tipsUrl}}" title="{{:huodongtitle}}"><span class="bred">惠</span><i class="sale_con">{{>imageTips}}</i></a>
							{{/if}}
							{{if imageFlag == 2}}
								<a class="re" data="{{:~parentId}}-{{:#getIndex()+1}}" url="{{:tipsUrl}}" title="{{:huodongtitle}}"><span class="bred">热</span><i class="sale_con">{{>imageTips}}</i></a>
							{{/if}}
						{{/if}}
					{{/for}}
               </div>
				<div class="fade_clist"></div>
				{{for listPrompt  ~parentId=id}}
					<div class="zc_activity" id="tcbox{{:~parentId}}-{{:#getIndex()+1}}">
				   		<div class="ac_inbox">
				        	<p class="title">{{>huodongtitle}}</p>
				        	<dl>
								{{if ruleDesc}}
				               		{{for ruleDesc}}
				               			<dt>{{>title}}</dt>
				               			<dd>{{:desc}}</dd>
				               		{{/for}}
				           		{{/if}}
				           		{{if activeTips}}
					           		<dd>{{:activeTips}}</dd>
				           		{{/if}}
					 		</dl>
				        	<a class="iknow_btn zc_bbtn">我知道了</a>
				    	</div>
					</div>
				{{/for}}
           </td>
           <td class="ord">
			  <div class="order_box">
				   {{if fromIndexPackage == 3 || fromIndexPackage == 4 || fromIndexPackage == 5}}
	                   <div class="od_price od_price_set">
	                        <div class="car_price">
	                           <span class="pri_ye">
	                               <em class="rmb">¥</em>
	                               <em class="num">{{>longRentTotalPrice}}</em>
	                               <em class="unit">/套餐价</em>
	                           </span> 
	                           {{if standTotalPrice > longRentTotalPrice}}
							   <div class="fl clear">
	                               <span class="fl pri_all">
	                                    <em class="total">原价:</em>
	                                    <em class="rmb">¥</em>
	                                    <em class="num">{{>standTotalPrice}}</em>
	                                    <em class="save"> | 节省<i class="rmb">¥</i><i class="minus">{{>standTotalPrice - longRentTotalPrice}}</i></em>
	                               </span>
	                           </div>
							   {{/if}}
	                        </div>
	                   </div>
				   {{else}}
	                   <div class="od_price">
	                        <div class="houfu {{if ~root.rentDay>27  && fromIndexPackage != 6}}hfset{{/if}}"></div>
	                        {{if fromIndexPackage==6}}
	                        <div class="car_price yearprice">
								<span class="pri_ye">
	                             	<em class="rmb">¥</em>
	                             	<em class="num">{{>longRentAvgPrice}}</em>
									<em class="unit">/月</em>
	                           	</span>
	                           	<div class="fl clear">
	                               <span class="fl pri_all">
	                                    <em class="total">总价约:</em>
	                                    <em class="rmb">¥</em>
	                                    <em class="num">{{>longRentTotalPrice}}</em>
	                                    {{if standTotalPrice > longRentTotalPrice}}
	                                    <em>&nbsp;|&nbsp;</em><em class="save">节省<i class="rmb"> ¥</i><i class="minus">{{>standTotalPrice - longRentTotalPrice}}</i></em>
	                                    {{/if}}
	                               </span>
	                           </div>
	                           </div>
	                        {{else}}
	                        <div class="car_price">
								<span class="pri_ye">
	                             	<em class="rmb">¥</em>	                             	
	                             	{{if ~root.rentDay >27}}
										<em class="num">{{>lowestAvgPrice}}</em>
									{{else}}
										<em class="num">{{>standAvgPrice}}</em>
									{{/if}}
	                             	<em class="unit">/日均</em>
	                           	</span>	                          
								<div class="sz_priceTotal" style="cursor: pointer;" data="normal" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
		                        	<div class="fl clear">
	                              		<span class="fl pri_all">
											{{if ~root.rentDay >27}}
												<em class="total">套餐价:</em>
												<em class="rmb">¥</em>
	                                   			<em class="num">{{>lowestTotalPrice}}</em>
											{{else}}
												<em class="total">总价:</em>
												<em class="rmb">¥</em>
												<em class="num">{{>standTotalPrice}}</em>
												<a href="javascript:;" class="zcargray_d"></a>
											{{/if}}
	                              		</span>
							    	</div>
									<!--价格日历 start-->
		                    	    <div class="calendarPrice normal"></div>
		                    	    <div class="calendarPrice pre"></div>
		                    	    <div class="calendarPrice long"></div>
		                    	    <!--价格日历 end-->
	                   	  	 	 </div>
	                         </div>
	                         {{/if}}
	                   </div>
				   {{/if}}
				   {{if stockCount == 1}}
						{{if fromIndexPackage == 3 || fromIndexPackage == 4 || fromIndexPackage == 5 || fromIndexPackage == 6}}
							<a href='javascript:pickUpCar({{>id}},"","","{{>fullName}}","0","","",{{>levelId}},0,1,{{>lowestAvgPrice}},{{>longRentTotalPrice}});' id="bookOrder{{>id}}" class="od_btn btn_yel zc_bbtn" >套餐预订</a>
                   		{{else}}
                   			<a href='javascript:pickUpCar({{>id}},"","","{{>fullName}}","0","","",{{>levelId}},0,0,{{>standAvgPrice}},{{>standTotalPrice}});' id="bookOrder{{>id}}" class="od_btn btn_yel zc_bbtn">租 车</a>
                   		{{/if}}
                   {{else stockCount == 2 || stockCount == 4}}
						{{if fromIndexPackage == 3 || fromIndexPackage == 4 || fromIndexPackage == 5}}
							<a href="javascript:void(0);" onclick='javascript:changeDepartment({{>id}},"{{>fullName}}","{{>levelId}}",0,1,{{>lowestAvgPrice}});' id="changeDepartment{{>id}}" class="change_st od_btn btn_blue zc_bbtn" >换门店<i class="arw arwhit_btm"></i></a>
                   		{{else   ~root.rentDay > 27 && ~root.orderType == 4}} 
							<a href="javascript:void(0);" onclick ='javascript:changeDepartment({{>id}},"{{>fullName}}","{{>levelId}}",0,1,{{>lowestAvgPrice}});' id="changeDepartment{{>id}}" class="change_st od_btn btn_blue zc_bbtn" >换门店<i class="arw arwhit_btm"></i></a>
						{{else}}
							<a href="javascript:void(0);" onclick ='javascript:changeDepartment({{>id}},"{{>fullName}}","{{>levelId}}",0,0,{{>lowestAvgPrice}});' id="changeDepartment{{>id}}" class="change_st od_btn btn_blue zc_bbtn" >换门店<i class="arw arwhit_btm"></i></a>
						{{/if}}
                   {{else}}
                   		<a href="javascript:void(0);" class="od_btn zc_bbtn btn_gray">已租满</a>
                   {{/if}}
			  </div>
			  {{if fromIndexPackage != 3 && fromIndexPackage != 4 && fromIndexPackage != 5 && fromIndexPackage != 6}}
			  {{if hasPrePayInfo}}
                 	  <div class="spe_order yu_o">
  	                   <span class="tip_o">在<br>线<br>预<br>付<br></span>
  	                   <div class="tip_incon">
  	                      <div style="float:left;position:relative;">
  								<div class="sz_priceTotal" style="cursor: pointer;float:left;" data="pre" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
  									<span class="tl">
	                   	<em class="rmb">¥</em>
	                   	<em class="num">{{>preAvgPrice}}</em>
	                   	<em class="unit">/日均</em>
	                   	<a href="javascript:;" class="zcarred_d"></a>
	  		                        	</span>
	  									<!-- 价格日历 start -->
	  		                    		<div class="calendarPrice normal"></div>
	  		                    		<div class="calendarPrice pre"></div>
	  		                    		<div class="calendarPrice long"></div>
	  		                    		<!-- 价格日历 end -->
	  								</div>
	  		                   </div>
	  		                   <a href="javascript:pickUpCar({{>id}},'','','{{>fullName}}','1','','',{{>levelId}},0,0,{{>preAvgPrice}},{{>preTotalPrice}})"  id="bookOrderPrePay{{>id}}" class="sz_btnOrange" >
	               <span class="tr">
	  		                       	  <em class="all">共优惠:</em>
	  		                       	  <em class="num">¥<span>{{>standTotalPrice - preTotalPrice}}</span></em>
	  		                       	  <i class="arred_right"></i>
	  		                       </span>
	  	                       </a>
	  						</div>
	  	           	  </div>
			      {{/if}}
	              {{if hasWorkDayRent || hasWeekRent}}
					 <a href='javascript:pickUpCar({{>id}},"","","{{>fullName}}","0","","",{{>levelId}},0,1,{{>longRentAvgPrice}},{{>longRentTotalPrice}});' id="longRentBookOrder{{>id}}" class="sz_btnOrange"  >
	               	   <div class="spe_order xian_o">
		                   <span class="tip_o tiplh16">套餐价</span>
		                   <div class="tip_incon">
		                       <span class="tl">
			                       <em class="rmb">¥</em>
			                       <em class="num">{{>longRentAvgPrice}}</em>
			                       <em class="unit">/套餐日均价</em>
		                       </span>
		                       <span class="tr">
			                       <em class="all">共优惠:</em>
			                       <em class="num">¥<span>{{>standTotalPrice - longRentTotalPrice}}</span></em>
			                       <i class="arora_right"></i>
		                       </span>
		                   </div>
		               </div>
					 </a> 
	              {{/if}}
              {{/if}}   
           </td>
		</tr>
	{{/for}}
</script>	
<script id="carListPayModeTemplate" type="text/x-jsrender">
	{{if hasPrePayInfo && (hasWeekRent || hasWorkDayRent)}}
		<div class="orderListBox orderListBoxThree d_none">
	{{else}}
		<div class="orderListBox d_none">
	{{/if}}
        <div class="orderBoxTop">
             <div class="orderBtn">
                  <a href="javascript:void(0);" class="sz_btnOrange arrowOrangeUp">租 车</a>
                  <a href="javascript:void(0);" class="sz_arrowOrangeUp arrowOrangeUp"></a>
             </div>
        </div>
	{{if hasPrePayInfo && (hasWeekRent || hasWorkDayRent)}}
		<div class="Bluebox BlueboxThree">
	{{else}}
		<div class="Bluebox">
	{{/if}}
			<div class="Bluebox_left">后付</div>
			<div class="Bluebox_right">
				<div class="BlueboxPrice">
					<span class="sz_priceBlue">
		    			<em class="rmb" style="margin-top:6px;">¥</em>
		    			<em class="num" style="font-size: 24px;">{{>standAvgPrice}}</em>
		    			<em class="unit">/日均</em>	
					</span>
					<div class="sz_priceTotal" style="cursor: pointer;margin-top:-3px;" data="normal" modeLevel="{{>levelId}}" modeId="{{>id}}"  ss="{{>strangeStr}}">
						<span>
		    				<em class="total">总价:</em>
		    				<em class="rmb">¥</em>
		    				<em class="num">{{>standTotalPrice}}</em>
		    				<a href="javascript:void(0);" class="sz_arrowGray"></a>
						</span>
						<!--价格日历 start-->
                    	<div class="calendarPrice normal"></div>
                   	 	<div class="calendarPrice pre"></div>
                   	 	<div class="calendarPrice long"></div>
                    	<!--价格日历 end-->
					</div>
					<div id='{{>id}}szbDiv' class="clear orange"></div>
				</div>
				<div class="BlueboxBtn">
		     		<a href='javascript:pickUpCar({{>id}},"","","{{>fullName}}","0","","",{{>levelId}},0,0,{{>standAvgPrice}},{{>standTotalPrice}});' id="bookOrder{{>id}}" class="sz_btnBlueSmall">租 车</a>
				</div>
       		</div>
   		</div>
  {{if hasWeekRent}}
		{{if hasPrePayInfo}}
			<div class="Orangebox OrangeboxThree">
				<div class="Orangebox_left Orangebox_leftThree">
		{{else}}
			<div class="Orangebox">
				<div class="Orangebox_left">
		{{/if}}
		      		周租套餐<br>取车支付<br>优惠:¥{{>standTotalPrice - longRentTotalPrice}}
		    	</div>
		        <div class="Orangebox_right">
		             <div class="OrangeboxPrice">
		                  <span class="sz_priceOrange">
		                        <em class="rmb" style="margin-top:6px;">¥</em>
		                        <em class="num" style="font-size: 24px;">{{>longRentAvgPrice}}</em>
		                        <em class="unit">/日均</em>	
		                  </span>
		                  <span class="sz_priceTotal" style="cursor: pointer;" data="long" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
		                        <em class="total">套餐价:</em>
		                        <em class="rmb">¥</em>
		                        <em class="num">{{>longRentTotalPrice}}</em>
		                       <!-- <a href="javascript:void(0);" class="sz_arrowGray"></a>-->
		                  </span>
		             </div>
		             <div class="OrangeboxBtn">
		                   <a href='javascript:pickUpCar({{>id}},"","","{{>fullName}}","0","","",{{>levelId}},0,1,{{>longRentAvgPrice}},{{>longRentTotalPrice}});' id="longRentBookOrder{{>id}}" class="sz_btnOrange">租 车</a>
		             </div>
                </div>
            </div>                  
	{{/if}}
	{{if hasWorkDayRent}}
		{{if hasPrePayInfo}}
			<div class="Orangebox OrangeboxThree">
				<div class="Orangebox_left Orangebox_leftThree">
		{{else}}
			<div class="Orangebox">
				<div class="Orangebox_left">
		{{/if}}
		      		工作日套餐<br>取车支付<br>优惠:¥{{>standTotalPrice - longRentTotalPrice}}
		    	</div>
		        <div class="Orangebox_right">
		             <div class="OrangeboxPrice">
		                  <span class="sz_priceOrange">
		                        <em class="rmb" style="margin-top:6px;">¥</em>
		                        <em class="num" style="font-size: 24px;">{{>longRentAvgPrice}}</em>
		                        <em class="unit">/日均</em>	
		                  </span>
		                  <span class="sz_priceTotal" style="cursor: pointer;" data="long" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
		                        <em class="total">套餐价:</em>
		                        <em class="rmb">¥</em>
		                        <em class="num">{{>longRentTotalPrice}}</em>
		                       <!-- <a href="javascript:void(0);" class="sz_arrowGray"></a>-->
		                  </span>
		             </div>
		             <div class="OrangeboxBtn">
		                   <a href='javascript:pickUpCar({{>id}},"","","{{>fullName}}","0","","",{{>levelId}},0,1,{{>longRentAvgPrice}},{{>longRentTotalPrice}});' id="longRentBookOrder{{>id}}" class="sz_btnOrange">租 车</a>
		             </div>
                </div>
            </div>                  
	{{/if}}
	{{if hasPrePayInfo}}
		{{if hasWeekRent || hasWorkDayRent}}
			<div class="Orangebox OrangeboxThree">
			<div class="Orangebox_left Orangebox_leftThree" style="padding-top:16px; height:50px;">
		{{else}}
			<div class="Orangebox">
			<div class="Orangebox_left" style="padding-top:16px; height:50px;">
		{{/if}}
		     	 预付<br>优惠:¥{{>standTotalPrice - preTotalPrice}}
			</div>
		    <div class="Orangebox_right">
		         <div class="OrangeboxPrice">
		              <span class="sz_priceOrange">
		                    <em class="rmb" style="margin-top:6px;">¥</em>
		                    <em class="num" style="font-size: 24px;">{{>preAvgPrice}}</em>
		                    <em class="unit">/日均</em>	
		              </span>
		              <div class="sz_priceTotal" style="cursor: pointer;" data="pre" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
						<span>
		                    <em class="total">总价:</em>
		                    <em class="rmb">¥</em>
		                    <em class="num">{{>preTotalPrice}}</em>
		                    <a href="javascript:void(0);" class="sz_arrowGray"></a>
		              	</span>
						<!--价格日历 start-->
                    	<div class="calendarPrice normal"></div>
                    	<div class="calendarPrice pre"></div>
                    	<div class="calendarPrice long"></div>
                    	<!--价格日历 end-->
					</div>
		         </div>
		         <div class="OrangeboxBtn">
		              <a href="javascript:pickUpCar({{>id}},'','','{{>fullName}}','1','','',{{>levelId}},0,0,{{>preAvgPrice}},{{>preTotalPrice}})"  id="bookOrderPrePay{{>id}}" class="sz_btnOrange">租 车</a>
		         </div>
             </div>
         </div>          
	{{/if}}
 </div>
 </script>
 <script id="carListPayModeTemplateSeach" type="text/x-jsrender">
	{{if hasPrePayInfo && (hasWeekRent || hasWorkDayRent)}}
		<div class="orderListBoxSeach orderListBoxThree d_none">
	{{else}}
		<div class="orderListBoxSeach d_none">
	{{/if}}
        <div class="orderBoxTopSeach">
             <div class="orderBtn">
                  <a href="javascript:void(0);" class="sz_btnOrange arrowOrangeUp">租 车</a>
                  <a href="javascript:void(0);" class="sz_arrowOrangeUp arrowOrangeUp"></a>
             </div>
        </div>
	{{if hasPrePayInfo && (hasWeekRent || hasWorkDayRent)}}
		<div class="Bluebox BlueboxThree">
	{{else}}
		<div class="Bluebox">
	{{/if}}
			<div class="Bluebox_left">后付</div>
			<div class="Bluebox_right">
				<div class="BlueboxPrice">
					<span class="sz_priceBlue">
		    			<em class="rmb" style="margin-top:6px;">¥</em>
		    			<em class="num" style="font-size: 24px;">{{>standAvgPrice}}</em>
		    			<em class="unit">/日均</em>	
					</span>
					<div class="sz_priceTotal" style="cursor: pointer;margin-top:-3px;" data="normal" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
						<span>
		    				<em class="total">总价:</em>
		    				<em class="rmb">¥</em>
		    				<em class="num">{{>standTotalPrice}}</em>
		    				<a href="javascript:void(0);" class="sz_arrowGray"></a>
						</span>
						<!--价格日历 start-->
                    	<div class="calendarPrice normal"></div>
                   	 	<div class="calendarPrice pre"></div>
                   	 	<div class="calendarPrice long"></div>
                    	<!--价格日历 end-->
					</div>
					<div id='{{>id}}szbDiv' class="clear orange"></div>
				</div>
				<div class="BlueboxBtn">
					<a href="javascript:gotorentcar('','','','','{{>id}}','0','{{>specialCarType}}',0,{{>levelId}});" id="bookOrder{{>id}}" class="sz_btnBlueSmall">租 车</a>
				</div>
       		</div>
   		</div>
  {{if hasWeekRent}}
		{{if hasPrePayInfo}}
			<div class="Orangebox OrangeboxThree">
				<div class="Orangebox_left Orangebox_leftThree">
		{{else}}
			<div class="Orangebox">
				<div class="Orangebox_left">
		{{/if}}
		      		周租套餐<br>取车支付<br>优惠:¥{{>standTotalPrice - longRentTotalPrice}}
		    	</div>
		        <div class="Orangebox_right">
		             <div class="OrangeboxPrice">
		                  <span class="sz_priceOrange">
		                        <em class="rmb" style="margin-top:6px;">¥</em>
		                        <em class="num" style="font-size: 24px;">{{>longRentAvgPrice}}</em>
		                        <em class="unit">/日均</em>	
		                  </span>
		                  <span class="sz_priceTotal" style="cursor: pointer;" data="long" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
		                        <em class="total">套餐价:</em>
		                        <em class="rmb">¥</em>
		                        <em class="num">{{>longRentTotalPrice}}</em>
		                       <!-- <a href="javascript:void(0);" class="sz_arrowGray"></a>-->
		                  </span>
		             </div>
		             <div class="OrangeboxBtn">
							<a href="javascript:gotorentcar('','','','','{{>id}}','1','{{>specialCarType}}',0,{{>levelId}});" id="longRentBookOrder{{>id}}" class="sz_btnOrange">租 车</a>
		             </div>
                </div>
            </div>                  
	{{/if}}
	{{if hasWorkDayRent}}
		{{if hasPrePayInfo}}
			<div class="Orangebox OrangeboxThree">
				<div class="Orangebox_left Orangebox_leftThree">
		{{else}}
			<div class="Orangebox">
				<div class="Orangebox_left">
		{{/if}}
		      		工作日套餐<br>取车支付<br>优惠:¥{{>standTotalPrice - longRentTotalPrice}}
		    	</div>
		        <div class="Orangebox_right">
		             <div class="OrangeboxPrice">
		                  <span class="sz_priceOrange">
		                        <em class="rmb" style="margin-top:6px;">¥</em>
		                        <em class="num" style="font-size: 24px;">{{>longRentAvgPrice}}</em>
		                        <em class="unit">/日均</em>	
		                  </span>
		                  <span class="sz_priceTotal" style="cursor: pointer;" data="long" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
		                        <em class="total">套餐价:</em>
		                        <em class="rmb">¥</em>
		                        <em class="num">{{>longRentTotalPrice}}</em>
		                       <!-- <a href="javascript:void(0);" class="sz_arrowGray"></a>-->
		                  </span>
		             </div>
		             <div class="OrangeboxBtn">
							<a href="javascript:gotorentcar('','','','','{{>id}}','1','{{>specialCarType}}',0,{{>levelId}});" id="longRentBookOrder{{>id}}" class="sz_btnOrange">租 车</a>
		             </div>
                </div>
            </div>                  
	{{/if}}
	{{if hasPrePayInfo}}
		{{if hasWeekRent || hasWorkDayRent}}
			<div class="Orangebox OrangeboxThree">
			<div class="Orangebox_left Orangebox_leftThree" style="padding-top:16px; height:50px;">
		{{else}}
			<div class="Orangebox">
			<div class="Orangebox_left" style="padding-top:16px; height:50px;">
		{{/if}}
		     	 预付<br>优惠:¥{{>standTotalPrice - preTotalPrice}}
			</div>
		    <div class="Orangebox_right">
		         <div class="OrangeboxPrice">
		              <span class="sz_priceOrange">
		                    <em class="rmb" style="margin-top:6px;">¥</em>
		                    <em class="num" style="font-size: 24px;">{{>preAvgPrice}}</em>
		                    <em class="unit">/日均</em>	
		              </span>
		              <div class="sz_priceTotal" style="cursor: pointer;" data="pre" modeLevel="{{>levelId}}" modeId="{{>id}}" ss="{{>strangeStr}}">
						<span>
		                    <em class="total">总价:</em>
		                    <em class="rmb">¥</em>
		                    <em class="num">{{>preTotalPrice}}</em>
		                    <a href="javascript:void(0);" class="sz_arrowGray"></a>
		              	</span>
						<!--价格日历 start-->
                    	<div class="calendarPrice normal"></div>
                    	<div class="calendarPrice pre"></div>
                    	<div class="calendarPrice long"></div>
                    	<!--价格日历 end-->
					</div>
		         </div>
		         <div class="OrangeboxBtn">
					<a href="javascript:gotorentcar('','','','','{{>id}}','0','{{>specialCarType}}',1,{{>levelId}});"  id="bookOrderPrePay{{>id}}" class="sz_btnOrange">租 车</a>
		         </div>
             </div>
         </div>          
	{{/if}}
 </div>
 </script>	
<script id="carListChangeStoreTemplate" type="text/x-jsrender">
	{{for models}}
		{{if stockCount == 2 || stockCount == 4}}
			<tr class="newtr"  id="changeStore{{>id}}" modeLevel="{{>levelId}}" ss="{{>strangeStr}}">
                <td class="brdbtm" colspan="4">
                	<div class="headli">
                       <span class="col col1">可租门店</span>
                       <span class="col col2">距离当前门店</span>
                       <span class="col col3">线路指引</span>
                       <span class="col col4">
                       		{{if fromIndexPackage == 3 || fromIndexPackage == 4 || fromIndexPackage == 5}}套餐价{{else}}租金均价{{/if}}
					   </span>
                       <span class="arrowbox">◆<span class="arrow">◆</span></span>
                       <span class="clear"></span>
                    </div>
                    <ul class="changest_box" id="shoplistcontent">
                    	<li class="ac chanload" style="background-color:#fafdff">
							<img src="https://image.zuchecdn.com/newversion/common/loading.gif" width="30" height="30" style="vertical-align:middle;">
						</li>
                    </ul>
                 </td>
             </tr>
		{{/if}}
	{{/for}}
</script>	
<script id="priceDetailTemplate" type="text/x-jsrender">
	<span class="top">◆
		<span class="top1">◆
		</span>
	</span>
	<div class="calendarTitle f14">{{>fromDate}}至{{>toDate}}</div>                        
	<div class="calendarWeek">
		<span>一</span>
   		<span>二</span>
    	<span>三</span>
    	<span>四</span>
    	<span>五</span>
    	<span class="orange">六</span>
    	<span class="orange">日</span>
	</div>
	{{for priceDetailList}}
    	{{if #index == 0 || #index % 7 == 0}}
    		<div class="calendarDays">
    	{{/if}}
		{{if everyDayPrice > 0}}
			{{if dayFlag == 0}}
					<a href="javascript:void(0);" class="current">
					<em class="date">{{>day}}</em>
					{{if specialDayPriceFlag == 1}}
						<em class="SpOffer calendarOrange">¥{{>everyDayPrice}}</em>
					{{else}}
						<em class="SpOffer calendarBlue">¥{{>everyDayPrice}}</em>
					{{/if}}
					<div class="shadow" style="display:block"></div>
				</a>
			{{else dayFlag == 1}}
					<a href="javascript:void(0);">
					<em class="date">{{>day}}</em>
					{{if specialDayPriceFlag == 1}}
						<em class="SpOffer calendarOrange">¥{{>everyDayPrice}}</em>
					{{else}}
						<em class="SpOffer calendarBlue">¥{{>everyDayPrice}}</em>
					{{/if}}
					<div class="shadow"></div>
				</a>
			{{else dayFlag == 2}}
					<a href="javascript:void(0);">
					<em class="date">{{>day}}</em>
					{{if specialDayPriceFlag == 1}}
						<em class="SpOffer calendarOrange">¥{{>everyDayPrice}}</em>
					{{else}}
						<em class="SpOffer calendarBlue">¥{{>everyDayPrice}}</em>
					{{/if}}
					<div class="shadow"></div>
				</a>
			{{/if}}
		{{else}}
			<a href="javascript:void(0);">&nbsp;</a>
		{{/if}}
		{{if #index == (#parent.data.length - 1) || (#index + 1) % 7 == 0}}
    		</div>
    	{{/if}}
	{{/for}}
	<div class="calendarBottom">保险费：<span class="orange">¥{{>insurance}}</span>/天&nbsp;&nbsp;预授权：<span class="orange">¥{{>forgift}}</span></div>
</script>
 <script id="changeStoreTemplate" type="text/x-jsrender"> 
	{{for depPrice}}
		<li class="deta_list">
            <span class="col col1">{{>name}}</span>
            <span class="col col2">{{>distance}} Km</span>
            <span class="col col3"><a href="javascript:void(0)" onclick="queryDepInfo('taiyuan',{{>code}});">交通线路</a></span>
            <div class="col col4">
                <div class="car_price">
 					{{if #parent.parent.data.isLongRent == 1}}
						<div class="sz_priceOrange sz_priceOrangeNoBorder priceDetail" data-sid="{{>code}}" data="priceDetail{{>code}}">
							<span class="pri_ye">
                        	<em class="rmb">¥</em>
                       		<em class="num">{{>price.totalPrice}}</em>
                    		</span> 
						</div>
					{{else}}
						<span class="pri_ye">
                        <em class="rmb">¥</em>
                        <em class="num">{{>price.standAvePrice}}</em>
                        <em class="unit">/日均</em>
                    	</span> 
						<div class="sz_priceOrange priceDetail" style="cursor: pointer;" data-sid="{{>code}}" data="priceDetail{{>code}}">
							<div class="fl clear">
		                       <span class="fl pri_all">
									{{if #parent.parent.parent.data.rentDay > 27}}
										<em class="total">套餐价:</em>
										<em class="rmb">¥</em>
		                            	<em class="num">{{>price.totalPrice}}</em>
									{{else}}
										<em class="total">总价:</em>
										<em class="rmb">¥</em>
		                            	<em class="num">{{>price.totalPrice}}</em>
										<a href="javascript:;" class="zcargray_d"></a>
									{{/if}}
		                       </span>
		                    </div> 
		 					<div class="calendarPrice priceDetail{{>code}}"></div>
						</div>
					{{/if}}
                </div>
            </div>
            <a class="od_btn zc_bbtn" href="javascript:void(0);" onclick="changeDepOrder({{>code}},{{>price.standAvePrice}},{{>price.totalPrice}})">租车</a>
        </li>
	{{/for}}
</script><div id='doorDiv' class="door d_none popup_block" mask-data="#?w=860">
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
	<div id="bigMapFrameDiv" class="popup_block" mask-data="#?w=1000" style="border-radius:0px;">
		<iframe src="" name="bigMapFrame" id="bigMapFrame" width="100%" height="600" FRAMEBORDER="0"></iframe>
	</div>
	
	<div id="yearregulation_wrap" class="popup_block">
	    <div class="yearregulation_wrap">
	    	<dl>
	    		<dt>年租规则说明</dt>
	    		<dd>
	    			1、 租期：年租套餐租期为365天；<br>
					2、 订单修改：年租订单提交后暂不接受更改任何内容；<br>
					3、 异地还车：年租订单暂不接受异地还车；<br>
					4、 预授权：年租订单需刷取租车押金，具体请咨询门店；<br>
					5、 支付方式：可取车时一次性支付租金，也可选择分期支付；<br>
					6、 提前还车：提前还车需支付违约金，详见取车时签订的合同细则。
	    		</dd>
	    		<dd><a href="javascript:;" class="search_btn yearclose">我知道了</a></dd>
	    	</dl>
	    </div>
    </div>
	
	<table class="changeStoreInfo d_none"></table>
	
	<form name="orderForm" id="orderForm" method="post">
		<input type="hidden" name="brandId" id="brandId" value="0"/>
		<input type="hidden" name="vehicleTypeId" id="vehicleTypeId" value="0"/>
		<input type="hidden" name="maxPrice" id="maxPrice" value="0"/>
		<input type="hidden" name="sortField" id="sortField" value="standAvePrice"/>
		<input type="hidden" name="sortType" id="sortType" value="ASC"/>
		<input type="hidden" id="senttype" name="senttype" value="0"/>
		<input type="hidden" id="picktype" name="picktype" value="0"/>
		<input type="hidden" id="fromCityId" name="fromCityId" value="30"/>
		<input type="hidden" id="toCityId" name="toCityId" value="30"/>
		<input type="hidden" id="fromTime" name="fromTime" value="2017-12-20 10:00"/>
		<input type="hidden" id="fromEndTime" name="fromEndTime" value=""/>
		<input type="hidden" id="fromDate" name="fromDate" value="2017-12-20"/>
		<input type="hidden" id="fromHour" name="fromHour" value="10"/>
		<input type="hidden" id="fromMinute" name="fromMinute" value="00"/>
		<input type="hidden" id="rentDay" name="rentDay" value="2"/>
		
		<input type="hidden" id="toTime" name="toTime" value="2017-12-22 10:00"/>
		<input type="hidden" id="toDate" name="toDate" value="2017-12-22"/>
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
		<input type="hidden" id="fromStoreChainFlag" name="fromStoreChainFlag" value="0"/>
		
		<input type="hidden" id="modeId" name="modeId" value=""/>
		<input type="hidden" id="modeName" name="modeName" value=""/>
		<input type="hidden" id="isSendMoney" name="isSendMoney" value=""/>
		<input type="hidden" id="vehicleLevel" name="vehicleLevel" value=""/>
		<input type="hidden" id="isLevelOrder" name="isLevelOrder" value=""/>
		<input type="hidden" id="isLevelChangeDep" name="isLevelChangeDep" value=""/>
		
		<input type="hidden" id="workdayPackage_notify" name="workdayPackage_notify" value=""/>
		<input type="hidden" id="totalRentPrice" name="totalRentPrice" value=""/>
			<input type="hidden" id="isLongRent" name="isLongRent" value="0"/>
		<input type="hidden" name="clickpositon" id="clickpositon" value="rent">
		<input type="hidden" name="flag" id="flag" value="carListPage">
		
		<input type="hidden" name="checkMemberId" id="checkMemberId" value=""/>
		<input type="hidden" name="memberId" id="memberId" value=""/>
		<input type="hidden" name="memberLevel" id="memberLevelVal" value=""/>
		<input type="hidden" name="memberState" id="memberState" value=""/>
		<input type="hidden" name="credit" id="credit" value=""/>
		<input type="hidden" name="identitycloseday" id="identitycloseday" value=""/>
		<input type="hidden" name="identityCardType" id="identityCardType" value=""/>
		
		
		

	</form>

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
		var pageSystemDate='2017-12-19 10:45';
		var priceLevel='1';
		var isHoliday = '';
		var differCityOrStore = ""==="true";
		var sentType = "0";
		var pickType = "0";
		var minDate = '2017-12-19';
		var currentDate = '2017-12-19';
		var hasCustomerDiscount = '';
		var orderId='';
		var spdbActivityParas = '';
		var modeLevel = "";

		seajs.use(['divided/som/entry/jQ@a576d97fa6','divided/som/entry/lib@0e5c12d914'],function(){
			seajs.use('divided/som/entry/cartlist@67fdf5fa1b');
		});
	</script>
	<div id="city_down_tips" class="city_down_tips" style="left: 373px; top: 170px; min-width: 212px; display: none;">
	 <div class="keydivh3" style="width: 212px;"><p style="width: 212px;"></p></div>
	 <div class="a_top_title" style="width: 202px; background: rgb(255, 255, 255);"><div id="a_error_info" style="white-space: nowrap; display: block;"></div><span id="dep_tip_info"><font color="red">输入汉字，用↑↓← →选择</font></span></div>
	 <ul id="city_tips_info">	 	
	 </ul>	 
	</div>

	
</body>
</html>