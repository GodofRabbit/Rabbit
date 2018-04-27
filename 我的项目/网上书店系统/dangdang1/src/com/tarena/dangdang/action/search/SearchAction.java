package com.tarena.dangdang.action.search;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import com.tarena.dao.SearchDao;
import com.tarena.entity.Book;
import com.tarena.entity.Category;

public class SearchAction {
	private String keyword;
	private int page=1;
	private int size;
	private int pid;
	private int cid;
	private List<Book> books;
	private List<Category> cats;
	private int maxPage;
	public String execute() throws Exception{
		keyword=new String (keyword.getBytes("ISO-8859-1"),"utf-8");
		String word="%"+keyword+"%";
		books=SearchDao.searchBooksByCatId(pid, word, page, size);
		for(Book book:books){
			String name=book.getProductName();
			name=name.replaceAll(keyword,"<span style='color:red;'>"+keyword+"</span>");
			book.setProductName(name);
			
			}
			
		
		maxPage=SearchDao.getMaxPage(pid,word,size);
		if(maxPage==0){
			maxPage=1;
		}
		
		return "success";
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public List<Category> getCats() {
		return cats;
	}
	public void setCats(List<Category> cats) {
		this.cats = cats;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
}
