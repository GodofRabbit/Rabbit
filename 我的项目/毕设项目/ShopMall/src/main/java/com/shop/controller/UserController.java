package com.shop.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Properties;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.NoteResult;
import com.shop.entity.User;
import com.shop.service.UserService;
import com.shop.util.CreateYZMCodeUtils;
import com.shop.util.EmailHelper;


//用户登录、退出、注册、控制层
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private NoteResult note;
	ModelAndView model=new ModelAndView();

	/** 
     * 登录 
     */  
	@RequestMapping("/login.do")
	public ModelAndView login(String li_url,String account,String password,boolean rememberMe,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser.isAuthenticated()==false){
			//将用户名及密码封装UsernamePasswordToken
			UsernamePasswordToken token = new UsernamePasswordToken(account,password);
			//是否记住我
			if(rememberMe){
				token.setRememberMe(true);
			}else{
				token.setRememberMe(false);
			}
			try{
				currentUser.login(token);
				request.getSession().setAttribute("username", account);
				if(li_url.equals(request.getRequestURI())||li_url.equals(" http://localhost:8080/ShopMall/login.do")||li_url.equals(" http://localhost:8080/ShopMall/register.do")||li_url.equals(" http://localhost:8080/ShopMall/login.jsp")||li_url.equals(" http://localhost:8080/ShopMall/Front/page/register.jsp")){
					li_url = "http://localhost:8080/ShopMall/index.jsp";
				}//注意空格
				//是否为管理员
				if(currentUser.hasRole("admin")||currentUser.hasRole("root")){
					li_url = "http://localhost:8080/ShopMall/Back/page/index.jsp";
				}
				response.sendRedirect(li_url);
			}catch(AuthenticationException e){
				token.clear();
				model.addObject("info","账号或密码错误,请重新输入");
				model.setViewName("login");
			}
		}
		return model;
	}
	/** 
     * 注册 
     */  
	@RequestMapping("/register.do")
	@Transactional
	public ModelAndView register(String realname,String phone,String checkCode,String username,String password,HttpSession session){
		String code=(String) session.getAttribute("code");
		if(!code.equals(checkCode)){  
            model.addObject("info", "验证码错误，请重新输入！");  
            model.setViewName("Front/page/register");
	    }else{
		String hashAlgorithmName = "MD5";
		Object credentials = password;
		Object salt = ByteSource.Util.bytes(phone);
		int hashIterations = 1024;
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		try{
			userService.add(realname, phone,username,result);
			int user_id = userService.login(username).getId();
			userService.addRole(user_id);
			Subject currentUser = SecurityUtils.getSubject();
			UsernamePasswordToken token = new UsernamePasswordToken(username,password);
			token.setRememberMe(true);
			session.setAttribute("username", username);
			currentUser.login(token);
			model.setViewName("index");
		}catch(Exception e){
			model.addObject("info","注册失败,请注意格式");
			model.setViewName("Front/page/register");
		}
	    }
		return model;
	}
	
	@RequestMapping(value ="/checkUsername.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult checkUsername(String username){
		User user = userService.login(username);
		if(user!=null){
			note.setMessage("抱歉,该账号已被注册");
		}else{
			note.setMessage("");
		}		
		return note;
	}
	
	@RequestMapping(value ="/checkPhone.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult checkPhone(String phone){
		User user = userService.checkPhone(phone);
		if(user!=null){
			note.setMessage("抱歉,该手机号已被注册");
		}else{
			note.setMessage("");
		}		
		return note;
	}
	/** 
     * 忘记密码身份验证 
     */  
	@RequestMapping(value ="/checkInfo.do",method = RequestMethod.POST)
	@ResponseBody
	public User checkInfo(String username,String phone,HttpSession session){
		session.setAttribute("username",username);
		User user = userService.checkInfo(username,phone);
		return user;
	}
	/** 
     * 忘记密码邮箱验证 
     */  
	@RequestMapping(value ="/sendEmail.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult sendEmail(String email,HttpSession session){
		String msg = null;
		try{
			//创建邮件发送服务器  
	        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();    
	        mailSender.setHost("smtp.qq.com");  
	        mailSender.setPort(587);  
	        mailSender.setUsername("1287882196@qq.com");  
	        mailSender.setPassword("fnmflnsjdjvkhdcg");     //670949185@qq.com  iybpsqmqicdsbedf
	        //加认证机制  
	        Properties javaMailProperties = new Properties();  
	        javaMailProperties.put("mail.smtp.auth", true);   
	        javaMailProperties.put("mail.smtp.starttls.enable", true);   
	        javaMailProperties.put("mail.smtp.timeout", 5000);   
	        mailSender.setJavaMailProperties(javaMailProperties);  
	        //创建邮件内容  
	        SimpleMailMessage message=new SimpleMailMessage();  
	        message.setFrom("1287882196@qq.com");  
	        message.setTo(email); 
	        message.setSubject("验证码");  
	        //验证码  
	        String vcode = "";  
	        for (int i = 0; i < 6; i++) {  
	            vcode = vcode + (int)(Math.random() * 9);  
	        } 
	        session.setAttribute("verifycode",vcode);
	        message.setText(vcode);  
	        //发送邮件  
	        mailSender.send(message);  
			 msg = "验证码发送成功,请注意查收";
		}catch(Exception e){
			msg = "验证码发送失败，请点击重发";
		}
		note.setMessage(msg);
		return note;
	}
	/** 
     * 忘记密码邮箱验证码检验
     */  
	@RequestMapping(value ="/checkVerify.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult checkVerify(String verify,HttpServletRequest request){
		String verifycode = (String) request.getSession().getAttribute("verifycode");
		if(verify.equals(verifycode)){
			note.setState(1);//正确
		}else{
			note.setState(0);//错误
		}
		return note;
	}
	/** 
     * 重置密码
     */  
	@RequestMapping(value ="/updatePwd.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult updatePwd(String newPwd,HttpSession session){
		String username = (String) session.getAttribute("username");
		userService.changePwd(username,newPwd);
		return note;
	}
	/** 
     * 联系我们 
     */  
	@RequestMapping(value ="/concat.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult concat(String concatname,String concatphone,String concattime,String concattext){
		StringBuffer info = new StringBuffer();
		info.append(concatname).append("\n").append(concatphone).append("\n").append(concattime).append("\n").append(concattext);
		EmailHelper email = new EmailHelper();
		email.simpleMailSend("670949185@qq.com",info.toString());
		note.setMessage("信息已提交,我们将尽快与您联系");
		return note;
	}
	/** 
     * 加载我的订单页面 
     */ 
	@RequestMapping("loadMyOrder.do")
	public ModelAndView loadMyOrder(){
		String user_name = (String) SecurityUtils.getSubject().getPrincipal();
		User user = userService.login(user_name);
		int user_id = user.getId();
		NoteResult note = userService.loadMyOrder(user_id);
		model.addObject("myorder",note);
		model.setViewName("Front/page/myorder");
		return model;
	}
	/** 
     * 生成验证码图片 
     *  
     * @param response 
     * @param session 
     */  
    @RequestMapping("createYZM.do")  
    public void createYZM(HttpServletResponse response, HttpSession session) {  
        OutputStream out = null;  
        try {  
            // 设置响应类型  
            response.setContentType("image/jpg");  
            // 获取创建验证码工具类实例  
            CreateYZMCodeUtils yzm = CreateYZMCodeUtils.getInstance();  
            // 获取生成的验证码字符串  
            String code = yzm.getCreateYZMCode();  
            // 将验证码存放在session  
            session.setAttribute("code", code);  
            // 获取验证码图片  
            BufferedImage img = yzm.getCreateYZMImg(code);  
            out = response.getOutputStream();  
            // 通过ImageIO写出图片  
            ImageIO.write(img, "jpg", out);  
            out.flush();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            if (out != null) {  
                try {  
                    out.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
            }  
        } 
    } 
    
    
}
