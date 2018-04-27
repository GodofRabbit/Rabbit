<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="../css/shopping_vehicle.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		
		<script>
			function checkUser(){
				var email=$("#txtUsername").val();
				var password=$("#txtPassword").val();
				var xwj="email="+email+"&password="+password;
				if(!email|!password){
					$("#errorMsg").text("邮箱和密码不能为空");
					return false;
				}
				if(!email.match(/^\w+@{1}\w+([.]{1}[a-zA-Z]{2,3})+$/)){
					$("#errorMsg").text("邮箱格式错误");
					return false;
				}
				if(!password.match(/^\w{6,20}$/)){
					$("#errorMsg").text("密码格式错误");
					return false;
				}
				var result=$.ajax({type:"post",url:"/dangdang/user/checkLogin?"+xwj,dataType:"json",async:false}).responseText;
				if(result=="true"){
					return true
				}else{
					$("#errorMsg").text("邮箱或密码错误");
					return false;
				}
				
			}
			function clearText(){
				$("#errorMsg").text("");
			}
		</script>
		
	<script>
		function update(element){
			var num=$(element).prev().val();
			var id=$(element).parent().siblings().eq(0).text();
			location="update?id="+id+"&quantity="+num;
		}
		function showWindow(){
			
		}
		function nextPage(){
			$.post("isLogin",{id:new Date().getTime()},function(data){
				if(data){
					location="/dangdang/order/orderInfo";
				}else{
					$("#login").show("slow");
				}
			
			},"json");
		}
		function closeWindow(){
			$("#login").hide("slow");
		}
	</script>
	<style>
		#login{position:fixed;top:120px;left:200px;display:none;}
	</style>
	
	</head>
	<body>
		<br />
		<br />
		<div class="my_shopping">
			<img class="pic_shop" src="../images/pic_myshopping.gif" />

		</div>
		<div id="div_choice" class="choice_merch">
			<h2 id="cart_tips">
				您已选购以下商品
			</h2>
			<div class="choice_bord">
				<table class="tabl_buy" id="tbCartItemsNormal">
					<tr class="tabl_buy_title">
						<td class="buy_td_6">
							<span>&nbsp;</span>
						</td>
						<td>
							<span class="span_w1">商品名</span>
						</td>
						<td class="buy_td_5">
							<span class="span_w2">市场价</span>
						</td>
						<td class="buy_td_4">
							<span class="span_w3">当当价</span>
						</td>
						<td class="buy_td_1">
							<span class="span_w2">数量</span>
						</td>
						<td class="buy_td_2">
							<span>变更数量</span>
						</td>
						<td class="buy_td_1">
							<span>删除</span>
						</td>
					</tr>
					<tr class='objhide' over="no">
						<td colspan="8">
							&nbsp;
						</td>
					</tr>
					
                      <!-- 购物列表开始 -->
                   <c:if test="buyList.size!=0">   
                      <c:iterator value="buyList">
						<tr class='td_no_bord'>
							<td style='display: none'>
								${product.id}
							</td>
							<td class="buy_td_6">
								<span class="objhide"><img /> </span>
							</td>
							<td>
								<a href="#">${product.productName}</a>
							</td>
							<td class="buy_td_5">
								<span class="c_gray">${product.fixedPrice}</span>
							</td>
							<td class="buy_td_4">
								&nbsp;&nbsp;
								<span>￥${product.dangPrice }</span>
							</td>
							<td class="buy_td_1">
								&nbsp;&nbsp;${quantity}
							</td>

							<td >
								<input class="del_num" type="text" size="3" maxlength="4"/>
								<a href="javascript:;" onclick="update(this);">变更</a>
							</td>
							<td>
								<a href="del?id=${product.id}">删除</a>
							</td>
						</tr>
						</c:iterator>
					
					
					<!-- 购物列表结束 -->
					</c:if>	
				</table>
				
				<c:else>
				<div id="div_no_choice">
					<div class="choice_title"></div>
					<div class="no_select" style="height:120px;">
						<table align="center" width="100%">
							<tr>
								<td valign="middle" align="right"><img src="../images/cart.png"></img></td>
								<td>您还没有挑选商品</td>
							</tr>
						</table>
					</div>
				</div>
				</c:else>
			
				
				<div class="choice_balance">
					<div class="select_merch">
						<a href='../main/main.jsp'> 继续挑选商品>></a>
						<a href="clearAll" style="color:blue;">清空购物车</a>
					</div>
					<div class="total_balance">
						<div class="save_total">
							您共节省：
							<span class="c_red"> ￥<span id="total_economy">${savePrice}</span>
							</span>
							<span id='total_vip_economy' class='objhide'> ( 其中享有优惠： <span
								class="c_red"> ￥<span id='span_vip_economy'>0.00</span> </span>
								) </span>
							<span style="font-size: 14px">|</span>
							<span class="t_add">商品金额总计：</span>
							<span class="c_red_b"> ￥<span id='total_account'>${totalPrice}</span>
							</span>
						</div>
						<div id="balance" class="balance">
							<a name='checkout' href='javascript:;' onclick="nextPage();" > 
								<img src="../images/butt_balance.gif" alt="结算" border="0" title="结算" />
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 用户删除恢复区 -->


		<div id="divCartItemsRemoved" class="del_merch">
			<div class="del_title">
				您已删除以下商品，如果想重新购买，请点击“恢复”   <a  href="deleteAll">清空回收站</a>    <a  href="recoverAll">恢复全部</a>
			</div>
			<table class=tabl_del id=del_table>
				<tbody>

				<c:iterator value="deleteList">
					<tr>
						<td width="58" class=buy_td_6>
							&nbsp;
						</td>
						<td width="365" class=t2>
							<a href="#">${product.productName}</a>
						</td>
						<td width="106" class=buy_td_5>
							￥${product.fixedPrice}
						</td>
						<td width="134" class=buy_td_4>
							<span>￥${product.dangPrice}</span>
						</td>
						<td width="56" class=buy_td_1>
							<a href="recover?id=${product.id}">恢复</a>
							<a href="realDelete?id=${product.id}">彻底删除</a>
						</td>
						<td width="16" class=objhide>
							&nbsp;
						</td>
					</tr>
				</c:iterator>


					<tr class=td_add_bord>
						<td colspan=8>
							&nbsp;
						</td>
					</tr>
				


				</tbody>
			</table>
		</div>
		<br />
		<br />
		<br />
		<br />
		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
		<div id="login">
		<div class="enter_part"  style="width:500px;height:300px;">
			<div class="enter_in">
				<div class="bj_top"></div>
				<div class="center">
					<a style="float:right;"><img onclick="closeWindow();" src="../images/booksaleimg/cha.gif"></img></a>
					<div style="height: 30px; padding: 5px; color: red" id="divErrorMssage">
					 <table  width="100%">
					 	<tr><td align="center" valign="middle"><span id="errorMsg"></span>
					 	</td></tr>
					 </table>
					</div>
					<div class="main">
						<h3>
							登录当当网     
						</h3>

						<form method="post" action="/dangdang/user/login?from=cart" id="ctl00" onsubmit="return checkUser();">
							<ul>
								<li>
									<span>请输入Email地址：</span>
									<input type="text" name="email" id="txtUsername" class="textbox" onfocus="clearText();" />
								</li>
								<li>
									<span class="blank">密码：</span>
									<input onfocus="clearText();" type="password" name="password" id="txtPassword"
										class="textbox"/>
								</li>
								<li>
									<div style="float:right;"><input id="autoLogin" type="checkbox" name="autoLogin" value="yes"/>
									<span class="blank"></span>
									<label for="autoLogin">下次自动登录</label>
									</div>								
								</li>
								<li>
									<input type="submit" id="btnSignCheck" class="button_enter" 
										value="      登 录" />


								</li>
							</ul>
							<input type="hidden" name="uri" value="${uri}" />
						</form>
					</div>
					<div class="user_new">
						<p>
							您还不是当当网用户？
						</p>
						<p class="set_up">
							<a href="/dangdang/user/register_form.jsp">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>



