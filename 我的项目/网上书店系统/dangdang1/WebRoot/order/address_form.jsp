<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
			var flag=new Array();
			flag["name"]=false;
			flag["address"]=false;
			flag["code"]=false;
			flag["phone"]=false;
			flag["mobile"]=false; 
			var chinese=new Array();
			chinese["name"]="收件人姓名";
			chinese["address"]="收件人的详细信息";
			chinese["code"]="收件人的邮政编码";
			chinese["phone"]="收件人的电话";
			chinese["mobile"]="收件人的手机";
			function checkNull(id){
				var value=$("#"+id).val();
				var msg=$("#"+id+"ValidMsg").children().eq(0);
				if(!value){
					msg.css("color","red");
					msg.html("<img src='../images/minus.jpg'/>"+chinese[id]+"不能为空");
					flag[id]=false;
					return false;
				}else{
					return true;
				}
			}
			
			function clickMsg(element){
				var id=$(element).attr("id");
				var msg=$("#"+id+"ValidMsg").children().eq(0);
				if(!flag[id]){
					msg.css("color","grey");
					msg.html("请填写有效的"+chinese[id]);
				}
			}
			function judge(element){
				var id=$(element).attr("id");
				var msg=$("#"+id+"ValidMsg").children().eq(0);
				var value=$(element).val();
				if(!checkNull(id)){
					return;
				}
				if(id=="name"){
					checkName(value);			
				}
				if(id=="address"){
					checkAddress(value);
				}
				if(id=="code"){
					checkCode(value);
				}
				if(id=="phone"){
					checkPhone(value);
				}
				if(id=="mobile"){
					checkMobile(value);
				}
					
			}
			function checkName(value){
				var msg=$("#nameValidMsg").children().eq(0);
				if(value.match(/^[A-Za-z0-9\u4e00-\u9fa5]{2,5}$/)){
					msg.html("<img src='../images/bg_right.jpg'/>");
					flag["name"]=true;
					
				}else{
					msg.css("color","red");
					msg.html("<img src='../images/minus.jpg'/>请输入正确的收件人姓名");	
					flag["name"]=false;
				}
			}
			function checkAddress(value){
				var msg=$("#addressValidMsg").children().eq(0);
				if(value.length>5){
					msg.html("<img src='../images/bg_right.jpg'/>");
					flag["address"]=true;
				}else{
					msg.css("color","red");
					msg.html("<img src='../images/minus.jpg'/>请输入正确的收件人地址");	
					flag["address"]=false;
				}
				
			}
			function checkCode(value){
				var msg=$("#codeValidMsg").children().eq(0);
				if(value.match(/^[1-9]\d{5}$/)){
					msg.html("<img src='../images/bg_right.jpg'/>");
					flag["code"]=true;
				}else{
					msg.css("color","red");
					msg.html("<img src='../images/minus.jpg'/>请输入正确的邮政编码");	
					flag["code"]=false;
				}
				
			}
			function checkPhone(value){
				var msg=$("#phoneValidMsg").children().eq(0);
				if(value.match(/^[1-9]\d{7}$/)){
					msg.html("<img src='../images/bg_right.jpg'/>");
					flag["phone"]=true;
				}else{
					msg.css("color","red");
					msg.html("<img src='../images/minus.jpg'/>请输入正确的收件人电话号码");	
					flag["phone"]=false;
				}
			
			}
			function checkMobile(value){
				var msg=$("#mobileValidMsg").children().eq(0);
				if(value.match(/^[1]\d{10}$/)){
					msg.html("<img src='../images/bg_right.jpg'/>");
					flag["mobile"]=true;
				}else{
					msg.css("color","red");
					msg.html("<img src='../images/minus.jpg'/>请输入正确的收件人手机号码");	
					flag["mobile"]=false;
				}
			}
			function checkAll(){
				for(x in flag){
					var element=$("#"+x);
					judge(element);
					if(!flag[x]){
						return false;
					}
				}
				return true;
			}
			function removeAllMsg(){
				for(x in flag){
					$("#"+x+"ValidMsg").children().eq(0).html("");
				}
			
			}
			
			
		</script>
		<script type="text/javascript">
			var information=new Array();
			information["name"]="";
			information["address"]="";
			information["code"]="";
			information["phone"]="";
			information["mobile"]="";
			var msg=new Array();
			msg["name"]="";
			msg["address"]="";
			msg["code"]="";
			msg["phone"]="";
			msg["mobile"]="";
			function changeAddress(element){
				var addressId=$("#addressId").val(); 
				var val=$(element).val();
				if(addressId=="0"){
					for(x in information){
						var value=$("#"+x).val();
						var msgValue=$("#"+x+"ValidMsg").children().eq(0).html();
						information[x]=value;
						msg[x]=msgValue;
					}
					
				}
				if(val!="0"){
					$.getJSON("getReceiveAddress",{id:val},function(data){
						for(x in information){
							$("#"+x).attr("disabled","disabled");
						}
						$("#name").val(data.receiveName);
						$("#address").val(data.fullAddress);
						$("#code").val(data.postalCode);
						$("#phone").val(data.phone);
						$("#mobile").val(data.mobile);
						$("#addressId").val(data.id);
						checkAll();
					});
				}else{
						$("#name").val(information["name"]);
						$("#address").val(information["address"]);
						$("#code").val(information["code"]);
						$("#phone").val(information["phone"]);
						$("#mobile").val(information["mobile"]);
						$("#addressId").val("0");
						$("#nameValidMsg").children().eq(0).html(msg["name"]);
						$("#addressValidMsg").children().eq(0).html(msg["address"]);
						$("#codeValidMsg").children().eq(0).html(msg["code"]);
						$("#phoneValidMsg").children().eq(0).html(msg["phone"]);
						$("#mobileValidMsg").children().eq(0).html(msg["mobile"]);
							for(x in information){
							$("#"+x).removeAttr("disabled");
						}
				}
			} 
		
		</script>
	</head>
	<body>
		<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			生成订单骤: 1.确认订单 >
			<span class="red_bold"> 2.填写送货地址</span> > 3.订单成功
		</div>
		<div class="fill_message">
			<p>
				选择地址：
				<c:select id="addres" list="optList" listValue="text" listKey="value" headerKey="0" headerValue="填写新地址" 
				onchange="changeAddress(this);">
				</c:select>
			</p>
			<form name="ctl00" method="post" action="/dangdang/order/createOrder" id="f" onsubmit="return checkAll();">
				<input type="hidden" name="information.id" id="addressId" value="0"/>

				<table class="tab_login">
					<tr>
						<td valign="top" class="w1">
							收件人姓名：
						</td>
						<td>
							<input type="text" class="text_input" name="information.receiveName"
							 id="name" onfocus="clickMsg(this);" onblur="judge(this);"/>
							<div class="text_left" id="nameValidMsg">
								<p>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							收件人详细地址：
						</td>
						<td>
							<input type="text" name="information.fullAddress" class="text_input"
								id="address" onfocus="clickMsg(this);" onblur="judge(this);"/>
							<div class="text_left" id="addressValidMsg">
								<p>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							邮政编码
						</td>
						<td>
							<input type="text" class="text_input" name="information.postalCode"
								id="code" onblur="judge(this);" onfocus="clickMsg(this);" />
							<div class="text_left" id="codeValidMsg">
								<p>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							电话
						</td>
						<td>
							<input type="text" class="text_input" name="information.phone"
								onblur="judge(this);" id="phone" onfocus="clickMsg(this);" />
							<div class="text_left" id="phoneValidMsg">
								<p>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							手机
						</td>
						<td>
							<input type="text" class="text_input" name="information.mobile"
							 onblur="judge(this);" id="mobile" onfocus="clickMsg(this);"/>
							<div class="text_left" id="mobileValidMsg">
								<p>
								</p>
							</div>
						</td>
					</tr>
				</table>

				<div class="login_in">

					<a href="order_info.jsp"><input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="取消" /></a>
			
				<input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="下一步" />
				</div>
			</form>
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

