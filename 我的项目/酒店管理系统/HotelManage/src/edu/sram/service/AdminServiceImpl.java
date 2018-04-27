package edu.sram.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sram.dao.AdminDao;
import edu.sram.entity.Admin;
import edu.sram.entity.NoteMessage;
import edu.sram.util.NoteUtil;

@Service
public class AdminServiceImpl implements AdminService{
	private NoteMessage note = new NoteMessage();
	@Autowired
	private AdminDao adminDao;

	public NoteMessage checkAdmin(String adminName, String adminPassword) throws Exception {
        Admin admin = adminDao.findByName(adminName);
		if(admin==null){
			note.setState(0);//0表示用户不存在
			note.setMessage("账号不存在");
		}else if(!admin.getAdmin_password().equals(NoteUtil.md5(adminPassword))){
			note.setState(1);
			note.setMessage("密码错误");
		}else{
			note.setState(2);
			note.setData(admin.getAdmin_id());
			note.setMessage(admin.getAdmin_reallyName());
		}
		return note;
	}
	
	
	public NoteMessage changePassword(int aid, String old_psw, String new_psw) throws Exception {
		Admin has = adminDao.findById(aid);
		if(!has.getAdmin_password().equals(NoteUtil.md5(old_psw))){
			note.setState(0);
			note.setMessage("原密码错误");
			return note;
		}else {
			Admin admin = new Admin();
			admin.setAdmin_id(aid);
			admin.setAdmin_password(NoteUtil.md5(new_psw));
			adminDao.changePassword(admin);
			note.setState(1);
			note.setMessage("密码修改成功");
			return note;
		}
	}


	public NoteMessage checkOldPsw(int aid, String oldpassword) throws Exception {
		Admin admin = adminDao.findById(aid);
		if(admin!=null&&admin.getAdmin_password().equals(NoteUtil.md5(oldpassword))){
			note.setState(1);
		}else if(oldpassword==""){
			note.setState(2);
		}else{
			note.setState(0);
		}
		return note;
	}


	public NoteMessage dispalyMenu(String admin_id) {
		List<String> list2 = adminDao.dispalyMenu(admin_id);
		note.setData(list2);
		//根据管理员id去查角色id,如果id=3代表是总经理登录，才去计算营业额
		int role_id = adminDao.selectRole(admin_id);
		if(role_id==3){
		String todayIncome = adminDao.todayIncome();
		String weekIncome = adminDao.weekIncome();
		String monthIncome = adminDao.monthIncome();
		String allIncome = adminDao.allIncome();
		List<String> list1 = new ArrayList<String>();
		if(todayIncome==null){
			list1.add("0");
		}else{
		list1.add(todayIncome);
		}
		if(weekIncome==null){
			list1.add("0");
		}else{
		list1.add(weekIncome);
		}
		if(monthIncome==null){
			list1.add("0");
		}else{
		list1.add(monthIncome);
		}
		if(allIncome==null){
			list1.add("0");
		}else{
		list1.add(allIncome);
		}
		note.setList(list1);
		}
		
		return note;
	}
	
	
	public NoteMessage deblocking(int aid, String psw) throws Exception {
		Admin admin = new Admin();
		admin.setAdmin_id(aid);
		admin.setAdmin_password(NoteUtil.md5(psw));
		Admin has = adminDao.findByIdAndPsw(admin);
		if(has == null){
			note.setState(0);
			note.setMessage("密码错误");
		} else {
			note.setState(1);
		}
		return note;
	}


	public void updateImg(String fileName,String admin_id) {
		adminDao.updateImg(fileName,admin_id);
	}


	public NoteMessage dispalyImg(String admin_id) {
		String image_name = adminDao.dispalyImg(admin_id);
		note.setData(image_name);
		return note;
	}

}
