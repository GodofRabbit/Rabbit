package com.tarena.dangdang.action.order;

import java.util.List;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.entity.CartItem;
import com.tarena.service.CartService;
import com.tarena.util.CartManagement;

public class OrderInfoAction extends BaseAction {
	private List<CartItem> buyList; 
	private double totalPrice;
	public String execute() throws Exception{
		CartService service=CartManagement.initCart(session);
		buyList=service.getBuyPros();
		totalPrice=service.getTotalPrice();
		return "success";
	}
	public List<CartItem> getBuyList() {
		return buyList;
	}
	public void setBuyList(List<CartItem> buyList) {
		this.buyList = buyList;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
