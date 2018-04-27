package com.shop.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.NoteResult;
import com.shop.entity.ShopCart;
import com.shop.entity.User;
import com.shop.service.UserService;

@Controller
public class UserManagerController {
	
ModelAndView model=new ModelAndView();
	
	@Autowired
	UserService userService;
	@Autowired
	User user;
	@Autowired
	NoteResult note;
	String message = null;
	
	//��̨����Ա����
	@RequestMapping(value="BackAdminDisplay.do")
	@ResponseBody	
	public NoteResult BackAdminDisplay(int page) {
		return userService.BackAdminDisplay(page,2);
	}
	
	//��̨��Ա����
		@RequestMapping(value="BackUserDisplay.do")
		@ResponseBody	
		public NoteResult BackUserDisplay(int page) {
			return userService.BackAdminDisplay(page,1);
		}

	//��ͨ����Ա��ɾ��
	@RequestMapping("delAdmin.do")
	public ModelAndView delAdmin(int admin_id) {
		try{
			userService.delAdmin(admin_id);
			message = "ɾ���ɹ�";
		}catch(Exception e){
			message = "ɾ��ʧ�ܣ�������";
		}
		model.addObject("message",message);
		model.setViewName("Back/page/user/Admin");
		return model;
	}
	
	//��̨��ͨ����Ա�����
	@RequestMapping(value="addAdmin.do")
	public ModelAndView addAdmin(String username,String password,String realname,String phone,int role_id) {
		String hashAlgorithmName = "MD5";
		Object credentials = password;
		Object salt = ByteSource.Util.bytes(phone);
		int hashIterations = 1024;
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		try{
			userService.add(realname, phone,username,result);
			int user_id = userService.login(username).getId();
			userService.addAdmin_role(user_id,role_id);
		    message = "��ӳɹ�";
		}catch(Exception e){
			message = "���ʧ�ܣ�������";
		}
		model.addObject("message",message);
		model.setViewName("Back/page/user/Admin");
		return model;
	}
	
	//��̨����Ա������
		@RequestMapping("searchAdmin.do")
		@ResponseBody
		public NoteResult searchAdmin(int page,String keywords) throws UnsupportedEncodingException{
			//get�������
			keywords = URLDecoder.decode(keywords, "utf-8");
			note = userService.searchUser(page,keywords,2);
			return note;
		}
		
	//��̨��Ա������
		@RequestMapping("searchUser.do")
		@ResponseBody
		public NoteResult searchUser(int page,String keywords) throws UnsupportedEncodingException{
			//get�������
			keywords = URLDecoder.decode(keywords, "utf-8");
			note = userService.searchUser(page,keywords,1);
			return note;
		}
    
	//��̨��������
		@RequestMapping("BackOrderDisplay.do")
		@ResponseBody
		public NoteResult BackOrderDisplay(int page) throws UnsupportedEncodingException{
			note = userService.BackOrderDisplay(page);
			return note;
		}
		
		//��̨����������
		@RequestMapping("searchOrder.do")
		@ResponseBody
		public NoteResult searchOrder(int page,String keywords) throws UnsupportedEncodingException{
			//get�������
			keywords = URLDecoder.decode(keywords, "utf-8");
			note = userService.searchOrder(page,keywords);
			return note;
		}
	  //��������
		@RequestMapping("orderDatail.do")
		@ResponseBody
		public ModelAndView orderDatail(int order_id){
			List<ShopCart> list = userService.orderDatail(order_id);
			Double d = 0.0;
			for (ShopCart i : list) {
				d += Double.parseDouble(i.getGoodsprice())*i.getGoods_num();
			}
			model.addObject("d",d);//�ܼ�
			model.addObject("order_id",order_id);
			model.addObject("list",list);
			model.setViewName("Back/page/user/orderDetail");
			return model;
		}
	//�޸Ķ���״̬
	@RequestMapping("udos.do")
	@ResponseBody
	public NoteResult udos(int order_id,String state){
		try{
			userService.udos(order_id,state);
			note.setState(1);//���³ɹ�
		}catch(Exception e){
			note.setState(0);//����ʧ��
		}
		return note;
	}	
	//��̨ԭ������֤
		@RequestMapping("checkOldPassword.do")
		@ResponseBody
		public NoteResult checkOldPassword(String username,String oldPwd){
			note = userService.checkOldPassword(username,oldPwd);
			return note;
		}	
	//��̨�����޸�
		@RequestMapping("changePwd.do")
		@ResponseBody
		public void changePwd(String username,String newPwd){
			userService.changePwd(username,newPwd);
		}	
	//��̨����
		@RequestMapping("unlock.do")
		@ResponseBody
		public NoteResult unlock(String ulpwd){
			String username = (String) SecurityUtils.getSubject().getPrincipal();
			return userService.unlock(username,ulpwd);
		}	
}
