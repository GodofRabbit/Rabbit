package com.tarena.dangdang.action.main;

import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.OreDao;
import com.tarena.dao.impl.OreDaoImlp;
import com.tarena.entity.GeOrder;
import com.tarena.util.Constant;



public class GeAllOrderAction {
	private List<GeOrder> Georders=new ArrayList<GeOrder>();
	private int page = Constant.INITPAGE;
	private int maxPage = Constant.MAXSIZE;
	
	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public List<GeOrder> getGeorders() {
		return Georders;
	}


	public void setGeorders(ArrayList<GeOrder> georders) {
		this.Georders = georders;
	}


	public String execute() throws Exception{
		
		OreDao od=new OreDaoImlp();
		Georders=od.searchAllOrder( page,Constant.SIZE);
		int total=od.totalAllOrder();
		maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
		return "success";
	}
	
}
