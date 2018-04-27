package com.tarena.dangdang.action.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tarena.dao.ProductDao;
import com.tarena.entity.Product1;


public class addbook2  {
	private int id=0;
	private double jiage;
	private double newjiage;
	
	public double getJiage() {
		return jiage;
	}


	public void setJiage(double jiage) {
		this.jiage = jiage;
	}


	public double getNewjiage() {
		return newjiage;
	}


	public void setNewjiage(double newjiage) {
		this.newjiage = newjiage;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	private File pic;
	private String picFileName;
	private String picContentType;
	private String productname;
	
	
	public String getProductname() {
		return productname;
	}


	public void setProductname(String productname) {
		this.productname = productname;
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


	public String execute() throws Exception{
		System.out.println("11111111");
		System.out.println(ServletActionContext.getServletContext().getRealPath("/productImages"));
		System.out.println(picFileName);
		System.out.println(productname);
		System.out.println("1111111111111111111");
	    String[] tempOtherPicName=picFileName.split("\\.");
	    System.out.println(tempOtherPicName.length+"KKKKKK");
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
		//������ͼƬ���ϴ� ������ǲ���id��id+1����
		
		id=ProductDao.findMaxProductId();
		//id=id+1 ���뵽impl��+1 �����ɿ��Ը�;
		//�������
		Product1 pduct=new Product1();
		pduct.setId(id);
		pduct.setProductName(productname);
		pduct.setAddTime(time);
		pduct.setDescription("�Ͽ�ͷ�۵Ĺ���");
		pduct.setFixedPrice(jiage);
		pduct.setDangPrice(newjiage);
		pduct.setKeyswords("key");
		pduct.setHasDelete(1);
		pduct.setProductPic(tempOtherPicName1);
		
		id=ProductDao.insertInFoP(pduct);
		
		return "success";
	}
}
