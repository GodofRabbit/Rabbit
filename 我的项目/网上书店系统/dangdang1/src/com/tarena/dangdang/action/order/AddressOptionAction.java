package com.tarena.dangdang.action.order;

import java.util.List;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.dao.OrderDao;
import com.tarena.entity.Option;
import com.tarena.entity.UserInfo;

public class AddressOptionAction extends BaseAction{
	private List<Option> optList;
	public String execute() throws Exception{
		UserInfo user=(UserInfo)session.get("user");
		optList=OrderDao.getAddressOption(user.getId());
		return "success";
	}
	public List<Option> getOptList() {
		return optList;
	}
	public void setOptList(List<Option> optList) {
		this.optList = optList;
	}
	
}
