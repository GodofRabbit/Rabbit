package com.tarena.dangdang.action.main;

import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.BookDao;
import com.tarena.dao.OreDao;
import com.tarena.dao.SelectUserDao;
import com.tarena.dao.impl.BookDaoImlp;
import com.tarena.dao.impl.OreDaoImlp;
import com.tarena.dao.impl.SelectUserDaoimpl;
import com.tarena.entity.BookListAll;
import com.tarena.entity.D_User;
import com.tarena.entity.GeOrder;
import com.tarena.util.Constant;



public class ManageAction {
	private int id;//当前类别id
	private int productid=0;//父id
	private List<D_User> Users=new ArrayList<D_User>();
	private List<GeOrder> Georders=new ArrayList<GeOrder>();
	private List<BookListAll> Books=new ArrayList<BookListAll>();
	
	public List<BookListAll> getBooks() {
		return Books;
	}
	public void setBooks(List<BookListAll> books) {
		Books = books;
	}
	public List<GeOrder> getGeorders() {
		return Georders;
	}
	public void setGeorders(List<GeOrder> georders) {
		Georders = georders;
	}
	private int page = Constant.INITPAGE;
	private int maxPage = Constant.MAXSIZE;
	public List<D_User> getUsers() {
		return Users;
	}
	public void setUsers(List<D_User> users) {
		Users = users;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String execute() throws Exception{
		if(id==2&&productid==0){
			page=Constant.INITPAGE;
			
			BookDao bd=new BookDaoImlp();
			Books=bd.findBookAll(page,Constant.SIZE);
			
			int total=bd.findBookAllTotal();
			maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
			return "book";
		}
		if(id==5&&productid==2){
			page=Constant.INITPAGE;
			
			BookDao bd=new BookDaoImlp();
			Books=bd.findBookAll(page,Constant.SIZE);
			
			int total=bd.findBookAllTotal();
			maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
			return "book";
		}
		if(id==7&&productid==2){
					return "addbook";
		}
		if(id==15&&productid==2){
			return "searchbook";
		}
		//以上图书管理操作
		if(id==3&&productid==0){
			OreDao od=new OreDaoImlp();
			Georders=od.searchAllOrder( page,Constant.SIZE);
			int total=od.totalAllOrder();
			maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
			return "dingdan";
		}
		if(id==4&&productid==0){
			SelectUserDao sud=new SelectUserDaoimpl();
			Users=sud.SelectUser(page, Constant.SIZE);
			maxPage=sud.SelectUsers();
			return "user";
		}
		if(id==8&&productid==3){
			OreDao od=new OreDaoImlp();
			Georders=od.searchAllOrder( page,Constant.SIZE);
			int total=od.totalAllOrder();
			maxPage=total%Constant.SIZE==0?total/Constant.SIZE:total/Constant.SIZE+1;
			return "dingdan";
		}
		if(id==16&&productid==3){
			return "searchDing";
		}
		//订单
		if(id==13&&productid==4){
			SelectUserDao sud=new SelectUserDaoimpl();
			Users=sud.SelectUser(page, Constant.SIZE);
			maxPage=sud.SelectUsers();
			return "user";
		}
		if(id==17&&productid==4){
			return "usersearch";
		}
		if(id==14&&productid==4){
			return "addedd";
		}
		//yonghu
		return "success";
	}
}
