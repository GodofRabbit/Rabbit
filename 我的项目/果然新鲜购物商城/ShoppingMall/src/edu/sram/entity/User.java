package edu.sram.entity;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class User {
	private  int id;
	private  String username;
	private  String password;
	private  String realname;
	private  String sex;
	private  Date  birthday;
	private  String  phone;
	private  Date  jointime;
	public User() {
	}
	public User(int id, String username, String password, String realname,
			String sex, Date birthday, String phone, Date jointime) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.sex = sex;
		this.birthday = birthday;
		this.phone = phone;
		this.jointime = jointime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJointime() {
		return jointime;
	}
	public void setJointime(Date jointime) {
		this.jointime = jointime;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", realname=" + realname + ", sex=" + sex
				+ ", birthday=" + birthday + ", phone=" + phone + ", jointime="
				+ jointime + "]";
	}
	
	
}
