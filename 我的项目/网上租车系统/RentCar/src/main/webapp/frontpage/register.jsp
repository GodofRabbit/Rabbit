<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="description" content="神州租车，天天有新车，新用户得150元！全国1000+服务网点,100+车型,100%车险,无限里程!周租月租6折起,24小时服务,手续便捷,还能免费上门送取.Tel:400-616-6666">
<meta name="keywords" content="租车,租车网,租车公司,汽车租赁">
<title>会员注册—神州租车——全球租车领导品牌</title>

<!-- 新版所用css文件 -->
<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/divided/lm/entry/main@e5b2f7853d.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/register.js"></script>
</head>

<body onload="reCheckcode();">
	<div class="zc_page_bd"><div class="zc_page_title" lcwa-se="注册页-注册按钮,注册页-立即登陆,注册页-注册成功">欢迎注册</div></div>
	<!--head start -->
<div class="zc_head_bd">
    <div class="zc_main">
        <a href="<%=path %>/index.jsp" class="zc_logo" alt="神州租车"></a>
        <div class="zc_phone_bd">
			<div class="p-re zc_p_h">
				<span class="zc-tel"></span>
				<div class="zc_ga_phonebox"><img src="https://image.zuchecdn.com/newStatic/newversion/common/zc_gaphone.png" alt="港澳台及海外电话861058209555"></div>
			</div>
		</div>
    </div>
