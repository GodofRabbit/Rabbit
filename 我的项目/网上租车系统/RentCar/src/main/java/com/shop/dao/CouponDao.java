package com.shop.dao;

import java.util.List;

import com.shop.entity.Coupon;

public interface CouponDao {

	//��ѯ�����Ż�ȯ
	public List<Coupon> findAll();
    //��ѯ�����Ż�ȯ����ѯ�Ż�ȯ����ϸ��Ϣ
	public Coupon findCouponById(int id);
	//�����Ż�ȯ��id��ѯ�Ż�ȯ����Ч����
	public int findTimeByCid(int coupon_id);
	
}
