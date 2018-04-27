package com.tarena.dangdang.action.chart;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.entity.Message;
import com.tarena.entity.UserInfo;
import com.tarena.service.Chat;
import com.tarena.util.ChatManagement;

public class SendMessageAction extends BaseAction{
	private String text;
	private int id;
	private boolean ok;
	public String execute(){
		
		Chat chat=ChatManagement.getChatById(id,ServletActionContext.getServletContext());
		
		if(chat==null){
			ok=false;
			return "success";
		}
		UserInfo user=(UserInfo)session.get("user");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Message message=new Message(user.getId()+"", id+"", text,sdf.format(new Date()), false);
		chat.addMessage(message);
		ok=true;
		return "success";
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isOk() {
		return ok;
	}
	public void setOk(boolean ok) {
		this.ok = ok;
	}
	
}
