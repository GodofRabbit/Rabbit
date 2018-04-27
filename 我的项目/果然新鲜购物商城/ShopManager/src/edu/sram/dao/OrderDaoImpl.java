package edu.sram.dao;

import java.util.ArrayList;
import java.util.List;

import edu.sram.entity.Order;
import edu.sram.entity.Page;
import edu.sram.entity.User;

public class OrderDaoImpl extends BaseDao implements OrderDao{

	public boolean toAddOrder(Order order) throws Exception {
		String sql = "insert into t_order(Orderseq,address_id,ordertime,state,user_id) values(?,?,?,?,?)";
		return this.update(sql,order.getOrderseq(),order.getAddress_id(),order.getOrdertime(),order.getState(),order.getUser_id());
	}

	public boolean deleteOrder(int id) throws Exception {
		String sql = "delete from t_order where id=?";
		return this.update(sql,id);
	}

	public List<Order> findAll() throws Exception {
		String sql = "select * from t_order";
		List<Order> list = this.query(sql, Order.class,new Object[0]);
		return list;
	}

	public Page<Order> findPage(Integer currentPage, int pageSize,
			Order searchModel) throws Exception {
		List list = new ArrayList();
		String sql ="select * from t_order where 1=1 ";
		String countSql ="select count(*) from t_order where 1=1 ";
		if (searchModel.getOrderseq()!=null) {
			sql+=" and Orderseq like ?";
			countSql+=" and Orderseq like ?";
			list.add("%"+searchModel.getOrderseq()+"%");
		}
		return this.findPage(sql, countSql, Order.class, currentPage, pageSize, list);
	}

}
