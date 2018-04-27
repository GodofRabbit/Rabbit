package edu.sram.dao;

import java.util.List;

import edu.sram.entity.Admin;

public interface AdminDao {

	public Admin findByName(String adminName);
	
	public void changePassword(Admin admin);

	public Admin findById(int aid);

	public Admin findByIdAndPsw(Admin admin);

	public String todayIncome();

	public String weekIncome();

	public String monthIncome();

	public String allIncome();

	public List<String> dispalyMenu(String admin_id);

	public int selectRole(String admin_id);

	public void updateImg(String fileName,String admin_id);

	public String dispalyImg(String admin_id);

}
