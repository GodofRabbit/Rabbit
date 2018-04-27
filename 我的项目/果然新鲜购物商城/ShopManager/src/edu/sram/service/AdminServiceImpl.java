package edu.sram.service;

import java.util.List;

import edu.sram.dao.AdminDao;
import edu.sram.dao.AdminDaoImpl;
import edu.sram.entity.Admin;
import edu.sram.entity.Page;

public class AdminServiceImpl implements AdminService{
	private AdminDao adminDao = new AdminDaoImpl();

	public boolean toAddAdmin(Admin admin) throws Exception {
		return adminDao.toAddAdmin(admin);
	}

	public boolean deleteAdmin(int id) throws Exception {
		return adminDao.deleteAdmin(id);
	}

	public boolean editAdmin(Admin admin) throws Exception {
		return adminDao.editAdmin(admin);
	}

	public List<Admin> findAll() throws Exception {
		return adminDao.findAll();
	}
	
	public Admin findAdmin(Admin admin) throws Exception {
		return adminDao.findAdmin(admin);
	}

	public Page<Admin> findPage(Integer currentPage, int pageSize,
			Admin searchModel) throws Exception {
		return adminDao.findPage(currentPage, pageSize, searchModel);
	}

	public Admin findById(int id) throws Exception {
		return adminDao.findById(id);
	}

}
