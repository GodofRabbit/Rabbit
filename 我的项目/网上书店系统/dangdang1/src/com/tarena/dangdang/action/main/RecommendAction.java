package com.tarena.dangdang.action.main;

import java.util.List;

import com.tarena.dao.ProductDao;
import com.tarena.entity.Book;

public class RecommendAction {
	private List<Book> books;
	public String execute()throws Exception{
		books=ProductDao.getRecommendedBooks();
		return "success";
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	

}
