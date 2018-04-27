<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<html>
	<head>
	<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="../css/list.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#left").html("正在加载中。。");
				$("#left").load("/dangdang/main/newMANCategory.action");
			});
		
		</script>
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
    <div class="book_center">
      <div class=second_c_border1 id="selectuser">
		<table border="1" cellpadding="0" cellspacing="0" 
		width="110%">
			<caption>用户列表</caption>
			<tr><td>id</td><td>邮箱 </td><td>昵称</td><td>密码</td>
			<td>最后登陆ip</td><td>操作</td>
			</tr>
		
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
			
		</table>
		<div id="divTopPageNavi" class="list_r_title_text3">
		<s:if test="page>1">
							
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="../main/selectuser?page=${page-1}">
								<img src='../images/page_up.gif' /> </a>
							</div>
							</s:if>
							
							
							<s:else>
							<div class='list_r_title_text'>
								<img src='../images/page_up_gray.gif' />
							</div>
							</s:else>
							<div class='list_r_title_text3b'>
								第${page}页/共${maxPage}页
							</div>
							<s:if test="page<maxPage">
							
							<div class='list_r_title_text'>
								<a name=link_page_next
									href="../main/selectuser?page=${page+1}">
									<img src='../images/page_down.gif' /> </a>
							</div>
							</s:if>
							
							<s:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_down_gray.gif' />
							</div>
							</s:else>
							</div>
							</div>
							</div>
							<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>