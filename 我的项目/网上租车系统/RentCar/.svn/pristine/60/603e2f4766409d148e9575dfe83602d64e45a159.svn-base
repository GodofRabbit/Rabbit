package com.shop.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.entity.NoteResult;
import com.shop.entity.User;
import com.shop.service.UserCouponService;

@Controller
public class UserCouponController {

	@Autowired
	UserCouponService userCouponService;
	
	NoteResult result = new NoteResult();
	@RequestMapping("addUserCoupon.do")
	@ResponseBody
	public NoteResult addUserCoupon(int cid,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if(user == null){
			result.setState(1);//状态为1 用户没有登录
			result.setMessage("请先登录！！");
		}else{
			result = userCouponService.addUserCoupon(user.getId(),cid);
		}
		return result;
		
	}
	
	@RequestMapping("findUserCouponByUid.do")
	@ResponseBody
	public NoteResult findUserCouponByUid(int uid) throws ParseException{
		return userCouponService.findUserCouponByUid(uid);
	}
}
