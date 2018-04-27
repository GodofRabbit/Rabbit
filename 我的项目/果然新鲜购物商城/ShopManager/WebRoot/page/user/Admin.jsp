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
<title>管理员管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
 <style>
	body{
		background:url(images/beijing1.jpg) top left;
		background-size:100% 100%;
		overflow:hidden;
	}
</style>
  <body style="width:100%; height:100%;">
<form action="${pageContext.request.contextPath}/adminServlet?flag=adminList" method="post" id="form1">
	<div id="pageAll">
		<div class="pageTop">
			<div class="page">
		<a href="#" onclick="javascript:history.back(-1);"> <img src="images/timg.jpg" height="22px" width="22px"/></a>&nbsp;  
		<a href="#" onclick="javascript:history.go(1);"> <img src="images/timg2.jpg" height="22px" width="22px"/></a>
		管理员管理
			</div>
		</div>

		<div class="page">
			<!-- user页面样式 -->
			<div class="connoisseur">
				<div class="conform">
						<div class="cfD">
							<input class="userinput" type="text" placeholder="请输入关键字" name="managername" value="${searchModel.managername}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="userbtn" type="submit">查询</button>
							<button class="userbtn" onclick="toAdd()">添加管理员</button>
						</div>
				</div>
				<!-- user 表格 显示 -->
				<div class="conShow">
					<table border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td width="435px" class="tdColor">管理员账号</td>
							<td width="435px" class="tdColor">管理员密码</td>
							<td width="300px" class="tdColor">姓名</td>
							<td width="100px" class="tdColor">性别</td>
							<td width="130px" class="tdColor">管理等级</td>
							<td width="600px" class="tdColor">注册时间</td>
							<td width="130px" class="tdColor">操作</td>
						</tr>
		<c:forEach items="${page.dataList}" var="admin">
						<tr height="40px">
							
		     <td>${admin.managername}</td>
		     <td>${admin.managerpassword}</td>
		     <td>${admin.realname}</td>
		     <td>${admin.sex}</td>
		     <td>${admin.role}</td>
		     <td><fmt:formatDate pattern="yyyy-MM-dd E"  value="${admin.jointime}" /></td>
							<td><a class="userbtn" href="<%=path%>/adminServlet?flag=adminEdit&id=${admin.id}"><img class="operation"
									src="page/img/update.png"></img></a> 
							<a href="javascript:void(0);" onclick="confirmDel('${admin.id}')"><img class="operation delban" src="page/img/delete.png"></img></a></td>
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
				<!-- user 表格 显示 end-->
			</div>
			<!-- user页面样式end -->
		</div>

	</div>


	
	</form>
</body>
<script type="text/javascript">
function confirmDel(id){
	if(confirm("确定删除此条记录吗？")){
		window.location.href="${pageContext.request.contextPath}/adminServlet?flag=delAdmin&id="+id;
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
			submiForm("${pageContext.request.contextPath}/adminServlet?flag=adminList&currentPage="+(currentPage-1));
		}
	}
	function nextPage(){
		if(currentPage==totalPage){
			alert("没有下一页");
		}else{
			submiForm("${pageContext.request.contextPath}/adminServlet?flag=adminList&currentPage="+(currentPage+1));
		}
	}
	function firstPage(){
			submiForm("${pageContext.request.contextPath}/adminServlet?flag=adminList&currentPage=1");
	}
	function lastPage(){
			submiForm("${pageContext.request.contextPath}/adminServlet?flag=adminList&currentPage="+totalPage);
	}
	function jumpPage(){
		submiForm("${pageContext.request.contextPath}/adminServlet?flag=adminList2&currentPage="+currentPage);
}
   function toAdd(){
       submiForm("${pageContext.request.contextPath}/adminServlet?flag=addAdmin");
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