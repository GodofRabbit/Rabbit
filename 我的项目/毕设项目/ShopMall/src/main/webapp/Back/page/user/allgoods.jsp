<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/Back/css/css.css" />
<script type="text/javascript" src="<%=path %>/Back/js/jquery.min.js"></script>
</head>
 <style>
	body{
		background:url(<%=path %>/Back/images/beijing2.jpg) top left;
		background-size:100% 100%;
		overflow:hidden;
	}
</style>
  <body style="width:100%; height:100%;" onload="BackgoodsDisplay(url);">
  <input id="page" type="hidden" value="1"/>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
		<a href="#" onclick="javascript:history.back(-1);"> <img src="<%=path %>/Back/images/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
		<a href="#" onclick="javascript:history.go(1);"> <img src="<%=path %>/Back/images/timg2.jpg" height="22px" width="22px"/></a>
		商品管理
			</div>
		</div>

		
		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
						<div class="cfD">
							<input id="keywords" class="userinput" type="text" placeholder="请输入关键字" name="goodsname" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="userbtn" onclick="searchGoods();" style="cursor: pointer">查询</button>
							<a href="<%=path %>/Back/page/user/addgoods.jsp" ><button class="userbtn" style="cursor: pointer">上架商品</button></a>
						</div>
				</div>
				<!-- goods 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="100px" class="tdColor">商品名称</td>
							<td width="100px" class="tdColor">商品单价</td>
							<td width="130px" class="tdColor">商品图片</td>
							<td width="435px" class="tdColor">商品上架时间</td>
							<td width="130px" class="tdColor">商品库存</td>
 							<td width="130px" class="tdColor">商品状态<br>(1.上架，2.下架)</td>   <!--商品状态，1.上架，2.下架 -->
 							<td width="130px" class="tdColor">操作</td>
						</tr>
						<tbody id="boody_tr">
	                          <!-- 遍历的内容 -->
                        </tbody>
		
					</table>
					 <div class="paging"> 
                    	<h4>共<span id="totalRecord"></span>条记录&nbsp;&nbsp;&nbsp;&nbsp;共<span id="totalPage"></span>页&nbsp;&nbsp;&nbsp;&nbsp;当前第<span id="currentPage"></span>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a id="firstPage" href="javascript:void(0);" onclick="firstPage(url);">首页</a>&nbsp;&nbsp;
                    	<a id="prePage" href="javascript:void(0);" onclick="prePage();">上一页</a>&nbsp;&nbsp;
                    	<a id="nextPage" href="javascript:void(0);" onclick="nextPage();">下一页</a>&nbsp;&nbsp;
                    	<a id="lastPage" href="javascript:void(0);" onclick="lastPage(url);">尾页</a>&nbsp;&nbsp;
                    
                                                            跳转至第<input id="jump" type="text" value="" style="width:25px"/>页
                           <a id="assign" href="javascript:void(0);" onclick="jumpPage();"> <input type="button" value="确定" style="cursor: pointer"></input></a></h4>
                    </div>
				</div>
				<!-- goods 表格 显示 end-->
			</div>
			<!-- goods页面样式end -->
		</div>

	</div>

</body>
<script type="text/javascript" src="<%=path %>/Back/page/js/allgoods.js"></script>
<script type="text/javascript">
// 广告弹出框
$(".delban").click(function(){
  $(".banDel").show();
});
$(".close").click(function(){
  $(".banDel").hide();
});
$(".no").click(function(){
  $(".banDel").hide();
});
	
    var m ="${message}";
		if(m!=""){
			alert(m);
		}
// 广告弹出框 end
</script>
</html>