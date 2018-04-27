<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>添加图书 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
	
		function seg(){
			window.location="../main/guanli.jsp";
			return;
		}
		var productnameFlag=false;
		var jiageFlag=false;
		var newjiageFlag=false;
			
			function yanz(){
				if(productnameFlag&&jiageFlag&&newjiageFlag){
					return true;
				}else{
					$("#tijiao").html("信息填写有错或者没有填写！");
					return false;
				}
			}
		$(function(){
				
				$('#productname').blur(function(){
					productnameFlag=false;
					var receiveName=$('#productname').val();
					if(receiveName==""){
						$('#productname_msg').html("书名不能为空");
					}else{
						productnameFlag=true;
						$('#productname_msg').html("可以");
					}
				});
			
				$('#jiage').blur(function(){
					jiageFlag=false;
					var fullAddress=$('#jiage').val();
					if(fullAddress==""){
						$('#jiage_msg').html("原价格不能为空");
					}else if(!fullAddress.match("^\\d{1,10}(\\.\\d{1,2})?$")){
						$('#jiage_msg').html("价格式不对,正确格式:1.1");
						}else{
					
						jiageFlag=true;
						$('#jiage_msg').html("可以");
					}
				});
				
				$('#newjiage').blur(function(){
					newjiageFlag=false;
					var postalCode=$('#newjiage').val();
					if(postalCode==""){
						$('#newjiage_msg').html("新价格不能为空");
					}else if(!postalCode.match("^\\d{1,10}(\\.\\d{1,2})?$")){
						$('#newjiage_msg').html("价格式不对,正确格式:1.1");
					}else{
						newjiageFlag=true;
						$('#newjiage_msg').html("可以");
					}
				});
				
			
				
			});
			
		</script>
	</head>
	<body>
		&gt;<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			添加图书步骤: <span class="red_bold">1.书籍信息 ></span>
			 2.作者与印刷厂商信息 > 3.分类选择  >4.完成
		</div>
		<div class="fill_message">
			
		<s:form action="../main/addbook2" name="ctl00" id="f" enctype="multipart/form-data" method="post" onsubmit="return yanz();">
			<table class="tab_login">
			<tr>
				<td valign="top" class="w1">
							书名：
				</td>
				<td>
							<input type="text" class="text_input" name="productname" id="productname" />
							<div class="text_left" id="nameValidMsg">
								<p>
									请填写有效的书名
									<br/>
									<span id="productname_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
			</tr>
			<tr>
						<td valign="top" class="w1">
							原价格：
						</td>
						<td>
							<input type="text" name="jiage" class="text_input"id="jiage" />
							<div class="text_left" id="addressValidMsg">
								<p>
									请填写有效的收件人的详细地址
									<br/><span id="jiage_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							现价格：
						</td>
						<td>
							<input type="text" class="text_input" name="newjiage" id="newjiage" />
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的价格
									<br/><span id="newjiage_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
				<s:file name="pic" label="上传信息" ></s:file>
				
				<tr><td>
					<a href="../main/guanli.jsp" id="quxiao">返回</a></td>
				<td><input id="btnClientRegister" class="button_1" name="submit"type="submit" value="下一步"/></td></tr>
			</table>
		</s:form>	
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

