package com.tarena.dangdang.action.main;

import com.tarena.dao.OreDao;
import com.tarena.dao.impl.OreDaoImlp;
import com.tarena.entity.Order;



public class updateOrder1 {
	private int orderId;
	private Order orders;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Order getOrders() {
		return orders;
	}
	public void setOrders(Order orders) {
		this.orders = orders;
	}
	public String execute() throws Exception{
		OreDao od=new OreDaoImlp();
		orders=od.searchSpecialOrder(orderId);
		return "success";
	}
}
