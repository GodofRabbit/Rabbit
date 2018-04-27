<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>最新资讯</title>
    <link href="<%=path%>/css/consult.css"rel="stylesheet">
    <link href="<%=path%>/css/share.css"rel="stylesheet">
    <script src="<%=path%>/js/jquery-1.12.3.js"></script>    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path%>/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="<%=path%>/index.jsp">首页</a> </li>
                <li><a href="<%=path%>/hot.jsp">蔬果热卖</a> </li>
                <li><a href="<%=path%>/goods.go">全部产品</a> </li>
                <li><a href="<%=path%>/consult.jsp" style="color: #4AB344"><span style="color: #4AB344">最新资讯</span></a></li>
                <li><a href="<%=path%>/touch.jsp">联系我们</a> </li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom"  >
                </div>
            </div>
        </div>
        <div class="headr-right">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            <a href="<%=path%>/cart.jsp">我的购物车 ∨</a>
            <div class="hr-car">
                <i class="iconfont"style="font-size: 40px;margin-right: 10px">&#xe633;</i>
                您的购物车内暂时没有任何产品。
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束-->
<!--banner图片-->
<div class="her-banner">

</div>
<!--banner图片结束-->
<div class="content">
    <!--最新资讯开始-->
    <div class="recommand clear">
        <div class="rec-cont clear">
            <div class="rec-left">
                <div class="classily">
                    <div class="cltop">
                        <p>产品分类</p>
                    </div>
                    <div class="cltcon">
                        <p><a href="#">国产水果</a> </p>
                        <p><a href="#"> 进口水果</a></p>
                        <p style="border-bottom:0px dashed #999999;"><a href="#">新鲜时蔬</a></p>
                    </div>

                </div>
                <div class="service">
                    <div class="cltop">
                        <p>在线客服</p>
                    </div>
                    <div class="sercon">
                       <div class="qqs">
                           <p><a hidefocus="true" href="#">
                               <span class="serOnline-img0 qqImg0">&nbsp;</span>蜜桃
                           </a>
                           </p>
                           <P><a hidefocus="true" href="#">
                               <span class="serOnline-img0 qqImg0">&nbsp;</span>芒果
                           </a>
                           </P>
                       </div>
                        <div class="tims">
                            <div class="marBL-10">
                                <span class="worktime-header-img">&nbsp;</span>
                                <span class="serWorkTimeText"><b>工作时间</b></span>
                            </div>
                            <div class="serOnline-list-v "><span>周一至周五 ：8:30-17:30</span></div>
                            <div class="serOnline-list-v lastData"><span>周六至周日 ：9:00-17:00</span></div>
                        </div>
                    </div>

                </div>

            </div>

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
                        <li><a href="#" class="active">1</a></li>
                        <li><span>下一页</span></li>
                    </ul>

                </div>
            </div>


        </div>
    </div>

    <!--最新资讯结束-->
</div>
<!--底部-->
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="<%=path%>/images/fot-1.jpg">
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
            <p>手机版 | 本站使用<span><img src="images/ft.jpg"></span>凡科建站搭建 | 管理登录</p>
        </div>

    </div>
</div>
</body>
<script src="<%=path%>/js/consult.js"></script>
</html>
