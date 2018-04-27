package com.tarena.dangdang.action.user;


import com.tarena.entity.User;
import com.tarena.service.UserService;
import com.tarena.service.UserServiceImpel;

public class RegisterAction extends BaseAction{
	private User user=new User();
	
	public String execute() throws Exception{
		UserService userService=new UserServiceImpel();
		userService.register(user, httpRequest);
		return "verify";
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
