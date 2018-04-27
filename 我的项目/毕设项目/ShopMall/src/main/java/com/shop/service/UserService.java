package com.shop.service;


import java.util.List;

import com.shop.entity.NoteResult;
import com.shop.entity.ShopCart;
import com.shop.entity.User;

public interface UserService {

	public User login(String account);
	
	public void add(String realname,String phone,String username,String password);

	public void addRole(int user_id);

	public User checkPhone(String phone);
	
	public String searchRole(String username);

	public NoteResult BackAdminDisplay(int page,int role_id);

	public void delAdmin(int admin_id);

	public void addAdmin_role(int user_id, int role_id);

	public NoteResult searchUser(int page, String keywords,int role_id);

	public NoteResult BackOrderDisplay(int page);

	public NoteResult searchOrder(int page, String keywords);

	public List<ShopCart> orderDatail(int order_id);

	public NoteResult checkOldPassword(String username,String oldPwd);

	public void changePwd(String username, String newPwd);

	public User checkInfo(String username, String phone);

	public NoteResult loadMyOrder(int user_id);

	public NoteResult unlock(String username, String ulpwd);

	public void udos(int order_id, String state);
	
}
