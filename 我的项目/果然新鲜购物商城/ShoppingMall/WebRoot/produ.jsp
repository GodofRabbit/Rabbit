<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <title>全部产品</title>
    <link href="<%=path%>/css/produ.css"rel="stylesheet">
    <link href="<%=path%>/css/share.css"rel="stylesheet">
    <script src="<%=path%>/js/jquery-1.12.3.js"></script>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/layui.css" type="text/css"></link>
    
<script type="text/javascript">
$(function(){
        $("#look").click(function(){
          var user = "${findUser.id}";
            if(user!=""){
                 $(this).attr("href","<%=path%>/carList.go?user_id="+user); 
           return true;
            }else{
               alert("亲，请先登录！");
               return false;
            }
                 
			});
		})
</script>
  </head>
  <body>
  <form action="" method="post" id="form1">
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="<%=path%>/images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="<%=path%>/index.jsp">首页</a> </li>
                <li><a href="<%=path%>/hot.jsp">蔬果热卖</a> </li>
                <li><a href="<%=path%>/goods.go" style="color: #4AB344"><span style="color: #4AB344">全部产品</span></a> </li>
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
            <a href="<%=path%>/cart.jsp" id="look">我的购物车 ∨</a>
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
<c:forEach items="${page.dataList}" var="fruit">
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=path%>/images/${fruit.goods_imageurl}" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    ${fruit.goodsname}
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">${fruit.goodsprice}0
                                        </span>
                                    <span class="second_Marketprice">￥0.00</span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy" href="<%=path%>/findOne.go?fid=${fruit.id}">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
</c:forEach> 
                     </div></div><br><br>  
<!-- 分页 -->
                <div class="hd"><h3>
                共${page.totalPage }页&nbsp;&nbsp;&nbsp;&nbsp;第${page.currentPage }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:void(0);" onclick="firstPage();">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0);" onclick="prePage();">上一页</a>&nbsp;&nbsp;
                    <a href="javascript:void(0);" onclick="nextPage();">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="javascript:void(0);" onclick="lastPage();">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      第<input type="text" name="jumpPage" value="${search}" style="width:25px"/>页
                           <a href="javascript:void(0);" onclick="jumpPage();">  <button class="layui-btn layui-btn-small">跳转</button></a>
               </h3></div>
                
                
            </div>
        </div>
    </div>

    <!--产品推荐结束-->
</div>
<!--底部-->
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="images/fot-1.jpg">
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
</div></form>
</body>
<script type="text/javascript">
function submiForm(url){
		var element =  document.getElementById("form1");
		element.action=url;
		element.submit();
	}
	var currentPage=${page.currentPage};
	var totalPage =${page.totalPage };
	function prePage(){
		if(currentPage==1){
			alert("没有上一页");
		}else{
			submiForm("${pageContext.request.contextPath}/goods.go?currentPage="+(currentPage-1));
		}
	}
	function nextPage(){
		if(currentPage==totalPage){
			alert("没有下一页");
		}else{
			submiForm("${pageContext.request.contextPath}/goods.go?currentPage="+(currentPage+1));
		}
	}
	function firstPage(){
			submiForm("${pageContext.request.contextPath}/goods.go?currentPage=1");
	}
	function lastPage(){
			submiForm("${pageContext.request.contextPath}/goods.go?currentPage="+totalPage);
	}
	function jumpPage(){
		submiForm("${pageContext.request.contextPath}/goods2.go?currentPage="+currentPage);
}
</script>
<script src="<%=path%>/js/produ.js"></script>
</html>
