package com.tarena.service;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.security.krb5.internal.UDPClient;

import com.tarena.entity.D_User;
import com.tarena.util.Constant;

import com.tarena.dao.UserDao;
import com.tarena.entity.User;
import com.tarena.entity.UserInfo;
import com.tarena.util.DegistUtil;
import com.tarena.util.EmailUtil;
import com.tarena.util.MD5Util;
import com.tarena.util.VerifyUtil;

public class UserServiceImpel implements UserService {

	public void register(User user,HttpServletRequest request) throws Exception {
		user.setLastLoginTime(new Date().getTime());
		user.setPassword(MD5Util.encrypt(user.getPassword()));
		user.setIsEmailVerify("N");
		user.setUserIntegral(0);
		user.setEmailVeryCode(VerifyUtil.createUUID());
		user.setLastLoginIp(request.getRemoteAddr());//得到对方IP地址
		UserDao.addUser(user);
		String code=user.getEmailVeryCode()+"-"+user.getId();
		EmailUtil.sendEmail(user.getEmail(), code);
	}

	public UserInfo loginIn(int id,Map<String,Object> session)
			throws Exception {
		UserInfo user=UserDao.getLoginedUser(id);
		session.put("user",user);
		return user;
	}

	public void loginIn(String email, Map<String, Object> session)
			throws Exception {
		UserInfo user=UserDao.getLoginedUserByEmail(email);
		session.put("user",user);
	}
	public void autoLogin(HttpServletRequest request,HttpServletResponse response)throws Exception {
		Cookie cookie=CookieManagement.getCookieByName(request, CookieManagement.AUTO_LOGIN_COOKIE_NAME);
		String value=cookie.getValue();
		String[] strs=value.split(":");
		String email=strs[0];
		String password=strs[1];
		if(UserDao.userLogin(email, password)){
 			UserInfo user=UserDao.getLoginedUserByEmail(email);
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
		}else{
			CookieManagement.deleteCookie("/dangdang",CookieManagement.AUTO_LOGIN_COOKIE_NAME, response);
		}
	}

	public Boolean isGuan(String email) throws Exception {
		// TODO Auto-generated method stub
		Boolean t=UserDao.isGuan(email);
		return t;
	}
	public void register(D_User user) throws Exception {
		//生成一个验证码
		String uuid=VerifyUtil.createUUID();
		//将密码加密
		String pwd=DegistUtil.md5Digest(user.getPassword());
		user.setPassword(pwd);
		user.setUser_integral(Constant.NORMAL);
		user.setIs_email_verify("N");
		user.setEmail_verify_code(uuid);
		user.setLast_login_time(System.currentTimeMillis());
	
		UserDao.addUser(user);
		String code=uuid+"-"+user.getId();//这个是email的验证码
		EmailUtil.sendEmail(user.getEmail(), code);
	//生成
	}

	public void addUser(D_User user) throws Exception {
		// TODO Auto-generated method stub
		String uuid=VerifyUtil.createUUID();
		String code=uuid+"-"+user.getId();
		String pwd=DegistUtil.md5Digest(user.getPassword());
		user.setPassword(pwd);
		user.setUser_integral(Constant.NORMAL);
		user.setIs_email_verify("Y");
		user.setEmail_verify_code(code);
		user.setLast_login_time(System.currentTimeMillis());
		
		UserDao.addUser(user);
	}

	public void updateU(D_User user) throws Exception {
		// TODO Auto-generated method stub
		String pwd=DegistUtil.md5Digest(user.getPassword());
		user.setPassword(pwd);
		
		UserDao.updateUser(user);
	}
	
}
