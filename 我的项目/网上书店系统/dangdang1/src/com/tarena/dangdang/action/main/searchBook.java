package com.tarena.dangdang.action.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tarena.dao.BookDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.entity.BookListAll;
import com.tarena.util.Constant;


public class searchBook {
	private String T1;
	private String bookname;
	private double momey=0.0;
	private String author;
	private String pushlish;
	private String isbn;
	private String xuanze;
	public String getT1() {
		return T1;
	}
	public void setT1(String t1) {
		T1 = t1;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public double getMomey() {
		return momey;
	}
	public void setMomey(double momey) {
		this.momey = momey;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPushlish() {
		return pushlish;
	}
	public void setPushlish(String pushlish) {
		this.pushlish = pushlish;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	private List<BookListAll> Books=new ArrayList<BookListAll>();
	private int page = Constant.INITPAGE;
	private int maxPage = Constant.MAXSIZE;
	
	public String getXuanze() {
		return xuanze;
	}
	public void setXuanze(String xuanze) {
		this.xuanze = xuanze;
	}
	public List<BookListAll> getBooks() {
		return Books;
	}
	public void setBooks(List<BookListAll> books) {
		Books = books;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public String execute() throws Exception{
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		Date bs;
		long Ttemp=0L;
		try{
		
		
			bs = sd.parse(T1);
			
		Ttemp=bs.getTime();
		}catch(ParseException ex){
			bs=sd.parse(sd.format(new Date(System.currentTimeMillis())));
			Ttemp=bs.getTime();
		}
		page=1;
		maxPage=1;
		BookDao bd=new BookDaoImlp();
		//	private String bookname;
		
		Books=bd.findBookByParam(Ttemp,bookname,momey,author,pushlish,isbn,xuanze);
		
		return "success";
	}
}
