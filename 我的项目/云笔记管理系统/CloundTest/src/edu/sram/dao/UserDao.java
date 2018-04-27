package edu.sram.dao;

import edu.sram.entity.User;

public interface UserDao {

	public User findByName(String name);
	public void addUser(User user);
	public User checkPassword(String uid);
	public void changePassword(String uid, String md5);
}
