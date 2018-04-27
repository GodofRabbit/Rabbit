<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <title>果然新鲜</title>
    <link href="<%=path%>/css/index.css"rel="stylesheet">
    <link href="<%=path%>/css/share.css"rel="stylesheet">
    <script src="<%=path%>/js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript">
               function exit(){
              if(confirm("您确定注销吗？")){
               window.location.href="<%=path%>/logout.go";
            }else{
              return;
            }
               }
     </script>
     
 <script type="text/javascript">
       var user = "${findUser.realname}";
            function test(){
                if(user!=""){
                    alert("请勿重复登录！");
                    return false;
                }else{
                    return true;
                }
            }
    </script>
    
<script type="text/javascript">
$(function(){
        $("#look").click(function(){
          var user = "${findUser.id}";
            if(user!=""){
                 $(this).attr("href","<%=path%>/carList.go?user_id="+user); 
          }else{
               alert("亲，请先登录！");
               return false;
            }
                 
			});
		})
</script>

<script type="text/javascript">
     $(function(){
         var $all = $("div.rcr:gt(5)");
         $all.hide();
         var $showmore=$(".showmore");
         $showmore.click(function(){
             if($all.is(":visible")){
                $all.hide();
                $showmore.text(">>显示全部<<");
             }else{
                $all.show(); 
                $showmore.text(">>精简显示<<");
             }
         });
     })
</script>
</head>
 <body>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path%>/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav"><br>
            <ul>
                <li><a href="<%=path%>/index.jsp"style="color: #4AB344"><span style="color: #4AB344">首页</span></a> </li>
                <li><a href="<%=path%>/hot.jsp">蔬果热卖</a> </li>
                <li><a href="<%=path%>/goods.go">全部产品</a> </li>
                <li><a href="<%=path%>/consult.jsp">最新资讯</a></li>
                <li><a href="<%=path%>/touch.jsp">联系我们</a> </li>
            </ul> 
            <div class="sptopfoot">
                <div class="spbottom" >
                </div>
            </div>
        </div>
        <a href="javascript:vopid(0);" onclick="exit();"><div class="headr-right">注销</div></a>
        <a href="<%=path%>/log.go" onclick="return test();"> <div class="headr-right"><span id="logo">登录</span></div></a>
        <br><br><br><br>
        <div class="headr-right"><span>欢迎，亲爱的${findUser.realname}</span></div>
        <div class="headr-right">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            <a href="<%=path%>/cart.jsp" id="look">我的购物车 ∨</a>
            <div class="hr-car">
                <i class="iconfont"style="font-size: 40px;margin-right: 10px">&#xe633;</i>
                您的购物车内暂时没有任何产品。
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束-->

