package edu.sram.entity;

import java.util.Date;

public class Admin {
	private  int id;
	private  String managername;
	private  String managerpassword;
	private  String realname;
	private  String sex;
    private  int role;  //I.超级管理员 2.普通管理员
    private  Date jointime;
	public Admin() {
		
	}
	public Admin(int id, String managername, String managerpassword,
			String realname, String sex, int role, Date jointime) {
		super();
		this.id = id;
		this.managername = managername;
		this.managerpassword = managerpassword;
		this.realname = realname;
		this.sex = sex;
		this.role = role;
		this.jointime = jointime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public String getManagerpassword() {
		return managerpassword;
	}
	public void setManagerpassword(String managerpassword) {
		this.managerpassword = managerpassword;
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
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public Date getJointime() {
		return jointime;
	}
	public void setJointime(Date jointime) {
		this.jointime = jointime;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", managername=" + managername
				+ ", managerpassword=" + managerpassword + ", realname="
				+ realname + ", sex=" + sex + ", role=" + role + ", jointime="
				+ jointime + "]";
	}

}