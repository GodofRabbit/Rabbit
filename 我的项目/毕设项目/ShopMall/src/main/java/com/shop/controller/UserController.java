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


//�û���¼���˳���ע�ᡢ���Ʋ�
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private NoteResult note;
	ModelAndView model=new ModelAndView();

	/** 
     * ��¼ 
     */  
	@RequestMapping("/login.do")
	public ModelAndView login(String li_url,String account,String password,boolean rememberMe,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser.isAuthenticated()==false){
			//���û����������װUsernamePasswordToken
			UsernamePasswordToken token = new UsernamePasswordToken(account,password);
			//�Ƿ��ס��
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
				}//ע��ո�
				//�Ƿ�Ϊ����Ա
				if(currentUser.hasRole("admin")||currentUser.hasRole("root")){
					li_url = "http://localhost:8080/ShopMall/Back/page/index.jsp";
				}
				response.sendRedirect(li_url);
			}catch(AuthenticationException e){
				token.clear();
				model.addObject("info","�˺Ż��������,����������");
				model.setViewName("login");
			}
		}
		return model;
	}
	/** 
     * ע�� 
     */  
	@RequestMapping("/register.do")
	@Transactional
	public ModelAndView register(String realname,String phone,String checkCode,String username,String password,HttpSession session){
		String code=(String) session.getAttribute("code");
		if(!code.equals(checkCode)){  
            model.addObject("info", "��֤��������������룡");  
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
			model.addObject("info","ע��ʧ��,��ע���ʽ");
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
			note.setMessage("��Ǹ,���˺��ѱ�ע��");
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
			note.setMessage("��Ǹ,���ֻ����ѱ�ע��");
		}else{
			note.setMessage("");
		}		
		return note;
	}
	/** 
     * �������������֤ 
     */  
	@RequestMapping(value ="/checkInfo.do",method = RequestMethod.POST)
	@ResponseBody
	public User checkInfo(String username,String phone,HttpSession session){
		session.setAttribute("username",username);
		User user = userService.checkInfo(username,phone);
		return user;
	}
	/** 
     * ��������������֤ 
     */  
	@RequestMapping(value ="/sendEmail.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult sendEmail(String email,HttpSession session){
		String msg = null;
		try{
			//�����ʼ����ͷ�����  
	        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();    
	        mailSender.setHost("smtp.qq.com");  
	        mailSender.setPort(587);  
	        mailSender.setUsername("1287882196@qq.com");  
	        mailSender.setPassword("fnmflnsjdjvkhdcg");     //670949185@qq.com  iybpsqmqicdsbedf
	        //����֤����  
	        Properties javaMailProperties = new Properties();  
	        javaMailProperties.put("mail.smtp.auth", true);   
	        javaMailProperties.put("mail.smtp.starttls.enable", true);   
	        javaMailProperties.put("mail.smtp.timeout", 5000);   
	        mailSender.setJavaMailProperties(javaMailProperties);  
	        //�����ʼ�����  
	        SimpleMailMessage message=new SimpleMailMessage();  
	        message.setFrom("1287882196@qq.com");  
	        message.setTo(email); 
	        message.setSubject("��֤��");  
	        //��֤��  
	        String vcode = "";  
	        for (int i = 0; i < 6; i++) {  
	            vcode = vcode + (int)(Math.random() * 9);  
	        } 
	        session.setAttribute("verifycode",vcode);
	        message.setText(vcode);  
	        //�����ʼ�  
	        mailSender.send(message);  
			 msg = "��֤�뷢�ͳɹ�,��ע�����";
		}catch(Exception e){
			msg = "��֤�뷢��ʧ�ܣ������ط�";
		}
		note.setMessage(msg);
		return note;
	}
	/** 
     * ��������������֤�����
     */  
	@RequestMapping(value ="/checkVerify.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult checkVerify(String verify,HttpServletRequest request){
		String verifycode = (String) request.getSession().getAttribute("verifycode");
		if(verify.equals(verifycode)){
			note.setState(1);//��ȷ
		}else{
			note.setState(0);//����
		}
		return note;
	}
	/** 
     * ��������
     */  
	@RequestMapping(value ="/updatePwd.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult updatePwd(String newPwd,HttpSession session){
		String username = (String) session.getAttribute("username");
		userService.changePwd(username,newPwd);
		return note;
	}
	/** 
     * ��ϵ���� 
     */  
	@RequestMapping(value ="/concat.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult concat(String concatname,String concatphone,String concattime,String concattext){
		StringBuffer info = new StringBuffer();
		info.append(concatname).append("\n").append(concatphone).append("\n").append(concattime).append("\n").append(concattext);
		EmailHelper email = new EmailHelper();
		email.simpleMailSend("670949185@qq.com",info.toString());
		note.setMessage("��Ϣ���ύ,���ǽ�����������ϵ");
		return note;
	}
	/** 
     * �����ҵĶ���ҳ�� 
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
     * ������֤��ͼƬ 
     *  
     * @param response 
     * @param session 
     */  
    @RequestMapping("createYZM.do")  
    public void createYZM(HttpServletResponse response, HttpSession session) {  
        OutputStream out = null;  
        try {  
            // ������Ӧ����  
            response.setContentType("image/jpg");  
            // ��ȡ������֤�빤����ʵ��  
            CreateYZMCodeUtils yzm = CreateYZMCodeUtils.getInstance();  
            // ��ȡ���ɵ���֤���ַ���  
            String code = yzm.getCreateYZMCode();  
            // ����֤������session  
            session.setAttribute("code", code);  
            // ��ȡ��֤��ͼƬ  
            BufferedImage img = yzm.getCreateYZMImg(code);  
            out = response.getOutputStream();  
            // ͨ��ImageIOд��ͼƬ  
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
