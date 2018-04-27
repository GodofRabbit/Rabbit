package com.tarena.dangdang.action.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

public class BaseAction implements SessionAware,ServletRequestAware {
	protected HttpServletRequest httpRequest;
	protected  Map<String,Object> session;
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.httpRequest=arg0;
	}

	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.session=arg0;
	}
	
}
