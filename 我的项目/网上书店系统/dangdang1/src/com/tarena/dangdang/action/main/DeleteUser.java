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
		//��ѯd_category �����������Ϣ ��parentId=1�Ĵ����ȡ����cats������������cats�д����gory
		
		
		UserDao.deleteUser(id);
		
		return "success";
	}
}
