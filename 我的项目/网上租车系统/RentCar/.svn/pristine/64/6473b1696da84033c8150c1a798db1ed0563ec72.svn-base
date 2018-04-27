package com.shop.serviceImp;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.CouponDao;
import com.shop.dao.UserCouponDao;
import com.shop.entity.Coupon;
import com.shop.entity.MyCoupon;
import com.shop.entity.NoteResult;
import com.shop.entity.Order;
import com.shop.entity.UserCoupon;
import com.shop.service.UserCouponService;
@Service
public class UserCouponServiceImpl implements UserCouponService{

	@Autowired
	UserCouponDao userCouponDao;
	@Autowired
	CouponDao couponDao;

	NoteResult result = new NoteResult();
	public NoteResult addUserCoupon(int user_id, int coupon_id) {
		List<Integer> cids = userCouponDao.findCidsByUid(user_id);
		if(coupon_id==1){
			boolean flag = true;
			for (Integer cid : cids) {
				if(cid == coupon_id){
					result.setState(2);//已经领取过券,每个用户只能领取一张
					result.setMessage("您已经领取过了，不能再次领取！");
					flag = false;
					break;
				}
			}
			if(flag){
				List<Order> list = userCouponDao.findOrderByUid(user_id);
				if(list.size() == 0){
					Timestamp time = new Timestamp(System.currentTimeMillis());
					UserCoupon userCoupon = new UserCoupon(coupon_id,user_id,time,1);
					userCouponDao.addUserCoupon(userCoupon);
					result.setMessage("您领取成功了！");//领取成功默认状态为0
				}else{
					result.setData(3);//用户已不是新用户，不能领取新人券
					result.setMessage("您已经不是新用户了，不能领取了");
				}
			}		    	
		}else{
			boolean flag = true;
			for (Integer cid : cids) {
				if(cid == coupon_id){
					result.setData(2);//领取过该券
					result.setMessage("您已经领取过了，不能再次领取！");
					flag = false;
					break;
				}
			}
			if(flag){
				Timestamp time = new Timestamp(System.currentTimeMillis());
				UserCoupon userCoupon = new UserCoupon(coupon_id,user_id,time,1);
				userCouponDao.addUserCoupon(userCoupon);
				result.setMessage("您领取成功了！");//领取成功，默认状态为0
			}

		}
		return result;	


	}

	public NoteResult findUserCouponByUid(int user_id) throws ParseException{
		//遍历用户所有的优惠券
		List<UserCoupon> list = userCouponDao.findUserCouponByUid(user_id);
		//优惠券没有过期
		List<MyCoupon> list1 = new ArrayList<MyCoupon>();
		//优惠券已过期
		List<MyCoupon> list2 = new ArrayList<MyCoupon>();
		for(UserCoupon userCoupon : list){
			Coupon coupon = couponDao.findCouponById(userCoupon.getCoupon_id());
			//获取优惠券的有效时间
			int day = coupon.getTime();
			//优惠券的生成时间
			Timestamp createtime = userCoupon.getCreatetime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//优惠券的最终有效时间
			long time = sdf.parse(sdf.format(createtime)).getTime()+1000*60*60*24*day;
			
			MyCoupon myCoupon = new MyCoupon(coupon.getId(),coupon.getName(),coupon.getPrice(),
					coupon.getTime(),coupon.getCoutype(),userCoupon.getCreatetime(),userCoupon.getState());
			//优惠券有效
			if(System.currentTimeMillis()<=time){
				
				list1.add(myCoupon);
			}else{//优惠券已过期
				//修改用户优惠券的状态
				userCouponDao.updateUserCouponState(userCoupon.getId());	
				list2.add(myCoupon);
			}
		}
		List list3 = new ArrayList();
		list3.add(list1);
		list3.add(list2);
		result.setData(list3);
		
		return result;
	}

}
