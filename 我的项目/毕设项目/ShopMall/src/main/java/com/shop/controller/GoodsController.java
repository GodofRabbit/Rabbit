package com.shop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.Goods;
import com.shop.entity.NoteResult;
import com.shop.entity.User;
import com.shop.service.GoodsService;
import com.shop.service.UserService;


@Controller
public class GoodsController {
	
	ModelAndView model=new ModelAndView();
	
	@Autowired
	GoodsService goodsService;
	@Autowired
	UserService userService;
	@Autowired
	Goods goods;
	@Autowired
	NoteResult note;

	//前台首页果园推荐
	@RequestMapping(value="recommand.do")
	@ResponseBody	
	public NoteResult recommand(String username) {
		return goodsService.recommand(username);
	}
	
	//前台首页显示更多
	@RequestMapping("showmore.do")
	@ResponseBody	
	public List<Goods> showmore(int page) {
		return goodsService.showmore(page);
	}
	
	//前台首页加载详情页，展示单个商品
	@RequestMapping("findOne.do")
	public ModelAndView findOne(int goods_id) {
		Goods goods = goodsService.findOne(goods_id);
		int allnum = goodsService.allnum();
		model.addObject("goods",goods);
		model.addObject("allnum",allnum);
		model.setViewName("Front/page/detail");
		return model;
	}
	
	//前台展示全部产品，果蔬热卖，国产水果，进口水果，新鲜时蔬
	@RequestMapping("allProdu.do")
	@ResponseBody	
	public NoteResult allProdu(int page,int id) {
		int pageSize = 12;
		return goodsService.allProdu(page,pageSize,id);
	}
	
	//后台商品管理，根据页数展示
	@RequestMapping("BackgoodsDisplay.do")
	@ResponseBody
	public NoteResult BackgoodsDisplay(int page){
		int pageSize = 4;
		return goodsService.allProdu(page,pageSize);
	}	
		
	//购物车
	@RequestMapping("shopcart.do")
	@ResponseBody	
	public void shopcart(int id,int num,String username,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		User user = userService.login(username);
		int user_id = user.getId();
		goodsService.addShopCart(user_id,id, num);
	}
	
	//商品信息查询
	@RequestMapping("goodsInfo.do")
	public ModelAndView goodsInfo(int goods_id) {
		Goods goods = goodsService.findOne(goods_id);
		model.addObject("goods",goods);
		model.setViewName("Back/page/user/addgoods");
		return model;
	}
	
	//商品的删除(下架商品)
		@RequestMapping("delgoods.do")
		public ModelAndView delgoods(int goods_id) {
			String message = null;
			try{
				goodsService.delgoods(goods_id);
				message = "下架成功";
			}catch(Exception e){
				message = "下架失败，请重试";
			}
			model.addObject("message",message);
			model.setViewName("Back/page/user/allgoods");
			return model;
		}
	
	//商品信息修改or添加商品
	@RequestMapping("editGoods.do")
	public ModelAndView editGoods(String goods_id,String goodsname,String goodsprice,String goods_imageurl,String goodstime,int num,int sort,int state) {
		goods.setGoodsname(goodsname);
		goods.setGoodsprice(goodsprice);
		goods.setGoods_imageurl(goods_imageurl);
		goods.setNum(num);
		goods.setState(state);
		String message = null;
		if(goods_id!=null && goods_id !=""){
			try{
				goods.setGoodstime(goodstime);
				goods.setId(Integer.valueOf(goods_id));
				goodsService.editGoods(goods,sort);
			}catch(Exception e){
				message = "抱歉，商品信息修改失败，请重试";
				model.setViewName("Back/page/user/addgoods");
			}
			  message = "商品信息修改成功";
		}else{
			try{
			goodsService.addGoods(goods,sort);
			}catch(Exception e){
				message = "抱歉，添加商品失败，请重试";
				model.setViewName("Back/page/user/addgoods");
			}
			message = "商品添加成功";
		}
		model.addObject("message",message);
		model.setViewName("Back/page/user/allgoods");
		return model;
	}
	
	//商品的搜索
	@RequestMapping("searchGoods.do")
	@ResponseBody
	public NoteResult searchGoods(int page,HttpServletRequest request) throws UnsupportedEncodingException{
		String keywords = request.getParameter("keywords");
		//get请求解码
		keywords = URLDecoder.decode(keywords, "utf-8");
		note = goodsService.searchGoods(page,keywords);
		return note;
	}
	
	//加载我的购物车页面
	@RequestMapping("loadCart.do")
	@ResponseBody
	public NoteResult loadCart(String user_name){
		User user = userService.login(user_name);
		int user_id = user.getId();
		return goodsService.loadCart(user_id);
	}
	
	//购物车删除操作
	@RequestMapping("delShopCart.do")
	@ResponseBody
	public void delShopCart(int uid,int gid){
	     goodsService.delShopCart(uid,gid);
	}
	
	//订单页面购物清单加载
		@RequestMapping("loadBalance.do")
		@ResponseBody
		public NoteResult loadBalance(int uid,String gid){
			String[] goods_id = gid.split(","); 
		    return goodsService.loadBalance(uid,goods_id);
		}
		
    //保存地址
		@RequestMapping("saveAddress.do")
		@ResponseBody
		public void saveAddress(String user_id,String Consignee,String Telephone,String Provinces,String Citys,String Countys,String Street,int Zipcode,String Tag){
		     goodsService.saveAddress(user_id,Consignee,Telephone,Provinces,Citys,Countys,Street,Zipcode,Tag);
		}
	//生成订单
		@RequestMapping("createOrder.do")
		@ResponseBody
		public void createOrder(int user_id,String goods_id,String conphone,String delivery_time,String order_message){
		     goodsService.createOrder(user_id,goods_id,conphone,delivery_time,order_message);
		}

}
