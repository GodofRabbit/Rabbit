<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>在线购物系统</title>
	
		<script type="text/javascript" src="../js/jquery-1.4.4.js">
		</script>
		
		<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="../css/list.css" rel="stylesheet" type="text/css" />
			<%@include file="../main/text.jsp"%>
		<script>
	
			function buy(id){
				$.post("/dangdang/cart/buy",{"id":id},function(data){
					if(data){
						$("#message").css("display","block");
						setTimeout(hiddenMessage,3000);
					}
				},"json");
			}
			function hiddenMessage(){
				$("#message").css("display","none");
			}
		</script>
		<script>
			function changeOrder(){
				var orderType=$("select[name='orderType']").val();
				var order=$("select[name='order']").val();
				location="/dangdang/main/bookList?pid=${pid}&cid=${cid}&orderType="+orderType
				+"&order="+order;
			}
		</script>
		<style>
		#message{width:160px;height:60px;position:fixed;left:600px;top:350px;background:white;
		border: dotted gray;display:none;}
		.starArea{float:right;width:100px;height:150px;}
		</style>
	</head>
	<body>
		&nbsp;

		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#"><img src="../images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>
		<div class='your_position'>
			您现在的位置:&nbsp;
			<a href='/dangdang/main/main.jsp'>在线购物</a> &gt;&gt;
			<font style='color: #cc3300'><strong>${cats[0].parentName}</strong> </font>
		</div>

		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
				<div id="__fenleiliulan">
					<div class=second_l_border2>
						<h2>
							分类浏览
						</h2>
						<ul>
							<li>
								<div>
									<div class=second_fenlei>
										&middot;全部&nbsp;(${totalNum})
									</div>
								</div>
							</li>
							<div class="clear"></div>
							
							<!--2级分类开始-->
						<c:iterator value="cats">	
							<li>
								<div>
									<div class=second_fenlei>
										&middot;
									</div>
									
									<div class=second_fenlei<c:if test="id==cid">3</c:if>>
										<a href="bookList?pid=${pid}&cid=${id}">${name}&nbsp;(${num})</a>
									</div>
								</div>
							</li>
						    
							<div class="clear"></div>
						</c:iterator>	
							<!--2级分类结束-->
							
							<li>
								<div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right">

					<div id="book_list" class="list_r_title">
						<div class="list_r_title_text">
							排序方式
						</div>
						<select onchange='changeOrder();' name='orderType' size='1'
							class='list_r_title_ml'>
							<option <c:property value="orderType==1?'selected':''"/> value="1">
								按上架时间 
							</option>
							<option <c:property value="orderType==2?'selected':''"/> value="2">
								按价格
							</option>
							<option <c:property value="orderType==3?'selected':''"/> value="3">
								按购买次数 
							</option>
							<option <c:property value="orderType==4?'selected':''"/> value="4">
								按评分 
							</option>
						</select>
						<select onchange='changeOrder();' name='order' size='1'
							class='list_r_title_ml'>
							<option <c:property value="order==1?'selected':''"/> value="1">
								 降序
							</option>
							<option <c:property value="order==2?'selected':''"/> value="2">
								 升序
							</option>
						</select>
						<div id="divTopPageNavi" class="list_r_title_text3">

							<!--分页导航开始-->
						<c:if test="page!=1">	
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="bookList?pid=${pid}&cid=${cid}&page=${page-1}&orderType=${orderType}&order=${order}">
								<img src='../images/page_up.gif' /> </a>
							</div>
						</c:if>
						<c:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_up_gray.gif' />
							</div>
						</c:else>
							<div class='list_r_title_text3b'>
								第${page}页/共${maxPage}页
							</div>
						<c:if test="page!=maxPage">	
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="bookList?pid=${pid}&cid=${cid}&page=${page+1}&orderType=${orderType}&order=${order}">
									<img src='../images/page_down.gif' /> </a>
							</div>
						</c:if>
						<c:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_down_gray.gif' />
							</div>
						</c:else>
					<!--分页导航结束-->
						</div>
					</div>
					
					<!--商品条目开始-->
					<c:if test="books.size()==0">
						<table width="100%">	
						<tr><td align="center" valign="middle">抱歉目前还没有该商品</td></tr>
						</table>
					</c:if>
						<c:iterator value="books">						
						<div class="list_r_line" ></div>
						<div class="clear"></div>

						<div class="list_r_list" >
							<span class="list_r_list_book"><a name="link_prd_img" href='product?id=${id}'>
								<img src="../productImages/${productPic}" class="dongimg"/> </a> </span>
							<h2>
								<a name="link_prd_name" href='product?id=${id}'>${productName}</a>
							</h2>
							<h4 class="list_r_list_h4">
								作 者:
								<a href='#' name='作者'>${author}</a>
							</h4>
							<h4>
								出版社：
								<a href='#' name='出版社'>${publishing}</a>
							</h4>
							<h4>
								上架时间：${time}
							</h4>
							<h4 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
							<h4>
								<span style="font-size:40px;color:orange;">${star}</span>
								<span style="margin-left:10px;">已有${comments}人评价</span>
							</h4>
							<h5>
								作者总结：${description}
							</h5>
							<div class="clear"></div>
							<h6>
								<span class="del">￥${fixedPrice}</span>
								<span class="red">￥${dangPrice}</span>
								节省：￥${fixedPrice-dangPrice}
							</h6>
							<span class="list_r_list_button"> 
							<a href="javascript:;" onclick="buy(${id});"> 
							<img src='../images/buttom_goumai.gif' /> </a>
							<span id="cartinfo"></span>
						</div>
						<div class="clear"></div>
						</c:iterator>
						
					
						<!--商品条目结束-->

					<div class="clear"></div>
					<div id="book_list" class="list_r_title">
						<div class="list_r_title_text">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;
						</div>
						
						<div id="divTopPageNavi" class="list_r_title_text3">

							<!--分页导航开始-->
						<c:if test="page!=1">	
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="bookList?pid=${pid}&cid=${cid}&page=${page-1}&orderType=${orderType}&order=${order}">
								<img src='../images/page_up.gif' /> </a>
							</div>
						</c:if>
						<c:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_up_gray.gif' />
							</div>
						</c:else>
							<div class='list_r_title_text3b'>
								第${page}页/共${maxPage}页
							</div>
						<c:if test="page!=maxPage">	
							<div class='list_r_title_text3a'>
								<a name=link_page_next
									href="bookList?pid=${pid}&cid=${cid}&page=${page+1}&orderType=${orderType}&order=${order}">
									<img src='../images/page_down.gif' /> </a>
							</div>
						</c:if>
						<c:else>
							<div class='list_r_title_text3a'>
								<img src='../images/page_down_gray.gif' />
							</div>
						</c:else>
					<!--分页导航结束-->
						</div>
					</div>
					
					<div id="divBottomPageNavi" class="fanye_bottom">
					</div>
					

				</div>
				<!--图书列表结束-->
			
			<!--中栏结束-->
	
			
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
		<div id="message">
		<table align="center">
			<tr>
				<td><img src="../images/bg_right.jpg"></img></td>
				<td>已将商品添加到购物车</td>
			</tr>
			<tr>
				<td></td>
				<td><a href="javascript:;" onclick="window.open('/dangdang/cart/list','cart');">点击</a>查看购物车</td>
			</tr>
		</table>
		
		</div>
	</body>
</html>
