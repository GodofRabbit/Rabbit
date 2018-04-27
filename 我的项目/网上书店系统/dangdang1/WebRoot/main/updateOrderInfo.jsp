<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
		
		var b=1;
	
	
		var mobileFlag=false;
		var phoneFlag=false;
		var receiveNameFlag=false;
			var fullAddressFlag=false;
			var postalCodeFlag=false;
			var totalpriceFlag=false;
			function yanz(){
				if(mobileFlag&&phoneFlag&&receiveNameFlag&&fullAddressFlag&&postalCodeFlag&&totalpriceFlag){
					return true;
				}else{
					$("#tijiao").html("信息填写有错或者没有填写！");
					return false;
				}
			}
		$(function(){
				
				$('#receiveName').blur(function(){
					var receiveName=$('#receiveName').val();
					receiveNameFlag=false;
					if(receiveName==""){
						$('#receiveName_msg').html("收件人姓名不能为空");
					}else if(!receiveName.match("[a-zA-Z\\u4e00-\\u9f5a]{2,15}$")){
						$('#receiveName_msg').html("收件人姓名 只能是a-z或者中文并且2-15个");
					}else{
						receiveNameFlag=true;
						$('#receiveName_msg').html("可以");
					}
				});
			
				$('#fullAddress').blur(function(){
					var fullAddress=$('#fullAddress').val();
					fullAddressFlag=false;
					if(fullAddress==""){
						$('#fullAddress_msg').html("收件人地址不能为空");
					}else{
						fullAddressFlag=true;
						$('#fullAddress_msg').html("可以");
					}
				});
				
				$('#postalCode').blur(function(){
					var postalCode=$('#postalCode').val();
					postalCodeFlag=false;
					if(postalCode==""){
						$('#postalCode_msg').html("收件人邮编不能为空");
					}else if(!postalCode.match("^[0-9]{6}$")){
						$('#postalCode_msg').html("邮编不正确");
					}else{
						postalCodeFlag=true;
						$('#postalCode_msg').html("可以");
					}
				});
				
				$('#phone').blur(function(){
					var phone=$('#phone').val();
					phoneFlag=false;
					if(phone==""){
						$('#phone_msg').html("收件人电话不能为空");
					}else{
						phoneFlag=true;
						$('#phone_msg').html("已填写");
					}
				});
				$('#totalprice').blur(function(){
					var totalprice=$('#totalprice').val();
					totalpriceFlag=false;
					if(totalprice==""){
						$('#totalprice_msg').html("总价不能为空");
					}else if(!totalprice.match("^\\d{1,10}(\\.\\d{1,2})?$")){
						$('#totalprice_msg').html("总价格式不对,正确格式:1.1");
					}else{
						totalpriceFlag=true;
						$('#totalprice_msg').html("已填写,可以");
					}
					
				});
				$('#mobile').blur(function(){
					var mobile=$('#mobile').val();
					mobileFlag=false;
					if(mobile==""){
						$('#mobile_msg').html("收件人手机不能为空");
					}else if(!mobile.match("^(\\+86\\s|0086\\s)?\\d{11}$")){
						$('#mobile_msg').html("手机号码不对");
					}else{
						mobileFlag=true;
						$('#mobile_msg').html("已填写");
					}
				});
				
			});
			
		</script>
	</head>
	<body>
		&gt;<%@include file="../common/managehead.jsp"%>
		<div class="login_step">
			
			<span class="red_bold"> 修改订单</span>
		</div>
		<div class="fill_message">
		
			<form name="ctl00" method="get" action="../main/updateorder2.action" id="f" onsubmit="return yanz();">
				<input type="hidden" name="id" id="addressId"  value="${orders.id}"/>

				<table class="tab_login">
					<tr>
					<td valign="top" class="w1">
							总价：
						</td>
						<td>
							<input type="text" class="text_input" name="totalprice"
								id="totalprice" value="${orders.totalPrice}"/>
							<div class="text_left" id="totalprice">
								<p>
									请填写有效的价格
									<br/><span id="totalprice_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收件人姓名：
						</td>
						<td>
							<input type="text" class="text_input" name="receiveName"
								id="receiveName" value="${orders.receiveName}"/>
							<div class="text_left" id="nameValidMsg">
								<p>
									请填写有效的收件人姓名
									<br/><span id="receiveName_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收件人详细地址：
						</td>
						<td>
							<input type="text" name="fullAddress" class="text_input"
								id="fullAddress" value="${orders.fullAddress}"/>
							<div class="text_left" id="addressValidMsg">
								<p>
									请填写有效的收件人的详细地址
									<br/><span id="fullAddress_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码
						</td>
						<td>
							<input type="text" class="text_input" name="postalCode"
								id="postalCode" value="${orders.postalCode}"/>
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的收件人的邮政编码
									<br/><span id="postalCode_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							电话
						</td>
						<td>
							<input type="text" class="text_input" name="phone"
								id="phone" value="${orders.phone}"/>
							<div class="text_left" id="phoneValidMsg">
								<p>
									请填写有效的收件人的电话
									<br/><span id="phone_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							手机
						</td>
						<td>
							<input type="text" class="text_input" name="mobile"
								id="mobile" value="${orders.mobile}"/>
							<div class="text_left" id="mobileValidMsg">
								<p>
									请填写有效的收件人的手机
									<br/><span id="mobile_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">

			
				<input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="修改"  />
					<br/>
					<span id="tijiao" style="color:red"></span>
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

