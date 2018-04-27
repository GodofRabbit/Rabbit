
  <style type="text/css">
    #topimage{
	position:absolute;
	border:1px solid #ccc;
	background:#333;
	padding:2px;
	display:none;
	color:#fff;
}
</style>
	<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
	<script type="text/javascript">
			$(function(){
				$(".dongimg").hover(function(){
				
					var s=$(this).attr("src");
					var $x=$("<div id='topimage'><img src='"+s+"'></div>");
					$(this).mousemove(function(e){
						$x.css("left",e.pageX+20);
						$x.css("top",e.pageY+20);
					});
					$("body").append($x);
					$x.show();
					$(this).mouseout(function(){
						$x.hide();
					});
				},function(){
					$(this).mouseout(function(){
						$("#topimage").remove();
					});
				});
			});
	</script>
 
