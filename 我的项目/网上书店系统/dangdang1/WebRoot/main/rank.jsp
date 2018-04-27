<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="c"%>
<table>
	<c:iterator value="pros" status="count">
	<tr>
		<td><img src="../images/book_no0${count.index+1}.gif"/></td>
		<td><a href="/dangdang/main/product?id=${id}" target="_blank">${productName }</a></td>
	</tr>
	</c:iterator>
</table>
<span class="dot_r"> </span><a href="#" target="_blank">更多&gt;&gt;</a>