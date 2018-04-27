<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
<meta charset="utf-8">
	<link href="http://m.zuche.com" rel="dns-prefetch">
	<title>新用户专享150元见面礼_神州租车</title>
	<meta name="description" content="神州租车新用户注册赢豪礼！150元新用户专享租车代金券等你来拿，从4月1日起，新用户注册即送100元电子代金券，首次租车结算后再送50元电子代金券，新用户专享券适用于全国所有直营门店全部车型，节假日通用。日租车、周租车、月租车、假期租车、租好车，享优惠就到神州租车，神州租车天天特价。">
	<meta name="keywords" content="新用户专享券,神州租车券,租车代金券">
	<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<style>
	*{padding:0;margin:0}a{text-decoration:none}
	a:hover{text-decoration:none}
	.wrap,.ban{max-width:1920px;min-width:1100px;width:100%;margin:0 auto;color:#000;background-color:#fff;background-repeat:no-repeat;background-position:center top}
	.wmprepl160{width:922px;margin:0 auto}
	dl.wmprepl160{line-height:44px;font-size:24px;color:#2e2e2e;font-family:"Microsoft yahei"}
	dl.wmprepl160 dt{font-size:30px;height:30px;margin-top:40px;margin-bottom:20px;line-height:30px;color:#2e2e2e;font-weight:bold;border-left:10px solid #ab1e00;padding-left:20px}
	dl.wmprepl160 dd{font-size:24px;color:#2e2e2e;padding-left:25px;background:url("https://mktimage.zuchecdn.com/mktweb/2017/osnmgift/web_list_style_img.jpg") no-repeat left 17px}
	dl.wmprepl160 dd.pl0{padding-left:0;background:none}
	.wx_wrap{width:895px;margin:50px auto 70px auto;text-align:center}
    </style>
    <script type="text/javascript"  src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
       $(function(){
         $("#btn1").click(function(){
             $.get("http://localhost:8080/RentCar/addUserCoupon.do?cid=${coupon.id }",function(data,status){              
               if(data.state==1){
                 alert(data.message);
                 window.location="frontpage/login.jsp";
                
               }else if(data.state==2){
                 alert(data.message);
               }else if(data.state==3){
                  alert(data.message);
               }else{
                  alert(data.message);
                  window.location="http://localhost:8080/RentCar/CouponFindAll.do";
               }
            }) 
         })
         
       })
    
    </script>
<body style="background:#fff;">
<link type="text/css" rel="stylesheet" href="https://css.zuchecdn.com/newversion/??global.css,aboutus.css?v=201408190800" />
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
	var internationalURL='https://international.zuche.com';
	var enURL='https://en.zuche.com';
	var orderURL='https://order.zuche.com';
	var leasingURL='https://leasing.zuche.com';
	var easyrideURL='https://easyride.zuche.com';
	var serviceURL='https://service.zuche.com';
	var jsVersion = '201408190800';
	var protocol='https://';
	var protocoldm='https://';
	var helpURL = 'https://help.zuche.com';
	var irURL = 'https://ir.zuche.com';
</script><script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/seajs/sea.js?v=201408190800"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/seajs/seajs-preload.js?v=201408190800"></script>
<script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/seajs/seaconfig.js?v=201408190800"></script><input type = "hidden" id="mebId" value = ''>
<div class="hdNav">
	<div class="abusw980 height30" style="width:1280px;">
    	<div class="fr">
            <span id="loginMemberInfo" style="display: none;">欢迎您，&nbsp;
	            <span id="memberName"></span>&nbsp; 
	            <!-- <a href="https://passport.zuche.com/memberManage/xtoploginMember.do?act=delsession" class="yellow">退出</a> -->
            </span>
            <span id="loginDiv">
            
             <c:if test="${empty user }">
	            <a href="http://localhost:8080/RentCar/frontpage/login.jsp" class="yellow">登录</a>&nbsp;或&nbsp;
	            <a href="http://localhost:8080/RentCar/frontpage/register.jsp" class="yellow">注册</a>
            </c:if>
            <c:if test="${not empty user }">
               <h1>欢迎你${user.username }</h1>
            </c:if>
            </span>
        </div>
       
    </div>
</div>
<div class="wrap" width="100%">
    <div class="ban h1"></div>
    <div class="ban h2"><div class="wmprepl160"><img src="http://localhost:8080/RentCar/${coupon.img }" width="100%"></div></div>    
    <div class="ban h6">
        <dl class="wmprepl160">
            <dt>活动规则</dt>
            <dd class="pl0">${coupon.description }</dd>          
        </dl>
    </div>
    <div><button id="btn1" style="height:100px;width:400px;position:relative;left:500px;"><h1>点击一下，领取优惠券</h1></button></div>
</div>
<div class="clear"></div>
<div class="sz_footer">
	<p>
		<a title="关于我们" href="https://huodong.zuche.com/gywm/">关于我们</a>
		|&nbsp;<a title="投资者关系" target="_blank" href="https://ir.zuche.com">投资者关系</a>
		|&nbsp;<a rel="nofollow" target="_parent" title="新闻中心" href="https://huodong.zuche.com/gsdt/">新闻中心</a>
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
		<!-- footer end-->
<script type="text/javascript" src="https://js.zuchecdn.com/newversion/sea/common/bdshare.js?v=201408190800" ></script>
<script>
	seajs.use(['jspath/cms/activity/foot']);
</script><script type="text/javascript">
seajs.use(['jspath/jquery/jquery-1.7.1.min'],function(){
	var getUrlParam = function(key) {
	    var url = window.location.search;
	    url = url.split("?")[1];
	    if (!url) {
	        return null;
	    }
	    var value = null;
	    var params = url.split("&");
	   
	    $.each(params,
	        function(i, param) {
	    		var index = param.indexOf("=");
	    		var kvkey = param.substring(0,index);
	    		var kvvalue = param.substring(index+1);
	            if (kvkey == key) {
	                value = decodeURIComponent(kvvalue);
	                return false;
	            }
	        });
	    return value;
	};
	$(function(){
		var szhdbm = getUrlParam("szhdbm");
		if(szhdbm){
			$(".op-btngo").click(function(){
				setTimeout(function(){
					window.location.href="https://passport.zuche.com/member/loginandregist/regist.do";
				},300);
			});
		}else{
			$(".op-btngo").attr("href","https://passport.zuche.com/member/loginandregist/regist.do");
		}
	});
});
	
</script>
</body>
</html>