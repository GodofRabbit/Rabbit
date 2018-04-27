<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>蔬果热卖</title>
    <link href="<%=path%>/css/hot.css"rel="stylesheet">
    <link href="<%=path%>/css/share.css"rel="stylesheet">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=path%>/js/jquery-1.12.3.js"></script>
  </head>
 <body>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path%>/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="<%=path%>/index.jsp">首页</a> </li>
                <li><a href="<%=path%>/hot.jsp"style="color: #4AB344"><span style="color: #4AB344">蔬果热卖</span></a> </li>
                <li><a href="<%=path%>/goods.go">全部产品</a> </li>
                <li><a href="<%=path%>/consult.jsp">最新资讯</a></li>
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
    <!--产品推荐开始-->
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
                    <div class="bd1"  style="display: block">
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-1.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    菠菜280g
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">19
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-2.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    进口香蕉超甜蕉
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">49
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-3.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    菲律宾进口菠萝凤梨 2个
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">38
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-4.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    福建特级红心蜜柚 4个

                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">69
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-5.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    广西青皮芒果青芒玉芒 5斤
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">39
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-6.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    加力果嗄啦果苹果12个装
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">39
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-7.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    国产绿奇异果 16颗
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">49
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-8.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    佳沛新西兰阳光金奇异果8颗
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">29
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-9.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    精选百香果西番莲8颗
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">29
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-10.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    莲藕5g
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">19
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-11.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    绿芦笋200g
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">39
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-12.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    美国进口红啤梨 6个
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">39
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bd1">
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-1.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    菠菜280g
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">19
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/ht-2.jpg" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    进口香蕉超甜蕉
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">49
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hd">
                    <div class="net">上一页</div>
                    <ul>
                        <li><a href="#" class="active">1</a></li>
                        <li><a href="#">2</a></li>
                    </ul>
                    <div class="next"> 下一页</div>

                </div>
            </div>


        </div>
    </div>

    <!--产品推荐结束-->
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
        </div>

    </div>
</div>
</body>
<script src="<%=path%>/js/hot.js"></script>
</html>
