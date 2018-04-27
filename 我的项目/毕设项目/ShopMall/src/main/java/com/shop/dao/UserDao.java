package com.shop.dao;

import java.util.List;

import com.shop.entity.Goods;
import com.shop.entity.Order;
import com.shop.entity.ShopCart;
import com.shop.entity.User;

public interface UserDao {

	public User findByAccount(String account);

	public void add(String realname, String phone,String username, String password);

	public void addRole(int user_id);

	public User checkPhone(String phone);

	public String searchRole(String username);

	public List<User> BackAdminDisplay(int page,int role_id);

	public int allAdminNum(int role_id);

	public void delAdmin_role(int admin_id);

	public void delAdmin(int admin_id);

	public void addAdmin_role(int user_id, int role_id);

	public List<Goods> searchUser(int currentPage, String keywords, int role_id);

	public int allSearchUserNum(String keywords, int role_id);

	public List<Order> BackOrderDisplay(int currentPage);

	public int allOrderNum();

	public List<Order> searchOrder(int currentPage, String keywords);

	public int allSearchOrderNum(String keywords);

	public List<ShopCart> orderDatail(int order_id);

	public void changePwd(String result, int user_id);

	public User checkInfo(String username, String phone);

	public List<Order> loadMyOrder(int user_id);

	public void udos(int order_id, String state);

}
