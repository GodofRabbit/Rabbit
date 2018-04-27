package edu.sram.service;


import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sram.dao.UserDao;
import edu.sram.entity.NoteMessage;
import edu.sram.entity.User;
import edu.sram.util.NoteUtil;
@Service
public class UserServiceImp implements UserService{
   @Autowired
   private UserDao userDao;
   private NoteMessage note = new NoteMessage();
	
	public NoteMessage checkLogin(String name,String psw) throws Exception {
		User user = userDao.findByName(name);
		
		if(user==null){
			note.setState(0);//0表示用户不存在
			note.setMessage("用户不存在");
		}else if(!user.getCn_user_password().equals(NoteUtil.md5(psw))){
			note.setState(1);
			note.setMessage("密码错误");
		}else{
			note.setState(2);
			note.setObj(user.getCn_user_id());
			note.setMessage("登录成功");
		}
		return note;
	}

	public NoteMessage saveUser(String username, String password,
			String nickname) throws Exception {
		User has_user = userDao.findByName(username);
		if(has_user!=null){
			note.setState(1);
			note.setMessage("用户名已存在");
		}else{
			
			User user=new User();
			String uuid = NoteUtil.UUID();
			user.setCn_user_id(uuid);
			user.setCn_user_name(username);
			user.setCn_user_password(NoteUtil.md5(password));
			user.setCn_user_desc(nickname);
			
			userDao.addUser(user);
			
			note.setState(0);
			note.setMessage("注册成功");
		}
		return note;
	}

	public User checkPassword(String uid) {
		return userDao.checkPassword(uid);
	}

	public void changePassword(String uid, String newPassword) throws NoSuchAlgorithmException {
		userDao.changePassword(uid,NoteUtil.md5(newPassword));
	}

	
}
