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
		<s:if test="Books.size()==0">
			<tr><td style="color: Red;font-size: 20px">不好意思没有图书</td></tr>
		</s:if>
		<s:else>
			<s:iterator value="Books" var="book">
			        
					<tr id="row${id}" name="row${id}">
						<table border="1" cellpadding="0">
				<tr>
					<td rowspan="6"><img  width="100px" height="100px" src="../productImages/${productPic}" /></td>
				</tr>
				<tr>
					<td>书&nbsp;&nbsp;名:${productName}</td>
					<td>上架时间：${addTime1}</td>
					<td>ISBN：${isbn}</td>
					<td>操作：</td>
					
				</tr>
				<tr>
					<td>作&nbsp;&nbsp;者：${author}</td>
					<td>原&nbsp;&nbsp;价：￥${fixedPrice}</td>
					<td>包&nbsp;&nbsp;装：平包</td>
					<td><a href="../main/updatebook?id=${id}"><img width="20px" height="20px" src="../images/updateOk.png"/></a></td>
					
				</tr>
				<tr>
					<td>&nbsp;出版社：${publishing}</td>
					<td>现&nbsp;&nbsp;价：￥${dangPrice}</td>
					<td>纸&nbsp;&nbsp;张：胶版纸</td>
					<td><a href='../main/book2.action?id=${id}' target="_blank">详细描述</a></td>
					
				</tr>
				<tr>
					<td>出版时间：${publishTime1}</td>
					<td>字&nbsp;&nbsp;数：${wordnumber}</td>
					<td>中文分类:${name}</td>
					<td><a href="../main/deletebook?id=${id}"><img width="20px" height="20px" src="../images/deleteOk.png"/></a></td>
					
				</tr>
				<tr>
					<td>版&nbsp;&nbsp;次：${whichediion}</td>
					<td>页&nbsp;&nbsp;数：${totalpage}</td>
					<td>英文分类:${en_name}</td>
					<td></td>
					
				</tr>
			</table>
					</tr>
				
			</s:iterator>	
			</s:else>
		</table>
		<div id="divTopPageNavi" class="list_r_title_text3">
		<s:if test="page>1">
							
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="../main/searchBookP?page=${page-1}">
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
									href="../main/searchBookP?page=${page+1}">
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