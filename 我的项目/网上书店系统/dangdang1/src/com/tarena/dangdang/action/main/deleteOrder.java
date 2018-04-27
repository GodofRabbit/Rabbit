package com.tarena.dangdang.action.main;

import com.tarena.dao.OreDao;
import com.tarena.dao.impl.OreDaoImlp;



public class deleteOrder {
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String execute() throws Exception{
		OreDao od=new OreDaoImlp();
		od.deleteorder(id);
		return "success";
	}
}
