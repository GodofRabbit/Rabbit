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
			<caption>订单列表</caption>
			<tr><td>用户名</td><td>购买时间 </td><td>收货地址</td><td>邮编</td>
			<td>手机号码</td><td width="50px">原价<td>数量</td><td>书名</td><td>作者</td><td>ISBN<td>图片</td>
			<td>操作</td>
			</tr>
		<s:if test="Georders.size()==0">
			<tr><td style="color: Red;font-size: 20px">不好意思没有订单</td></tr>
		</s:if>
		<s:else>
			<s:iterator value="Georders" var="georder">
			        
					<tr class="row${orderTime}">
					 <td>${nickname}</td>
					 <td>${orderTime}</td>
					 <td>${receiveName}</td>
					 <td>${postalCode}</td>
					 <td>${mobile }</td>
					 
					  <td>￥${dangPrice}</td>
					  <td>${productNum }</td>
					  <td>${productName}</td>
					  <td>${author}</td>
					  <td>${isbn}</td>
					  
					  <td>
					  <s:if test="productPic!=NULL">
					  <img width="50px" height="50px" src="../productImages/${productPic }"/>
					  </s:if>
					  <s:else>
					  <img width="50px" height="50px" src="../images/default/button01_080527_book.jpg"/>
					  </s:else>
					  
					  </td>
					  <td><a href="/dangdang/main/deleteorderonly.action?id=${id}">删除</a>|
								<a href="../main/updateOrder1.action?orderId=${orderId}">修改</a></td>
					</tr>
				
			</s:iterator>	
			</s:else>
		</table>
		<div id="divTopPageNavi" class="list_r_title_text3">
		<s:if test="page>1">
							
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="../main/searchAllorder?page=${page-1}">
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
									href="../main/searchAllorder?page=${page+1}">
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
			<!--中栏结束-->
			<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>