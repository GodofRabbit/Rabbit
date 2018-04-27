package edu.sram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.service.UserInfoService;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/addUserInfo.do")
	@ResponseBody
	public NoteMessage addUserInfo(String name,String sex,String phone, String type,String idcard){
		return userInfoService.addUserInfo(name,sex,phone,type,idcard);
	}
	
	@RequestMapping("/updateUserInfoType.do")
	@ResponseBody
	public NoteMessage updateUserInfoType(String name,String type,String idcard){
		return userInfoService.updateUserInfoType(name,type,idcard);
	}
	
	@RequestMapping("/checkUserInfo.do")
	@ResponseBody
	public NoteMessage checkUserInfo(String idcard){
		return userInfoService.checkUserInfo(idcard);
	}
	
	
	@RequestMapping("/updateUserInfo.do")
	@ResponseBody
	public NoteMessage updateUserInfo(String name,String phone,String idcard){
		return userInfoService.updateUserInfo(name, phone, idcard);
	}
	
	
	@RequestMapping("userLiveInfo.do")
	@ResponseBody
	public NoteMessage addUserRecord(String page){
		    NoteMessage message = userInfoService.userLiveInfo(page);
			return message;
	}
	
	@RequestMapping("userInfo.do")
	@ResponseBody
	public NoteMessage userInfo(String page){
		NoteMessage message = userInfoService.userInfo(page);
		return message;
	}
}
