package com.tarena.entity;

import java.io.Serializable;
import java.text.DecimalFormat;

public class Product implements Serializable {
	private double star;
	private int id;
	private String productName;
	private String description;
	private long addTime;
	private double fixedPrice;
	private double dangPrice;
	private String keyWords;
	private int hasDeleted;
	private String productPic;
	private int comments;
	public Product(){}
	
	public Product(int id, String productName, String description,
			long addTime, double fixedPrice, double dangPrice, String keyWords,
			int hasDeleted, String productPic) {
		super();
		this.id = id;
		this.productName = productName;
		this.description = description;
		this.addTime = addTime;
		this.fixedPrice = fixedPrice;
		this.dangPrice = dangPrice;
		this.keyWords = keyWords;
		this.hasDeleted = hasDeleted;
		this.productPic = productPic;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getAddTime() {
		return addTime;
	}
	public void setAddTime(long addTime) {
		this.addTime = addTime;
	}
	public double getFixedPrice() {
		return fixedPrice;
	}
	public void setFixedPrice(double fixedPrice) {
		this.fixedPrice = fixedPrice;
	}
	public double getDangPrice() {
		return dangPrice;
	}
	public void setDangPrice(double dangPrice) {
		this.dangPrice = dangPrice;
	}
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	public int getHasDeleted() {
		return hasDeleted;
	}
	public void setHasDeleted(int hasDeleted) {
		this.hasDeleted = hasDeleted;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}

	public String getStar() {
		DecimalFormat df=new DecimalFormat("0.0");
		return df.format(star);
	}

	public void setStar(double star) {
		this.star = star;
	}

	public int getComments() {
		return comments;
	}

	public void setComments(int comments) {
		this.comments = comments;
	}
	
	
}
