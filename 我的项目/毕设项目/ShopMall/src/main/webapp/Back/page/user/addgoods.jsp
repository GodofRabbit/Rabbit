<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>商品上架/修改--果然新鲜后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="<%=path%>/Back/css/css.css" />
	<link rel="stylesheet" href="<%=path%>/Back/layui/css/layui.css" media="all" />
	<script type="text/javascript" src="<%=path%>/Back/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=path%>/Back/js/jquery-1.9.1.min.js"></script>
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
	</style>

</head>
<body>

<div>
<a href="#" onclick="javascript:history.go(-1);"> <img src="<%=path%>/Back/page/user/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
<a href="#" onclick="javascript:history.go(1);"> <img src="<%=path%>/Back/page/user/timg2.jpg" height="22px" width="22px"/></a>
</div>
	<form class="layui-form" style="width:40%;" action="<%=path%>/editGoods.do?goods_id=${goods.id}" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-block">
				<input name="goodsname" type="text" class="layui-input goodsName" lay-verify="required" placeholder="请输入商品名称" value="${goods.goodsname}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品单价</label>
			<div class="layui-input-block">
				<input id="input1" name="goodsprice" type="text" class="layui-input goodsName" lay-verify="required" placeholder="请输入商品单价" value="${goods.goodsprice}">
			</div>
		</div>
		<div class="layui-form-item"  id="input2">
			<label class="layui-form-label">图片路径</label>
			<div class="layui-input-block">
				<input name="goods_imageurl" type="text" class="layui-input goodsName" lay-verify="required" placeholder="请输入商品图片名" value="${goods.goods_imageurl}">
			</div>
		</div>
		<c:if test="${goods.id!=null}">
		<div class="layui-form-item"  id="input3">
			<label class="layui-form-label">上架时间</label>
			<div class="layui-input-block">
				<input name="goodstime" type="text" class="layui-input goodsName" lay-verify="required" placeholder="请输入商品上架时间" value="${goods.goodstime}">
			</div>
		</div>
		</c:if>
		<div class="layui-form-item">
			<label class="layui-form-label">商品库存</label>
			<div class="layui-input-block">
				<input name="num" type="text" class="layui-input goodsName" lay-verify="required" placeholder="请输入商品数量" value="${goods.num}">
			</div>
		</div>
		<div class="layui-inline">
			    <label class="layui-form-label">商品类别</label>
				<div class="layui-input-block">
					<select name="sort" class="userGrade" lay-filter="userGrade">
						<option value="1">国产水果</option>
						<option value="2">进口水果</option>
						<option value="3">新鲜时蔬</option>
				    </select>
				</div>
		    </div>
		 <div class="layui-inline">
			    <label class="layui-form-label">商品状态</label>
				<div class="layui-input-block">
					<select name="state" class="userGrade" lay-filter="userGrade">
						<option value="1">上架</option>
						<option value="2">下架</option>
				    </select>
				</div>
		    </div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" type="submit">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="<%=path%>/Back/layui/layui.js"></script>
	<script type="text/javascript" src="<%=path%>/Back/page/js/addUser.js"></script>
</body>
</html>