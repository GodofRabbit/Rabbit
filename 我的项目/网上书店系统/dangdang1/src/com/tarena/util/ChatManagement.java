package com.tarena.util;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.tarena.entity.UserInfo;
import com.tarena.service.Chat;


public class ChatManagement {
	public static Chat getChat(HttpSession session,
			ServletContext application){
		Chat chat=null;
		if(session.getAttribute("user")==null){
			return null;
		}
		String id=((UserInfo)session.getAttribute("user")).getId()+"";
		if(application.getAttribute(id)==null){
			chat=new Chat();
			session.setAttribute("chat", chat);
			application.setAttribute(id,session);
			return chat;
		}else{
		HttpSession	midle=(HttpSession)application.getAttribute(((UserInfo)session.getAttribute("user"))
				.getId()+"");
		return (Chat)midle.getAttribute("chat");
		}
	}
	public static Chat getChatById(int id,
			ServletContext application){
		HttpSession session=(HttpSession)application.getAttribute(id+"");
		if(session==null){
			return null;	
		}
		
		return (Chat)session.getAttribute("chat");
		
	}
	
}
