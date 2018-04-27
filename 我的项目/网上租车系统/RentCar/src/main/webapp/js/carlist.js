function loadCar(){
	    var time=$("#limit_time").text()    			
		var type_conditions = new Array();
		var price_conditions = new Array();
		var title_conditions = new Array();
			  

			//类型
		$(".chexing li a").each(function(){
			if($(this).hasClass("checked")){
				type_conditions.push($(this).attr("data"));
			}
		});
			     //价格
		$(".pri_range li a").each(function(){
			if($(this).hasClass("checked")){
				price_conditions.push($(this).attr("data"));
			}
		});
		     //品牌
		$(".car_brand li a").each(function(){
			if($(this).hasClass("checked")){
				title_conditions.push($(this).attr("data"));
			}
		});
	$.ajax({
			url:"http://localhost:8080/RentCar/search_car.do",
			traditional:true,
			type:"post",
			data:{type_conditions:type_conditions,price_conditions:price_conditions,title_conditions:title_conditions},
			success:function(result){
				var list = result.data;
				$.each(list,function(i,item){
					var tr='<tr class="clist_tr carLi carInfo166 ">'
        tr+='<td class="pic">'                 			   
       
	    tr+='<img src="http://localhost:8080/RentCar/img/'+item.photo+'"  onclick="carDetailFn('+item.id+', &quot;normal&quot;);" width="230" height="130">'
	    
        tr+='</td>'
        tr+='<td class="info">'
        tr+='<p class="name">'+item.carname+'</p>'
        tr+='<p class="oth">'+item.type_id+' | 乘坐'+item.seating+'人'					
	    tr+='</p>'
        tr+='<div class="alltips">'       										
	    tr+='<div class="clear"></div>'
        tr+='</div>'
		tr+='<div class="bh_sale">'					
        tr+='</div>'
		tr+='<div class="fade_clist"></div>'			
        tr+='</td>'
        tr+='<td class="ord">'
	    tr+='<div class="order_box">'			   
        tr+='<div class="od_price">'
        tr+='<div class="houfu "></div>'                        
        tr+='<div class="car_price" style="z-index: 1;">'
		tr+='<span class="pri_ye">'
        tr+='<em class="rmb">¥</em>'                             	
		tr+='<em class="num">'+item.price+'</em>'	
        tr+='<em class="unit">/日均</em>'
        tr+='</span>'
		tr+='<div class="sz_priceTotal" style="cursor: pointer;" data="normal" modelevel="7" modeid="166" ss="">'
        tr+='<div class="fl clear">'
        tr+='<span class="fl pri_all">'
		tr+='<em class="total">总价:</em>'
		tr+='<em class="rmb">¥</em>'
		tr+='<em class="num">620</em>'
		tr+='<a href="javascript:;" class="zcargray_d"></a>'
        tr+='</span>'
		tr+='</div>'          	    
        tr+='</div>'
        tr+='</div>'
        tr+='</div>'					
        tr+='<a href="javascript:pickUpCar(166,"","","起亚狮跑/SUV/2.0自动","0","","",7,0,0,310,620);" id="bookOrder166" class="od_btn btn_yel zc_bbtn">租 车</a>'                 		
	    tr+='</div>'		  			  	                            
        tr+='</td>'
        tr+='</tr>'
					$tr=$(tr);
					$(".carList").append($tr);



				})
				

			}


		});
	
	
}