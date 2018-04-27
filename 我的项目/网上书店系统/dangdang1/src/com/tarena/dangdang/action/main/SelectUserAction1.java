package com.tarena.dangdang.action.main;

import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.SelectUserDao;
import com.tarena.dao.impl.SelectUserDaoimpl;
import com.tarena.entity.D_User;
import com.tarena.util.Constant;

public class SelectUserAction1 {
	
		private List<D_User> Users=new ArrayList<D_User>();
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
		public String execute() throws Exception{
			SelectUserDao sud=new SelectUserDaoimpl();
			Users=sud.SelectUser(page, Constant.SIZE);
			
			maxPage=sud.SelectUsers();
			
			return "success";
		}
		}



