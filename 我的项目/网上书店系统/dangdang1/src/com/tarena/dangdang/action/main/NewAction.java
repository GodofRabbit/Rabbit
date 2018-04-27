package com.tarena.dangdang.action.main;

import java.util.List;

import com.tarena.dao.ProductDao;
import com.tarena.entity.Product;

public class NewAction {
	private List<Product> pros;
	
	public String execute() throws Exception{
		pros=ProductDao.findNewProduct();
		return "success";
	}

	public List<Product> getPros() {
		return pros;
	}

	public void setPros(List<Product> pros) {
		this.pros = pros;
	}
	
}
