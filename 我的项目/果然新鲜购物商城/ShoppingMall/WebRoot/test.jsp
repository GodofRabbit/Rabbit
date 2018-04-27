<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>js年月日三级联动-懒人建站，web前端工程师学习交流平台 http://www.51xuediannao.com/</title>
	<script language="javascript" src="<%=path %>js/YMDClass.js"></script>

	<!--   年月日联动下拉选择JS封装类 Ver 1.0 版

	  应用说明:页面包含<script type="text/javascript" src="YMDClass.js" charset="utf-8"></script>
	  <select name="year1"></select>
	  <select name="month1"></select>
	  <select name="day1"></select>
	  <script>
	  new YMDselect('year1','month1','day1',1990,2,10);
	  </script>
		年月联动
		  new YMDselect('year1','month1');
		  new YMDselect('year1','month1',1990);
		  new YMDselect('year1','month1',1990,2);
		年月日联动
		  new YMDselect('year1','month1','day1');
		  new YMDselect('year1','month1','day1',1990);
		  new YMDselect('year1','month1','day1',1990,2);
		  new YMDselect('year1','month1','day1',1990,2,10);
		  
	程序制作/版权所有:http://iulog.com
	收集：懒人建站：http://www.51xuediannao.com/懒人建站提供web前端资源、web前端教程，这一切都是免费的！
	-->
	<style>
		/*这里的样式是测试，你可以自定义样式*/
		select{ height: 30px; padding: 0 4px;}
	</style>
</head>
<body style="padding: 50px;">
<select name="year1"></select>
<select name="month1"></select>
<select name="day1"></select>


<script>
	new YMDselect('year1','month1','day1');
</script>
</body>
</html>
