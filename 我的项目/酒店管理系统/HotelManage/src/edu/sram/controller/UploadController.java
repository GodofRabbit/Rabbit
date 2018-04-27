package edu.sram.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.sram.entity.NoteMessage;
import edu.sram.service.AdminService;

@Controller
public class UploadController {
	private NoteMessage note = new NoteMessage();
	@Autowired
	private AdminService adminService;

	 @Transactional
	 @RequestMapping(value = "/upload.do")  
	 @ResponseBody
	    public NoteMessage upload(@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request) {  
	  
	        String path = request.getSession().getServletContext().getRealPath("upload");  
	        String fileName = file.getOriginalFilename();  
//	        String fileName = new Date().getTime()+".jpg";  
	        File targetFile = new File(path, fileName);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	  
	        try {  
	        	//保存图片
	            file.transferTo(targetFile);
	            //这样便可以获取一个cookie数组
	            Cookie[] cookies = request.getCookies();
	            for (int i = 0; i < cookies.length; i++) {
	   		    	Cookie cook = cookies[i];
	   		    	if(cook.getName().equalsIgnoreCase("aid")){ 
	   		    	//拿到cookie中管理员对应的id
	   		    	String admin_id = cook.getValue().toString(); 
	   		        adminService.updateImg(fileName,admin_id);
	   		    	}
	            }
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        note.setMessage("上传成功");
	        note.setData(fileName);
	        return note;  
	    }  
}
