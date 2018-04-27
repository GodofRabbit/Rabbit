<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/Back/css/css.css" />
<script type="text/javascript" src="<%=path %>/Back/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/Back/page/js/Admin.js"></script>
</head>
 <style>
	body{
		background:url(<%=path %>/Back/images/beijing1.jpg) top left;
		background-size:100% 200%;
		overflow:hidden;
	}
</style>
  <body style="width:100%; height:100%;" onload="BackAdminDisplay(url);">
   <input id="page" type="hidden" value="1"/>
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
		<a href="#" onclick="javascript:history.back(-1);"> <img src="<%=path %>/Back/images/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
		<a href="#" onclick="javascript:history.go(1);"> <img src="<%=path %>/Back/images/timg2.jpg" height="22px" width="22px"/></a>
		管理员管理
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
						<div class="cfD">
							<input class="userinput" type="text" placeholder="请输入关键字" id="keywords"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="userbtn" style="cursor: pointer" onclick="searchAdmin();">查询</button>
							<a href="<%=path %>/Back/page/user/addAdmin.jsp" ><button class="userbtn" style="cursor: pointer">添加管理员</button></a>
						</div>
				</div>
				<!-- user 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="435px" class="tdColor">管理员账号</td>
							<td width="250px" class="tdColor">姓名</td>
							<td width="400px" class="tdColor">联系方式</td>
							<td width="600px" class="tdColor">注册时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>

                 <tbody id="boody_tr">
	                   <!-- 遍历的内容 -->
                 </tbody>
                 
					</table>
					 <div class="paging"> 
                    	
                    	<h4><a id="prePage" href="javascript:void(0);" onclick="prePage();">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	共<span id="totalRecord"></span>条记录&nbsp;&nbsp;&nbsp;&nbsp;共<span id="totalPage"></span>页&nbsp;&nbsp;&nbsp;&nbsp;当前第<span id="currentPage"></span>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a id="nextPage" href="javascript:void(0);" onclick="nextPage();">下一页</a>&nbsp;&nbsp;</h4>
                    
                    </div>
				</div>
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>
	</div>

</body>
<script type="text/javascript">
    var m ="${message}";
		if(m!=""){
			alert(m);
		}
</script>
</html>