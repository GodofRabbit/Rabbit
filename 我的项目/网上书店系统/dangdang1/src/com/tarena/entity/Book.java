package com.tarena.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Book extends Product implements Serializable {
	private String author;
	private String publishing;
	private long publishTime;
	private String wordNumber;
	private String whichEdtion;
	private String totalPage;
	private int printTime;
	private String printNumber;
	private String isbn;
	private String authorSummary;
	private String catalogue;
	public Book(){}
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
	public long getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(long publishTime) {
		this.publishTime = publishTime;
	}
	public String getWordNumber() {
		return wordNumber;
	}
	public void setWordNumber(String wordNumber) {
		this.wordNumber = wordNumber;
	}
	public String getWhichEdtion() {
		return whichEdtion;
	}
	public void setWhichEdtion(String whichEdtion) {
		this.whichEdtion = whichEdtion;
	}
	public String getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}
	public int getPrintTime() {
		return printTime;
	}
	public void setPrintTime(int printTime) {
		this.printTime = printTime;
	}
	public String getPrintNumber() {
		return printNumber;
	}
	public void setPrintNumber(String printNumber) {
		this.printNumber = printNumber;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getAuthorSummary() {
		return authorSummary;
	}
	public void setAuthorSummary(String authorSummary) {
		this.authorSummary = authorSummary;
	}
	public String getCatalogue() {
		return catalogue;
	}
	public void setCatalogue(String catalogue) {
		this.catalogue = catalogue;
	}
	public String getTime(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date(getAddTime());
		return sdf.format(date);
	}
	
	
	
	
}
