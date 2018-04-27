<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="c"%>
<link href="../css/book_head090107.css" rel="stylesheet" type="text/css" />
<link href="../css/chat.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
<script>
		$(function(){
		setInterval(function(){
			var value=$(window).scrollTop();
			var attr=$("#toTop").css("display");
			if(value<200){
				if(attr!="none"){
					$("#toTop"). css("display","none");
				}
			}else{
				if(attr!="block"){
					$("#toTop"). css("display","block");
				}
			}
			
			
		},500);
		
		});
		$(function(){
			$.get("/dangdang/getSearchOption",function(data){
				for(var i=0;i<data.length;i++){
					$("#options").append("<option value='"+data[i].value+"'>"+data[i].text+"</option>");
				}
			},"json");
		});
		</script>
<script>
	$(function(){
		$("#button").click(start);
	})
	function start(){
		$.post("/dangdang/cart/isLogin",{id:new Date().getTime()},function(data){
				if(data){
					$("#button").unbind("click");
					firstGetMsg();
					setInterval(getMsg,1000);
					$("#button").toggle(function(){$("#chat").animate({left:'0px'},"slow");},function(){$("#chat").animate({left:'-350px'},"slow");});	
					$("#button").click();
				
				}else{
					alert("请先登录");
				}
			
			},"json");
	}
			
			
			
			$(function(){
				$(".send").hover(function(){
					$(this).attr("src","../images/bg_onsend.png");
				},function(){
					$(this).attr("src","../images/bg_send.png");
				});
			});
			function firstGetMsg(){
				$.getJSON("/dangdang/chat/getMessage?mode=0",function(data){
					for(var i=0;i<data.length;i++){
						var message="客服 : "+data[i].text+" ("+data[i].sendTime+")";
						$(".chatContent").append(message+"<br/>");
					}
				});
			}
			function getMsg(){
			    //alert("getMsg....");
				$.getJSON("/dangdang/chat/getMessage",function(data){
					for(var i=0;i<data.length;i++){
						var message="客服 : "+data[i].text+" ("+data[i].sendTime+")";
						
						$(".chatContent").append(message+"<br/>");
					}
				});
			}
			function sendMsg(){
				var msg=$(".message").eq(0).val();
				$(".message").eq(0).val("");
				$.post("/dangdang/chat/send",{"text":msg,"id":"0"},function(data){
					if(!data){
						alert("发送失败");
					}
				},"json");
				var date=new Date();
				var x=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
				var message="您："+msg+" ("+x+")";
				$(".chatContent").append(message+"<br/>");
			}
</script>		
<div id="toTop" onclick="window.scrollTo(0,0);" style="cursor:pointer;display:none;background-image:url(../images/up.png);height:57px;width:19px;position:fixed;bottom:100px;right:140px;">
</div>
<div id="chat">
			<div id="button"></div>
			<div class="window">
				<div class="chatContent"></div>
				<div class="bar"></div>
				<div class="input">
					<textarea rows="6" cols="40" class="message"></textarea>
					<div class="submit">
						<input onclick="sendMsg();" class="send" type="image" src="../images/bg_send.png" >
					</div>
					
				</div>
			
		</div>
		</div>
<div class="head_container">
	<div class="head_welcome">
		<div class="head_welcome_right">
			<span class="head_welcome_text"> </span>
			<span class="head_welcome_text"> <span class="little_n">
					| <a href="#" name="mydangdang" class="head_black12a">我的购物</a> 
					 <c:if test="#session.user!=null"> |<a href="../main/searchGeorder?page=1" name="mydangdang" class="head_black12a">我的订单</a></c:if> 
					| <a
					href="#" name="helpcenter" class="head_black12a" target="_blank">帮助</a>
					| </span> </span>
			<div class="cart gray4012">
				<a href="javascript:;" onclick="window.open('/dangdang/cart/list','cart');">购物车</a>
			</div>
		</div>
		<span class="head_toutext" id="logininfo">
		
		<c:if test="#session.user!=null">
		<b>您好  ${user.nickName}，欢迎光临购网系统</b>
		[&nbsp;<a href="../user/loginOut" class="b">登出</a>&nbsp;]
		</c:if>
		<c:else>
		<b>欢迎光临购物系统</b>
		[&nbsp;<a href="../user/login_form.jsp" class="b">登录</a>|<a
			href="../user/register_form.jsp" class="b">注册</a>&nbsp;]</c:else>
		</span>
	</div>
	<div class="head_head_list">
		<div class="head_head_list_left">
			<span class="head_logo"><a href="/dangdang/main/main.jsp" name="backtobook"><img
						src="../images/booksaleimg/book_logo.gif" /> </a> </span>
		</div>
		<div class="head_head_list_right">

			<div class="head_head_list_right_b">
			</div>
		</div>
	</div>
	<div class="head_search_div">
		<form action="/dangdang/search/search" method="get"	>
			<input type="text" style="font-size:18px;color:grey" name="keyword" value="请输入商品名">
			<select id="options" name="pid">
				<option value="1">全部</option>
			</select>
			<input type="submit" value="   搜索   ">
		</form>
		
	</div>
	<div class="head_search_bg"></div>
	
</div>
