<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>添加图书 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
	
	</head>
	<body>
		&gt;<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			添加图书步骤: 1.书籍信息 >
			 2.作者与印刷厂商信息 >3.分类选择  > <span class="red_bold">4.完成</span>
		</div>
		<div class="fill_message">
			<h2 style="color: blue">插入的书籍信息如下：</h2>
			<table class="tab_login" border="1" cellpadding="0">
				
				<tr>
					<td rowspan="6"><img  width="100px" height="100px" src="../productImages/${Books.productPic}" /></td>
				</tr>
				<tr>
					<td>书&nbsp;&nbsp;名:${Books.productName}</td>
					<td>上架时间：${Books.addTime1}</td>
					<td>ISBN：${Books.isbn}</td>
					
					
				</tr>
				<tr>
					<td>作&nbsp;&nbsp;者：${Books.author}</td>
					<td>原&nbsp;&nbsp;价：￥${Books.fixedPrice}</td>
					<td>包&nbsp;&nbsp;装：平包</td>
					
					
				</tr>
				<tr>
					<td>&nbsp;出版社：${Books.publishing}</td>
					<td>现&nbsp;&nbsp;价：￥${Books.dangPrice}</td>
					<td>纸&nbsp;&nbsp;张：胶版纸</td>
					
					
				</tr>
				<tr>
					<td>出版时间：${Books.publishTime1}</td>
					<td>字&nbsp;&nbsp;数：${Books.wordnumber}</td>
					<td>中文分类:${Books.name}</td>
					
					
				</tr>
				<tr>
					<td>版&nbsp;&nbsp;次：${Books.whichediion}</td>
					<td>页&nbsp;&nbsp;数：${Books.totalpage}</td>
					<td>英文分类:${Books.en_name}</td>
					<td></td>
					
				</tr>
		
			</table>
			
			
				<a href="../main/guanli.jsp" style="color:red">返回管理员菜单</a>
		
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

