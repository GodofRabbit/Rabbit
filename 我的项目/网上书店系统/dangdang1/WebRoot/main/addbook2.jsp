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
		var authorFlag=false;
		var pushingFlag=false;
		var wordnumberFlag=false;
		var pagenumberFlag=false;
		var isbnFlag=false;
			function yanz(){
				if(authorFlag&&pushingFlag&&wordnumberFlag&&wordnumberFlag&&isbnFlag){
					return true;
				}else{
					$("#tijiao").html("信息填写有错或者没有填写！");
					return false;
				}
			}
		$(function(){
				
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
					$('#wordnumber').blur(function(){
					wordnumberFlag=false;
					var fullAddress=$('#wordnumber').val();
					if(fullAddress==""){
						$('#wordnumber_msg').html("字数不能为空");
					}else{
					
						wordnumberFlag=true;
						$('#wordnumber_msg').html("可以");
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
					$('#isbn').blur(function(){
					isbnFlag=false;
					var postalCode=$('#isbn').val();
					if(postalCode==""){
						$('#isbn_msg').html("ISBN不能为空");
						isbnFlag=false;
						return;
						}
					 if(!postalCode.match("^\\d{8}$")){
						$('#isbn_msg').html("isbn不对,正确格式:12345678");
						isbnFlag=false;
						return ;
					}
					$.ajax({
					data:"isbn="+postalCode,
				url:"checkisbn.action",
			
			success:function(data){
						
						if(data==false){
					  $("#isbn_msg").html("可以用");
					  	isbnFlag=true;
					  return;
					  }else{
						  	isbnFlag=false;
						   $("#isbn_msg").html("isbn已经存在了");
						 
					  return;
					  }
			},
			
				
		});
					 
						isbnFlag=true;
						$('#isbn_msg').html("可以");
					
				});
			
				
			});
			
		</script>
	</head>
	<body>
		&gt;<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			添加图书步骤: 1.书籍信息 >
			 <span class="red_bold">2.作者与印刷厂商信息 > </span>3.分类选择  >4.完成
		</div>
		<div class="fill_message">
			
		<form action="../main/addbook3" name="ctl00" id="f"  method="post" onsubmit="return yanz();">
		<input type="hidden" name="id" id="id"  value="${id}"/>
			<table class="tab_login">
			<tr>
				<td valign="top" class="w1">
							作者姓名：
				</td>
				<td>
							<input type="text" class="text_input" name="author" id="author" />
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
							出版社：
						</td>
						<td>
							<input type="text" name="pushing" class="text_input"id="pushing" />
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
							字数：
						</td>
						<td>
							<input type="text" class="text_input" name="wordnumber" id="wordnumber" />
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的字数
									<br/><span id="wordnumber_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
						<tr>
						<td valign="top" class="w1">
							页数：
						</td>
						<td>
							<input type="text" class="text_input" name="pagenumber" id="pagenumber" />
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的页数
									<br/><span id="pagenumber_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
						<tr>
						<td valign="top" class="w1">
							ISBN：
						</td>
						<td>
							<input type="text" class="text_input" name="isbn" id="isbn" />
							<div class="text_left" id="codeValidMsg">
								<p>
									请填写有效的ISBN
									<br/><span id="isbn_msg" style="color:red;"></span>
								</p>
							</div>
						</td>
					</tr>
				
				<tr><td>
					<a href="../main/lastaddbook1.action?id=${id}" id="quxiao">返回</a></td>
				<td><input id="btnClientRegister" class="button_1" name="submit"type="submit" value="下一步"/></td></tr>
			</table>
		</form>	
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

