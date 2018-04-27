package com.tarena.entity;

public class User {
	private int id;
	private String email;
	private String nickName;
	private String password;
	private int userIntegral;
	private String isEmailVerify;
	private String emailVeryCode;
	private long lastLoginTime;
	private String lastLoginIp;
	public User(){};
	
	public User(int id, String email,String nickName, String password, int userIntegral,
			String isEmailVerify, String emailVeryCode, long lastLoginTime,
			String lastLoginIp) {
		super();
		this.id = id;
		this.email = email;
		this.nickName=nickName;
		this.password = password;
		this.userIntegral = userIntegral;
		this.isEmailVerify = isEmailVerify;
		this.emailVeryCode = emailVeryCode;
		this.lastLoginTime = lastLoginTime;
		this.lastLoginIp = lastLoginIp;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserIntegral() {
		return userIntegral;
	}
	public void setUserIntegral(int userIntegral) {
		this.userIntegral = userIntegral;
	}
	
	public String getEmailVeryCode() {
		return emailVeryCode;
	}
	public void setEmailVeryCode(String emailVeryCode) {
		this.emailVeryCode = emailVeryCode;
	}
	public long getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(long lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getIsEmailVerify() {
		return isEmailVerify;
	}
	public void setIsEmailVerify(String isEmailVerify) {
		this.isEmailVerify = isEmailVerify;
	}
	
	

}
