<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
   	<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
   	<script type="text/javascript">
   	$(function(){
			    $(".chaoji").click(function(){
			   
			    	var f=$(this).attr("name");
			    	
			       var result=$.ajax({type:"post",url:"../cart/buy.action?id="+f,async:false}).responseText;
			       
			      if(result=="true"){
			    	  $(".yinchang"+f).hide();
			    	  $("#cartinfo"+f).html("购买成功");
			    	  $("#cartinfo"+f).hide(2000);
			    	  $(".yinchang"+f).show(1000);
			    	  return false;
			      }else{
			    	    $(".yinchang").hide();
			    	  $("#cartinfo"+f).html("购买失败");
			    	  $("#cartinfo"+f).hide(2000);
			    	  $(".yinchang"+f).show(1000);
			    	  return false;
			      }
			    });
			});
   	</script>
  </head>
  
  <body>
  <a name="top">${product.productName }</a>
   <h1 style="color:black"></h1><br/>
   <h6 style="color:gray">丛书名：${product.productName }</h6>
   <hr/>
   	<table border="0" cellpadding="5">
   		<tr>
   			<td rowspan="9"><img width="200px" height="200px" src="../productImages/${product.productPic }"/></td>
   			<td>作&nbsp;&nbsp;者:${book.author }</td>
   		</tr>
   		<tr>
   			<td>出版社：${book.publishing }</td>
   		</tr>
   		<tr>
   			<td>出版时间：${book.rebTimechu }</td>
   			<td>字&nbsp;&nbsp;数：${book.wordnumber }</td>
   		</tr>
   		<tr>
   			<td>版&nbsp;&nbsp;次：${book.whichediion }</td>
   			<td>页&nbsp;&nbsp;数：${book.totalpage }</td>
   		</tr>
   		<tr>
   			<td>刷应时间：1970-1-1</td>
   			<td>开&nbsp;&nbsp;本：16k</td>
   		</tr>
   		<tr>
   			<td>印&nbsp;&nbsp;次：${book.pirinttime }</td>
   			<td>纸&nbsp;&nbsp;张：胶版纸</td>
   		</tr>
   		<tr>
   			<td>isbn：${book.isbn }</td>
   			<td>包&nbsp;&nbsp;装：平包</td>
   		</tr>
   		<tr>
   			<td> 定价：${product.fixedPrice }当当价格：${product.dangPrice }节省：${product.fixedPrice-product.dangPrice }</td>
   			
   		</tr>
   		<tr>
   			<td> <a href="#" class="chaoji" name="${product.id}"> 
							<img src='../images/buttom_goumai.gif' class="yinchang${product.id}"/> </a><br/><span id="cartinfo${product.id}"></span></td>
   			
   		</tr>
   	</table>
   <hr/>
   <div><h3 style="color:black">&gt;编辑推荐：</h3></div>
   <div>
   	<h6 style="color:gray">这是一本好书啊。此书是为各大人才写的！！aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
   	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</h6>
   	<div>--------------</div>
<div>-----------------</div>
   	<div>------------</div>
   	<div>------------</div>
   	<div>--------------</div>
   	<div>--------------</div>
   	<div>-----------</div>
   	<div>--------------</div>
   	<div>--------------</div>
   	<div>--------------</div>
   	<div>--------------</div>
  
   	<div>--------------</div>
   	<div>--------------</div>
   	<br/>
   	<a href="#top"><img src="../images/top.gif"></a>
   	
   </div>
  </body>
</html>
