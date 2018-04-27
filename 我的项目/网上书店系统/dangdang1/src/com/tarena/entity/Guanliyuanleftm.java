package com.tarena.entity;



import java.util.ArrayList;
import java.util.List;

public class Guanliyuanleftm {
	private int id;
	
	private String name;
	
	private int parent_id;
	//追加一个属性用户存储子类别
	private List<Guanliyuanleftm> gory=new ArrayList<Guanliyuanleftm>();
	
	//用户保存数量
	private int count;
	public Guanliyuanleftm(){
		
	}
	public Guanliyuanleftm(int id,String name,int parent_id,List<Guanliyuanleftm> gory){
		 this.id=id;
		 this.name=name;
		 this.gory=gory;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<Guanliyuanleftm> getGory() {
		return gory;
	}
	public void setGory(List<Guanliyuanleftm> gory) {
		this.gory = gory;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parentId) {
		parent_id = parentId;
	}
	
}
