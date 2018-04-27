package com.tarena.dangdang.action.chart;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.tarena.dangdang.action.user.BaseAction;
import com.tarena.entity.Message;
import com.tarena.service.Chat;
import com.tarena.util.ChatManagement;

public class GetMessageAction extends BaseAction{
	private int mode=1;
	private List<Message>msgs;
	public String execute(){
		Chat chat=ChatManagement.getChat(httpRequest.getSession(),
				ServletActionContext.getServletContext());
		if(chat==null){
			return "success";
		}
		msgs=chat.getMessage(mode);
		return "success";
	}
	public int getMode() {
		return mode;
	}
	public void setMode(int mode) {
		this.mode = mode;
	}
	public List<Message> getMsgs() {
		return msgs;
	}
	public void setMsgs(List<Message> msgs) {
		this.msgs = msgs;
	}
	

}
