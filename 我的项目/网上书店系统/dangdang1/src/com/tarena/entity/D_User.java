package com.tarena.entity;

import java.io.Serializable;

public class D_User implements Serializable{
	private int id;
	private String email;
	private String nickname;//�ǳ�
	private String password;
	private int user_integral;//�û��ȼ�
	private String is_email_verify;//�����Ƿ�ͨ����֤
	private String email_verify_code;//������֤��
	private long last_login_time;//���һ�ε�½ʱ��
	private String last_login_ip;//���һ�ε�½��ַ
	private String nickName;
	
	public String getNickName() {
		return nickname;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUser_integral() {
		return user_integral;
	}
	public void setUser_integral(int userIntegral) {
		user_integral = userIntegral;
	}
	public String getIs_email_verify() {
		return is_email_verify;
	}
	public void setIs_email_verify(String isEmailVerify) {
		is_email_verify = isEmailVerify;
	}
	public String getEmail_verify_code() {
		return email_verify_code;
	}
	public void setEmail_verify_code(String emailVerifyCode) {
		email_verify_code = emailVerifyCode;
	}
	public long getLast_login_time() {
		return last_login_time;
	}
	public void setLast_login_time(long lastLoginTime) {
		last_login_time = lastLoginTime;
	}
	public String getLast_login_ip() {
		return last_login_ip;
	}
	public void setLast_login_ip(String lastLoginIp) {
		last_login_ip = lastLoginIp;
	}
	public D_User(){
		
	}
}
