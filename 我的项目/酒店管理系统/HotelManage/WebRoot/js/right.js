function displayRoom(){
	//删除table下每一个tr中除了第一个td外的所有td
	var trArray = $("tr");
    console.log(trArray.length);
    var td;
    for (var i = 0; i < trArray.length; i++) {
        td = $(trArray[i]).find("td:not(:first)");
        $(td).remove();
    }
    //根据数据库查到的房间状态改变图片颜色
	$.ajax({
        type:"post",
        resultType:"json",
        url:"allRoomState.do",
        success:function(data){
             $.each(data.data,function(j,value){
            	 var x = String.fromCharCode(65+parseInt(j));
            	 $.each(value,function(i,n){
                   	var td='<td><a><img title="'+x+'00'+(i+1)+'" src="images/ico/'+n+'.jpg" class="icotype" onmouseover="this.src=\'images/ico/'+n+'.1.jpg\'"  onmouseout="this.src=\'images/ico/'+n+'.jpg\'"/></a></td>'
                	var $td = $(td);
                   	var room_id=(parseInt(j)*6+(parseInt(i)+1));
                   	$td.data("room_id",room_id);
                   	$td.data("room_state_id",n);
                   	$("#body_tr tr").eq(parseInt(j)).append($td);
            	 })
             });
        },
        error:function(){
        	alert("加载失败");
        }
    });
}


     function clickRoom(){
    	   $("#body_tr a").removeClass("checked");
		   $(this).addClass("checked");
		   var room_id =$("#body_tr a.checked").parent("td").data("room_id");
		   var room_state_id = $("#body_tr a.checked").parent("td").data("room_state_id");
		   if(parseInt(room_state_id)==2){
			   window.location.href="HomeDetail.html?room_id="+room_id;
		   }
		   if(parseInt(room_state_id)==3){
		   $.ajax({
			   type:"post",
			   resultType:"json",
			   data:{room_id:room_id},
			   url:"clickRoom.do",
			   success:function(data){
				   window.location.href="CheckIn1.html?room_number="+data.data.room_number+"&room_type_price="+data.data.room_type_price+"&room_type_name="+encodeURI(encodeURI(data.data.room_type_name));
			   }
		   });
		   }
     }