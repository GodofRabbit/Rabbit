package com.tarena.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BookListAll {
	private int id;
	private String productName;
	private long addTime;
	private double fixedPrice;
	private double dangPrice;
	private String productPic;
	private String author;
	private String publishing;
	private long publishtime;
	private String wordnumber;
	private String whichediion;
	private String	totalpage;
	private String isbn;
	private int catId;
	private String en_name;
	private String name;
	
	private String addTime1;
	private String publishTime1;
	
	
	public String getAddTime1() {
		Date d=new Date(addTime);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
		String bd1=sdf.format(d);
		
		return bd1;
	}

	public String getPublishTime1() {
		Date d=new Date(publishtime);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日");
		String bd=sdf.format(d);
		
		return bd;
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

	public String getProductPic() {
		return productPic;
	}

	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublishing() {
		return publishing;
	}

	public void setPublishing(String publishing) {
		this.publishing = publishing;
	}

	public long getPublishtime() {
		return publishtime;
	}

	public void setPublishtime(long publishtime) {
		this.publishtime = publishtime;
	}

	public String getWordnumber() {
		return wordnumber;
	}

	public void setWordnumber(String wordnumber) {
		this.wordnumber = wordnumber;
	}

	public String getWhichediion() {
		return whichediion;
	}

	public void setWhichediion(String whichediion) {
		this.whichediion = whichediion;
	}

	public String getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(String totalpage) {
		this.totalpage = totalpage;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String enName) {
		en_name = enName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BookListAll(){
		
	}
}
