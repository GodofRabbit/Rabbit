package com.tarena.dangdang.action.order;

import com.tarena.dao.OrderDao;
import com.tarena.entity.RecieveInformation;

public class GetReceiveAddressAction {
	private RecieveInformation inf;
	private int id;
	public String execute() throws Exception{
		inf=OrderDao.getReceiveAddress(id);
		return "success";
	}
	public RecieveInformation getInf() {
		return inf;
	}
	public void setInf(RecieveInformation inf) {
		this.inf = inf;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	 
}
