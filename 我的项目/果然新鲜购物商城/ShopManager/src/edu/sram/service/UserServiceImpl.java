package edu.sram.service;

import java.util.List;

import edu.sram.dao.UserDao;
import edu.sram.dao.UserDaoImpl;
import edu.sram.entity.Admin;
import edu.sram.entity.Page;
import edu.sram.entity.User;

public class UserServiceImpl implements UserService{
	private UserDao userDao = new UserDaoImpl();

	public boolean toAddUser(User user) throws Exception {
		return userDao.toAddUser(user);
	}

	public boolean deleteUser(int id) throws Exception {
		return userDao.deleteUser(id);
	}

	public boolean editUser(User user) throws Exception {
		return userDao.editUser(user);
	}

	public List<User> findAll() throws Exception {
		return userDao.findAll();
	}

	public Page<User> findPage(int currentPage, int pageSize,
			User searchModel) throws Exception {
		
		return userDao.findPage(currentPage, pageSize, searchModel);
	}

	public User findById(int id) throws Exception {
		return userDao.findById(id);
	}


}
