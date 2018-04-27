package com.tarena.entity;

import java.util.Map;

public class D_Receive_Address {
	private int id;
	private int user_id;
	private String receive_address;
	private String full_address;
	private String postal_code;
	private String mobile;
	private String phone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	public String getReceive_address() {
		return receive_address;
	}
	public void setReceive_address(String receiveAddress) {
		receive_address = receiveAddress;
	}
	public String getFull_address() {
		return full_address;
	}
	public void setFull_address(String fullAddress) {
		full_address = fullAddress;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postalCode) {
		postal_code = postalCode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public D_Receive_Address(){
		
	}
}
