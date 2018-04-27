package com.tarena.entity;

import java.io.Serializable;

public class Option implements Serializable{
	private String text;
	private String value;
	public Option(){}
	public Option(String text,String value){
		this.text=text;
		this.value=value;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
}
