package com.shop.util;

import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

//����ӿڲ�����
public class EmailHelper{  
	
	public void simpleMailSend(String email,String text) {  
		
	     //�����ʼ����ͷ�����  
	        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();    
	        mailSender.setHost("smtp.qq.com");  
	        mailSender.setPort(587);  
	        mailSender.setUsername("1287882196@qq.com");  
	        mailSender.setPassword("fnmflnsjdjvkhdcg");     //iybpsqmqicdsbedf
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
	        message.setSubject("�ͻ�����");  
	        message.setText(text);  
	        //�����ʼ�  
	        mailSender.send(message);  
	    }  
   
}  