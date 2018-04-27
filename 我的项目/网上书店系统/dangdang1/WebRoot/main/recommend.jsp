<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c"%>
<html>
<head><%@include file="../main/text.jsp"%></head>
<body>
<h2>
	编辑推荐
</h2>
<div id=__bianjituijian/danpin>
	<div class=second_c_02>
		<c:iterator value="books">
		<div class=second_c_02_b1>
			<div class=second_c_02_b1_1>
				<a href='product?id=${id}' target='_blank'><img src="../productImages/${productPic}" width=70 border=0 class="dongimg"/> </a>
			</div>
			<div class=second_c_02_b1_2>
				<h3>
					<a href='product?id=${id}' target='_blank' title='${productName}'>${productName }</a>
				</h3>
				<h4>
					作者：${author } 著
					<br />
					出版社：${publishing}&nbsp;&nbsp;&nbsp;&nbsp;出版时间：${time}
				</h4>
				<h5>
					${description}
				</h5>
				<h6>
					定价：￥${fixedPrice}&nbsp;&nbsp;当当价：￥${dangPrice}
				</h6>
				<div class=line_xx></div>
			</div>
		</div>
		</c:iterator>
	</div>
</div>
</body></html>

