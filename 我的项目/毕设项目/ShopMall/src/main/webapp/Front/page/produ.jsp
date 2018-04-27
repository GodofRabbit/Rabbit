<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <title>果然新鲜</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="<%=path%>/Front/css/layui.css" type="text/css"></link>
    <link href="<%=path%>/Front/css/produ.css"rel="stylesheet">
    <link href="<%=path%>/Front/css/share.css"rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/Front/css/consult.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=path%>/Front/css/touch.css" type="text/css"></link>
    <script src="<%=path%>/Front/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="<%=path%>/Front/js/jquery.SuperSlide.2.1.1.js"></script>
   <style type="text/css">
        a:link {color: #000000}     /* 未访问的链接 */
		a:visited {color: black}  /* 已访问的链接 */
		a:hover {color: #d90a81}    /* 当有鼠标悬停在链接上 */
		a:active {color: #d90a81}   /* 被选择的链接 */
   </style>
  </head>
  <body onload="loading();">
  <input id="page" type="hidden" value="1"/>
  <div style="display: none;"><span id="totalPage"></span><span id="currentPage"></span></div>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="Front/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav"><br>
            <ul>
                <li><a href="<%=path %>/index.jsp"style="color: #4AB344"><span style="color: #4AB344">首页</span></a> </li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=130">蔬果热卖</a> </li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=240">全部产品</a> </li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=350">最新资讯</a></li>
                <li><a href="<%=path %>/Front/page/produ.jsp?id=460">联系我们</a> </li>
            </ul> 
            <div class="sptopfoot">
                <div class="spbottom" >
                </div>
            </div>
        </div>
        <shiro:user><a href="javascript:vopid(0);" onclick="exit();"><div class="headr-right">退出</div></a></shiro:user>
        <c:if test="${empty cookie.rememberMe}"><shiro:notAuthenticated><a href="Front/page/register.jsp"> <div class="headr-right"><span id="logo">注册</span></div></a></shiro:notAuthenticated></c:if>
        <c:if test="${empty cookie.rememberMe}"><shiro:notAuthenticated><a href="login.jsp"> <div class="headr-right"><span id="logo">登录</span></div></a></shiro:notAuthenticated></c:if>
        <shiro:user><div class="headr-right"><a href="<%=path %>/loadMyOrder.do"><font color="blue" id="dearUser"><shiro:principal/></font>的个人中心</a></div></shiro:user>
        <br><br><br><br>
        <div class="headr-right" id="shopcart">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            <a href="<%=path %>/Front/page/cart.jsp" id="look" onclick="myCart();">我的购物车 ∨</a>
            
        </div>
    </div>
</div>
<!--顶部导航结束-->
<!--banner图片-->
<div class="her-banner">

</div>
<!--banner图片结束-->
<div class="content">
    <!--产品推荐开始-->
    <div class="recommand clear">
        <div class="rec-cont clear">
            <div class="rec-left">
                <div class="classily">
                    <div class="cltop">
                        <p>产品分类</p>
                    </div>
                    <div class="cltcon">
                        <p><a href="Front/page/produ.jsp?id=131">国产水果</a> </p>
                        <p><a href="Front/page/produ.jsp?id=132"> 进口水果</a></p>
                        <p style="border-bottom:0px dashed #999999;">
                        <a href="Front/page/produ.jsp?id=133">新鲜时蔬</a></p>
                    </div>

                </div>

            </div>
<!-- 蔬果热卖、全部产品 -->
<c:if test="${param.id!=350 && param.id!=460}"> 
            <div class="rec-right">
                    <div class="bd1"  style="display: block" id="allProdu">
                    </div> 
                     <div class="hd">
                    <ul>
                        <li id="pre"><a href="javascript:;" onclick="prePage();">上一页</a></li>
                         <span id="cat"></span>
                        <li id="next"><a href="javascript:;" onclick="nextPage();">下一页</a></li>
                    </ul>
                </div>
                
            </div>
</c:if>            
<!-- 最新资讯 -->
<c:if test="${param.id==350}">
        <div class="rec-right">
               <div class="bd">
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>谁在为“蒜你狠”推波助澜</h3>
                            <p>近期，部分城市大蒜零售价格超过每公斤20元，多地大蒜价格同比上涨90％以上，不少人惊呼“蒜你狠”卷土重来。　　“新...</p>
                        </div>

                    </div>
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>美国一批次洋葱重金属超标被通报</h3>
                            <p>11月8日台湾食药署发布边境查验不合格食品名单显示，美国一批次洋葱重金属超标被通报。一批次洋葱的进口商为“舒坦达贸....</p>
                        </div>

                    </div>
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>辣椒价格炒上近年同期新高</h3>
                            <p>近期，“蒜你狠”，“姜你军”卷土重来。眼下，冬天的宠儿红辣椒也可谓是出尽风头，价格直线上涨，破近年来同期新高。可以...</p>
                        </div>

                    </div>
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>蒜你狠再度来袭蒜农挣得盆满钵满</h3>
                            <p>入冬以来，随着气温下降，想吃大蒜的市民多起来了。然而，2010年的“蒜你狠”还历历在目，今年“蒜你狠”又重新上演。...</p>
                        </div>

                    </div>
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>“网红”橙子去年劲爆今年退热</h3>
                            <p>2015年，橙子成为各电商的“网红”产品。继褚橙之后，天天果园、爱鲜蜂、沱沱工社等生鲜电商陆续推出“橙先生.........</p>
                        </div>

                    </div>
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>西红柿价格一月内下跌15</h3>
                            <p>一个多月前，做一盘西红柿炒鸡蛋，精打细算的人会告诉你，多放鸡蛋，少放西红柿。这说明当时西红柿比鸡蛋要贵。...</p>
                        </div>

                    </div>
                    <div class="rec-cot">
                        <div class="rgl-cont">
                            <p>28</p>
                            <span>2016/11</span>
                        </div>
                        <div class="rgr-cont">
                            <h3>谁在为“蒜你狠”推波助澜</h3>
                            <p>近期，部分城市大蒜零售价格超过每公斤20元，多地大蒜价格同比上涨90％以上，不少人惊呼“蒜你狠”卷土重来。　　“新...</p>
                        </div>

                    </div>
               </div>

                <div class="hd">
                    <ul>
                        <li><span>上一页</span></li>
                        <li><a href="javascript:;" class="active">1</a></li>
                        <li><span>下一页</span></li>
                    </ul>

                </div>
            </div>
</c:if>        
  <!-- 联系我们 -->
<c:if test="${param.id==460}">
          <div class="rec-right">
                <div class="rec-top">
                    <div class="rt-left">
                        <img src="<%=path%>/Front/images/tou-1.png">
                    </div>
                    <div class="rt-right">
                        <span style="line-height: 32px;">
                            <span style=""><div style="">
                                <span style="color: rgb(51, 51, 51); font-size: 18px; background-color: transparent;">
                                    向越来越多的人提供最好吃的水果
                                </span><br style=""></div><div style=""><span style="">
                                <p style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 12px;">
                                    <span style="font-size: 14px; font-family: 微软雅黑; color: rgb(51, 51, 51);">
                                        FRESH蔬果（集团）有限公司以蔬果、水果、粮油、肉类、冻品、水产、南北干货以及花卉等农产品批发市场经营管理、生鲜配送为主力业态。
                                    </span></p>
                                <p style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 12px;"><span style="font-size: 14px; font-family: 微软雅黑; color: rgb(51, 51, 51);">
                                    用毕生精力致力于水果产业链和水果专营连锁业态的发展，为消费者提供最好吃的水果。开拓创新立宏愿，决心“一生只做一件事，一心一意做水果”。
                                </span></p></span><p style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 12px;"></p></div></span><div style="">
                            <p style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 12px;"></p></div></span>
                    </div>

                </div>
                <div class="fk-editor simpleText  ">
                        <font style="color: rgb(5, 160, 69);" color="#05a045">
                            <span style="font-size: 15px;">
                                &nbsp; &nbsp; &nbsp; &nbsp; * 如有合作需要，请填写以下表单，我们将尽快给您回复，并为您提供最真诚的服务，谢谢您的支持。
                            </span>
                        </font>

                </div>
                <div class="message">
                    <p>姓名</p>
                    <div class="siteFormMiddle">
                        <input _show="1"class="g_itext" type="text"placeholder="请输入真实姓名" id="concatname">
                        <div class="star">*</div>
                    </div>
                    <p>电话</p>
                    <div class="siteFormMiddle">
                        <input _show="1"class="g_itext" type="text"placeholder="请输入真实电话" id="concatphone">
                        <div class="star">*</div>
                    </div>
                    <p>联系时间</p>
                    <div class="siteFormMiddle">
                        <select _show="1" class="resize" id="concattime">
                            <option value="none" style="display: none; ">请选择</option>
                            <option value="工作日">工作日</option>
                            <option value="周末">周末</option>
                            <option value="随时">随时</option>
                        </select>
                    </div>
                    <p>留言内容</p>
                    <div class="siteFormMiddle" style="height: 102px; ">
                        <textarea id="concattext" class="g_textarea resize" cols="50" rows="3" maxlength="1000" placeholder="请输入留言"></textarea>
                        <div class="star"style="line-height: 100px;">*</div>
                    </div>
                    <p>购买方式</p>
                    <div class="siteFormMiddle">
                        <div class="siteFormItemCheckItem_N_U siteFormItemCheckItem_N_U_A">
                            <input type="radio" id="M376F1siteFormRadio3I0" name="M376F1siteFormRadioR3" value="批发">
                            <label for="M376F1siteFormRadio3I0">批发</label>
                        </div>
                        <div class="siteFormItemCheckItem_N_U siteFormItemCheckItem_N_U_A">
                            <input type="radio" id="M376F1siteFormRadio3I1" name="M376F1siteFormRadioR3" value="零食">
                            <label for="M376F1siteFormRadio3I1">零售</label>
                        </div>
                    </div>
                    <div class="s_ibutton" onclick="concat();">
                    </div>
                </div>
            </div>
</c:if>
  <!-- 联系我们结束 -->
        </div>
    </div>

    <!--产品推荐结束-->
</div>
<!--底部-->
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="<%=path%>/Front/images/fot-1.jpg">
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
  <script type="text/javascript" src="<%=path%>/Front/js/produ.js"></script>
</html>
