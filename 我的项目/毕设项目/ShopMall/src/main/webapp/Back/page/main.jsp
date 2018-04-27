<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>果然新鲜后台管理</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../css/main.css" media="all" />
    <link rel="stylesheet" href="../css/font_eolqem241z66flxr.css"  media="all" type="text/css"></link>
    </head>
<body class="childrenBody">
	<div class="panel_box row">
<!-- 		<div class="panel col"> -->
<!-- 			<a href="message/message.html"> -->
<!-- 				<div class="panel_icon"> -->
<!-- 					<i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i> -->
<!-- 				</div> -->
<!-- 				<div class="panel_word newMessage"> -->
<!-- 					<span></span> -->
<!-- 					<cite>新消息</cite> -->
<!-- 				</div> -->
<!-- 			</a> -->
<!-- 		</div> -->
		<shiro:hasRole name="root">  
		<div class="panel col">
			<a href="<%=path %>/Back/page/user/Admin.jsp">
				<div class="panel_icon" style="background-color:#FF5722;">
					<i class="iconfont icon-dongtaifensishu"></i>
				</div>	
				<div class="panel_word userAll">
					<span></span>
				<cite>管理员管理</cite>
				</div>
			</a>
		</div>
		</shiro:hasRole>
		<div class="panel col">
			<a href="<%=path %>/Back/page/user/allUsers.jsp">
				<div class="panel_icon" style="background-color:#009688;">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word userAll">
					<span></span>
					<cite>会员管理</cite>
				</div>
			</a>
		</div>
<!-- 		<div class="panel col"> -->
<!-- 			<a href="img/images.html"> -->
<!-- 				<div class="panel_icon" style="background-color:#5FB878;"> -->
<!-- 					<i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i> -->
<!-- 				</div> -->
<!-- 				<div class="panel_word imgAll"> -->
<!-- 					<span></span> -->
<!-- 					<cite>图片管理</cite> -->
<!-- 				</div> -->
<!-- 			</a> -->
<!-- 		</div> -->
		<div class="panel col">
			<a href="<%=path %>/Back/page/user/allgoods.jsp">
				<div class="panel_icon" style="background-color:#F7B824;">
					<i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
				</div>
				<div class="panel_word waitNews">
					<span></span>
					<cite>商品管理</cite>
				</div>
			</a>
		</div>
		<div class="panel col max_panel">
			<a href="<%=path %>/Back/page/user/order.jsp">
				<div class="panel_icon" style="background-color:#2F4056;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word allNews">
					<span></span>
					<em>订单管理</em>
					<cite>订单列表</cite>
				</div>
			</a>
		</div>
	</div>
	<blockquote class="layui-elem-quote">
		<p>警言：</p>
		<p>总有人在你切一盘水果时秒杀一道数学题,总有人在你调整愤怒的小鸟弹射角度时记住一个单词,总有人在你打一盘dota的时间内看完一章教材,总有人在你打一局2K的时间里完成一套阅读题,总有人在你与他人闲聊时听一段VOA,总有人在你熟睡时回想一天的得失,总有人比你跑得快,你还会虚度光阴么?</p>
		<p style="margin-top:5px;">开发文档地址：<a class="layui-btn layui-btn-mini" target="_blank" href="http://www.layui.com/doc">点此跳转</a> <a class="layui-btn layui-btn-mini layui-btn-danger" target="_blank" href="http://fly.layui.com/case/u/3198216">我要点赞</a>　　技术交流QQ群：535986733</span></p>
	</blockquote>
</body>
</html>