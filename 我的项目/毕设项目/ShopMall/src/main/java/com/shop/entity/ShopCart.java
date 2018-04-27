package com.shop.entity;

public class ShopCart {

	private int cart_id;
	private int user_id;
	private int goods_id;
	private String goodsname;
	private String goods_imageurl;
	private String goodsprice;
	private int goods_num;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoods_imageurl() {
		return goods_imageurl;
	}
	public void setGoods_imageurl(String goods_imageurl) {
		this.goods_imageurl = goods_imageurl;
	}
	public String getGoodsprice() {
		return goodsprice;
	}
	public void setGoodsprice(String goodsprice) {
		this.goodsprice = goodsprice;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	@Override
	public String toString() {
		return "ShopCart [cart_id=" + cart_id + ", user_id=" + user_id
				+ ", goods_id=" + goods_id + ", goodsname=" + goodsname
				+ ", goods_imageurl=" + goods_imageurl + ", goodsprice="
				+ goodsprice + ", goods_num=" + goods_num + "]";
	}
	
	
}
