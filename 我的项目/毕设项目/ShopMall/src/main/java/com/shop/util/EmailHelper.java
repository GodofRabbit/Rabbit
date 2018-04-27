package com.shop.util;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

//邮箱接口测试类
public class EmailHelper{  
	
	public void simpleMailSend(String email,String text) {  
		
	     //创建邮件发送服务器  
	        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();    
	        mailSender.setHost("smtp.qq.com");  
	        mailSender.setPort(587);  
	        mailSender.setUsername("1287882196@qq.com");  
	        mailSender.setPassword("fnmflnsjdjvkhdcg");     //iybpsqmqicdsbedf
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
	        message.setSubject("客户需求");  
	        message.setText(text);  
	        //发送邮件  
	        mailSender.send(message);  
	    }  
   
}  