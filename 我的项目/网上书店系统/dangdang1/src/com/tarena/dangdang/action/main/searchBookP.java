package com.tarena.dangdang.action.main;

import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.BookDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.entity.BookListAll;
import com.tarena.util.Constant;


public class searchBookP {
	private List<BookListAll> Books=new ArrayList<BookListAll>();
	private int page = Constant.INITPAGE;
	private int maxPage = Constant.MAXSIZE;
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
		
		BookDao bd=new BookDaoImlp();
		Books=bd.findBookAll(page,Constant.SIZE);
		
		int total=bd.findBookAllTotal();
		maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
		return "success";
	}
}
