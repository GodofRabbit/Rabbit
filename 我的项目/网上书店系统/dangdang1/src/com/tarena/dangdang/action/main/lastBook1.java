package com.tarena.dangdang.action.main;

import com.tarena.dao.ProductDao;


public class lastBook1 {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String execute() throws Exception{
		if(id!=0){
		ProductDao.deletenewP(id);
		}
		return "success";
	}
}
