package com.tarena.dangdang.action.main;

import com.tarena.dao.BookDao;
import com.tarena.dao.impl.BookDaoImlp;



public class lastBook2 {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String execute() throws Exception{
		if(id!=0){
		BookDao bd=new BookDaoImlp();
		bd.deletenewB(id);
		}
		return "success";
	}
}
