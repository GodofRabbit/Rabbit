package com.tarena.dangdang.action.cart;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.service.CartService;
import com.tarena.util.CartManagement;

public class BuyAction extends BaseAction{
	private int id;
	private boolean ok=true;
	public String execute(){
		CartService cart=CartManagement.initCart(session);
		try{
			cart.add(id);
		}catch(Exception e){
			e.printStackTrace();
			ok=false;
		}
		return "success";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
	
}
