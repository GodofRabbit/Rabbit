package com.shop.entity;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class NoteResult implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int state;
	private String message;
	private Object data;
	private Object obj;
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "NoteResult [state=" + state + ", message=" + message
				+ ", data=" + data + "]";
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
}
