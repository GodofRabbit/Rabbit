package com.tarena.dangdang.action.main;

import com.tarena.dao.UserDao;

import com.tarena.entity.D_User;
import com.tarena.service.UserService;
import com.tarena.service.UserServiceImpel;


public class UpdateUserInFo1 {
	private D_User user;

	public D_User getUser() {
		return user;
	}

	public void setUser(D_User user) {
		this.user = user;
	}
	public String execute() throws Exception{
		
		UserService us=new UserServiceImpel();
		us.updateU(user);
		return "success";
	}
}
