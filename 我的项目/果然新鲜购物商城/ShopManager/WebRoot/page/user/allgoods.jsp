<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
 <style>
	body{
		background:url(images/beijing2.jpg) top left;
		background-size:100% 100%;
		overflow:hidden;
	}
</style>
  <body style="width:100%; height:100%;">
<form action="${pageContext.request.contextPath}/goodsServlet?flag=goodsList" method="post" id="form1">
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
		<a href="#" onclick="javascript:history.back(-1);"> <img src="images/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
		<a href="#" onclick="javascript:history.go(1);"> <img src="images/timg2.jpg" height="22px" width="22px"/></a>
		商品管理
			</div>
		</div>

		
		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
						<div class="cfD">
							<input class="userinput" type="text" placeholder="请输入关键字" name="keywords" value="${search}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="userbtn" type="submit">查询</button>
							<button class="userbtn" onclick="toAdd()">上架商品</button>
						</div>
				</div>
				<!-- goods 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="100px" class="tdColor">商品名称</td>
							<td width="100px" class="tdColor">商品单价</td>
							<td width="130px" class="tdColor">商品图片</td>
							<td width="435px" class="tdColor">商品上架时间</td>
							<td width="130px" class="tdColor">商品库存</td>
 							<td width="130px" class="tdColor">商品状态<br>(1.上架，2.下架)</td>   <!--商品状态，1.上架，2.下架 -->
 							<td width="130px" class="tdColor">操作</td>
						</tr>
		<c:forEach items="${page.dataList}" var="goods">
						<tr height="40px">
		     <td>${goods.goodsname}</td>
		     <td>${goods.goodsprice}</td>
		     <td><img src="<%=path%>/images/${goods.goods_imageurl}" width="130px" height="50px"/></td>
		     <td><fmt:formatDate pattern="yyyy-MM-dd E"  value="${goods.goodstime}" /></td>
		     <td>${goods.num}</td>
		     <td>${goods.state}</td>
							<td><a class="goodsbtn" href="<%=path%>/goodsServlet?flag=goodsEdit&id=${goods.id}"><img class="operation"
									src="page/img/update.png"></img></a> 
							<a href="javascript:void(0);" onclick="confirmDel('${goods.id}')"><img class="operation delban" src="page/img/delete.png"></img></a></td>
						</c:forEach></tr>
					</table>
					 <div class="paging"> 
                    	<h4>共${page.totalRecord }条记录&nbsp;&nbsp;&nbsp;&nbsp;共${page.totalPage }页&nbsp;&nbsp;&nbsp;&nbsp;当前第${page.currentPage }页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="javascript:void(0);" onclick="firstPage();">首页</a>&nbsp;&nbsp;
                    	<a href="javascript:void(0);" onclick="prePage();">上一页</a>&nbsp;&nbsp;
                    	<a href="javascript:void(0);" onclick="nextPage();">下一页</a>&nbsp;&nbsp;
                    	<a href="javascript:void(0);" onclick="lastPage();">尾页</a>&nbsp;&nbsp;
                    
                                                            跳转至第<input type="text" name="jumpPage" value="${search}" style="width:25px"/>页
                           <a href="javascript:void(0);" onclick="jumpPage();"> <input type="button" value="确定"></input></a></h4>
                    </div>
				</div>
				<!-- goods 表格 显示 end-->
			</div>
			<!-- goods页面样式end -->
		</div>

	</div>


	
	</form>
</body>
<script type="text/javascript">
function confirmDel(id){
	if(confirm("确定删除此条记录吗？")){
		window.location.href="${pageContext.request.contextPath}/goodsServlet?flag=delgoods&id="+id;
	}else{
		return;
	}
}
</script>
<script type="text/javascript">
// 广告弹出框
$(".delban").click(function(){
  $(".banDel").show();
});
$(".close").click(function(){
  $(".banDel").hide();
});
$(".no").click(function(){
  $(".banDel").hide();
});

	function submiForm(url){
		var element =  document.getElementById("form1");
		element.action=url;
		element.submit();
	}
	var currentPage=${page.currentPage};
	var totalPage =${page.totalPage };
	function prePage(){
		if(currentPage==1){
			alert("没有上一页");
		}else{
			submiForm("${pageContext.request.contextPath}/goodsServlet?flag=goodsList&currentPage="+(currentPage-1));
		}
	}
	function nextPage(){
		if(currentPage==totalPage){
			alert("没有下一页");
		}else{
			submiForm("${pageContext.request.contextPath}/goodsServlet?flag=goodsList&currentPage="+(currentPage+1));
		}
	}
	function firstPage(){
			submiForm("${pageContext.request.contextPath}/goodsServlet?flag=goodsList&currentPage=1");
	}
	function lastPage(){
			submiForm("${pageContext.request.contextPath}/goodsServlet?flag=goodsList&currentPage="+totalPage);
	}
	function jumpPage(){
		submiForm("${pageContext.request.contextPath}/goodsServlet?flag=goodsList2&currentPage="+currentPage);
}
   function toAdd(){
       submiForm("${pageContext.request.contextPath}/goodsServlet?flag=addgoods");
   }
   var msg ="${message1}";
		if(msg!=""){
			alert(msg);
		}
  var m ="${info}";
		if(m!=""){
			alert(m);
		}
// 广告弹出框 end
</script>
</html>