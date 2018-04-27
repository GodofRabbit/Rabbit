package com.tarena.dangdang.action.main;

import java.util.List;

import com.tarena.dao.UserDao;


public class DeleteUser {
	 private int id;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String execute() throws Exception{
		//查询d_category 表所有类别信息 将parentId=1的大类别取出给cats将其他子类别该cats中大类别gory
		
		
		UserDao.deleteUser(id);
		
		return "success";
	}
}
