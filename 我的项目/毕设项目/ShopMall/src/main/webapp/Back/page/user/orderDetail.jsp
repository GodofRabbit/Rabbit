<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订单详情</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/Back/css/css.css" />
<script type="text/javascript" src="<%=path %>/Back/js/jquery.min.js"></script>
</head>
<style>
	body{
		background:url(<%=path %>/Back/images/860462_20161105193527807120_1.jpg) top left;
		background-size:100% 200%;
	}
</style>
  <body style="width:100%; height:100%;">
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
		<a href="#" onclick="javascript:history.back(-1);"> <img src="<%=path %>/Back/images/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
		<a href="#" onclick="javascript:history.go(1);"> <img src="<%=path %>/Back/images/timg2.jpg" height="22px" width="22px"/></a>
		订单详情
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				
				<!-- user 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="200px" class="tdColor">商品图片</td>
							<td width="250px" class="tdColor">商品名称</td>
							<td width="250px" class="tdColor">商品单价</td>
							<td width="150px" class="tdColor">购买数量</td>
							<td width="250px" class="tdColor">小计</td>
						</tr>

                 <tbody id="boody_tr">
	                   <!-- 遍历的内容 -->
	              <c:forEach var="d" items="${list}">
	              <tr height="100px">
					<td><img src="<%=path%>/Back/images/${d.goods_imageurl}" width="200px" height="100px"/></td>
					<td>${d.goodsname}</td>
					<td>${d.goodsprice}</td>
					<td>${d.goods_num}</td>
					<td>${d.goods_num*d.goodsprice}</td>
					</tr>
	              </c:forEach>
	                   
                 </tbody>
					</table>
					<br/>
                    	<span style="font-size:30px; color:#ff9900">总计:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${d}元</span>
				</div><br/>
				<span style="font-size:20px;">订单有新的进展，需改变状态？</span>
				<br/>
				<div>
			    <label><span style="font-size:15px;">请选择订单状态:</span></label>
			    <div>
			      	<input type="radio" name="state" value="1" checked><span style="font-size:15px;">未支付</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	<input type="radio" name="state" value="2"><span style="font-size:15px;">已支付（待发货）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	<input type="radio" name="state" value="3"><span style="font-size:15px;">已发货（待收货）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      	<input type="radio" name="state" value="4"><span style="font-size:15px;">交易完成（收货）</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <input type="button" style="height:30px;width:100px;" value="确定" onclick="udos();"/>
			    </div>
		   </div>
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
    var m ="${message}";
		if(m!=""){
			alert(m);
		}
	function udos(){
	   var order_id = "${order_id}";
	   var state = $("input:radio:checked").val();
	   $.ajax({
	      type:"post",
	      resultType:"json",
	      data:{order_id:order_id,state:state},
	      url:"http://localhost:8080/ShopMall/udos.do",
	      success:function(result){
	         if(result.state==1){
	         alert("更新成功！");
	         window.history.back();
	         }else{
	           alert("更新失败，请重试");
	         }
	      }
	   })
	}
</script>
</html>