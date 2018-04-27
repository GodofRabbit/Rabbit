package com.shop.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.NoteResult;
import com.shop.entity.User;
import com.shop.service.UserService;
import com.shop.util.CreateYZMCodeUtils;


//�û���¼���˳���ע�ᡢ���Ʋ�
@Controller
public class UserLogController {
	@Autowired
	private UserService userService;
	@Autowired
	private NoteResult note;
	ModelAndView model=new ModelAndView();

	@RequestMapping("/login.do")
	public ModelAndView login(String account,String password,String autoLogin,HttpServletResponse response) throws UnsupportedEncodingException{
		Subject currentUser = SecurityUtils.getSubject();
		if(currentUser.isAuthenticated()==false){
			//���û����������װUsernamePasswordToken
			UsernamePasswordToken token = new UsernamePasswordToken(account,password);
			User user = userService.login(account);
			Cookie cookie = new Cookie("user_id",String.valueOf(user.getId()));
			if(autoLogin!=null && autoLogin.equals("remember")){
				token.setRememberMe(true);
				cookie.setMaxAge(2592000);
				response.addCookie(cookie);
			}else{
				token.setRememberMe(false);
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
			}
			try{
				currentUser.login(token);
				model.setViewName("redirect:frontpage/personal_information.jsp");
			}catch(AuthenticationException e){
				token.clear();
				model.addObject("info","�˺Ż��������,����������");
				model.setViewName("frontpage/login");
			}
		}
		return model;
	}
	
	@RequestMapping("/register.do")
	public ModelAndView register(String username,String password,String phone,String checkCode,HttpSession session){
		String code=(String) session.getAttribute("code");
		if(!code.equals(checkCode)){  
            model.addObject("info", "��֤��������������룡");  
            model.setViewName("frontpage/register");
	    }else{
		String hashAlgorithmName = "MD5";
		Object credentials = password;
		Object salt = ByteSource.Util.bytes(phone);
		int hashIterations = 1024;
		String result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations).toHex();
		try{
			userService.add(username,result, phone);
			model.addObject("info","ע��ɹ�,���¼");
			model.setViewName("frontpage/login");
		}catch(Exception e){
			System.out.println(e);
			model.addObject("info","δ֪ԭ��,ע��ʧ��");
			model.setViewName("frontpage/register");
		}
	    }
		return model;
	}
	
	@RequestMapping(value ="/checkPhone.do",method = RequestMethod.POST)
	@ResponseBody
	public NoteResult checkPhone(String phone){
		User user = userService.login(phone);
		if(user!=null){
			note.setMessage("��Ǹ,���ֻ����ѱ�ע��");
		}else{
			note.setMessage("");
		}		
		return note;
	}
	/** 
     * ������֤��ͼƬ 
     *  
     * @param response 
     * @param session 
     */  
    @RequestMapping("/createYZM.do")  
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
