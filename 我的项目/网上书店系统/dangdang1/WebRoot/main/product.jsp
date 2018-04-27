<%@page contentType="text/html;charset=utf-8"%>
<%@page pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>在线购物系统</title>
		<script type="text/javascript" src="../js/jquery-1.4.4.js">
		</script>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="../css/list.css" rel="stylesheet" type="text/css" />
		<style>
			#login{position:fixed;top:120px;left:200px;display:none;}
			#top_bar{background:orange; width:100%;}
			#comment_content ul{list-style-type:none;}
			.headImage{float:left;width:75px; margin:2px;}
			.content{float:left;margin-left:8px;width:662px;}
			.userInfo{background:#F3F3F3;font-size:12px;color:#66C;height:20px;margin-bottom:10px;}
			.star5{margin-top:5px;float:left;display:block;background-image:url("../images/smallstar.png");height:12px;width:64px;background-position:0px 0px;}
			.star4{margin-top:5px;float:left;display:block;background-image:url("../images/smallstar.png");height:12px;width:64px;background-position:0px -34px;}
			.star3{margin-top:5px;float:left;display:block;background-image:url("../images/smallstar.png");height:12px;width:64px;background-position:0px -68px;}
			.star2{margin-top:5px;float:left;display:block;background-image:url("../images/smallstar.png");height:12px;width:64px;background-position:0px -85px;}
			.star1{margin-top:5px;float:left;display:block;background-image:url("../images/smallstar.png");height:12px;width:64px;background-position:0px -102px;}
			
			.point{margin-left:5px;float:left;color:red;} 
			.comment-entry{margin-top:15px; width:100%;}
			.date{margin-top:15px;margin-bottom:30px;color:#999;font-size:12px;}
			#commentTitle{font-weight:bold;margin-top:10px;width:100%;height:25px;background:#F3F3F3;font-size:16px;color:black;}
			#stararea{margin:10px;}
			#star{width:129px;height:25px;border:1px #F0C36D solid;padding:8px;}
			#star ul{zoom:1;width:129px;height:25px;margin:0px;padding:0px; display:block;background-position: 0px -150px;background-image:url("../images/bigstar.png");}
			#star ul li{display:inline;margin:0px;padding:0px;width:auto;height:auto;left:0px;}
			#star1{float:left;dispaly:block;width:25px;height:25px;position:absloute;left:0px;top:0px;}
			#star2{margin-left:1px;float:left;dispaly:block;width:25px;height:25px;position:absloute;left:0px;top:0px;}
			#star3{margin-left:1px;float:left;dispaly:block;width:25px;height:25px;position:absloute;left:0px;top:0px;}
			#star4{margin-left:1px;float:left;dispaly:block;width:25px;height:25px;position:absloute;left:0px;top:0px;}
			#star5{margin-left:1px;float:left;dispaly:block;width:25px;height:25px;position:absloute;left:0px;top:0px;}
			#comment-panel{margin:10px;}
			#commentMsg{margin:5px;color:#09F;}
			
			
		</style>
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
				$("#commentMessage").css("display","none");
			}
		</script>
		<script type="text/javascript">
			var position="0px -150px";
			var star=0;
			var starMsg=new Array();
			starMsg[0]="点击星星为该书打分";
			starMsg[1]="很差";
			starMsg[2]="差";
			starMsg[3]="还行";
			starMsg[4]="好";
			starMsg[5]="很好";
			$(function(){
				$("#comment_content").load("comment?id=${book.id}");
			});
			function submitComment(){
				var value=$("#your-comment").val();
				$.post("addComment",{"star":star,"comment":value,"productId":${book.id}},function(data){
					if(data){
						$("#commentMessage").css("display","block");
						setTimeout(hiddenMessage,1000);
						$("#comment_content").load("comment?id=${book.id}");
					}
				},"json");
			}
			function login(){
				var email=$("#txtUsername").val();
				var password=$("#txtPassword").val();
				var autoLogin=$("#autoLogin:checked").size();
				var al="";
				if(autoLogin==1){
					al="yes";
				}
				var xwj="email="+email+"&password="+password+"&autoLogin="+al+"&from=comment";
				
				if(checkUser()){
					$.ajax({type:"post",url:"/dangdang/user/login?"+xwj,
						dataType:"json",async:false});
						closeWindow();
					submitComment();
						
				}
			}
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
			function nextPage(){
			$.post("/dangdang/cart/isLogin",{id:new Date().getTime()},function(data){
				if(data){
					submitComment();
				}else{
					$("#login").show("slow");
				}
			
			},"json");
		}
		function closeWindow(){
			$("#login").hide("slow");
		}
			
			$(function(){
				$("#star1").hover(function(){
					$("#star>ul").css("background-position","0px -120px");
					$("#starMsg").css("color","#C00").text("很差");
				},function(){
					$("#star>ul").css("background-position",position);
					if(star==0){
						$("#starMsg").css("color","grey").text(starMsg[star]);
					}else{
						$("#starMsg").css("color","#C00").text(starMsg[star]);
						}
				}).click(function(){
					position="0px -120px";
					star=1;
				});
				$("#star2").hover(function(){
					$("#star>ul").css("background-position","0px -90px");
						$("#starMsg").css("color","#C00").text("差");
				},function(){
					$("#star>ul").css("background-position",position);
					if(star==0){
						$("#starMsg").css("color","grey").text(starMsg[star]);
					}else{
						$("#starMsg").css("color","#C00").text(starMsg[star]);
						}
				}).click(function(){
					position="0px -90px";
					star=2;
				});
				$("#star3").hover(function(){
					$("#star>ul").css("background-position","0px -60px");
						$("#starMsg").css("color","#C00").text("还行");
				},function(){
					$("#star>ul").css("background-position",position);
					if(star==0){
						$("#starMsg").css("color","grey").text(starMsg[star]);
					}else{
						$("#starMsg").css("color","#C00").text(starMsg[star]);
						}
				}).click(function(){
					position="0px -60px";
					star=3;
				});
				$("#star4").hover(function(){
					$("#star>ul").css("background-position","0px -30px");
					$("#starMsg").css("color","#C00").text("好");
				},function(){
					$("#star>ul").css("background-position",position);
					if(star==0){
						$("#starMsg").css("color","grey").text(starMsg[star]);
					}else{
						$("#starMsg").css("color","#C00").text(starMsg[star]);
						}
				}).click(function(){
					position="0px -30px";
					star=4;
				});
				$("#star5").hover(function(){
					$("#star>ul").css("background-position","0px 0px");
					$("#starMsg").css("color","#C00").text("很好");
				},function(){
					$("#star>ul").css("background-position",position);
					if(star==0){
						$("#starMsg").css("color","grey").text(starMsg[star]);
					}else{
						$("#starMsg").css("color","#C00").text(starMsg[star]);
						}
				}).click(function(){
					position="0px 0px";
					star=5;
				});
				
			});
			function changeWork(){
				var value=$("#your-comment").val();
				if(value.length<20){
					$("#commentMsg").css("color","#FF5243").text("最少20字，你还需要输入"+(20-value.length)+"个字");
				}
				if(value.length>=20&&value.length<=500){
					$("#commentMsg").css("color","#390").text("还可以写"+(500-value.length)+" 字");
				}
				if(value.length>500){
					$("#commentMsg").css("color","#FF5243").text("超出上限"+(value.length-500)+" 字");
				}
					
			}
			function comment(){
				var value=$("#your-comment").val();
				
				if(star==0){
					alert("请对该书进行评分");
					return;
				}
				if(value.length<20||value.length>500){
					 alert("请输入20-500字的评论");
					 return;
				}
				nextPage();
				
			}
		</script>
		<style>
		#message{width:160px;height:60px;position:fixed;left:600px;top:300px;background:white;
		border: dotted gray;display:none;}
		#commentMessage{width:100px;height:30px;position:fixed;left:600px;top:300px;background:white;
		border:1px solid black;display:none;}
		</style>
	</head>
	<body>
 
		<!-- 头部开始 -->
		<%@include file="../common/head.jsp"%>
		<!-- 头部结束 -->

		<div style="width: 962px; margin: auto;">
			<a href="#"><img src="../images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>
		<div class="book">

			<!--左栏开始-->
			

			<!--左栏结束-->

			<!--中栏开始-->
			<div class="book_center">

				<!--图书列表开始-->
				<div id="divRight" class="list_right">

					
					
					<!--商品条目开始-->
										
						<div class="list_r_line"></div>
						<div class="clear"></div>

						<div class="list_r_list">
							<span class="list_r_list_book"><a name="link_prd_img" href='../productImages/${book.productPic}'>
								<img width="100%" src="../productImages/${book.productPic}" class="dongimg"/> </a> </span>
							<h2>
								<a name="link_prd_name" href='#'>${book.productName}</a>
							</h2>
							<h3>
								
							</h3>
							<table>
								<tr>
									<td colspan="2"><h4 class="list_r_list_h4">
								作 者:
								<a href='#' name='作者'>${book.author}</a>
							</h4></td>
								</tr>
								<tr>
									<td colspan="2"><h4>
								出版社：
								<a href='#' name='出版社'>${book.publishing}</a>
							</h4></td>
								</tr>
								<tr>
									<td colspan="2"><h4>
								出版时间：${book.time}
							</h4><h4 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
							<h4 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
							<h4>
								<span style="font-size:40px;color:orange;">${book.star}</span>
								<span style="margin-left:10px;">已有${book.comments}人评价</span>
							</h4>
							</td>
								</tr>
								<tr>
									<td><h4>版次：${book.whichEdtion }</h4></td>
									<td><h4>页数：${book.totalPage}</h4></td>
								</tr>
								<tr>
									<td><h4>字数：${book.wordNumber }</h4></td>
									<td><h4>印次：${book.printTime }</h4></td>
								</tr>
								<tr>
									<td><h4>印刷时间：${book.time }</h4></td>
									<td><h4>isbn：${book.isbn }</h4></td>
								</tr>
								<tr><td colspan="2"><h5>
								${description}
							</h5></td></tr>
								
							</table>
							<div class="clear"></div>
							<h6>
								<span class="del">￥${book.fixedPrice}</span>
								<span class="red">￥${book.dangPrice}</span>
								节省：￥${book.fixedPrice-book.dangPrice}
							</h6>
							<span class="list_r_list_button"> 
							<a href="javascript:;" onclick="buy(${book.id});"> 
							<img src='../images/but_buy.gif' /> </a></span>
							<span id="cartinfo"></span>							
						</div>
						<div class="clear"></div>
						
						
					
						<!--商品条目结束-->

					<div class="clear"></div>
					<div style="width:100%;" id="comment">
						<div id="comment_content">
							
							</div>
							<div id="writeComment">
							<div id="commentTitle">您的点评</div>
							<div id="stararea">
							<table>
								<tr>
									<td>评分：</td>
									<td>
										<div id="star">
											<ul>
												<li><a href="javascript:;" id="star1"></a></li>
												<li><a href="javascript:;" id="star2"></a></li>
												<li><a href="javascript:;" id="star3"></a></li>
												<li><a href="javascript:;" id="star4"></a></li>
												<li><a href="javascript:;" id="star5"></a></li>
											</ul>
										</div>
									</td>
									<td><span id="starMsg" style="color:grey;margin-left:10px;">点击星星为该书打分</span></td>
								</tr>
							</table>
							</div>
							<div id="comment-panel">
								<table>
									<tr>
										<td>评论：</td>
										<td><textarea id="your-comment" style="font-family: Tahoma,Geneva,sans-serif;" cols="80" rows="10" onkeyup="changeWork();"></textarea></td>
									</tr>
									<tr>
										<td></td>
										<td>
											<span id="commentMsg">20-500字</span>
											<input type="image" onclick="comment();" style="float:right;" src="../images/comment.png" /> 
										</td>
									</tr>
								</table>
							</div>
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
		<div id="commentMessage">
		<table align="center">
			<tr>
				<td><img src="../images/bg_right.jpg"></img></td>
				<td>评论成功</td>
			</tr>
		</table>
		
		</div>
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
									<input type="button" id="btnSignCheck" class="button_enter" onclick="login();"
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
							<a href="dangdang/user/register_form.jsp">创建一个新用户&gt;&gt;</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>
