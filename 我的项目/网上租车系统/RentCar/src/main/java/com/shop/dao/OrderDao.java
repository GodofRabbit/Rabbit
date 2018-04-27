package com.shop.dao;

import java.util.List;

import com.shop.entity.Order;

public interface OrderDao {

	public List<Order> findt_order(int t_user_id);
}
