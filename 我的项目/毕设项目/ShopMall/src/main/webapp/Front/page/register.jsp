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
<title>果然新鲜</title>
<link rel="stylesheet" href="<%=path %>/Front/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=path %>/Front/css/share.css" type="text/css"></link>
<link rel="stylesheet" href="<%=path %>/Front/css/register.css" type="text/css"></link>
<script type="text/javascript" src="<%=path %>/Front/js/jquery-3.2.1.js"></script>
</head>
<body onload="reCheckcode();">
	<div class="zc_page_bd"><div class="zc_page_title" lcwa-se="注册页-注册按钮,注册页-立即登陆,注册页-注册成功">欢迎注册</div></div>
	<!--head start -->
<div class="zc_head_bd">
    <div class="zc_main">
    <a href="index.jsp" class="zc_logo" alt="果然新鲜"></a>
    </div>
</div>	<!--head end -->
	<div class="zc-pbox">
		<div class="zc-inbox">
			<div class="reg-l">
				<p class="reg-title ltitle">注册新用户</p>
				<form id="myform" name="myform" action="http://localhost:8080/ShopMall/register.do" method="post" autocomplete="off" accept-charset="utf-8">
				<ul>
					<li class="zc-iptbox">
						<span class="rstar">*</span>
						<label><span class="zc-iuser"></span></label>
						<input name="realname" id="realname" class="zc-ipt t_val" type="text" placeholder="请输入您的真实姓名"  maxlength="20" >
						<input id="ffzfname"  type="hidden">
						<div class="input-erreg ipt-err" id="realnamecheck_tips" style=" display: none;">
							<span class="arrowbox">◆<span class="arrow">◆</span></span>
							<span class="zc-retan"></span>
							<i id="realname_err"></i>
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
						<label><span class="zc-iuser"></span></label>
						<input name="username" id="username" class="zc-ipt t_val" type="text" placeholder="请输入注册账号"  maxlength="20" onblur="checkUsername();">
						<input type="hidden"  id="smsOverTime" />
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
				<p class="lfwtk"><input class="zc-yes zc-rayes" type="checkbox" checked="checked"><span class="zc-yes zc-blyes"></span>我已阅读并同意<a href="http://localhost:8080/RentCar/frontpage/rulesKJT.html" target="_blank">《会员服务条款》</a></p>
				<a class="zc-btn btn-reg" href="javascript:void(0);" id="nextButton" onClick="register();">注册</a>
			</div>
			<div class="reg-r">
				<p class="reg-title rtitle">已有账号？<a href="<%=path %>/login.jsp" rel="nofollow" onClick="window.LCTJ&&window.LCTJ.putBe({type:3,name:'注册页-立即登陆'})">立即登录&nbsp;»</a></p>
				<div class="wapbox" style="padding:0px;border:0px;">
					<img class="qcode" src="<%=path %>/Front/images/qrCode (1).gif" usemap="#Map">
					<map name="Map">
					  <area shape="rect" coords="142,321,252,341" href="#" target="_blank">
					</map>
					<div style="display:block;">
						<p class="text">手机预定专享优惠</p>
					</div>
					
				</div>

			</div>
		</div>
	</div>
	<!--底部-->
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
<script type="text/javascript" src="<%=path %>/Front/js/register.js"></script>
<script type="text/javascript">
     var info = "${info}";
     if(info!=""){
      $("#codeError").text(info);
      $("#codecheck_tips").css("display","block");
     }
</script>
</html>