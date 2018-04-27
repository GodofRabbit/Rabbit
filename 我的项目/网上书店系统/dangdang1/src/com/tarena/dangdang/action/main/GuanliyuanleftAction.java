package com.tarena.dangdang.action.main;

import java.util.ArrayList;

import java.util.List;

import com.tarena.dao.CategoryMANDao;
import com.tarena.dao.CategroyDao;
import com.tarena.dao.impl.CategoryDaoImlp;
import com.tarena.dao.impl.CategoryMANDaoImpl;
import com.tarena.entity.Category;
import com.tarena.entity.Guanliyuanleftm;



public class GuanliyuanleftAction {
//input wu
//output 
	private List<Guanliyuanleftm> category;

	public List<Guanliyuanleftm> getCategory() {
		return category;
	}

	public void setCategory(List<Guanliyuanleftm> category) {
		this.category = category;
	} 
	public String execute() throws Exception{
		//查询d_category 表所有类别信息 将parentId=1的大类别取出给cats将其他子类别该cats中大类别gory
		
		CategoryMANDao cat=new CategoryMANDaoImpl();
		List<Guanliyuanleftm> cate=cat.findmanage();
		
		category=findB(cate,1);
		
		for(int i=0;i<category.size();i++){
			List<Guanliyuanleftm> ccbb=findB(cate,category.get(i).getId());
		 
			category.get(i).setGory(ccbb);
		}
		
		return "success";
	}
	public List<Guanliyuanleftm> findB(List<Guanliyuanleftm> a,int parent_id){
		List<Guanliyuanleftm> c=new ArrayList<Guanliyuanleftm>();
		for(int i=0;i<a.size();i++){
			if(a.get(i).getParent_id()==parent_id){
				Guanliyuanleftm cb=new Guanliyuanleftm();
				cb.setId(a.get(i).getId());
				cb.setName(a.get(i).getName());
				cb.setParent_id(a.get(i).getParent_id());
				c.add(cb);
			}
		}
		return c;
	}
}
