package com.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.CouponDao;
import com.shop.entity.Coupon;
import com.shop.service.CouponService;
@Service
public class CouponServiceImp implements CouponService{

	@Autowired
	CouponDao couponDao;
	public List<Coupon> findAll() {
		return couponDao.findAll();
	}
	public Coupon findCouponById(int id) {
		
		return couponDao.findCouponById(id);
	}

	
}
