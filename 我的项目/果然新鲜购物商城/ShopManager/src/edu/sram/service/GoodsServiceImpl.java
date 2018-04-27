package edu.sram.service;

import java.util.List;

import edu.sram.dao.GoodsDao;
import edu.sram.dao.GoodsDaoImpl;
import edu.sram.entity.Goods;
import edu.sram.entity.Page;

public class GoodsServiceImpl implements GoodsService{
	private GoodsDao goodsDao = new GoodsDaoImpl();

	public boolean toAddGoods(Goods goods) throws Exception {
		return goodsDao.toAddGoods(goods);
	}

	public boolean deleteGoods(int id) throws Exception {
		return goodsDao.deleteGoods(id);
	}

	public boolean editGoods(Goods goods) throws Exception {
		return goodsDao.editGoods(goods);
	}

	public List<Goods> findAll() throws Exception {
		return goodsDao.findAll();
	}

	public Page<Goods> findPage(Integer currentPage, int pageSize,
			Goods searchModel) throws Exception {
		return goodsDao.findPage(currentPage, pageSize, searchModel);
	}

	public Goods findById(int id) throws Exception {
		return goodsDao.findById(id);
	}

}
