package edu.sram.dao;

import java.util.List;

import edu.sram.entity.Page;
import edu.sram.entity.Order;

public interface OrderDao {
	 public boolean toAddOrder(Order order) throws Exception;
	 public boolean deleteOrder(int id) throws Exception;
	 public List<Order> findAll()throws Exception;
    
     public Page<Order> findPage(Integer currentPage, int pageSize, Order searchModel) throws Exception;
}
