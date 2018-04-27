package com.shop.util;

public class BrandType {
	private String brandName;
	private String country;
	private String typeName;
	
	
	
	public BrandType() {
		super();
	}



	public BrandType(String brandName, String country, String typeName) {
		super();
		this.brandName = brandName;
		this.country = country;
		this.typeName = typeName;
	}



	public String getBrandName() {
		return brandName;
	}



	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getTypeName() {
		return typeName;
	}



	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}



	@Override
	public String toString() {
		return "BrandType [brandName=" + brandName + ", country=" + country
				+ ", typeName=" + typeName + "]";
	}
	
	
	

}

