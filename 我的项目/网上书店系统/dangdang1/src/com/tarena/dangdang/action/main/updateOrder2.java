package com.tarena.dangdang.action.main;

import com.tarena.dao.OreDao;
import com.tarena.dao.impl.OreDaoImlp;
import com.tarena.entity.Order;



public class updateOrder2 {
	private int id;
	private double totalprice;
	private String receiveName;
	private String fullAddress;
	private String postalCode;
	private String phone;
	private String mobile;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public String getReceiveName() {
		return receiveName;
	}

	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String execute() throws Exception{
		Order o=new Order();
		o.setId(id);
		o.setTotalPrice(totalprice);
		o.setPhone(phone);
		o.setMobile(mobile);
		o.setPostalCode(postalCode);
		o.setFullAddress(fullAddress);
		o.setReceiveName(receiveName);
		
		OreDao od=new OreDaoImlp();
		od.updateOrder(o);
		return "success";
	}
}
