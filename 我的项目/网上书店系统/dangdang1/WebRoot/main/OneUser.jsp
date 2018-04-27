<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
	<title>在线购物系统</title>
		<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
			$(function(){
			$("#new").html("正在加载中。。");
				$("#new").load("/dangdang/main/findnew.action");
				$("#left").html("正在加载中。。");
				$("#left").load("/dangdang/main/newMANCategory.action");
				
				
	
	
			});
		
		</script>
		<link href="../css/list.css" rel="stylesheet" type="text/css" />
		<style>
			.row1{
				background-color:#fff8dc;
			}
			.row2{
				background-color:yellow;
			}
			
		</style>
		
		
	</head>
	<body >
	&nbsp;
		<!-- 头部开始 -->
		<%@include file="../common/managehead.jsp"%>
		<!-- 头部结束 -->
		<div style="width: 962px; margin: auto;">
			<a href="#" target="_blank"><img
					src="../images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>

		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
			</div>
			<!--左栏结束-->
	<!--中栏开始-->
			<div class="book_center">
		<table border="1" cellpadding="0" cellspacing="0" 
		width="110%">
			<caption>用户列表</caption>
			<tr><td>id</td><td>邮箱 </td><td>昵称</td><td>密码</td>
			<td>最后登陆ip</td><td>操作</td>
			</tr>
		<s:if test="Users.size()==0">
		<tr >
			<td style="color: Red;font-size: 20px">没有此用户</td>
		</tr>
		
		</s:if>
		<s:else>
			<s:iterator value="Users" var="user">
			        
					<tr class="row${id%2+1}">
					 <td>${id}</td>
					 <td>${email}</td>
					 <td>${nickname}</td>
					 <td>${password}</td>
					 <td>${last_login_ip }</td>
					 <td><a href="/dangdang/main/deleteUser.action?id=${id}">删除</a>|
								<a href="/dangdang/main/updateUserB?id=${id}">修改</a>|
								<a href="/dangdang/main/updatequanxian.action?id=${id}">设置管理员</a></td>
					</tr>
				
			</s:iterator>	
			</s:else>
		</table>
						
		
		</div>
			<!--中栏结束-->
			<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>