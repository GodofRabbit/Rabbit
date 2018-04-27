package com.tarena.dangdang.action.main;

import com.tarena.dao.BookDao;
import com.tarena.dao.ProductDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.entity.Book2;
import com.tarena.entity.Product1;


public class Book2Action {
	public int id;
	public Book2 book;
	public Product1 product;
	
	public Product1 getProduct() {
		return product;
	}
	public void setProduct(Product1 product) {
		this.product = product;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Book2 getBook() {
		return book;
	}
	public void setBook(Book2 book) {
		this.book = book;
	}
	public String execute(){
		
		BookDao bd=new BookDaoImlp();
		try {
			book=bd.findBookById(id);
			product=ProductDao.findbyid(id);
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}
}
