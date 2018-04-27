package com.shop.entity;

public class Address {

	private int address_id;
	private int user_id;
	private String address_type;
	private String provinces;
	private String citys;
	private String countys;
	private String street;
	private int postalcode;
	private String conname;
	private String conphone;
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAddress_type() {
		return address_type;
	}
	public void setAddress_type(String address_type) {
		this.address_type = address_type;
	}
	public String getProvinces() {
		return provinces;
	}
	public void setProvinces(String provinces) {
		this.provinces = provinces;
	}
	public String getCitys() {
		return citys;
	}
	public void setCitys(String citys) {
		this.citys = citys;
	}
	public String getCountys() {
		return countys;
	}
	public void setCountys(String countys) {
		this.countys = countys;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public int getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(int postalcode) {
		this.postalcode = postalcode;
	}
	public String getConname() {
		return conname;
	}
	public void setConname(String conname) {
		this.conname = conname;
	}
	public String getConphone() {
		return conphone;
	}
	public void setConphone(String conphone) {
		this.conphone = conphone;
	}

	
	
}
