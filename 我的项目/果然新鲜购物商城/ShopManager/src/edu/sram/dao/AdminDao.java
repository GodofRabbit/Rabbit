package edu.sram.dao;

import java.util.List;

import edu.sram.entity.Admin;
import edu.sram.entity.Page;

public interface AdminDao {
	 public boolean toAddAdmin(Admin admin) throws Exception;
	 public boolean deleteAdmin(int id) throws Exception;
	 public boolean editAdmin(Admin admin)throws Exception;
	 public List<Admin> findAll()throws Exception;
	 public Admin findAdmin(Admin admin) throws Exception;
   
    public Page<Admin> findPage(Integer currentPage, int pageSize, Admin searchModel) throws Exception;
	public Admin findById(int id) throws Exception;
	
}
