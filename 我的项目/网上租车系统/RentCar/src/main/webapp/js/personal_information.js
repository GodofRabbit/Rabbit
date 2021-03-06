
function to_order(){
	$("#orderlist_rent_car").css("display","block");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
	
	var id=1;
	$.ajax({
		url:"http://localhost:8080/RentCar/findorder.do",
		data:{t_user_id:id},
		type:"post",
		resultType:"json",
		success:function(result){
			if(result.state==0){
				$("#zc_order").show();
				$("#zc_horder").hide();
			}else if(result.state==1){
				$("#zc_order").hide();
				$("#zc_horder").show();
				
				var orders=result.data;
				
				$.each(orders,function(i,o){
					var tr='<tr style="border-bottom: 1px solid #DCDCDC">'
					tr+='<td colspan="3"><img src="https://image.zuchecdn.com/newversion/news/common/grayben.png"  width="100" height="100" ></td>'
					tr+='<td width="762px" colspan="1"  valign="top" style="line-height: 20px">'
					tr+='<p style="font-size: 13px;padding-left: 50px;margin-top: 5px">车型:'+o.t_cartype_id+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5座/1.5t</p>'
					tr+='<p style="font-size: 13px;padding-left: 50px;margin-top: 3px">租车时间:'+o.btime+'</p>'
					tr+='<p style="font-size: 13px;padding-left: 50px;margin-top: 3px">还车时间:'+o.rtime+'</p>'
					tr+='<p style="font-size: 22px;padding-left: 550px;color: #B8860B">价格: ￥'+o.aRent+'</p>'
					tr+='</td></tr>'
										
					var $tr=$(tr);
					$tr.data("oid",o.id);
					$("#allorder").append($tr);
          
				})
				
			}
		}
		
	})
}


function to_bonus_points(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","block");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
}


function to_coupon(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","block");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
}


function to_information(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","block");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
	
	$.ajax({
		url:"http://localhost:8080/RentCar/getInformation.do",
		data:{user_id:user_id},
		type:"post",
		resultType:"json",
		success:function(result){
			
		}
	});
}


function to_rank(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","block");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
}


function to_password(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","block");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
}


function to_rules(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","block");//会员章程
	$("#member_bylaws").css("display","none");//会员细则
}


function to_bylaws(){
	$("#orderlist_rent_car").css("display","none");//自驾订单
	$("#my_coupon").css("display","none");//优惠券
	$("#my_bonus_points").css("display","none");//我的积分
	$("#my_information").css("display","none");//我的信息
	$("#my_rank").css("display","none");//我的等级
	$("#my_password").css("display","none");//登录密码
	$("#member_rules").css("display","none");//会员章程
	$("#member_bylaws").css("display","block");//会员细则
}

