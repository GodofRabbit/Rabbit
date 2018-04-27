<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>添加图书 - 在线购物系统</title>
		<link href="../css/login.css" rel="stylesheet" type="text/css" />
		<link href="../css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
	
	</head>
	<body>
		&gt;<%@include file="../common/head1.jsp"%>
		<div class="login_step">
			添加图书步骤: 1.书籍信息 >
			 2.作者与印刷厂商信息 > <span class="red_bold">3.分类选择  ></span>4.完成
		</div>
		<div class="fill_message">
			
		<form action="../main/addbook4" name="ctl00" id="f"  method="post" onsubmit="return yanz();">
		<input type="hidden" name="id" id="id"  value="${id}"/>
			<table class="tab_login">
			 <tr>
			 	<td valign="top" class="w1">请选择类型： </td>
			 	<td> <select  name='xuanze' size='1'
							class='list_r_title_ml' id="xuan">
							<option value="0">-----选择---</option>
							<option value="1">
								图书
							</option>
								<option value="2">
								小说
							</option>
								<option value="3">
								青春
							</option>
								<option value="4">
								人文社科
							</option>
								<option value="5">
								管理
							</option>
								<option value="6">
								少儿
							</option>
								<option value="7">
								外语
							</option>
								<option value="8">
								计算机
							</option>
								<option value="9">
								当代小说
							</option>
								<option value="10">
								近现代小说
							</option>
								<option value="11">
								古典小说
							</option>
								<option value="12">
								四大名著
							</option>
								<option value="13">
								世界名著
							</option>
								<option value="14">
								校园
							</option>
								<option value="15">
								爱情/情感
							</option>
								<option value="16">
								叛逆/成长
							</option>
								<option value="17">
								玄幻
							</option>
								<option value="18">
								原创
							</option>
								<option value="19">
								政治
							</option>
								<option value="20">
								经济
							</option>
								<option value="21">
								法律
							</option>
								<option value="22">
								哲学
							</option>
								<option value="23">
								历史
							</option>
								<option value="24">
							管理学
							</option>
								<option value="25">
								战略管理
							</option>
								<option value="26">
								市场营销
							</option>
								<option value="27">
								商业史传
							</option>
								<option value="28">
								电子商务
							</option>
								<option value="29">
								0-2岁
							</option>
								<option value="30">
								3-6岁
							</option>
								<option value="31">
								7-10岁
							</option>
								<option value="32">
								11-14岁
							</option>
								<option value="33">
								儿童文学
							</option>
								<option value="34">
								英语
							</option>
								<option value="35">
								日语
							</option>
								<option value="36">
								韩语
							</option>
								<option value="37">
								俄语
							</option>
								<option value="38">
								德语
							</option>
								<option value="39">
								计算机理论
							</option>
								<option value="40">
								数据库
							</option>
								<option value="41">
								程序设计
							</option>
							
								<option value="42">
								人工智能
							</option>
								<option value="43">
								计算机考试
							</option>
						</select></td>
			 </tr>
			  
				
			</table>
			<div class="login_in">

					<a href="../main/lastaddbook2.action?id=${id}" id="quxiao">取消</a>
			
				<input id="btnClientRegister" class="button_1" name="submit"
					type="submit" value="下一步"/>
					<br/>
					<span id="tijiao" style="color:red"></span>
				</div>
		</form>	
		</div>
		<%@include file="../common/foot1.jsp"%>
	</body>
</html>

