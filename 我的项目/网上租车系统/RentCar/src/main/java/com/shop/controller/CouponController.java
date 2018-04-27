package com.shop.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.dao.UserInformationDao;
import com.shop.entity.Coupon;
import com.shop.entity.NoteResult;
import com.shop.entity.User;
import com.shop.service.CouponService;

@Controller
public class CouponController {

	@Autowired
	CouponService couponService;
	@Autowired
	UserInformationDao userInformationDao;
	
	NoteResult result = new NoteResult();
	@RequestMapping("CouponFindAll.do")
	@ResponseBody
	public NoteResult findAll(HttpServletRequest request){
		String user_id = request.getParameter("user_id");
		if(user_id!=null&&user_id!=""){
			User user = userInformationDao.findOneById(Integer.parseInt(user_id));
			request.getSession().setAttribute("user",user);
		}
		List<Coupon> list = couponService.findAll();
		result.setData(list);
		return result;
	}
	
	@RequestMapping("couponDetails.do")
	public String couponDetails(HttpServletRequest request){
		 int id = Integer.parseInt(request.getParameter("cid"));
		 Coupon coupon = couponService.findCouponById(id);
		 request.setAttribute("coupon", coupon);
		 return "frontpage/couponDetails";
	}
	
}
