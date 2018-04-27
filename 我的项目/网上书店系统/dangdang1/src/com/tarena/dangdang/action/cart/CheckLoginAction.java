package com.tarena.dangdang.action.cart;

import com.tarena.dangdang.action.user.BaseAction;

public class CheckLoginAction extends BaseAction {
	private boolean ok=false;
	public String execute(){
		if (session.get("user")==null){
			ok=false;
		}else{
			ok=true;
		}
		return "success";
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
}
