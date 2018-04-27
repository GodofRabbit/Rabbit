 var url="allEmptyRoomList.do";
        //展示全部空房
		function allEmptyRoom(url){
			$("#boody_tr").html("");
			var page = $("#page").val();
			$.ajax({
				url:url,
				data:{page:page},
				type:"post",
				success:function(data){
					$.each(data.data,function(index,emptyRoom){
						var tr = '<tr>'
						tr+='<th style="text-align: center;">'+emptyRoom.room_number+'</th>'
						tr+='<th style="text-align: center;">'+emptyRoom.room_type_price+'</th>'  
						tr+='<th style="text-align: center;">'+emptyRoom.room_type_name+'</th>'
						tr+='<th style="text-align: center;"><a><input type="button" value="入住登记" class="buttom"/></a></th>'
						tr+='</tr>'
						var $tr = $(tr);
						$tr.data("emptyRoom_number",emptyRoom.room_number);
						$tr.data("emptyRoom_price",emptyRoom.room_type_price);
						$tr.data("emptyRoom_name",emptyRoom.room_type_name);
						$("#boody_tr").append($tr);
					});
					$("#totalPage").text(data.state);
					$("#totalRecord").text(data.message);
				}
			});
		}
		//下一页
		function nextPage(){
		   var totalPage = parseInt($("#totalPage").text());
		   var page = parseInt($("#page").val())+1;
		   if(page<=totalPage){
		   $("#currentPage").text(page);
	       $("#page").val(page);
	       allEmptyRoom(url);
	       }else{
	    	  
	          alert("亲，已经是最后一页了");
	       }
		}
		//上一页
		function lastPage(){
		   var page = parseInt($("#page").val())-1;
		   var totalPage = parseInt($("#totalPage").text());
		   if(page<=0){
		     alert("亲，已经是第一页了");
		   }else{
		   $("#currentPage").text(page);
	       $("#page").val(page);
	       allEmptyRoom(url);
	       }
		}
		//展示普通单人间空房
		function normalSingleRoom(){
			$("#page").val(1);
			$("#currentPage").text(1);
		    url="normalSingleRoom.do";
		    allEmptyRoom(url);
		}
		//展示豪华单人间空房
		function deluxeSingleRoom(){
			$("#page").val(1);
			$("#currentPage").text(1);
		    url="deluxeSingleRoom.do";
		    allEmptyRoom(url);
		}
		//展示普通双人间空房
		function normalDoubleRoom(){
			$("#page").val(1);
			$("#currentPage").text(1);
		    url="normalDoubleRoom.do";
		    allEmptyRoom(url);
		}
		//展示豪华双人间空房
		function deluxeDoubleRoom(){
			$("#page").val(1);
			$("#currentPage").text(1);
		    url="deluxeDoubleRoom.do";
		    allEmptyRoom(url);
		}
		//展示贵宾套房空房
		function vipSuite(){
			$("#page").val(1);
			$("#currentPage").text(1);
		    url="vipSuite.do";
		    allEmptyRoom(url);
		}
		//展示总统套房空房
		function presideSuite(){
			$("#page").val(1);
			$("#currentPage").text(1);
		    url="presideSuite.do";
		    allEmptyRoom(url);
		}
		//点击入住登记  进行登记
		
		function userRegister(){
			$("#boody_tr a").removeClass("checked");
			$(this).addClass("checked");
			var emptyRoom_number =$("#boody_tr a.checked").parent("th").parent("tr").data("emptyRoom_number");
			var price = $("#boody_tr a.checked").parent("th").parent("tr").data("emptyRoom_price");
			var emptyRoom_name = $("#boody_tr a.checked").parent("th").parent("tr").data("emptyRoom_name");
			window.location.href="CheckIn1.html?room_number="+emptyRoom_number+"&room_type_price="+price+"&room_type_name="+encodeURI(encodeURI(emptyRoom_name));
		}