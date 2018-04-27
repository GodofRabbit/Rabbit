package edu.sram.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import edu.sram.dto.ShopCart;
import edu.sram.dto.UserCart;
import edu.sram.entity.User;
import edu.sram.service.ShopCartServiceImpl;
@Controller
public class ShopCartServlet {
	
	 @Autowired
	 ShopCartServiceImpl shopCartService;
	 @Autowired
	 UserCart userCart;
	@RequestMapping("addShopCart.go")
	protected void addShopCart(String sid,String num,String user_id,HttpServletRequest request)  throws ServletException, IOException{
		userCart.setUser_id(Integer.parseInt(user_id));
		userCart.setNum(Integer.parseInt(num));
		userCart.setSid(Integer.parseInt(sid));
		try {
			shopCartService.toAdd(userCart);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("userCartList.go")
	protected String userCartList(String user_id,HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		userCart.setUser_id(Integer.parseInt(user_id));
		List<ShopCart> shopList=null;
		try {
			 shopList = shopCartService.shopList(userCart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("shopList", shopList);
		return "cart";
	}

	@RequestMapping("delShop.go")
	protected void delShop(String gid,HttpServletRequest request,HttpServletResponse response)  throws ServletException, IOException{
		boolean b = false;
		String s = null;
		try {
			b = shopCartService.delShop(Integer.parseInt(gid));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		s= b?"移除成功":"移除失败";
		request.setAttribute("s",s);
		User user = (User)request.getSession().getAttribute("findUser");
		int id = user.getId();
		request.getRequestDispatcher("/carList.go?user_id="+id).forward(request, response);
	}
	@RequestMapping("balance.go")
	protected String balance(String user_id,HttpServletRequest request)  throws ServletException, IOException{
		boolean b = false;
		String information = null;
		try {
			b = shopCartService.addOrder(Integer.parseInt(user_id));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		information=b?"下单成功":"下单失败";
		request.setAttribute("information", information);
		return "cart";
	}
}