<!--主页内容-->
<div class="content">
    <div class="ban-boot clear">
        <div class="ban-zs">
            <img src="<%=path%>/images/ban-1.jpg" width="100%">
        </div>
        <div class="ban-zs">
            <img src="<%=path%>/images/ban-2.jpg" width="100%">
        </div>
        <div class="ban-zs">
            <img src="<%=path%>/images/ban-3.jpg" width="100%">
        </div>
    </div>
    <!--果园推荐开始-->
    <div class="recommand clear">
        <div class="rec-nav clear">
            <h2>果园推荐 <span>RECOMMAND</span></h2>
        </div>
        <div class="rec-cont clear">
            <div class="rec-left">
                <img src="<%=path%>/images/rc-1.jpg">
            </div>

            <div class="rec-right">

                <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/rc-2.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            南非进口黄柠檬 6个装
                        </div>
                            <div class="second_P">
                                <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">29
                                    <span class="fk-prop-p">.00</span>
                                </span>
                                <span class="second_Marketprice">￥0.00</span>
                            </div>
                       
                    </div>
                </div>
                
                
                <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/rc-3.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            智利进口新鲜蓝莓 4盒
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">99
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/rc-4.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            美国进口红啤梨 6个
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">48
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/rc-5.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            美国进口无籽红提 1kg
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">39
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/rc-6.jpg" width="100%">
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
                        
                    </div>
                </div>
                <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/rc-7.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            浙江涌泉蜜桔无核桔子5斤
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">39
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                
                
                
                
            </div>
        </div>
         <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/ht-20.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            泰国金枕头榴莲
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">129
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
            <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/ht-24.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            新疆库尔勒香梨 5斤礼盒装
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">36
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                 <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/ht-25.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                          新鲜水果龙眼
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">10
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                 <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/ht-27.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            越南进口红心火龙果 5斤
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">38
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
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
                                <span class="fk-prop-price">27
                                    <span class="fk-prop-p">.50</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
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
                                <span class="fk-prop-price">33
                                    <span class="fk-prop-p">.50</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
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
                        
                    </div>
                </div>
                 <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/ht-4.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                            梨福建特级红心蜜柚 4个
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">69
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
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
                        
                    </div>
                </div>
                 <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/pr-1.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                              大红脆甜水蜜桃 5斤
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">29
                                    <span class="fk-prop-p">.00</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                        
                    </div>
                </div>
                 <div class="rcr">
                    <div class="rcr-top">
                        <img src="<%=path%>/images/ht-19.jpg" width="100%">
                    </div>
                    <div class="rcr-bot">
                        <div class="rb-top">
                             四川大凉山会理石榴8个
                        </div>
                        <div class="second_P">
                            <span class="fk-prop">￥</span>
                                <span class="fk-prop-price">37
                                    <span class="fk-prop-p">.50</span>
                                </span>
                            <span class="second_Marketprice">￥0.00</span>
                        </div>
                          
                    </div>
                </div>   
          <div style="float: right"><font style="font-size: 20px"><a class="showmore"><font color="#FFD700">>>显示全部<<</font></a></font></div> 
    </div>   
   <!--果园推荐结束-->
   
</div>
<!--每日新品特卖-->
    <div class="rec-bottom clear">
        <div class="rbt-con">
                <div class="banner_1">
                    <img src="<%=path%>/images/rb-1.jpg"width="1424px">
                    <img src="<%=path%>/images/rb-2.jpg"width="1424px">
                </div>
        </div>
                <ul class="banner-bottom">

                </ul>
    </div>
