package com.tarena.dao;

import java.util.List;

import com.tarena.entity.D_User;

public interface SelectUserDao {
	public List<D_User> SelectUser(int page,int size) throws Exception;
	public int SelectUsers() throws Exception;
	public List<D_User> SelectFindUser(String email,String alise) throws Exception; 
}
