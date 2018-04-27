package com.tarena.dangdang.action.main;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.entity.D_User;
import com.tarena.service.UserService;
import com.tarena.service.UserServiceImpel;

public class addUserBB extends BaseAction{
	private D_User user;

	public D_User getUser() {
		return user;
	}

	public void setUser(D_User user) {
		this.user = user;
	}
	public String execute() throws Exception{
		
		
		user.setLast_login_ip(httpRequest.getRemoteAddr());
		UserService us=new UserServiceImpel();
		us.addUser(user);
		return "success";
	}
}
