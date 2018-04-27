<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../css/chat.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery-1.4.4.js" ></script>
<script>
	
</script>
<script>
	var list=new Array();
	
	function isContain(value){
		for(var i=0;i<list.length;i++){
			if(list[i]==value){
				return;
			}
		}
		//sds
		list[list.length]=value;
		$(".chatContent").eq(list.length-1).attr("id",value);
		$(".send").eq(list.length-1).bind("click",{id:value,index:list.length-1},sendMsg);
		
		
	}
	
	function insertwindow(){
		
	
	
	
	}
	
	$(function(){
		setInterval(getMsg,1000);
	});
	
	function getMsg(){
				$.getJSON("/dangdang/chat/getMessage",function(data){
					for(var i=0;i<data.length;i++){
						 isContain(data[i].sender);
						var message=data[i].sender+": "+data[i].text+" ("+data[i].sendTime+")";
						$("#"+data[i].sender).append(message+"<br/>");
						
					}
				});
			}
	function sendMsg(event){
				var msg=$(".message").eq(event.data.index).val();
				$(".message").eq(event.data.index).val("");
				$.post("/dangdang/chat/send",{"text":msg,"id":event.data.id},function(data){
					if(!data){
						alert("发送失败");
					}
				},"json");
				var date=new Date();
				var x=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
				var message="您："+msg+" ("+x+")";
				$("#"+event.data.id).append(message+"<br/>");
			}		
</script>

</head>
<body>
	
<div  class="chat">		
	<div class="window">
				<div id="1" class="chatContent"></div>
				<div class="bar"></div>
				<div class="input">
					<textarea rows="6" cols="40" class="message"></textarea>
					<div class="submit">
						<input  class="send" type="image" src="../images/bg_send.png"></input>
					</div>
					
				</div>
		</div>
	</div>
	<div style="position:absolute;left:400px;">
	<div   class="chat">		
	<div class="window">
				<div class="chatContent"></div>
				<div class="bar"></div>
				<div class="input">
					<textarea rows="6" cols="40" class="message"></textarea>
					<div class="submit">
						<input  class="send" type="image" src="../images/bg_send.png"></input>
					</div>
					
				</div>
		</div>
	</div>
	</div>
	<div style="position:absolute;left:800px;">
	<div   class="chat">		
	<div class="window">
				<div class="chatContent"></div>
				<div class="bar"></div>
				<div class="input">
					<textarea rows="6" cols="40" class="message"></textarea>
					<div class="submit">
						<input  class="send" type="image" src="../images/bg_send.png"></input>
					</div>
					
				</div>
		</div>
	</div>
	</div>				
</body>

</html>
