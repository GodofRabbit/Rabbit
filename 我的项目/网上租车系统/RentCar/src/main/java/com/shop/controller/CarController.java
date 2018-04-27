package com.shop.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.NoteResult;
import com.shop.service.CarService;

@Controller
public class CarController {
	@Autowired
	CarService carService;
	@RequestMapping(value="address.do")
	@ResponseBody	
	public NoteResult getAddress(String address,HttpServletRequest request) throws UnsupportedEncodingException{
		String str= new String(request.getParameter("address").getBytes("iso-8859-1"), "utf-8");
		return carService.listAddress(str);
	}
	
	
	@RequestMapping("search_car.do")
	@ResponseBody
	public NoteResult search(String[] type_conditions,String[] price_conditions,String[] title_conditions){	
		return carService.list(type_conditions, price_conditions, title_conditions);
		
	}
	
	
	@RequestMapping("findcar.do")
	@ResponseBody	
	public NoteResult findCar(int cid,int bid,int tid){
		System.out.println("controller");
		return carService.findCar(cid, bid, tid);
		
	}
	
	@RequestMapping("findsameprice.do")
	@ResponseBody	
	public NoteResult findSamePrice(double price,int id){
		System.out.println("controller");
		return carService.findPrice(price,id);
		
	}

}
