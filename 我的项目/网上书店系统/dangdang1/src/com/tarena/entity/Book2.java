package com.tarena.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import freemarker.template.SimpleDate;

public class Book2 extends Product {
	private String author;
	private String publishing;
	private long publishtime;
	private String wordnumber;
	private String whichediion;
	private String	totalpage;
	private int pirinttime;
	private String print_number;
	private String isbn;
	private String authorsummary;
	private String catalogue;
	private String timechu;
	
	public String getRebTimechu() {
		Date d=new Date(publishtime);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyƒÍMM‘¬dd»’");
		String bd=sdf.format(d);
		
		return bd;
	}
	public void setTimechu(String timechu) {
		this.timechu = timechu;
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
	public int getPirinttime() {
		return pirinttime;
	}
	public void setPirinttime(int pirinttime) {
		this.pirinttime = pirinttime;
	}
	public String getPrint_number() {
		return print_number;
	}
	public void setPrint_number(String printNumber) {
		print_number = printNumber;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getAuthorsummary() {
		return authorsummary;
	}
	public void setAuthorsummary(String authorsummary) {
		this.authorsummary = authorsummary;
	}
	public String getCatalogue() {
		return catalogue;
	}
	public void setCatalogue(String catalogue) {
		this.catalogue = catalogue;
	}
	
}
