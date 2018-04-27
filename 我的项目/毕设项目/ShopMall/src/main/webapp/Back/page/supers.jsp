<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'supers.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" type="text/css"></link>
 <script type="text/javascript">
 	var role = ${manager.role};
 	function supers(){
 		if(role!=1){
 			alert("对不起，只有超级管理员才有该权限！");
 			return false;
 		}else{
 		    return true;
 		}
 	}
   </script>
  </head>
  <style>
	body{
		background:url(images/1505199170366.jpg) top left;
		background-size:100% 100%;
		overflow:hidden;
	}
</style>
  <body style="width:100%; height:100%;">
  <div style="margin-left:500px; margin-top:200px;">
  <a href="${pageContext.request.contextPath}/adminServlet?flag=adminList" onclick="return supers();">
   <button class="layui-btn layui-btn-warm layui-btn-radius">亲，点我跳转哦！</button>
  </a></div>
  </body>
</html>
