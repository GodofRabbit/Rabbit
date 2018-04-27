package com.shop.serviceImp;

import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.UserDao;
import com.shop.entity.Goods;
import com.shop.entity.NoteResult;
import com.shop.entity.Order;
import com.shop.entity.ShopCart;
import com.shop.entity.User;
import com.shop.service.UserService;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserDao userDao;
	@Autowired
	NoteResult note;

	public User login(String account) {
		return userDao.findByAccount(account);
	}

	public void add(String realname, String phone, String username,
			String password) {
		userDao.add(realname, phone,username, password);
	}

	public void addRole(int user_id) {
		userDao.addRole(user_id);
	}

	public User checkPhone(String phone) {
		return userDao.checkPhone(phone);
	}

	public String searchRole(String username) {
		return userDao.searchRole(username);
	}

	public NoteResult BackAdminDisplay(int page,int role_id) {
		int currentPage = (page-1)*4;
		List<User> list = userDao.BackAdminDisplay(currentPage, role_id);
		note.setData(list);
		int i = userDao.allAdminNum(role_id);
		note.setState((i-1)/4+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	@Transactional
	public void delAdmin(int admin_id) {
		userDao.delAdmin_role(admin_id);//先删外键
		userDao.delAdmin(admin_id);//再删父表
	}

	public void addAdmin_role(int user_id, int role_id) {
		userDao.addAdmin_role(user_id,role_id);
	}

	public NoteResult searchUser(int page, String keywords,int role_id) {
		int currentPage = (page-1)*4;
		List<Goods> list = userDao.searchUser(currentPage,keywords,role_id);
		note.setData(list);
		int i = userDao.allSearchUserNum(keywords,role_id);
		note.setState((i-1)/4+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteResult BackOrderDisplay(int page) {
		int currentPage = (page-1)*4;
		List<Order> list = userDao.BackOrderDisplay(currentPage);
		note.setData(list);
		int i = userDao.allOrderNum();
		note.setState((i-1)/4+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteResult searchOrder(int page, String keywords) {
		int currentPage = (page-1)*4;
		List<Order> list = userDao.searchOrder(currentPage,keywords);
		note.setData(list);
		int i = userDao.allSearchOrderNum(keywords);
		note.setState((i-1)/4+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public List<ShopCart> orderDatail(int order_id) {
		return userDao.orderDatail(order_id);
	}

	public NoteResult checkOldPassword(String username, String oldPwd) {
		User user = userDao.findByAccount(username);
		String password = user.getPassword();
		String phone = user.getPhone();
		String hashAlgorithmName = "MD5";
		Object credentials = oldPwd;
		Object salt = ByteSource.Util.bytes(phone);
		int hashIterations = 1024;
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		if(password.equals(result)){
			note.setState(1);
		}else{
			note.setState(2);
		}
		return note;
	}

	public void changePwd(String username, String newPwd) {
		User user = userDao.findByAccount(username);
		String phone = user.getPhone();
		String hashAlgorithmName = "MD5";
		Object credentials = newPwd;
		Object salt = ByteSource.Util.bytes(phone);
		int hashIterations = 1024;
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		userDao.changePwd(result,user.getId());
	}

	public User checkInfo(String username, String phone) {
		return userDao.checkInfo(username,phone);
	}

	public NoteResult loadMyOrder(int user_id) {
		List<Order> order = userDao.loadMyOrder(user_id);
		note.setData(order);
		return note;
	}

	public NoteResult unlock(String username, String ulpwd) {
		User user = userDao.findByAccount(username);
		String fpwd = user.getPassword();
		String phone = user.getPhone();
		String hashAlgorithmName = "MD5";
		Object credentials = ulpwd;
		Object salt = ByteSource.Util.bytes(phone);
		int hashIterations = 1024;
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		if(fpwd.equals(result)){
			note.setState(1);//解锁密码正确，解屏
		}else{
			note.setState(0);//解锁密码错误
		}
		return note;
	}

	public void udos(int order_id, String state) {
		userDao.udos(order_id,state);
	}

}
