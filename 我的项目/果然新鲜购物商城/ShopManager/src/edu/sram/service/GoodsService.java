package edu.sram.service;

import java.util.List;

import edu.sram.entity.Goods;
import edu.sram.entity.Page;

public interface GoodsService {
	 public boolean toAddGoods(Goods goods) throws Exception;
	 public boolean deleteGoods(int id) throws Exception;
	 public boolean editGoods(Goods goods)throws Exception;
	 public List<Goods> findAll()throws Exception;
    
     public Page<Goods> findPage(Integer currentPage, int pageSize, Goods searchModel) throws Exception;
	 public Goods findById(int id) throws Exception;
}
