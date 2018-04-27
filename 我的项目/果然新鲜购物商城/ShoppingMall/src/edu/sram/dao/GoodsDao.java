package edu.sram.dao;

import java.util.List;

import edu.sram.entity.Goods;
import edu.sram.entity.Page;

public interface GoodsDao {
	 public List<Goods> findAll()throws Exception;
    
     public Page<Goods> findPage(Integer currentPage, int pageSize, Goods searchModel) throws Exception;
	public Goods findById(int id) throws Exception;

	public Goods findShopById(String sid) throws Exception;
}
