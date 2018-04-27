package com.tarena.dangdang.action.user;

import com.tarena.dao.UserDao;
import com.tarena.entity.User;
import com.tarena.entity.UserInfo;
import com.tarena.service.UserService;
import com.tarena.service.UserServiceImpel;

public class UnlockAccountAction extends BaseAction{
	private int id;
	private UserInfo user;
	public String execute() throws Exception{
		UserDao.updateIsVerifyCode(id);
		UserService service=new UserServiceImpel();
		user=service.loginIn(id, session);
		return "success";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	
}
