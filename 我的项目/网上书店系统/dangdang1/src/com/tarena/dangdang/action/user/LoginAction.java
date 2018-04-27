package com.tarena.dangdang.action.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.tarena.dao.UserDao;
import com.tarena.entity.User;
import com.tarena.entity.UserInfo;
import com.tarena.service.CookieManagement;
import com.tarena.service.UserService;
import com.tarena.service.UserServiceImpel;
import com.tarena.util.MD5Util;

public class LoginAction extends BaseAction{
	private String from;
	private UserInfo user;
	private String email;
	private String password;
	private String autoLogin;
	private boolean result;
	public String execute() throws Exception{
		password=MD5Util.encrypt(password);
		if(UserDao.userLogin(email, password)){
			
			result=true;
		}else{
			result=false;
		}
		return "success";
	}
	public String login() throws Exception{
		if(!UserDao.isUnlock(email)){
			user=UserDao.getLoginedUserByEmail(email);
			return "toUnlock";
		}
		
		UserService service=new UserServiceImpel();
		service.loginIn(email, session);
		if("yes".equals(autoLogin)){
			String value=email+":"+MD5Util.encrypt(password);
			Cookie cookie=new Cookie(CookieManagement.AUTO_LOGIN_COOKIE_NAME,value);
			cookie.setPath("/dangdang");
			cookie.setMaxAge(60*60*24*30);
			HttpServletResponse response=ServletActionContext.getResponse();
			response.addCookie(cookie);
		}
		if("comment".equals(from)){
			return "comment";
		}
		if("cart".equals(from)){
			return "another";
		}else{
			Boolean ba=service.isGuan(email);
			if(ba){
				return "guanli";
			}
			return "success";
		}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(String autoLogin) {
		this.autoLogin = autoLogin;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	
	
}
