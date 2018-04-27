package com.tarena.entity;


public class Message {
	private String sender;
	private String receiver;
	private String text;
	private String sendTime;
	private boolean isRead;
	public Message(){}
	
	public Message(String sender, String receiver, String text, String sendTime,
			boolean isRead) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.text = text;
		this.sendTime = sendTime;
		this.isRead = isRead;
	}

	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public boolean isRead() {
		return isRead;
	}
	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	
	
	
}

