package com.tarena.service;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tarena.dao.UserDao;
import com.tarena.entity.UserInfo;

public class AutoLoginFilter implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		UserInfo user=(UserInfo)request.getSession().getAttribute("user");
		if(user==null){
			Cookie cookie=CookieManagement.getCookieByName(request,
					CookieManagement.AUTO_LOGIN_COOKIE_NAME);
			if (cookie!=null){
				UserService service=new UserServiceImpel();
				try {
					service.autoLogin(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
