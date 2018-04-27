package com.shop.dao;

import com.shop.entity.User;

public interface UserDao {

	public User findByAccount(String account);

	public void add(String username, String password, String phone);

}
