package com.tarena.service;

import java.util.ArrayList;
import java.util.List;

import com.tarena.entity.Message;

public class Chat {
	public static int FIRST_GET_MESSAGE=0;
	public static int NOT_FIRST_GET_MESSAGE=1;
	private List<Message> msgs=new ArrayList<Message>();
	private static int MAX_AMOUNT_OF_MESSAGE=10;
	public synchronized void addMessage(Message message){
		System.out.println("msgs.size:"+msgs.size());
		if(msgs.size()<MAX_AMOUNT_OF_MESSAGE){
			msgs.add(message);
		}else{
			msgs.remove(0);
			msgs.add(message);
		}
	}
	public synchronized List<Message> getMessage(int mode){
		List<Message> msgList=new ArrayList<Message>();
		if(mode==NOT_FIRST_GET_MESSAGE){
			for(Message message:msgs){
				if(!message.isRead()){
					msgList.add(message);
					message.setRead(true);
				}
			}
			return msgList;
		}else{
			return msgs;
		}
	}
	
	

}
