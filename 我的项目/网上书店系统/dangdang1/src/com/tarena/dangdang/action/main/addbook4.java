package com.tarena.dangdang.action.main;

import com.tarena.dao.BookDao;
import com.tarena.dao.CategroyDao;
import com.tarena.dao.ProductDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.dao.impl.CategoryDaoImlp;
import com.tarena.entity.BookListAll;



public class addbook4 {
	private int id;
	private int xuanze;
	private BookListAll Books;
	
	public BookListAll getBooks() {
		return Books;
	}
	public void setBooks(BookListAll Books) {
		this.Books = Books;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getXuanze() {
		return xuanze;
	}
	public void setXuanze(int xuanze) {
		this.xuanze = xuanze;
	}
	public String execute() throws Exception{
		//1.�ֲ�����޸�
		CategroyDao cd=new CategoryDaoImlp();
		cd.insertIX(id,xuanze);
		ProductDao.updateHasDeleted(id);
		 //3.��ѯ id��ѯ
		BookDao bd=new BookDaoImlp();
		Books=bd.findnewBook(id);
		return "success";
	}
}
