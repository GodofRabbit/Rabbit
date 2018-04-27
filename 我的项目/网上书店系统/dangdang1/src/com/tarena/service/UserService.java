package com.tarena.service;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tarena.entity.D_User;
import com.tarena.entity.User;
import com.tarena.entity.UserInfo;

public interface UserService {
	public void register(User user,HttpServletRequest request)throws Exception;
	public void loginIn(String email, Map<String,Object> session)throws Exception;
	public UserInfo loginIn(int id, Map<String,Object> session)throws Exception;
	public void autoLogin(HttpServletRequest request,HttpServletResponse response)throws Exception;
	public Boolean isGuan(String email) throws Exception;
	
	
	public void register(D_User u)throws Exception;
	public void addUser(D_User u)throws Exception;
	
	public void updateU(D_User u) throws Exception;
}
