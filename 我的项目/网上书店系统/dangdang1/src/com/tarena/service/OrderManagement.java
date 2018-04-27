package com.tarena.service;

import com.tarena.dao.OrderDao;
import com.tarena.entity.RecieveInformation;

public class OrderManagement {
	public static void createOrder(RecieveInformation information ) throws Exception{
		OrderDao.createNewAddress(information);
		
		
	}

}
