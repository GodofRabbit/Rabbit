<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c"%>
<html>
<head>
	<%@include file="../main/text.jsp"%>
</head>
<body>
<h2>
	<span class="more"><a href="#" target="_blank">更多&gt;&gt;</a> </span>最新上架图书
</h2>
<div class="book_c_04">

	<!--热销图书A开始-->
	<c:iterator value="pros">
	<div class="second_d_wai">
		<div class="img">
			<a href="product?id=${id}" target='_blank'><img
					src="../productImages/${productPic}" border=0 class="dongimg"/> </a>
		</div>
		<div class="shuming">
			<a href='product?id=${id}' target="_blank">${productName}</a><a href="#" target="_blank"></a>
		</div>
		<div class="price">
			定价：￥${fixedPrice }
		</div>
		<div class="price">
			当当价：￥${dangPrice}
		</div>
	</div>
	</c:iterator>
	<div class="book_c_xy_long"></div>
	<!--热销图书A结束-->

</div>
<div class="clear"></div>
</body>
</html>