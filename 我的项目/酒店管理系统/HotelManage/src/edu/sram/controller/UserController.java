package edu.sram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("addUserRecord.do")
	@ResponseBody
	public NoteMessage addUserRecord(String userName,String personID,String phone,String userSex,String roomNum,String inTime,String dayNum,String outTime,String userRole,String charge,String consume,String remark) throws Exception{
		    NoteMessage message = userService.addUserRecord(userName,personID,phone,userSex,roomNum,inTime,dayNum,outTime,userRole,charge,consume,remark);
			return message;
		 }
	
	@RequestMapping("selectUser.do")
	@ResponseBody
	public NoteMessage selectUser(String user_name,String user_id,String personID,String user_phone,int page){
		    NoteMessage message = userService.selectUser(user_name,user_id,personID,user_phone,page);
			return message;
		 }
	
	@RequestMapping("userLiveDetail.do")
	@ResponseBody
	public NoteMessage userLiveDetail(String personID,int page){
		    NoteMessage message = userService.userLiveDetail(personID,page);
			return message;
		 }
	
	
	@RequestMapping("quitHomeSelect.do")
	@ResponseBody
	public NoteMessage quitHomeSelect(String room_number){
		    NoteMessage message = userService.quitHomeSelect(room_number);
			return message;
		 }
	
	
}
