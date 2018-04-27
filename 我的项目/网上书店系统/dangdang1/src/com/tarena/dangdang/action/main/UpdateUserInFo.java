package com.tarena.dangdang.action.main;

import com.tarena.dao.UserDao;
import com.tarena.entity.D_User;

public class UpdateUserInFo {
	private int id;
	private D_User user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public D_User getUser() {
		return user;
	}
	public void setUser(D_User user) {
		this.user = user;
	}
	public String execute() throws Exception{
		
		user=UserDao.findById(id);
		return "success";
	}
}
