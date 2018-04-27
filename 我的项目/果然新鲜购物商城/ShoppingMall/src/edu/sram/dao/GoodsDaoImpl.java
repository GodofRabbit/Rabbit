package edu.sram.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import edu.sram.entity.Goods;
import edu.sram.entity.Page;
@Repository
public class GoodsDaoImpl extends BaseDao implements GoodsDao{

	public List<Goods> findAll() throws Exception {
		String sql = "select * from t_goods";
		List<Goods> list = this.query(sql, Goods.class,new Object[0]);
		return list;
	}

	public Page<Goods> findPage(Integer currentPage, int pageSize,
			Goods searchModel) throws Exception {
		List list = new ArrayList();
		String sql ="select * from t_goods where 1=1 ";
		String countSql ="select count(*) from t_goods where 1=1 ";
		if (searchModel.getGoodsname()!=null) {
			sql+=" and goodsname like ?";
			countSql+=" and goodsname like ?";
			list.add("%"+searchModel.getGoodsname()+"%");
		}
		return this.findPage(sql, countSql, Goods.class, currentPage, pageSize, list);
	}

	public Goods findById(int id) throws Exception {
		String sql = "select * from t_goods where id=?";
		List<Goods> list = this.query(sql, Goods.class, id);
		return list.size()>0?list.get(0):null;
	}

	@Override
	public Goods findShopById(String sid) throws Exception {
		String sql = "select * from t_goods where id=?";
		List<Goods> list = this.query(sql, Goods.class, sid);
		return list.size()>0?list.get(0):null;
	}

}
