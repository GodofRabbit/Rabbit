package com.tarena.entity;

public class UserInfo {
	private int id;
	private String email;
	private String nickName;
	public UserInfo(int id, String email, String nickName) {
		super();
		this.id = id;
		this.email = email;
		this.nickName = nickName;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}
