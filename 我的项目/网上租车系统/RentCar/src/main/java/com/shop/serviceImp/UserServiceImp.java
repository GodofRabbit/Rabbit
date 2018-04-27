package com.shop.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.UserDao;
import com.shop.entity.User;
import com.shop.service.UserService;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserDao userDao;

	public User login(String account) {
		return userDao.findByAccount(account);
	}

	public void add(String username, String password, String phone) {
	    userDao.add(username, password, phone);
	}

}
