<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>在线购物系统</title>
		<link href="../css/book.css" rel="stylesheet" type="text/css" />
		<link href="../css/second.css" rel="stylesheet" type="text/css" />
		<link href="../css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#new").html("正在加载中。。");
				$("#new").load("/dangdang/main/findnew.action");
				$("#left").html("正在加载中。。");
				$("#left").load("/dangdang/main/newMANCategory.action");
			
				$("#selectuser").html("正在加载中。。");
				$("#selectuser").load("/dangdang/main/selectuser1.action");
				
	
			});
		
		</script>
		
	</head>
	<body style="background:#769B72">
		&nbsp;
		<!-- 头部开始 -->
		<%@include file="../common/managehead.jsp"%>
		<!-- 头部结束 -->
		<div style="width: 962px; margin: auto;">
			<a href="#" target="_blank"><img
					src="../images/default/book_banner_081203.jpg" border="0" /> </a>
		</div>

		<div class="book">

			<!--左栏开始-->
			<div id="left" class="book_left">
			</div>
			<!--左栏结束-->
    <div class="book_center">
      <div class=second_c_border1 id="selectuser">
				</div>
    </div>
		

			
			<div class="clear"></div>
		</div>

		<!--页尾开始 -->
		<%@include file="../common/foot.jsp"%>
		<!--页尾结束 -->
	</body>
</html>
