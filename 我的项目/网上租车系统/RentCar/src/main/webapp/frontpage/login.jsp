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
<meta name="description" content="神州租车，天天有新车，新用户得100元！全国1000+服务网点,100+车型,100%车险,无限里程!周租月租6折起,24小时服务,手续便捷,还能免费上门送取.Tel:400-616-6666">
<meta name="keywords" content="租车,租车网,租车公司,汽车租赁">
<title>会员登录—神州租车——全球租车领导品牌</title>

<!-- 新版所用css文件 -->
<link rel="stylesheet" type="text/css" href="https://css.zuchecdn.com/divided/lm/entry/main@e5b2f7853d.css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.min.js"></script>
</head>

<body>
	<div class="zc_page_bd"><div class="zc_page_title">欢迎登录</div></div>
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
	<!--banner loginbox start -->
	
	<div class="zc_login_bd">
	<form id="loginfo" action="http://localhost:8080/RentCar/login.do" method="post">
	    <div class="zc_main">
	        <div class="zc_login_box">
	            <ul class="tabs">
	                <li id="normallogin" class="cur">登录</li>
	                <input type="hidden" id="logintype">
	            </ul>
	            <div class="boxremove" style="width:730px;position:relative;">
		            <div class="tabcontents cur" style="float:left;">
		            	<div class="zc_l_error" id="error_tips">
		            	<div id="error_info" class="input-errlog ipt-err" style="top: -29px; left: 30px; display: none;">
			            	<span class="arrowbox">◆<span class="arrow">◆</span></span>
			            	<span class="zc-retan"></span><i id="error_detail"></i>
			            	<span class="zc-close"  onclick="conceal();"></span></div>
		            	</div>
		                <ul>
		                    <li><label class="icon_wz"><span class="zc-iuser "></span></label>
		                        <input type="text" class="wipt t_val" name="account" id="account" placeholder="请输入手机号/证件号" maxlength="18">
		                    </li>
		                    <li class="pass_switchover"><label class="icon_wz"><span class="zc-ipsw "></span></label>
		                        <input type="password" class="wipt" name="password" placeholder="请输入密码" id="password" >
		                    </li>
		                    <li class="zc_list_che">
		                        <label class="fl"><span class="zc-blyes" style="display: inline-block;"></span><span class="zc_blyes_kong" style="display: none;"></span>
		                        <input id="autoLogin" checked="" class="login_checkbox" value="checked" type="checkbox">30天内自动登录</label>
		                        <a href="https://passport.zuche.com/member/loginandregist/getpassword.do" class="fr">忘记密码？</a>
		                        <div class="clear"></div>
		                    </li>
		                </ul>
		                <ul class="login_sub" id="login_sub">
		                	<li><input type="button" onclick="logon();" class="zc-btn btn-login" value="登录" id="loginBt" ></li>
		                	<li><div class="zc_login_rbox">还不是会员？<a href="<%=path%>/frontpage/register.jsp" rel="nofollow" >立即注册</a> </div></li>
		            	</ul>
		                <input type="hidden" name="autoLogin" id="remember"  value="remember"></input>
		            </div>	
	       		</div>
	        </div>
	    </div>
	    </form>
	    
                   
    <!-- 隐藏域 -->
		<input type="hidden" id="flag" value="">
		<input type="hidden" id="xuserName" value="">
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
	<!--banner loginbox end -->
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
      $("#error_detail").text(info);
      $("#error_info").css("display","block");
     }
     //点击让提示信息隐藏
     function conceal(){
       $("#error_info").css("display","none");
     }
     //30天自动登录选择事件
     $("#autoLogin").click(function(){
      $(".zc_list_che").toggle(
        function(){
         $(".zc-blyes").css("display","none");
         $(".zc_blyes_kong").css("display","inline-block");
          $("#remember").val("");
         },
        function(){
          $(".zc_blyes_kong").css("display","none");
          $(".zc-blyes").css("display","inline-block");
          $("#remember").val("remember");
         })
       })
    //登录非空验证
    function logon(){
       var account = $("#account").val();
       var password = $("#password").val();
       if(account==""){
           $("#error_detail").text("请输入手机号/证件号");
           $("#error_info").css("display","block");
       }else if(password==""){
           $("#error_info").css("top","19px");
           $("#error_detail").text("请输入密码");
           $("#error_info").css("display","block");
       }else{
          $("#loginfo").submit();
       }
    }
       
</script>
</html>