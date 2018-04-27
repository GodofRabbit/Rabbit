package com.tarena.dangdang.action.cart;

import java.util.List;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.entity.CartItem;
import com.tarena.service.CartService;
import com.tarena.util.CartManagement;

public class CartAction extends BaseAction{
	private List<CartItem> buyList;
	private List<CartItem> deleteList;
	private int id;
	private int quantity;
	private double totalPrice;
	private double savePrice;
	public String execute() throws Exception{
		CartService service=CartManagement.initCart(session);
		buyList=service.getBuyPros();
		deleteList=service.getDeletePros();
		totalPrice=service.getTotalPrice();
		savePrice=service.getMarketTotalPrice()-totalPrice;
		return "success";
	}
	public String del() throws Exception{
		CartService service=CartManagement.initCart(session);
		service.delete(id);
		return "success";
	}
	public String update() throws Exception{
		CartService service=CartManagement.initCart(session);
		service.update(id, quantity);
		return "success";
	}
	public String recover()throws Exception{
		CartService service=CartManagement.initCart(session);
		service.recover(id);
		return "success";
	}
	public String clearAll() throws Exception{
		CartService service=CartManagement.initCart(session);
		service.clearBuyPros();
		return "success";
	}
	public String deleteAll() throws Exception{
		CartService service=CartManagement.initCart(session);
		service.clearDeletePros();
		return "success";
	}
	public String realDelete() throws Exception{
		CartService service=CartManagement.initCart(session);
		service.realDelete(id);
		return "success";
	}
	public String recoverAll() throws Exception{
		CartService service=CartManagement.initCart(session);
		service.recoverAll();
		return "success";
	}
	public List<CartItem> getBuyList() {
		return buyList;
	}
	public void setBuyList(List<CartItem> buyList) {
		this.buyList = buyList;
	}
	public List<CartItem> getDeleteList() {
		return deleteList;
	}
	public void setDeleteList(List<CartItem> deleteList) {
		this.deleteList = deleteList;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public double getSavePrice() {
		return savePrice;
	}
	public void setSavePrice(double savePrice) {
		this.savePrice = savePrice;
	}
	
	

}
