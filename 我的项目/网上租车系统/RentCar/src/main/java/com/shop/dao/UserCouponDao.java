package com.shop.dao;

import java.util.List;

import com.shop.entity.Order;
import com.shop.entity.UserCoupon;

public interface UserCouponDao {
	//用户添加优惠券
	public void addUserCoupon(UserCoupon userCoupon);

	//查询某个用户所有的优惠券的id
	public List<Integer> findCidsByUid(int user_id);
    //查询某个用户的所有订单，查询用户是否为新用户
	public List<Order> findOrderByUid(int user_id);
	
	//查询某个用户的所有优惠券
	public List<UserCoupon> findUserCouponByUid(int user_id);
    
	//修改用户优惠券的状态
	public void updateUserCouponState(int id);

	

}