<div class="content">
    <div class="new-nav clear">
        <div class="nwn-con">
            <div style="text-align: center;">
                <span style="">
                    <span style="font-size: 31px;">
                        <font style="color: rgb(33, 33, 33);" color="#212121">
                        <font style="color: rgb(231, 231, 231);" color="#e7e7e7">
                            ———————
                        </font>
                            <b>&nbsp; 每日新品特卖 &nbsp;</b>
                        </font></span></span>
                <span style="font-size: 31px;">
                <font style="color: rgb(231, 231, 231);" color="#e7e7e7">
                    ———————
                </font>
            </span>
            </div>
       <div style="text-align: center;">
                <font color="#353535" style="">
                    <span style="font-size: 16px;">
                            <font style= color:#888888>
                                新鲜水果每一天，健康生活每一刻
                            </font>
                    </span>
                </font></div>

        </div>


    </div>
    <div class="new-con clear">
        <div class="nec-lift">
            <div class="fk-editor simpleText  ">
                <font color="#4b4b4b">
                    <span style="">
                        <span style="line-height: 29px;">
                            <span style="color: rgb(75, 75, 75); font-size: 16px;">
                                有机生鲜
                            </span>
                            <div style="color: rgb(75, 75, 75);">
                                <span style="font-size: 20px;">
                                    天然无污染水果
                                </span>
                            </div>
                        </span>
                    </span>
                    <div style="color: rgb(75, 75, 75);">
                        <span style="font-size: 20px;">
                            <br>
                        </span>
                   	</div>
                    <div>
                        <font style="color: rgb(243, 151, 0);" color="#f39700">
                    <b>
                        <span style="font-size: 42px;">6.8</span>
                    </b><span style="font-size: 42px;">
                    <b>折</b>
                    <span style="font-size: 18px;">
                        <font style="color: rgb(53, 53, 53);" color="#353535">起</font>
                    </span></span></font></div>
                </font>
            </div>
            <div class="xiqing">
                <a  href="<%=path%>/adsf"style="color: white">查看详情 &gt;</a>
            </div>
        </div>
        <div class="nec-right">
            <img src="<%=path%>/images/nw-1.jpg">

        </div>

    </div>
    <div class="new-bottom clear">
        <div class="nw-b">
            <img src="<%=path%>/images/nw-2.jpg">
        </div>
        <div class="nw-b">
            <img src="<%=path%>/images/nw-3.jpg">
        </div>
        <div class="nw-b">
            <img src="<%=path%>/images/nw-4.jpg">
        </div>
        <div class="nw-b" style="margin:0">
            <img src="<%=path%>/images/nw-5.jpg">
        </div>
    </div>
    <!--每日新品特卖结束-->
    <!--蔬果资讯-->
    <div class="fruits">
        <div class="fru-nav">
            <div class="fk-editorb ">
                <font style="color: rgb(103, 141, 30);" color="#678d1e">蔬果资讯</font>
            </div>
            <font style="color: rgb(53, 53, 53);float: right" color="#353535">更多资讯</font>
        </div>
        <div class="fru-lift">
            <div class="frl-nav">
                <ul>
                    <li>品种</li>
                    <li>地区</li>
                    <li>价格</li>
                  <span>时间</span>
                </ul>
            </div>
            <div class="txtMarquee-top">
                <div class="bd">
                    <ul class="infoList">

                        <li><p>苹果</p>
                            <p>河南省济源市</p>
                            <p >5.5/kg</p>
                            04-09
                        </li>
                        <li><p> 西瓜</p>
                            <p>	内蒙古鄂尔多斯</p>
                            <p >10/kg</p>
                            04-09
                        </li>
                        <li><p>葡萄</p>
                            <p>新疆乌鲁木齐</p>
                            <p >19/kg</p>
                            04-09
                        </li>
                        <li><p>车厘子</p><p>河南省郑州市</p><p>	58.5/kg</p> 04-09</li>
                        <li><p>菜心	</p><p>河南省新乡市</p><p>	5.5/kg</p>	04-09</li>
                        <li><p>西兰花</p>	<p>河南省信阳市</p><p>	3.5/kg</p>	04-09</li>
                        <li><p>苹果	</p><p>河南省济源市</p><p>	5.5/kg	</p>04-09</li>
                        <li><p>西瓜	</p><p>内蒙古鄂尔多斯</p><p>10/kg</p>	04-09</li>
                        <li><p>葡萄	</p><p>新疆乌鲁木齐	</p><p>19/kg</p>	04-09</li>
                        <li><p>菜心	</p><p>河南省新乡市</p><p>	5.5/kg	</p>04-09</li>
                        <li><p>西兰花</p><p>	河南省信阳市</p><p>	3.5/kg	</p>04-09</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="fru-right">
            <div id="slideBox" class="slideBox">
                <div class="hd">
                    <!--<ul><li>蜜橘首发</li>-->
                        <!--<li>智利车厘子</li>-->
                        <!--<li>进口青苹果</li>-->
                    <!--</ul>-->
                    <ul><li>1</li><li>2</li><li>3</li></ul>
                </div>
                <div class="bd">
                    <ul>
                        <li><a href="#" target="_blank"><img src="<%=path%>/images/fr-1.jpg" /></a></li>
                        <li><a href="#" target="_blank"><img src="<%=path%>/images/fr-2.jpg" /></a></li>
                        <li><a href="#" target="_blank"><img src="<%=path%>/images/fr-3.jpg" /></a></li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
    <!--蔬果资讯结束-->
</div>
<!--主页内容结束-->
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
<script src="<%=path%>/js/index.js"></script>
</html>
