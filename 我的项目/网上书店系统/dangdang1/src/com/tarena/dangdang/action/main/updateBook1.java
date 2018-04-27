package com.tarena.dangdang.action.main;

import com.tarena.dao.BookDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.entity.BookListAll;



public class updateBook1 {
	private int id;
	private BookListAll Books;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public BookListAll getBooks() {
		return Books;
	}
	public void setBooks(BookListAll books) {
		Books = books;
	}
	public String execute() throws Exception{
		 //3.≤È—Ø id≤È—Ø
		
		BookDao bd=new BookDaoImlp();
		Books=bd.findnewBook(id);
		
		return "success";
	}
}
