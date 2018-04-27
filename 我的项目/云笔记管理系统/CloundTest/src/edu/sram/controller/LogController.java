package edu.sram.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.service.UserService;

@Controller
public class LogController {
	@Autowired
	UserService userService;
	

	@RequestMapping("/toLogin.go")
	public String toLogin(){
		return "log_in";
	}
	
	@RequestMapping("/login.go")
	@ResponseBody
	public NoteMessage login(String username,String password) throws Exception{
		NoteMessage message = userService.checkLogin(username, password);
		return message;
	}
}
