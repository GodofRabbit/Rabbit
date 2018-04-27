package com.tarena.dangdang.action.main;

import com.tarena.dao.BookDao;
import com.tarena.dao.impl.BookDaoImlp;



public class DeleteBook {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String execute() throws Exception{
		BookDao bd=new BookDaoImlp();
		bd.deleteBookById(id);
		return "success";
	}
}
