package com.shop.entity;

public class Coupon {

	private Integer id;
	private String name;
	private double price;
	private Integer time;
	private Integer state;//1进行中2已过期
	private String description;
	private Integer coutype;//1新人券2满减券3折扣券
	private String img;
	public Coupon() {
		
	}
	
	public Coupon(String name, double price, Integer time, Integer state,
			String description, Integer coutype,String img) {
		super();
		this.name = name;
		this.price = price;
		this.time = time;
		this.state = state;
		this.description = description;
		this.coutype = coutype;
		this.img=img;
	}

	public Coupon(Integer id, String name, double price, Integer time,
			Integer state, String description, Integer coutype,String img) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.time = time;
		this.state = state;
		this.description = description;
		this.coutype = coutype;
		this.img=img;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getCoutype() {
		return coutype;
	}
	public void setCoutype(Integer coutype) {
		this.coutype = coutype;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Coupon [id=" + id + ", name=" + name + ", price=" + price
				+ ", time=" + time + ", state=" + state + ", description="
				+ description + ", coutype=" + coutype + ", img=" + img + "]";
	}
	
}
