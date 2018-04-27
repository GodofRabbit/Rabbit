package edu.sram.dao;

import java.util.ArrayList;
import java.util.List;

import edu.sram.entity.Goods;
import edu.sram.entity.Page;
import edu.sram.entity.User;

public class GoodsDaoImpl extends BaseDao implements GoodsDao{

	public boolean toAddGoods(Goods goods) throws Exception {
		String sql = "insert into t_goods(goodsname,goodsprice,goods_imageurl,state,num,goodstime) values(?,?,?,?,?,now())";
		return this.update(sql,goods.getGoodsname(),goods.getGoodsprice(),goods.getGoods_imageurl(),goods.getState(),goods.getNum());
	}

	public boolean deleteGoods(int id) throws Exception {
		String sql = "delete from t_goods where id=?";
		return this.update(sql,id);
	}

	public boolean editGoods(Goods goods) throws Exception {
		String sql = "update t_goods set goodsname=?,goodsprice=?,goods_imageurl=?,goodstime=?,state=?,num=? where id=?";
		return this.update(sql,goods.getGoodsname(),goods.getGoodsprice(),goods.getGoods_imageurl(),goods.getGoodstime(),goods.getState(),goods.getNum(),goods.getId());
	}

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

}
