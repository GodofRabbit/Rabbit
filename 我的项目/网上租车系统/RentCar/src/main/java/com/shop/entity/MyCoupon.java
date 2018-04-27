package com.shop.entity;

import java.sql.Timestamp;

public class MyCoupon {
	
	private Integer coupon_id;//优惠券id
	private String name;//优惠券名字
	private double price;//优惠价格
	private Integer time;//优惠券的有效时间
	private Integer coutype;//1新人券2满减券3折扣券
	private Timestamp createtime;//优惠券的生成时间
	private int state;//1未使用 2已使用 3已过期
	public MyCoupon() {
		
	}
	public MyCoupon(Integer coupon_id, String name, double price, Integer time,
			Integer coutype, Timestamp createtime, int state) {
		super();
		this.coupon_id = coupon_id;
		this.name = name;
		this.price = price;
		this.time = time;
		this.coutype = coutype;
		this.createtime = createtime;
		this.state = state;
	}
	public Integer getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(Integer coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public Integer getCoutype() {
		return coutype;
	}
	public void setCoutype(Integer coutype) {
		this.coutype = coutype;
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
		return "MyCoupon [coupon_id=" + coupon_id + ", name=" + name
				+ ", price=" + price + ", time=" + time + ", coutype="
				+ coutype + ", createtime=" + createtime + ", state=" + state
				+ "]";
	}
	
	

}
