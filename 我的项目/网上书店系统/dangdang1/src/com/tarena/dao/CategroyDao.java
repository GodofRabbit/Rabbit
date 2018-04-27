package com.tarena.dao;

import java.util.List;


import com.tarena.entity.Category;

public interface CategroyDao {
	public List<Category> findBook() throws Exception;
	public List<Category> findparent(int pid)throws Exception;
	public String findStringBook(int pid)throws Exception;
	public void insertIX(int id, int xuanze) throws Exception;
}
