package com.tarena.dangdang.action.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.tarena.dao.BookDao;
import com.tarena.dao.ProductDao;
import com.tarena.dao.impl.BookDaoImlp;


public class updateBook2 {
	private int id;
	private File pic;
	private String picFileName;
	private String picContentType;
	private String productname;
	private double newjiage;
	private String author;
	private String pushing;
	private String pagenumber;
	private int xuanze;
	
	public int getXuanze() {
		return xuanze;
	}
	public void setXuanze(int xuanze) {
		this.xuanze = xuanze;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public File getPic() {
		return pic;
	}
	public void setPic(File pic) {
		this.pic = pic;
	}
	public String getPicFileName() {
		return picFileName;
	}
	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}
	public String getPicContentType() {
		return picContentType;
	}
	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public double getNewjiage() {
		return newjiage;
	}
	public void setNewjiage(double newjiage) {
		this.newjiage = newjiage;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPushing() {
		return pushing;
	}
	public void setPushing(String pushing) {
		this.pushing = pushing;
	}
	public String getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(String pagenumber) {
		this.pagenumber = pagenumber;
	}
	public String execute() throws Exception{
		System.out.println(xuanze+"是否需要修改图片 1改");
		if(xuanze==1){
			System.out.println(ServletActionContext.getServletContext().getRealPath("/productImages"));
			
		    String[] tempOtherPicName=picFileName.split("\\.");
		   
		    long time=System.currentTimeMillis();
		    String tempOtherPicName1=String.valueOf(time)+"."+tempOtherPicName[tempOtherPicName.length-1];
			//FileOutputStream fos=new FileOutputStream("E:\\x\\Shangchuan\\WebRoot\\save"+"\\"+getUploadFileName());
			FileOutputStream fos=new FileOutputStream(ServletActionContext.getServletContext().getRealPath("/productImages")+"\\"+tempOtherPicName1);
			
			FileInputStream fis =new FileInputStream(pic);
			
			System.out.println(pic+"+++++++++++++++++");
			byte[] buffer=new byte[1024];
			int len=0;
			while((len=fis.read(buffer))>0){
				fos.write(buffer,0,len);
			}
			fos.close();
			ProductDao.updateImgName(tempOtherPicName1,id);
		}
		
		//上面是保存图片的
		ProductDao.updateBNANDmomey(productname,newjiage,id);
		BookDao bd=new BookDaoImlp();
		bd.upateAuAndPUAndPage(author,pushing,pagenumber,id);
		return "success";
	}
}
