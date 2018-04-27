package com.tarena.dangdang.action.user;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.tarena.service.CookieManagement;


public class LoginOutAction extends BaseAction{
	public String execute(){
		httpRequest.getSession().invalidate();
		HttpServletResponse response=ServletActionContext.getResponse();
		CookieManagement.deleteCookie("/dangdang",CookieManagement.AUTO_LOGIN_COOKIE_NAME,response);
		return "success";
	}
}
