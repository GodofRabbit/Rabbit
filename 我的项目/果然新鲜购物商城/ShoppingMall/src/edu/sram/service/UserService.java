package edu.sram.service;


import edu.sram.entity.Page;
import edu.sram.entity.User;
public interface UserService {
	 public boolean toAddUser(User user ) throws Exception;
	 public boolean editUser(User user)throws Exception;
    
     public Page<User> findPage(int currentPage, int pageSize, User searchModel) throws Exception;
	 public User findUser(User user) throws Exception;
	 public boolean findByName(User user) throws Exception;
} 
