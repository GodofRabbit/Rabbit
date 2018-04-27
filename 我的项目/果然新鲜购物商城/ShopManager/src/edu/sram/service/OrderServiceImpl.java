package edu.sram.service;

import java.util.List;

import edu.sram.dao.OrderDao;
import edu.sram.dao.OrderDaoImpl;
import edu.sram.entity.Order;
import edu.sram.entity.Page;

public class OrderServiceImpl implements OrderService{
	private OrderDao orderDao = new OrderDaoImpl();

	public boolean toAddOrder(Order order) throws Exception {
		return orderDao.toAddOrder(order);
	}

	public boolean deleteOrder(int id) throws Exception {
		return orderDao.deleteOrder(id);
	}

	public List<Order> findAll() throws Exception {
		return orderDao.findAll();
	}

	public Page<Order> findPage(Integer currentPage, int pageSize,
			Order searchModel) throws Exception {
		return orderDao.findPage(currentPage, pageSize, searchModel);
	}

}
