package edu.sram.service;

import java.util.List;

import edu.sram.entity.Admin;
import edu.sram.entity.Page;

public interface AdminService {
	 public boolean toAddAdmin(Admin admin) throws Exception;
	 public boolean deleteAdmin(int id) throws Exception;
	 public boolean editAdmin(Admin admin)throws Exception;
	 public List<Admin> findAll()throws Exception;
	 public Admin findAdmin(Admin admin) throws Exception;
	 public Admin findById(int id) throws Exception;
	 
   public Page<Admin> findPage(Integer currentPage, int pageSize, Admin searchModel) throws Exception;

}
