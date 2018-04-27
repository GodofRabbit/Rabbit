package edu.sram.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.entity.User;
import edu.sram.service.UserService;
import edu.sram.util.NoteUtil;

@Controller
public class RegisterController {
	@Autowired
	UserService userService;
	
	@RequestMapping("/regist.go")
	@ResponseBody
	public NoteMessage checkName(String username,String password,String nickname) throws Exception{
		NoteMessage message = userService.saveUser(username,password,nickname);
		return message;
	}
	
	
	@RequestMapping("/checkPassword.go")
	@ResponseBody
	public NoteMessage checkPassword(String uid,String oldpassword) throws NoSuchAlgorithmException{
		NoteMessage message = new NoteMessage();
		User user = userService.checkPassword(uid);
		if(user.getCn_user_password().equals(NoteUtil.md5(oldpassword))){
			message.setMessage("<font color='green'>原密码正确</font>");
		}else{
			message.setMessage("原密码错误");
		}
		return message;
	}
	
	
	@RequestMapping("/changePassword.go")
	@ResponseBody
	public NoteMessage changePassword(String uid,String newPassword) throws NoSuchAlgorithmException{
		NoteMessage message = new NoteMessage();
		userService.changePassword(uid,newPassword);
		message.setMessage("密码修改成功，请重新登录");
		return message;
	}

}
