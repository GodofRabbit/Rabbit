package com.tarena.dangdang.action.chart;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.entity.UserInfo;

public class ManagementAction extends BaseAction {
	public String execute(){
		UserInfo user=new UserInfo(0, null, null);
		session.put("user", user);
		return "success";
	}

}
