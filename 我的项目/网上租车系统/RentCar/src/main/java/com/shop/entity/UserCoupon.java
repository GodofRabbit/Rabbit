package com.shop.entity;

import java.sql.Timestamp;


public class UserCoupon {
	
	private int id;
	private int coupon_id;
	private int user_id;
	private Timestamp createtime;
	private int state;//1未使用 2已使用 3已过期
	
	public UserCoupon() {
		super();
	}
	public UserCoupon(int coupon_id, int user_id, Timestamp createtime,
			int state) {
		super();
		this.coupon_id = coupon_id;
		this.user_id = user_id;
		this.createtime = createtime;
		this.state = state;
	}
	public UserCoupon(int id, int coupon_id, int user_id, Timestamp createtime,
			int state) {
		super();
		this.id = id;
		this.coupon_id = coupon_id;
		this.user_id = user_id;
		this.createtime = createtime;
		this.state = state;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "UserCoupon [id=" + id + ", coupon_id=" + coupon_id
				+ ", user_id=" + user_id + ", createtime=" + createtime
				+ ", state=" + state + "]";
	}
	
	

}
