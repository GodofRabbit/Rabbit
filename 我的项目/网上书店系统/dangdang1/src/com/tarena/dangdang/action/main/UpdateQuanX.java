package com.tarena.dangdang.action.main;

import com.tarena.dao.UserDao;


public class UpdateQuanX {
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String execute() throws Exception{
		
		UserDao.XiuGaiQuanXian(id);
		return "success";
		
	}
}
