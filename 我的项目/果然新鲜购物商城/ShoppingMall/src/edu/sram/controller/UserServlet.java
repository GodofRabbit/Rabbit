package edu.sram.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.Goods;
import edu.sram.entity.User;
import edu.sram.service.GoodsService;
import edu.sram.service.GoodsServiceImpl;
import edu.sram.service.UserService;
import edu.sram.service.UserServiceImpl;
@Controller
public class UserServlet{
	@Autowired
	private UserService userService;
	@Autowired
    User user;
	@RequestMapping("index.go")
	protected String login(){
		return "index";
	}
	@RequestMapping("register.go")
	protected String register(){
		return "register";
	}
	@RequestMapping("log.go")
	protected String log(){
		return "login";
	}
	
	@RequestMapping("login.go")
	protected void check(String username,String password,String fid,HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		user.setUsername(username);
		user.setPassword(password);
		User findUser=null;
		try {
			findUser= userService.findUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(findUser==null){
			request.setAttribute("message", "»áÔ±ÕËºÅ»òÃÜÂë´íÎó£¬ÇëÖØÐÂÊäÈë");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		
		}else if(findUser!=null && fid!=null||fid!=""){
			HttpSession session = request.getSession();
			session.setAttribute("findUser", findUser);
			session.setAttribute("sessionId", session.getId());
			request.setAttribute("fid", fid);
			request.getRequestDispatcher("findOne.go").forward(request, response);
		}
	}
	
	@RequestMapping("addUser.go")
	protected String addUser(HttpServletRequest request)throws ServletException, IOException{
		String message1=null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		String birthday = request.getParameter("birthday");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		user.setUsername(username);
		user.setPassword(password);
		user.setRealname(realname);
		user.setSex(sex);
		user.setPhone(phone);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		boolean c =false;
		if(user.getUsername()==null){
			return "login";
		}
		try {
			date = sdf.parse(birthday);
			user.setBirthday(date);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}  
			   try {
					 c = userService.toAddUser(user);
				} catch (Exception e) {
					e.printStackTrace();
				}
			   if(c){
				   message1 = "¹§Ï²Äú£¬×¢²á³É¹¦£¬ÇëµÇÂ¼£¡";
				   request.setAttribute("message1", message1);
				   request.getSession().setAttribute("user", user);
				   return "login";
			   }else{
				   message1 = "Î´ÖªÔ­Òò£¬×¢²áÊ§°Ü£¡";
				   return "redirect:/register.go";
			   }
		
	}
	
	@RequestMapping("checkUserName.go")
	@ResponseBody
	public String checkUserName(String username)throws ServletException, IOException{
		boolean b =false;
		user.setUsername(username);
		try {
			b=userService.findByName(user);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(b){
			return "1";
		}else{
			
			return "2";
		}
		
	}
}
