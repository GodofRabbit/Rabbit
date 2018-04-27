package edu.sram.dto;

import org.springframework.stereotype.Repository;

@Repository
public class UserCart {
	private int user_id;
    private int sid;
    private int num;
	public UserCart() {
	}
	public UserCart(int user_id, int sid, int num) {
		this.user_id = user_id;
		this.sid = sid;
		this.num = num;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "UserCart [user_id=" + user_id + ", sid=" + sid + ", num=" + num
				+ "]";
	}
    
    
}
