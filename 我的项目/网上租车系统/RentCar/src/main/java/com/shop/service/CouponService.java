package com.shop.service;

import java.util.List;

import com.shop.entity.Coupon;

public interface CouponService {

	public List<Coupon> findAll();

	public Coupon findCouponById(int id);
}
