package com.shop.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.OrderDao;
import com.shop.entity.NoteResult;
import com.shop.entity.Order;
import com.shop.service.OrderService;

@Service
public class OrderServiceImp implements OrderService{

	
	@Autowired
	OrderDao orderDao;
	
	
	public NoteResult t_order(int t_user_id) {
		List<Order> list = orderDao.findt_order(t_user_id);
		NoteResult result = new NoteResult();
		if(list==null){
			result.setState(0);
			System.out.println(list);
			return result;
		}else{
			result.setData(list);
			System.out.println(list);
			result.setState(1);
			return result;
		}
		
	}

}
