package com.tarena.dangdang.action.main;

import java.util.ArrayList;
import java.util.List;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.dao.OreDao;
import com.tarena.dao.impl.OreDaoImlp;
import com.tarena.entity.D_User;
import com.tarena.entity.GeOrder;
import com.tarena.entity.UserInfo;
import com.tarena.util.Constant;

public class GePeopleOrderAction extends BaseAction{
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
		UserInfo d=(UserInfo) session.get("user");
		
		OreDao od=new OreDaoImlp();
		Georders=od.searchGePeoOrder(d.getId(), page,Constant.SIZE);
		int total=od.totalgePeopleOrder(d.getId());
		maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
		return "success";
	}
	
}
