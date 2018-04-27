<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>修改图书 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
		var productnameFlag=false;
		var pushingFlag=false;
		var newjiageFlag=false;
	    var authorFlag=false;
	    var pagenumberFlag=false;
					
			function yanz(){
				if(productnameFlag&&newjiageFlag&&authorFlag&&pushingFlag&&pagenumberFlag){
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
					
				$('#author').blur(function(){
					authorFlag=false;
					var receiveName=$('#author').val();
					if(receiveName==""){
						$('#author_msg').html("作者不能为空");
					}else{
						authorFlag=true;
						$('#author_msg').html("可以");
					}
				});
				$('#pushing').blur(function(){
					pushingFlag=false;
					var fullAddress=$('#pushing').val();
					if(fullAddress==""){
						$('#pushing_msg').html("出版社不能为空");
					}else{
					
						pushingFlag=true;
						$('#pushing_msg').html("可以");
					}
				});
					$('#pagenumber').blur(function(){
					pagenumberFlag=false;
					var postalCode=$('#pagenumber').val();
					if(postalCode==""){
						$('#pagenumber_msg').html("页数不能为空");
					}else if(!postalCode.match("^\\d{1,20}$")){
						$('#pagenumber_msg').html("页数不对,正确格式:6456");
					}else{
						pagenumberFlag=true;
						$('#pagenumber_msg').html("可以");
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
			修改图书信息
		</div>
		<div class="fill_message">
			
		<s:form action="../main/updateBoke" name="ctl00" id="f" enctype="multipart/form-data" method="post" onsubmit="return yanz();">
			<input type="hidden" name="id" id="id"  value="${id}"/>
			<table class="tab_login">
			<tr>
				<td valign="top" class="w1">
							书名：
				</td>
				<td>
							<input type="text" class="text_input" name="productname" id="productname" value="${Books.productName}" />
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
							作者姓名：
				</td>
				<td>
							<input type="text" class="text_input" name="author" id="author" value="${Books.author}" />
							<div class="text_left" id="nameValidMsg">
								<p>
									请填写有效的作者姓名
									<br/>
									<span id="author_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
			</tr>
			
					<tr>
						<td valign="top" class="w1">
							现价格：
						</td>
						<td>
							<input type="text" class="text_input" name="newjiage" id="newjiage" value="${Books.dangPrice}" />
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的价格
									<br/><span id="newjiage_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td valign="top" class="w1">
							出版社：
						</td>
						<td>
							<input type="text" name="pushing" class="text_input"id="pushing" value="${Books.publishing}"/>
							<div class="text_left" id="addressValidMsg">
								<p>
									请填写有效的出版社
									<br/><span id="pushing_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
						<tr>
						<td valign="top" class="w1">
							页数：
						</td>
						<td>
							<input type="text" class="text_input" name="pagenumber" id="pagenumber" value="${Books.totalpage}"/>
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的页数
									<br/><span id="pagenumber_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
					<tr>
						<td>原来的图片 ：</td>
						<td><img  width="100px" height="100px" src="../productImages/${Books.productPic}" /></td>
						<td>修改吗？<select  name='xuanze' size='1'
							class='list_r_title_ml' id="xuan">
							<option value="0">不修改</option>
							<option value="1">
								修改
							</option></select></td>
					</tr>
				<s:file name="pic" label="上传信息" ></s:file>
				
				<tr><td>
					<a href="../main/guanli.jsp" id="quxiao">返回</a></td>
				<td><input id="btnClientRegister" class="button_1" name="submit"type="submit" value="确定修改"/></td></tr>
			</table>
		</s:form>	
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

