package com.tarena.dangdang.action.main;

import com.tarena.dao.ProductDao;
import com.tarena.entity.Book;

public class ProductionAction {
	private int id;
	private Book book;
	public String execute() throws Exception{
		book=ProductDao.findBooksById(id);
		return "success";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
		
}
