package com.tarena.dangdang.action.user;

import com.tarena.dao.UserDao;

public class CheckEmailAction {
	private boolean hasEmail; 
	private String email;
	public String execute() throws Exception{
		int key=UserDao.checkEmail(email);
		if(key==0){
			this.hasEmail=true;
		}else{
			this.hasEmail=false;
		}
		return "sucess";
	}
	public boolean isHasEmail() {
		return hasEmail;
	}
	public void setHasEmail(boolean hasEmail) {
		this.hasEmail = hasEmail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
