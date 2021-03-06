package com.shop.entity;


import org.springframework.stereotype.Component;
@Component
public class Goods {
	private  int id;
	private  String goodsname;
	private  String goodsprice;
	private  String goods_imageurl;
	private  String goodstime;
	private  int state;//��Ʒ״̬��1.�ϼܣ�2.�¼�
	private  int num;
	public Goods() {
	}
	public Goods(int id, String goodsname, String goodsprice,
			String goods_imageurl, String goodstime, int state, int num) {
		this.id = id;
		this.goodsname = goodsname;
		this.goodsprice = goodsprice;
		this.goods_imageurl = goods_imageurl;
		this.goodstime = goodstime;
		this.state = state;
		this.num = num;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}
	public String getGoodsprice() {
		return goodsprice;
	}
	public void setGoodsprice(String goodsprice) {
		this.goodsprice = goodsprice;
	}
	public String getGoods_imageurl() {
		return goods_imageurl;
	}
	public void setGoods_imageurl(String goods_imageurl) {
		this.goods_imageurl = goods_imageurl;
	}
	public String getGoodstime() {
		return goodstime;
	}
	public void setGoodstime(String goodstime) {
		this.goodstime = goodstime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public int hashCode() {
		return this.goodsname.hashCode()*this.id;
	}
	@Override
	public boolean equals(Object obj) {
		Goods goods = (Goods) obj;
		if(this.id==goods.getId()){
			return true;
		}
		return false;
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", goodsname=" + goodsname + ", goodsprice="
				+ goodsprice + ", goods_imageurl=" + goods_imageurl
				+ ", goodstime=" + goodstime + ", state=" + state + ", num="
				+ num + "]";
	}
	
}
