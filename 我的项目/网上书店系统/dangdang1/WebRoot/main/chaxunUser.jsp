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
			<h5 style="color: Red;">不可以输入中文,可以选择查询的</h5>
				<form action="/dangdang/main/findUserMain.action" method="post">
				<table border="0" cellpadding="0" cellspacing="0" 
		width="110%">
					<tr>
						<td>请输入邮箱：</td>
						<td><input type="text" name="email"/><br/></td>
					</tr>
					<tr>
						<td> 请输入用户别名：</td>
						<td><input type="text" name="alises"/><br/></td>
					</tr>
					<tr><td></td><td><input type="submit" value="确定查询"/></td></tr>
				</table>
				  
				
				 
				</form>
						
		
		</div>
			<!--中栏结束-->
			<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>