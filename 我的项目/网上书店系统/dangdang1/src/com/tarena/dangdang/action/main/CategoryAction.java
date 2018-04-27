package com.tarena.dangdang.action.main;

import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.CategoryDao;
import com.tarena.entity.Category;

public class CategoryAction {
	private List<Category>cats;
	public String execute() throws Exception{
		//��ѯd_category,��ȡ�����Ϣ
		List<Category> bigcats=CategoryDao.findAll();
		cats=findByParent(bigcats, 1);
		for(Category cat:cats){
			cat.setSubCats(findByParent(bigcats, cat.getId()));
		}
		return "success";
	}
	public List<Category> findByParent(List<Category> all,int parentId){
		List<Category> list=new ArrayList<Category>();
		for(Category cat:all){
			if(cat.getParentId()==parentId){
				list.add(cat);
			}
		}
		return list;
	}
	public List<Category> getCats() {
		return cats;
	}
	public void setCats(List<Category> cats) {
		this.cats = cats;
	}
	
	
}

