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

	//ǰ̨��ҳ��԰�Ƽ�
	@RequestMapping(value="recommand.do")
	@ResponseBody	
	public NoteResult recommand(String username) {
		return goodsService.recommand(username);
	}
	
	//ǰ̨��ҳ��ʾ����
	@RequestMapping("showmore.do")
	@ResponseBody	
	public List<Goods> showmore(int page) {
		return goodsService.showmore(page);
	}
	
	//ǰ̨��ҳ��������ҳ��չʾ������Ʒ
	@RequestMapping("findOne.do")
	public ModelAndView findOne(int goods_id) {
		Goods goods = goodsService.findOne(goods_id);
		int allnum = goodsService.allnum();
		model.addObject("goods",goods);
		model.addObject("allnum",allnum);
		model.setViewName("Front/page/detail");
		return model;
	}
	
	//ǰ̨չʾȫ����Ʒ����������������ˮ��������ˮ��������ʱ��
	@RequestMapping("allProdu.do")
	@ResponseBody	
	public NoteResult allProdu(int page,int id) {
		int pageSize = 12;
		return goodsService.allProdu(page,pageSize,id);
	}
	
	//��̨��Ʒ��������ҳ��չʾ
	@RequestMapping("BackgoodsDisplay.do")
	@ResponseBody
	public NoteResult BackgoodsDisplay(int page){
		int pageSize = 4;
		return goodsService.allProdu(page,pageSize);
	}	
		
	//���ﳵ
	@RequestMapping("shopcart.do")
	@ResponseBody	
	public void shopcart(int id,int num,String username,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		User user = userService.login(username);
		int user_id = user.getId();
		goodsService.addShopCart(user_id,id, num);
	}
	
	//��Ʒ��Ϣ��ѯ
	@RequestMapping("goodsInfo.do")
	public ModelAndView goodsInfo(int goods_id) {
		Goods goods = goodsService.findOne(goods_id);
		model.addObject("goods",goods);
		model.setViewName("Back/page/user/addgoods");
		return model;
	}
	
	//��Ʒ��ɾ��(�¼���Ʒ)
		@RequestMapping("delgoods.do")
		public ModelAndView delgoods(int goods_id) {
			String message = null;
			try{
				goodsService.delgoods(goods_id);
				message = "�¼ܳɹ�";
			}catch(Exception e){
				message = "�¼�ʧ�ܣ�������";
			}
			model.addObject("message",message);
			model.setViewName("Back/page/user/allgoods");
			return model;
		}
	
	//��Ʒ��Ϣ�޸�or�����Ʒ
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
				message = "��Ǹ����Ʒ��Ϣ�޸�ʧ�ܣ�������";
				model.setViewName("Back/page/user/addgoods");
			}
			  message = "��Ʒ��Ϣ�޸ĳɹ�";
		}else{
			try{
			goodsService.addGoods(goods,sort);
			}catch(Exception e){
				message = "��Ǹ�������Ʒʧ�ܣ�������";
				model.setViewName("Back/page/user/addgoods");
			}
			message = "��Ʒ��ӳɹ�";
		}
		model.addObject("message",message);
		model.setViewName("Back/page/user/allgoods");
		return model;
	}
	
	//��Ʒ������
	@RequestMapping("searchGoods.do")
	@ResponseBody
	public NoteResult searchGoods(int page,HttpServletRequest request) throws UnsupportedEncodingException{
		String keywords = request.getParameter("keywords");
		//get�������
		keywords = URLDecoder.decode(keywords, "utf-8");
		note = goodsService.searchGoods(page,keywords);
		return note;
	}
	
	//�����ҵĹ��ﳵҳ��
	@RequestMapping("loadCart.do")
	@ResponseBody
	public NoteResult loadCart(String user_name){
		User user = userService.login(user_name);
		int user_id = user.getId();
		return goodsService.loadCart(user_id);
	}
	
	//���ﳵɾ������
	@RequestMapping("delShopCart.do")
	@ResponseBody
	public void delShopCart(int uid,int gid){
	     goodsService.delShopCart(uid,gid);
	}
	
	//����ҳ�湺���嵥����
		@RequestMapping("loadBalance.do")
		@ResponseBody
		public NoteResult loadBalance(int uid,String gid){
			String[] goods_id = gid.split(","); 
		    return goodsService.loadBalance(uid,goods_id);
		}
		
    //�����ַ
		@RequestMapping("saveAddress.do")
		@ResponseBody
		public void saveAddress(String user_id,String Consignee,String Telephone,String Provinces,String Citys,String Countys,String Street,int Zipcode,String Tag){
		     goodsService.saveAddress(user_id,Consignee,Telephone,Provinces,Citys,Countys,Street,Zipcode,Tag);
		}
	//���ɶ���
		@RequestMapping("createOrder.do")
		@ResponseBody
		public void createOrder(int user_id,String goods_id,String conphone,String delivery_time,String order_message){
		     goodsService.createOrder(user_id,goods_id,conphone,delivery_time,order_message);
		}

}
