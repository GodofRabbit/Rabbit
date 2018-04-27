package edu.sram.dao;

import java.util.List;

import edu.sram.entity.Page;
import edu.sram.entity.User;

public interface UserDao {
	 public boolean toAddUser(User user ) throws Exception;
	 public boolean deleteUser(int id) throws Exception;
	 public boolean editUser(User user)throws Exception;
	 public List<User> findAll()throws Exception;
    
     public Page<User> findPage(int currentPage, int pageSize, User searchModel) throws Exception;
	public User findById(int id) throws Exception;
	
}