</div>	<!--head end -->
	<div class="zc-pbox">
		<div class="zc-inbox">
			<div class="reg-l">
				<p class="reg-title ltitle">注册新用户</p>
				<form id="myform" name="myform" action="http://localhost:8080/RentCar/register.do" method="post" autocomplete="off" accept-charset="utf-8">
				<ul>
					<li class="zc-iptbox">
						<span class="rstar">*</span>
						<label><span class="zc-iuser"></span></label>
						<input name="username" id="username" class="zc-ipt t_val" type="text" placeholder="请输入您的真实姓名"  maxlength="20" >
						<input id="ffzfname"  type="hidden">
						<div class="input-erreg ipt-err" id="namecheck_tips" style=" display: none;">
							<span class="arrowbox">◆<span class="arrow">◆</span></span>
							<span class="zc-retan"></span>
							<i id="username_err"></i>
							<span class="zc-close" onclick="conceal();"></span>
						</div>
					</li>
					<li class="zc-iptbox">
						<span class="rstar">*</span>
						<label><span class="zc-iphone"></span></label>
						<input name="phone" id="phone" class="zc-ipt t_val" type="text" placeholder="请输入您的手机号" maxlength="11" default-value="请输入您的手机号" onblur="checkPhone();">
						<input type="hidden"  id="smsOverTime" />
						<div class="input-erreg ipt-err" id="mobilecheck_tips" style=" display: none;">
							<span class="arrowbox">◆<span class="arrow">◆</span></span>
							<span class="zc-retan"></span>
							<i id="phone_err"></i>
							<span class="zc-close" onclick="conceal();"></span>
						</div>
					</li>
                    <li class="zc-iptbox" 	>
						<label><span class="zc-iyzm"></span></label>
						<input class="zc-iptsht t_val" id="xyzm" name="checkCode" type="text" placeholder="请输入右侧验证码" maxlength="6" style="width:145px;color: rgb(147, 147, 158);">
						<span class="pic-yzm"><img id="kaptchaImage" src=""></span><span>看不清楚？<a onclick="reCheckcode();"><i class="zc-fresh" id="changeYzmBT"></i></a></span>
						<div class="input-errlog ipt-err" id="codecheck_tips" style="display: none;">
							<span class="arrowbox">◆<span class="arrow">◆</span></span>
							<span class="zc-retan"></span>
							<i class="pl0" id="codeError"></i>
							<span class="zc-close" onclick="conceal();"></span>
						</div>
				    </li>	
					<li class="zc-iptbox">
						<span class="rstar">*</span>
						<label><span class="zc-ipsw"></span></label>
						<input class="zc-ipt ipt-passwordH" type="password" name="password" id="xpassword" placeholder="建议6-18位数字、字母、符号的组合" maxlength="20" style="display:block" onclick="displayEye();" onblur="checkPassword();" onkeyup="passwordIntension();">
						<input class="zc-ipt ipt-passwordH" type="text" id="xpassword2" placeholder="建议6-18位数字、字母、符号的组合" maxlength="20" style="display:none">
						<input id="ffzfpassword" type="hidden">
						<span class="zc-secret zc-peyeh bhide" style="display:none" id="eye" onmouseover="displayPassword();" onmouseout="hidePassword();"></span>
						<div class="input-erreg ipt-err" id="passwordcheck_tips" style=" display: none;">
							<span class="arrowbox">◆<span class="arrow">◆</span></span>
							<span class="zc-retan"></span>
							<i id="password_err"></i>
							<span class="zc-close" onclick="conceal();"></span>
						</div>
						<div class="zc-safepsw" id="pwdLevelDiv">
							<span class="safe_1">弱</span>
							<span class="safe_2">中</span>
							<span class="safe_3">强</span>
						</div>
					</li>
					<li class="zc-iptbox">
						<span class="rstar">*</span>
						<label><span class="zc-ipsw"></span></label>
						<input class="zc-ipt ipt-passwordS" type="password" id="xpassword1"  placeholder="确认密码" maxlength="20">
						<input id="ffzfpassword" type="hidden">
						<span class="zc-secret zc-peyes bhide"></span>
						<div class="input-erreg ipt-err" id="passwordcheck_tips1" style=" display: none;">
							<span class="arrowbox">◆<span class="arrow">◆</span></span>
							<span class="zc-retan"></span>
							<i id="password_err1"></i>
							<span class="zc-close" onclick="conceal();"></span>
						</div>
					</li>
				</ul>
				</form>
				<p class="lfwtk"><input class="zc-yes zc-rayes" type="checkbox" checked="checked"><span class="zc-yes zc-blyes"></span>我已阅读并同意<a href="http://localhost:8080/RentCar/frontpage/rulesKJT.html" target="_blank">《神州租车会员服务条款》</a></p>
				<a class="zc-btn btn-reg" href="javascript:void(0);" id="nextButton" onClick="register();">注册</a>
			</div>
			<div class="reg-r">
				<p class="reg-title rtitle">已有账号？<a href="<%=path %>/frontpage/login.jsp" rel="nofollow" onClick="window.LCTJ&&window.LCTJ.putBe({type:3,name:'注册页-立即登陆'})">立即登录&nbsp;»</a></p>
				<div class="wapbox" style="padding:0px;border:0px;">
					<img class="qcode" src="https://image.zuchecdn.com/newStatic/newversion/common/tipsregist.png" usemap="#Map">
					<map name="Map">
					  <area shape="rect" coords="142,321,252,341" href="https://huodong.zuche.com/activityplanning/topic/ojnewmemebr.html" target="_blank">
					</map>
					<div style="display:block;">
						<p class="text">手机预定专享优惠</p>
						<p class="text textc">新客户首日<span>0元</span>租</p>
						<img class="qcode" src="https://image.zuchecdn.com/newStatic/common/qcode.jpg">
						<p class="mobtxt">手机浏览器访问: m.zuche.com</p>
					</div>
					
				</div>

			</div>
		</div>
	</div>
	<div class="p-re zc_b_bd">
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
	<!--foot start -->
<div class="zc_footmenu">
    <div class="zc_main">
        <dl class="wyd">
            <dt>租车预订说明</dt>
            <dd>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp#fwgz01">服务时间</a>
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
            <dt>租车费用及结算</dt>
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
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/cjwt1.jsp">常见问题</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/xssl.jsp">新手上路</a>
                <a target="_blank" href="https://help.zuche.com/jsp/newhelp/fwgz.jsp">服务规则</a>
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
	<!--foot end -->

</body>
<script type="text/javascript">
     var info = "${info}";
     if(info!=""){
      $("#codeError").text(info);
      $("#codecheck_tips").css("display","block");
     }
</script>
</html>