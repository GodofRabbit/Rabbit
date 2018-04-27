package com.tarena.dangdang.action.user;

import com.tarena.dao.UserDao;

public class CheckEmailVeryCodeAction {
	private String emailCode;
	private int id;
	private boolean result;
	public String execute() throws Exception{
		System.out.println(id);
		System.out.println(emailCode);
		String veryEmail=UserDao.getEmailVeryCode(id)+"-"+id+"";
		if(emailCode.equals(veryEmail)){
			result=true;
		}else{
			result=false;
		}
		return "success";
	}
	
	public String getEmailCode() {
		return emailCode;
	}
	public void setEmailCode(String emailCode) {
		this.emailCode = emailCode;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	
}
