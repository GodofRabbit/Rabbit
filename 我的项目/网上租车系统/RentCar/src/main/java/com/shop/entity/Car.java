package com.shop.entity;

public class Car {
	private int id;                           //����id
	private String carname;                   //��������
	private String carcolor;                   //������ɫ
	private int seating;                   //��λ��
	private int fuelType;                   //ȼ������
	private int displacement;                   //��������
	private String roz;                   //����ȼ�ͱ��
	private double fuelTank;                   //��������
	private String gps;                   //GPS����
	private double price;                   //���޼۸�
	private double overPrice;                   //���ڼ۸�
	private int state;                   //״̬  1����  2����  3��
	private String license;                   //��������
	private int brand_id;                   //Ʒ�Ʊ��
	private int type_id;                   //���ͱ��
	private String pricture;
	
	public Car() {
		super();
	}

	public Car(int id, String carname, String carcolor, int seating,
			int fuelType, int displacement, String roz, double fuelTank,
			String gPS, double price, double overPrice, int state,
			String license, int brand_id, int type_id, String pricture) {
		super();
		this.id = id;
		this.carname = carname;
		this.carcolor = carcolor;
		this.seating = seating;
		this.fuelType = fuelType;
		this.displacement = displacement;
		this.roz = roz;
		this.fuelTank = fuelTank;
		gps = gPS;
		this.price = price;
		this.overPrice = overPrice;
		this.state = state;
		this.license = license;
		this.brand_id = brand_id;
		this.type_id = type_id;
		this.pricture = pricture;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCarname() {
		return carname;
	}

	public void setCarname(String carname) {
		this.carname = carname;
	}

	public String getCarcolor() {
		return carcolor;
	}

	public void setCarcolor(String carcolor) {
		this.carcolor = carcolor;
	}

	public int getSeating() {
		return seating;
	}

	public void setSeating(int seating) {
		this.seating = seating;
	}

	public int getFuelType() {
		return fuelType;
	}

	public void setFuelType(int fuelType) {
		this.fuelType = fuelType;
	}

	public int getDisplacement() {
		return displacement;
	}

	public void setDisplacement(int displacement) {
		this.displacement = displacement;
	}

	public String getRoz() {
		return roz;
	}

	public void setRoz(String roz) {
		this.roz = roz;
	}

	public double getFuelTank() {
		return fuelTank;
	}

	public void setFuelTank(double fuelTank) {
		this.fuelTank = fuelTank;
	}

	public String getGPS() {
		return gps;
	}

	public void setGPS(String gPS) {
		gps = gPS;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getOverPrice() {
		return overPrice;
	}

	public void setOverPrice(double overPrice) {
		this.overPrice = overPrice;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public int getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getPricture() {
		return pricture;
	}

	public void setPricture(String pricture) {
		this.pricture = pricture;
	}

	@Override
	public String toString() {
		return "Car [id=" + id + ", carname=" + carname + ", carcolor="
				+ carcolor + ", seating=" + seating + ", fuelType=" + fuelType
				+ ", displacement=" + displacement + ", ROZ=" + roz
				+ ", fuelTank=" + fuelTank + ", GPS=" + gps + ", price="
				+ price + ", overPrice=" + overPrice + ", state=" + state
				+ ", license=" + license + ", brand_id=" + brand_id
				+ ", type_id=" + type_id + ", pricture=" + pricture + "]";
	}
	
	
	


	
	
	
	

}
