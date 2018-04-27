package com.tarena.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManagement {
	public static String AUTO_LOGIN_COOKIE_NAME="autoDangDgang";
	public static Cookie getCookieByName(HttpServletRequest request,String name){
		Cookie[] cookies=request.getCookies();
		if(cookies==null){
			return null;
		}
		for(Cookie cookie:cookies){
			if(cookie.getName().equals(name)){
				return cookie;
			}
		}
		return null;
	} 
	public static Map<String,String>getAutoLoginMap(Cookie cookie){
		String value=cookie.getValue();
		String[] strs=value.split(":");
		Map<String,String> map=new HashMap<String,String>();
		map.put(strs[0], strs[1]);
		return map;
	}
	public static void deleteCookie(String path,String name,HttpServletResponse response){
		Cookie cookie=new Cookie(name,"");
		cookie.setMaxAge(0);
		cookie.setPath(path);
		response.addCookie(cookie);
	}

}
