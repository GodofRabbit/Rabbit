package com.tarena.dangdang.action.main;

import com.tarena.dao.BookDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.entity.BookListAll;


public class addbook3 {
	private int id;
	private String author;
	private String pushing;
	private String wordnumber;
	private String pagenumber;
	private String isbn;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPushing() {
		return pushing;
	}
	public void setPushing(String pushing) {
		this.pushing = pushing;
	}
	public String getWordnumber() {
		return wordnumber;
	}
	public void setWordnumber(String wordnumber) {
		this.wordnumber = wordnumber;
	}
	public String getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(String pagenumber) {
		this.pagenumber = pagenumber;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String execute() throws Exception{
		BookListAll bla=new BookListAll();
		bla.setId(id);
		bla.setAuthor(author);
		bla.setPublishing(pushing);
		bla.setPublishtime(System.currentTimeMillis());
		bla.setWordnumber(wordnumber);
		bla.setTotalpage(pagenumber);
		bla.setWhichediion("1");
		bla.setIsbn(isbn);
		
		BookDao bd=new BookDaoImlp();
		bd.insertInfoB(bla);
		return "success";
	}
}
