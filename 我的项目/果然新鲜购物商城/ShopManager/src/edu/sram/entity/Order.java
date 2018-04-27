package edu.sram.entity;

import java.util.Date;

public class Order {
	private  int id;
	private  String orderseq;
	private  int address_id;
	private  Date ordertime;
	private  int state;  //1.表示未支付2.表示已支付（待发货）3.已发货（待收货）4.交易完成（收货）
	private  int user_id;
	public Order() {
	}
	public Order(int id, String orderseq, int address_id, Date ordertime,
			int state, int user_id) {
		this.id = id;
		this.orderseq = orderseq;
		this.address_id = address_id;
		this.ordertime = ordertime;
		this.state = state;
		this.user_id = user_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderseq() {
		return orderseq;
	}
	public void setOrderseq(String orderseq) {
		this.orderseq = orderseq;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", orderseq=" + orderseq + ", address_id="
				+ address_id + ", ordertime=" + ordertime + ", state=" + state
				+ ", user_id=" + user_id + "]";
	}
	
}
