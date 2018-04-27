package edu.sram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;

	@RequestMapping("toLogin.do")
	public String toLogin(){
		return "OPLogin";
	}
	
	@RequestMapping("checkAdmin.do")
	@ResponseBody
	public NoteMessage checkAdmin(String adminName,String adminPassword) throws Exception{
		    NoteMessage message = adminService.checkAdmin(adminName, adminPassword);
			return message;
		 }
	
	@RequestMapping("changePassword.do")
	@ResponseBody
	public NoteMessage changePassword(int aid,String old_psw,String new_psw) throws Exception{
		return adminService.changePassword(aid,old_psw,new_psw);
	}
	
	@RequestMapping("checkOldPsw.do")
	@ResponseBody
	public NoteMessage checkOldPsw(int aid,String oldpassword) throws Exception{
		return adminService.checkOldPsw(aid,oldpassword);
	}
	
	@RequestMapping("dispalyMenu.do")
	@ResponseBody
	public NoteMessage dispalyMenu(String admin_id) throws Exception{
		return adminService.dispalyMenu(admin_id);
	}
	
	
	@RequestMapping("deblocking.do")
	@ResponseBody
	public NoteMessage deblocking(int aid,String psw) throws Exception{
		return adminService.deblocking(aid,psw);
	}
	
	@RequestMapping("dispalyImg.do")
	@ResponseBody
	public NoteMessage dispalyImg(String admin_id) throws Exception{
		return adminService.dispalyImg(admin_id);
	}

}
