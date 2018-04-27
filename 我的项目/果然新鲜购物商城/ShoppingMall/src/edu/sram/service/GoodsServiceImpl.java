package edu.sram.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.sram.dao.GoodsDao;
import edu.sram.dao.GoodsDaoImpl;
import edu.sram.entity.Goods;
import edu.sram.entity.Page;
@Service
public class GoodsServiceImpl implements GoodsService{
	private GoodsDao goodsDao = new GoodsDaoImpl();

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

	@Override
	public Goods findShopById(String sid) throws Exception {
		return goodsDao.findShopById(sid);
	}

}
