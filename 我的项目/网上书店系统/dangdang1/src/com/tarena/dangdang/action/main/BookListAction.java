package com.tarena.dangdang.action.main;

import java.util.List;

import com.tarena.dao.CategoryDao;
import com.tarena.dao.ProductDao;
import com.tarena.entity.Book;
import com.tarena.entity.Category;
import com.tarena.entity.Product;

public class BookListAction {
	private int cid;
	private int pid;
	private List<Category> cats;
	private List<Book> books;
	private int totalNum;
	private int page=1;
	private int size;
	private int maxPage;
	private int orderType=1;
	private int order=1;
	public String execute() throws Exception{
		cats=CategoryDao.getCategoryByParenetId(pid);
		books=ProductDao.findBooksByCatId(cid,page,size,orderType,order);
		totalNum=getTotal();
		maxPage=(int) Math.ceil(((double)ProductDao.getMaxAmount(cid)/size));
		if(maxPage==0){
			maxPage=1;
		}
		return "success";
	}
	private int getTotal(){
		int num=0;
		for(Category cat:cats){
			num+=cat.getNum();
		}
		return num;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public List<Category> getCats() {
		return cats;
	}
	public void setCats(List<Category> cats) {
		this.cats = cats;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getTotalNum() {
		return totalNum;
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
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getOrderType() {
		return orderType;
	}
	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	

	
}
