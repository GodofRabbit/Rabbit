package edu.sram.service;

import org.springframework.stereotype.Service;

import edu.sram.dao.UserDao;
import edu.sram.dao.UserDaoImpl;
import edu.sram.entity.Page;
import edu.sram.entity.User;
@Service
public class UserServiceImpl implements UserService{
	private UserDao userDao = new UserDaoImpl();

	public boolean toAddUser(User user) throws Exception {
		return userDao.toAddUser(user);
	}

	public boolean editUser(User user) throws Exception {
		return userDao.editUser(user);
	}

	public Page<User> findPage(int currentPage, int pageSize,
			User searchModel) throws Exception {
		
		return userDao.findPage(currentPage, pageSize, searchModel);
	}

	@Override
	public User findUser(User user) throws Exception {
		return userDao.findUser(user);
	}

	@Override
	public boolean findByName(User user) throws Exception {
		return userDao.findByName(user) ;
	}

}
