package com.tarena.dangdang.action.user;

import com.tarena.dao.UserDao;



public class CheckEmail {
	private String Email;
	private boolean data;
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	public boolean getData() {
		return data;
	}
	public void isData(boolean data) {
		this.data = data;
	}
	public String execute() throws Exception{
	
		data=UserDao.findByEmail(Email);
		if(data==false){
			data=false;
		}else{
			data=true;
		}
		return "success";
	
	}
}
