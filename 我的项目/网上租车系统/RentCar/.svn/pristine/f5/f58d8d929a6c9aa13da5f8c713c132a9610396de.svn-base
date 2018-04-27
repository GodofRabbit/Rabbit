package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.NoteResult;
import com.shop.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	
	@RequestMapping("/findorder.do")
	@ResponseBody
	public NoteResult findorder(int t_user_id){
		return orderService.t_order(t_user_id);
	}

}
